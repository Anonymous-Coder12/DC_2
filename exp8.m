close all; 
clear all; 
clc; 

n = 8; % number of frames
i = 1; 

while i < n
    fprintf('Transmitting frame %d\n', i);
    s = randi(10, 1, 1);
    
    if s <= 3
        fprintf('Time out \n %d\n', i);
    else
        fprintf('Received frame %d\n', i);
        i = i + 1;
    end
end