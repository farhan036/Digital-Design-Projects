% matlab_model.m - Golden Reference Model for Fixed-Point CORDIC
clear; clk = 0;

N = 16; % Number of iterations
Kn = hex2dec('4DBA'); % 0.60725 in Q1.15 fixed point

% Fixed-Point Lookup Table matching Verilog LUT_ATAN
LUT_ATAN = [ ...
    hex2dec('16C0'), hex2dec('0D6B'), hex2dec('0712'), hex2dec('0397'), ...
    hex2dec('01CD'), hex2dec('00E6'), hex2dec('0073'), hex2dec('003A'), ...
    hex2dec('001D'), hex2dec('000F'), hex2dec('0007'), hex2dec('0004'), ...
    hex2dec('0002'), hex2dec('0001'), hex2dec('0000'), hex2dec('0000') ...
];

% --- SPECIFICATION TEST ANGLES ---
corner_angles     = [0, 90, 180, 270, 360]; 
over_under_angles = [450, -90, -180, -450]; 
boundary_angles   = [179.9, -179.9]; 
rng(42); 
random_angles     = (rand(1, 10) - 0.5) * 720; 

all_degrees = [corner_angles, over_under_angles, boundary_angles, random_angles];
num_tests = length(all_degrees);

% Convert degrees to Q1.15 Fixed-Point Angle format
test_angles = zeros(1, num_tests);
for k = 1:num_tests
    rad = deg2rad(all_degrees(k));
    wrapped_rad = atan2(sin(rad), cos(rad)); 
    test_angles(k) = round(wrapped_rad * (5824 / (pi/4)));
end

exp_cos = zeros(1, num_tests);
exp_sin = zeros(1, num_tests);

% Golden Reference Loop
for t = 1:num_tests
    x = Kn;
    y = 0;
    z = test_angles(t);
    
    % Perform bit-exact CORDIC iterations
    for i = 0:(N-1)
        x_shift = bitshift(int32(x), -i);
        y_shift = bitshift(int32(y), -i);
        
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
    
    % Clamp output to prevent Q1.15 overflow
    if x > 32767, exp_cos(t) = 32767; elseif x < -32768, exp_cos(t) = -32768; else, exp_cos(t) = x; end
    if y > 32767, exp_sin(t) = 32767; elseif y < -32768, exp_sin(t) = -32768; else, exp_sin(t) = y; end
end

% Write Hex Vectors: 16-bit for Inputs, 17-bit for Outputs
f_z   = fopen('input_angles.hex', 'w');
f_cos = fopen('expected_cos.hex', 'w');
f_sin = fopen('expected_sin.hex', 'w');

for t = 1:num_tests
    % Input Z is 16-bit (%04X)
    fprintf(f_z,   '%04X\n', bitand(int32(test_angles(t)), hex2dec('FFFF')));
    
    % Expected Cos/Sin are 17-bit (%05X)
    fprintf(f_cos, '%05X\n', bitand(int32(exp_cos(t)),     hex2dec('1FFFF')));
    fprintf(f_sin, '%05X\n', bitand(int32(exp_sin(t)),     hex2dec('1FFFF')));
end

fclose(f_z); fclose(f_sin); fclose(f_cos);
fprintf('MATLAB: Successfully generated %d test vectors!\n', num_tests);