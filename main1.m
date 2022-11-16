
% This function is for audio read from the current working directory/folder
 [X, Fs]=audioread("handel.wav");
 
 if Fs==16000
     soundsc(X,Fs);
 else
     resam='X.wav';
    audiowrite(resam,X,16000);
    [X, Fs]=audioread("X.wav");
    soundsc(X);
 end
 

% Compute and plot the STFT of the signal. Use a desired window(hanning or
% hamming ) of length 256, Specify the length of overlap as 220 samples and
% DFT length as 512 points
% window length (recomended to be power of 2), hop size (recomended to be
% power of 2),number of fft points (recomended to be power of 2)

[Y,F,t]=stft(X,Fs,'Window',hanning(1024,"periodic"),'OverlapLength',512,'FFTLength',1024 );

figure(1)
surf(t, F, 20*log10(abs(Y)));
shading interp
axis tight
view(0, 90)
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
xlabel('Time, s')
ylabel('Frequency, Hz')
title('Amplitude spectrogram of the signal')
hcol = colorbar;
set(hcol, 'FontName', 'Times New Roman', 'FontSize', 14)
ylabel(hcol, 'Magnitude, dB')