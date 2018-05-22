interval_stab <- function(n,theta,p)
{
# parameters to be set by the user
# numbers of observations
#n = 100;
# unknown parameter
#theta = 2.3;
# Probability of the confidence interval
#p = 0.975;
# Quantile associated to p
alpha = qnorm(p);

x = rnorm(n, theta, sqrt(theta));
xbar = mean(x);

a= (sqrt(xbar) - alpha/(2*sqrt(n)))^2;
b = (sqrt(xbar) + alpha/(2*sqrt(n)))^2;
#Result
c(min(a,b), max(a,b))

}