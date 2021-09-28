clear;
clc;
[Ga128,Gb128]=wlanGolaySequence(128);
Ga128;
Gb128;

Gu512=[-Gb128',-Ga128',Gb128',-Ga128'];
Gv512=[-Gb128',Ga128',-Gb128',-Ga128'];
STF=[repmat(Ga128',1,16),-Ga128']; %Short Training Field
CEF=[Gu512,Gv512,-Gb128']; %最后的“1-Gb128”称为Gv128
SCp=[STF,CEF];%SC preamble

Ga256=[-Gb128',-Ga128'];
Gb256=[Gb128',-Ga128'];
Fa=randsrc(1,128,[-1,1]);
Fb=randsrc(1,128,[-1,1]);
c1=[-Ga128',Gu512,-Gb128'];
c2=[Fa,Gu512,Fb];

figure(1)
stem(xcorr(Ga128)+xcorr(Gb128));
%两个256格雷序列的自相关之和
figure(2)
subplot(2,1,1);
stem(xcorr(c1));
subplot(2,1,2);
stem(xcorr(c2));

Ga256r=[Gb128',Ga128'];
Gb256r=[-Gb128',Ga128'];
Gu512r=[Ga256r,Gb256r];
ar=[1,1,-1,-1,-1,-1,-1,-1,-1,1,-1,1,1,-1,-1,1,1,1,-1,-1,1,1,1,1,-1,1,-1,1,-1,1,1,-1,...
       -1,-1,1,1,1,1,1,1,1,-1,1,-1,-1,1,1,-1,1,1,-1,-1,1,1,1,1,-1,1,-1,1,-1,1,1,-1];
br=[1,1,-1,-1,-1,-1,-1,-1,-1,1,-1,1,1,-1,-1,1,1,1,-1,-1,1,1,1,1,-1,1,-1,1,-1,1,1,-1,...
       1,1,-1,-1,-1,-1,-1,-1,-1,1,-1,1,1,-1,-1,1,-1,-1,1,1,-1,-1,-1,-1,1,-1,1,-1,1,-1,-1,1];
Ga128r=[ar,br];
Gb128r=[ar,-br];
%Gu512=[-Gb128',-Ga128',Gb128',-Ga128'];
figure(3)
stem(xcorr(Ga256,Ga256r)+xcorr(Gb256,Gb256r));
figure(4)
stem(xcorr(-Gb128',-Gb128')+xcorr(-Ga128',-Ga128')+xcorr(Gb128',Gb128r)+xcorr(-Ga128',Ga128r));

