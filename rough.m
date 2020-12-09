clc
clear
close all

string = 'DISHA';
bit_str = dec2bin(string);
bit_str = reshape(transpose(bit_str),1,[]);

if rem(length(bit_str),2) == 0;
    bit_str = bit_str;
else;
    bit_str = ['0' bit_str];
end

bit_str = reshape(transpose(bit_str),[],2)

q_peaks = [];
for i=1:length(bit_str)
if bin2dec(bit_str(i,:))== 0;
  
    q_peaks = [q_peaks -2];
elseif bin2dec(bit_str(i,:))== 1;
   
    q_peaks = [q_peaks -1];
elseif bin2dec(bit_str(i,:))== 2;
    
    q_peaks= [q_peaks 1];
elseif bin2dec(bit_str(i,:))== 3;
    
    q_peaks = [q_peaks 2];
end

hold all

end

plot(1:length(bit_str),q_peaks)