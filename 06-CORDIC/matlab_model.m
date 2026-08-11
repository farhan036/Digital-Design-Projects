% matlab_model.m - Golden Reference Model for 32-bit Fixed-Point CORDIC
clear; clc;

N = 32; % 32 Iterations
Q_FRAC_ANGLE = 29; % Q3.29 for Angle Inputs
Q_FRAC_OUT   = 30; % Q2.30 for Outputs

% Kn = 0.607252935008881 in Q2.30
Kn = round(0.607252935008881 * (2^Q_FRAC_ANGLE)); % 32'h136E9DBB
% Fixed-Point Lookup Table matching Verilog LUT_ATAN (Q3.29)
LUT_ATAN = [ ...
    hex2dec('1921FB54'), hex2dec('0ED66383'), hex2dec('07D6DD7E'), hex2dec('03FAB753'), ...
    hex2dec('01FF55BB'), hex2dec('00FFEAAE'), hex2dec('007FFD55'), hex2dec('003FFFAB'), ...
    hex2dec('001FFFF5'), hex2dec('000FFFFF'), hex2dec('00080000'), hex2dec('00040000'), ...
    hex2dec('00020000'), hex2dec('00010000'), hex2dec('00008000'), hex2dec('00004000'), ...
    hex2dec('00002000'), hex2dec('00001000'), hex2dec('00000800'), hex2dec('00000400'), ...
    hex2dec('00000200'), hex2dec('00000100'), hex2dec('00000080'), hex2dec('00000040'), ...
    hex2dec('00000020'), hex2dec('00000010'), hex2dec('00000008'), hex2dec('00000004'), ...
    hex2dec('00000002'), hex2dec('00000001'), hex2dec('00000000'), hex2dec('00000000')  ...
];

PI_OVER_2 = round(pi/2 * (2^Q_FRAC_ANGLE));
PI_VAL    = round(pi   * (2^Q_FRAC_ANGLE));

% --- SPECIFICATION TEST ANGLES IN DEGREES ---
corner_angles     = [0, 90, 180, 270, 360]; 
over_under_angles = [450, -90, -180, -450]; 
boundary_angles   = [179.9, -179.9]; 
rng(42); 
random_angles     = (rand(1, 10) - 0.5) * 720; 

all_degrees = [corner_angles, over_under_angles, boundary_angles, random_angles];
num_tests = length(all_degrees);

% Convert degrees to Q3.29 Fixed-Point Angle Radians
test_angles = zeros(1, num_tests);
for k = 1:num_tests
    rad = deg2rad(all_degrees(k));
    wrapped_rad = atan2(sin(rad), cos(rad)); % Map to [-pi, +pi]
    test_angles(k) = round(wrapped_rad * (2^Q_FRAC_ANGLE));
end

exp_cos = zeros(1, num_tests);
exp_sin = zeros(1, num_tests);

% Golden Reference Loop
for t = 1:num_tests
    z_in = test_angles(t);
    
    % Range Reduction / Quadrant Mapping Logic (Matching RTL)
    if z_in > PI_OVER_2
        z = z_in - PI_VAL;
        quadrant_flag = true;
    elseif z_in < -PI_OVER_2
        z = z_in + PI_VAL;
        quadrant_flag = true;
    else
        z = z_in;
        quadrant_flag = false;
    end
    
    x = Kn;
    y = 0;
    
    % Bit-exact CORDIC iterations
    for i = 0:(N-1)
        x_shift = bitshift(int64(x), -i);
        y_shift = bitshift(int64(y), -i);
        
        if z >= 0
            x_next = x - y_shift;
            y_next = y + x_shift;
            z_next = z - LUT_ATAN(i+1);
        else
            x_next = x + y_shift;
            y_next = y - x_shift;
            z_next = z + LUT_ATAN(i+1);
        end
        x = x_next; y = y_next; z = z_next;
    end
    
    % Post-Processing Quadrant Correction (Matching RTL)
    if quadrant_flag
        exp_cos(t) = -x;
        exp_sin(t) = -y;
    else
        exp_cos(t) = x;
        exp_sin(t) = y;
    end
end

% Write Hex Vectors: 32-bit for Inputs (%08X), 33-bit for Outputs (%09X)
f_z   = fopen('input_angles.hex', 'w');
f_cos = fopen('expected_cos.hex', 'w');
f_sin = fopen('expected_sin.hex', 'w');

for t = 1:num_tests
    fprintf(f_z, '%08X\n', bitand(int64(test_angles(t)), int64(hex2dec('FFFFFFFF'))));
    
    % Proper 33-bit Two's Complement Formatting
    c_val = int64(exp_cos(t));
    if c_val < 0, c_val = (2^33) + c_val; end
    fprintf(f_cos, '%09X\n', c_val);
    
    s_val = int64(exp_sin(t));
    if s_val < 0, s_val = (2^33) + s_val; end
    fprintf(f_sin, '%09X\n', s_val);
end

fclose(f_z); fclose(f_sin); fclose(f_cos);
fprintf('MATLAB: Successfully generated %d 32-bit test vectors!\n', num_tests);
