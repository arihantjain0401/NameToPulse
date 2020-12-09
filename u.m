function to_morse_pulse(string)

morse={'01';'1000';'1010';'100';'0';'0010';'110';'0000';'00';'0111';'101';'0100';'11';'10';'111';'0110';'1101';'010';'000';'1';'001';'0001';'011';'1001';'1011';'1100'};
string = string(~isspace(string));
string(string<=90)= 32+string(string<=90);
string= string-96;

bit_str_cell = morse(string);
bit_str = [];

for i=1:length(bit_str_cell)
    
    bit_str = [bit_str bit_str_cell{i}];
    
end

for i=1:length(bit_str)
if bit_str(i)=='0';
    polar_rz(4)= 0;
    polar_rz(3)= -1;
    polar_rz(2)=  1;
else bit_str(i)=='1';
    polar_rz(4)= 0;
    polar_rz(3)= -2;
    polar_rz(2)=  2;
end
polar_rz(1)=0;

t = [i-1 i-(2/3) i-(1/3) i];

hold all
plot(t,polar_rz);
% plot(t,polar_rz,'black');
xlim([0 t(3)]);
ylim([-2 2]);

pause(0.1)
end
end