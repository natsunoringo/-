close all; 
clear all; 
clc; 
%%���������������
u=xlsread('C:\Users\10143\Desktop\�γ���ҵ\ʵ�������������.xls',1,'A41:A941');
z=xlsread('C:\Users\10143\Desktop\�γ���ҵ\ʵ�������������.xls',1,'B41:B941');

Hf=0;theta=0;            %����ֵ Hf1=[L,n];Hf2=[L,n]
L=800;                   %����NΪ���ݳ���
n=10;                     %�״�������
for i=1:n                %�״γ�������
    na=i;nd=i;                      
    Hf1=zeros(L,i);Hf2=zeros(L,i);
    %%����Hf����
    for t=1:i
        Hf1(1:L,i-t+1)=-z(t:L+t-1);
        Hf2(1:L,i-t+1)=u(t:L+t-1);
    end
    Hf=[Hf1,Hf2];
    %%����������
    x1=inv(Hf'*Hf);  
    theta=x1*Hf'*z(i+1:i+L);
    e(i+1:L+i,1)=z(i+1:L+i)-Hf*theta; 
    ee=e'*e/L; 
    %%����AIC׼�����AIC
    AIC(i)=L*log(ee)+3*(i);
end
plot(1:i,AIC,'*-');
title('�״��ж�')


