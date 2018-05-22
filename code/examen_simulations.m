%Simulations and Numerical Applications
% 1- Simulate a n-sample with p=2 and theta=0.4
theta=0.4;

scale= 1/theta; %in matlab we give the inverse of the scale parameter of the gamma distribution
shape = 2; %p

n=100;%size of the sample
%the sample simulated with the gamma distribution and store them in an array
sample_n=gamrnd(shape,scale,n,1);

% 2- Estimation of the 3 estimators
Xn_barre=mean(sample_n);

theta_moment= 1/Xn_barre;%1/Xn_barre
theta_barre=((2*n-1)/n)*(1/Xn_barre); % (2n-1)/n *1/Xn_barre
theta_MLE=2/Xn_barre; %2/Xn_barre

% 3- Monte-Carlo simulations
monteCarloSim_n=[10;20;50;75;100;150;175;200;500];
sizeTest=length(monteCarloSim_n);
theta_moment_all = zeros(sizeTest);
theta_barre_all= zeros(sizeTest);
theta_MLE_all= zeros(sizeTest);
CRB_all=zeros(sizeTest);

mse_theta_moment=zeros(sizeTest);
mse_theta_barre=zeros(sizeTest);
mse_theta_MLE=zeros(sizeTest);

for i=1:sizeTest
sample_n=gamrnd(shape,scale,monteCarloSim_n(i),1);
Xn_barre=mean(sample_n);

theta_moment_all(i)= 1/Xn_barre;
mse_theta_moment(i)=(theta_moment_all(i)-theta)^2;

theta_barre_all(i)=((2*n-1)/n)*(1/Xn_barre);
mse_theta_barre(i)=(theta_barre_all(i)-theta)^2;

theta_MLE_all(i)=2/Xn_barre;
mse_theta_MLE(i)=(theta_MLE_all(i)-theta)^2;

%fisher information and CRB
FIM_1=2/theta^2;
CRB_all=1/(monteCarloSim_n(i)*FIM_1);
end


figure(1);
plot(monteCarloSim_n,mse_theta_moment,monteCarloSim_n,CRB_all);
title('Estimator of the moment method');
xlabel('n');
ylabel('MSE');
legend('mse method moment','CRB');


figure(2);
plot(monteCarloSim_n,mse_theta_barre,monteCarloSim_n,mse_theta_MLE,monteCarloSim_n,CRB_all);
title('Tetha barre and MLE');
xlabel('n');
ylabel('MSE');
legend('mse theta barre','mse theta MLE','CRB');

figure(3);
plot(monteCarloSim_n,mse_thetha_moment,monteCarloSim_n,mse_theta_barre,monteCarloSim_n,mse_theta_MLE,monteCarloSim_n,CRB_all);
title('All estimators ');
xlabel('n');
ylabel('MSEs');
legend('mse theta moment','mse theta barre','mse theta MLE','CRB');

% 5- Hypothesis testing
theta_0=0.45;
alpha=0.05;
n=500;