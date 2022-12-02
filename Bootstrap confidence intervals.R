Bootstrap confidence intervals:
  
  #A.  If you know the distribution from where the sample was taken:  Suppose #X1, ..., Xn from exponential with parameter lambda.
  data <- c(11.96, 5.03, 67.40, 16.07, 31.50, 7.73, 11.10, 22.38, 17.99,   36.72, 12.73, 33.81, 10.99,  72.70, 89.55, 48.96, 3.06, 30.33, 80.43,   56.14)
  
  n <- length(data)
  mean(data)
  #Estimate of lambda:
  lambda_hat <- 1/mean(data)
  
  #Now we draw many samples of size n from an exponential distribution with #parameter lambda_hat:
  
  x <- rexp(n, lambda_hat)
  lambda_hat <- 1/mean(x)
  lambda_hat
  
  #Here is another one:
  x <- rexp(n, lambda_hat)
  lambda_hat <- 1/mean(x)
  lambda_hat
  
  #Repeat the procedure B=500 times (in other words, get 500 samples each one #of size n=20 and compute the sample mean):
  B=500
  xbar <- rep(0,B)
  for(i in 1:B){
    x <- rexp(n, lambda_hat)
    xbar[i] = mean(x)
  }
  xbar
  
  #Therefore:
  lambda_bootstrap <- 1/xbar
  
  lambda_bootstrap
  
  hist(lambda_bootstrap)
  
  #We need a 95% CI for lambda:  find the 2.5 percentile and 97.5 percentile #of the distribution of lambda_hat:
  
  quantile(lambda_bootstrap, c(0.025, 0.975))
  
  
  
  
  
  
  #B. If you don't know the distribution from where the sample was taken.  #Then treat your data as the population and take many samples of size n with #replacement:
  
  data <- c(11.96, 5.03, 67.40, 16.07, 31.50, 7.73, 11.10, 22.38, 17.99,   36.72, 12.73, 33.81, 10.99,  72.70, 89.55, 48.96, 3.06, 30.33, 80.43,   56.14)
  
  x <- sample(data, replace=TRUE)
  theta_hat <- mean(x) 
  theta_hat
  
  #Do this many times:
  B=500
  theta_boot <- rep(0,B)
  for(i in 1:B){
    x <- sample(data, replace=TRUE)
    theta_boot[i] = mean(x)
  }
  
  theta_boot
  
  
  hist(theta_boot)
  
  
  quantile(theta_boot, c(0.025, 0.975))
  