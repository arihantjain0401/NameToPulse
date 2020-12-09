close all
clear all

Disha = 'DISHA';
Arihant = 'ARIHANT';

figure(1)

subplot(211)
title('On Arihant')
to_bit_pulse(Disha);

subplot(212)
title('On Disha')
to_bit_pulse(Arihant);



figure(2)

subplot(211)
title('On Arihant')
to_morse_pulse(Disha);

subplot(212)
title('On Disha')
to_morse_pulse(Arihant);

figure(3)

subplot(211)
title('On Arihant')
to4peaks(Disha);

subplot(212)
title('On Disha')
to4peaks(Arihant);

% saveas(figure(1),'binarypulse.jpg');
% saveas(figure(2),'morsepulse.jpg');


function to_bit_pulse(string)

bit_str = dec2bin(string);
bit_str = reshape(transpose(bit_str),1,[]);

for i=1:length(bit_str)
if bit_str(i)=='0';
    polar_rz(3)=0;
    polar_rz(2)= -1;
else bit_str(i)=='1';
    polar_rz(3)=0;
    polar_rz(2)= 1;
end
polar_rz(1)=0;

t = [i-1 i-0.5 i];

hold all
plot(t,polar_rz,'black');
xlim([0 t(3)]);
ylim([-2 2]);

%pause(0.1)
end

end

function to_morse_pulse(string)

morse={'01';'1000';'1010';'100';'0';'0010';'110';'0000';'00';'0111';'101';'0100';'11';'10';'111';'0110';'1101';'010';'000';'1';'001';'0001';'011';'1001';'1011';'1100'};
string(string<90)= 32+string(string<90);
string= string-96;

bit_str_cell = morse(string);
bit_str = [];

for i=1:length(bit_str_cell)
    
    bit_str = [bit_str bit_str_cell{i}]
    
end

for i=1:length(bit_str)
if bit_str(i)=='0';
    polar_rz(3)=0;
    polar_rz(2)= -1;
else bit_str(i)=='1';
    polar_rz(3)=0;
    polar_rz(2)= 1;
end
polar_rz(1)=0;

t = [i-1 i-0.5 i];

hold all
plot(t,polar_rz,'black');
xlim([0 t(3)]);
ylim([-2 2]);

%pause(0.1)
end


end

function to4peaks(string)

bit_str = dec2bin(string);
bit_str = reshape(transpose(bit_str),1,[]);

if rem(length(bit_str),2) == 0;
    bit_str = bit_str;
else;
    bit_str = ['0' bit_str];
end

bit_str = reshape(transpose(bit_str),[],2);

for i=1:length(bit_str)
if bin2dec(bit_str(i,:))== 0;
    q_peaks(3)=0;
    q_peaks(2)= -2;
elseif bin2dec(bit_str(i,:))== 1;
    q_peaks(3)=0;
    q_peaks(2)= -1;
elseif bin2dec(bit_str(i,:))== 2;
    q_peaks(3)=0;
    q_peaks(2)= 1;
elseif bin2dec(bit_str(i,:))== 3;
    q_peaks(3)=0;
    q_peaks(2)= 2;
end
q_peaks(1)=0;


t = [i-1 i-0.5 i];

hold all
plot(t,q_peaks,'black');
xlim([0 t(3)]);
ylim([-3 3]);

%pause(0.1)
end

end

