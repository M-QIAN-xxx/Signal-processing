signal = audioread('signal_1.wav'); % get the fs and data from given music .wav file
end_to_row_signal = data(921012:921061); % pick the last 50 elements which is the 'end-to-row' signal
plot (end_to_row_signal); % test the 'end-to-row' signal

image300_300 = []; % initiate the array to put the data of the image
index = 1;

% start to demodulate the signal
for i = 1:length(signal)
    if (((i-1)+50) <= length(signal))
        if(signal(i:((i-1)+50)) == end_to_row_signal)
            ASK = signal(index:i-1); % 
            
            deASK = []; % initiate the array to put the data wich demodulated with 
            
            for j = 1:5:(length(ASK)-1)
                if std(ASK(j:(j-1)+5)) == 0
                    deASK = [deASK 0];
                else
                    deASK = [deASK 1];
                end
            end
            
            deManchester = []; % initiate the array to put the data which demodulated with manchseter code
            
            for k = 1:2:length(deASK)
                if deASK(k) == 0 && deASK(k+1) == 1 % ASK 01 in Manchester code is 1 (low-high)
                    deManchester = [deManchester 1];
                elseif deASK(k) == 1 && deASK(k+1) == 0 % ASK 10 in Manchester code is 0 (high-low)
                    deManchester = [deManchester 0];
                end
            end
            
            
            image300_300 = [image300_300; deManchester];
            index = (i-1)+50;
        end
    end
end

image300_300 = image300_300(1:length(image300_300)-1,:); % delete the last row which consists of parity code
image300_300 = image300_300(:,1:length(image300_300)-1); % delete the last column which consists of parity code

I = mat2gray(image300_300); % transfer the array into white & black image

K = medfilt2(I); % use the median filter to filter out the noise around the image

imshow(K) % display the final ans