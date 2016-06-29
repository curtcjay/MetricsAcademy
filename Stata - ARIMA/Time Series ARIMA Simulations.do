* Time Series ARIMA Simulations
* Copyright 2013 by Ani Katchova

clear all
set more off

* Download ado file for sim_arma
set seed 12345

* Generate white noise
sim_arma white_noise, nobs(50) sigma(1) spin(10000)
twoway line white_noise _t
ac white_noise, lags(20) yscale(range(-1 1))
pac white_noise, lags(20) yscale(range(-1 1))

* Generate AR(1) model
sim_arma ar_1a, arcoef(0.8) nobs(50) sigma(1) spin(10000)
twoway line ar_1a _t
ac ar_1a, lags(20) yscale(range(-1 1))
pac ar_1a, lags(20) yscale(range(-1 1))

sim_arma ar_1b, arcoef(-0.8) nobs(50) sigma(1) spin(10000)
twoway line ar_1b _t
ac ar_1b, lags(20) yscale(range(-1 1))
pac ar_1b, lags(20) yscale(range(-1 1))

* Generate MA(1) model
sim_arma ma_1a, macoef(0.7) nobs(50) sigma(1) spin(10000)
twoway line ma_1a _t
ac ma_1a, lags(20) yscale(range(-1 1))
pac ma_1a, lags(20) yscale(range(-1 1))

sim_arma ma_1b, macoef(-0.7) nobs(50) sigma(1) spin(10000)
twoway line ma_1b _t
ac ma_1b, lags(20) yscale(range(-1 1))
pac ma_1b, lags(20) yscale(range(-1 1))

* Generate ARMA(1,1) model
sim_arma arma_11a, arcoef(0.8) macoef(0.7) nobs(50) sigma(1) spin(10000)
twoway line arma_11a _t
ac arma_11a, lags(20) yscale(range(-1 1))
pac arma_11a, lags(20) yscale(range(-1 1))

sim_arma arma_11b, arcoef(-0.8) macoef(-0.7) nobs(50) sigma(1) spin(10000)
twoway line arma_11b _t
ac arma_11b, lags(20) yscale(range(-1 1))
pac arma_11b, lags(20) yscale(range(-1 1))
