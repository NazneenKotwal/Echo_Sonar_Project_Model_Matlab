%% Random Project Part 2
clc
clear all
close all

%% Simulation of a single Reflected and Received Waveforms
% For Multiple Waveforms uncomment lines and plot using subplot
N = 100;
tmax = 1000;
fo = 1000;
P = 50;
Z = zeros(P,tmax);

% for p =1 : 1: P
t = linspace(0,1,tmax);
A = raylrnd(1,N,1);
phi1 = (2*pi).*rand(N,1);
T1 = 2*pi*fo.*t;
phi = repmat(phi1,1,tmax);
T = repmat(T1,N,1);
arg = T+phi;
% Simulation of X 
x = A.*cos(arg);
% X = sum(x);
% Z(p,1:1:length(X)) = X;
% end

figure(1)
histogram(x(1,:),'BinMethod','sqrt')
grid on;
xlabel('Random Variable Xi ','fontsize',12);
ylabel('Probability Density Function (f(x))','fontsize',12);
title(['Histogram of Xi(t) for N = ' num2str(N)])

%%  Comment: X(t) is a sequence of random variables, one for each instant in time. X(t) is said to be a stochastic gaussian process if the joint 
%            distribution of the sequence of random variables is gaussian.
%            This implies that each random variable has a gaussian
%            distribution. In the histogram we show that the distribution
%            of X(t) at t = 1 is gaussian.

%%

% Simulation of the Waveform Components and Histogram View 
U = randn(P,1);
V = randn(P,1);
figure(2)
histogram(U)
grid on;
xlabel('Random Variable U ','fontsize',12);
ylabel('Probability Density Function (f(u))','fontsize',12);
title('Histogram of U')
figure(3)
histogram(V)
xlabel('Random Variable V ','fontsize',12);
ylabel('Probability Density Function (f(v))','fontsize',12);
title('Histogram of V')
Aenv = sqrt((U.^2)+(V.^2));
figure(4)
histogram(Aenv,'BinMethod','sqrt')
grid on;
xlabel('Random Variable Aenv ','fontsize',12);
ylabel('Probability Density Function (f(a))','fontsize',12);
title(['Histogram of Aenv : Envelop of X for P = ' num2str(P)])

