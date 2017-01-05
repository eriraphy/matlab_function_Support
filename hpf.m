%Raphael 2014.Nov
function [Y]=hpf(X,fs,fp,fc,plt)
    N=length(X);
    n=0:N-1;
    t=n/fs;
   if fp<=fc
       error('Fpass<=Fcut')
   end
   if nargin<5
       plt= 0;
   end
    as=100;
    ap=1;
    wp1=2*fp/fs;
    wn1=2*fc/fs;     
    [n1,wp1]=ellipord(wp1,wn1,ap,as);
    [b1,a1]=ellip(n1,ap,as,wp1,'high');
    %process
    Y=filter(b1,a1,X);
    %plot
    if plt
        figure;
        subplot(211);
        plot(t,X)
        ylabel('origin'), grid;
        subplot(212);
        plot(t,Y) ;
        ylabel('Processed'),grid;
        xlabel('tranformed');
        %spectrum
        figure;
        subplot(211);
        print_fft(X,fs,1);
        xlabel('f');
        ylabel('X(f)');
        title('spectrum1');
        subplot(212);
        print_fft(Y,fs,1);
        xlabel('f');
        ylabel('X(f)');
        title('spectrum2');
        grid;
    end
end
