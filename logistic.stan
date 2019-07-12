data {
  int<lower=1> n;
  int<lower=0, upper=1> y[n];
  vector[n] dose;
}

// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  real a;
  real b;
}

// response y is 0 (died), 1 (lived)
model {
  vector[n] eta;
  eta = a + b * dose;
  a ~ normal(0, 10);
  b ~ normal(0, 4);
  y ~ bernoulli_logit(eta);
}

