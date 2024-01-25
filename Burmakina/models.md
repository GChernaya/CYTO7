models & bootstrap
================
Polina Burmakina
2024-01-25

## Models

- Model-loop that outputs null models

``` r
# outcome & time
variable_list <- c("os2", "os2time", 
                   "rel2", "rel2time", 
                   "compete2", "compete2time", 
                   "efs2", "efs2time", 
                   "a_gvhd24", "a_gvhd24time", 
                   "c_gvhd", "c_gvh_dtime")

# null model predictors
zero_predictors <- c("d_z", "restadirovanie_na_moment_tkm_stadia_pred_tk_me",  
                    "vozrast_polnyh_let_na_moment_tkm", "vozrastnaa_gruppa", 
                    "sovmestimost_donora_recipienta_ptkm_pred_tk_me", 
                    "rezim_kondicionirovania_pred_tk_me", 
                    "vid_tkm_nastoasej_ptkm_pred_tk_me_pditkm", 
                    "cd3_kg_ptkm_pdi", "cd34_kg_x10_ptkm_pdi")


formula_list <- map2(variable_list[seq(1, length(variable_list), 2)], 
                     variable_list[seq(2, length(variable_list), 2)], 
                     ~paste("Surv", "(", .y, ",", .x, ")", "~", paste(zero_predictors, collapse = " + ")))

model_list <- map(formula_list, ~coxph(as.formula(.x), data = main_df))

map2(model_list, formula_list, ~{print(summary(.x)$concordance); cat("Модель для", .y, "\n\n")})
```

    ##          C      se(C) 
    ## 0.72463029 0.04722597 
    ## Модель для Surv ( os2time , os2 ) ~ d_z + restadirovanie_na_moment_tkm_stadia_pred_tk_me + vozrast_polnyh_let_na_moment_tkm + vozrastnaa_gruppa + sovmestimost_donora_recipienta_ptkm_pred_tk_me + rezim_kondicionirovania_pred_tk_me + vid_tkm_nastoasej_ptkm_pred_tk_me_pditkm + cd3_kg_ptkm_pdi + cd34_kg_x10_ptkm_pdi 
    ## 
    ##         C     se(C) 
    ## 0.7064846 0.0491169 
    ## Модель для Surv ( rel2time , rel2 ) ~ d_z + restadirovanie_na_moment_tkm_stadia_pred_tk_me + vozrast_polnyh_let_na_moment_tkm + vozrastnaa_gruppa + sovmestimost_donora_recipienta_ptkm_pred_tk_me + rezim_kondicionirovania_pred_tk_me + vid_tkm_nastoasej_ptkm_pred_tk_me_pditkm + cd3_kg_ptkm_pdi + cd34_kg_x10_ptkm_pdi 
    ## 
    ##          C      se(C) 
    ## 0.72175732 0.05442075 
    ## Модель для Surv ( compete2time , compete2 ) ~ d_z + restadirovanie_na_moment_tkm_stadia_pred_tk_me + vozrast_polnyh_let_na_moment_tkm + vozrastnaa_gruppa + sovmestimost_donora_recipienta_ptkm_pred_tk_me + rezim_kondicionirovania_pred_tk_me + vid_tkm_nastoasej_ptkm_pred_tk_me_pditkm + cd3_kg_ptkm_pdi + cd34_kg_x10_ptkm_pdi 
    ## 
    ##          C      se(C) 
    ## 0.66221309 0.04104501 
    ## Модель для Surv ( efs2time , efs2 ) ~ d_z + restadirovanie_na_moment_tkm_stadia_pred_tk_me + vozrast_polnyh_let_na_moment_tkm + vozrastnaa_gruppa + sovmestimost_donora_recipienta_ptkm_pred_tk_me + rezim_kondicionirovania_pred_tk_me + vid_tkm_nastoasej_ptkm_pred_tk_me_pditkm + cd3_kg_ptkm_pdi + cd34_kg_x10_ptkm_pdi 
    ## 
    ##          C      se(C) 
    ## 0.72924188 0.06709169 
    ## Модель для Surv ( a_gvhd24time , a_gvhd24 ) ~ d_z + restadirovanie_na_moment_tkm_stadia_pred_tk_me + vozrast_polnyh_let_na_moment_tkm + vozrastnaa_gruppa + sovmestimost_donora_recipienta_ptkm_pred_tk_me + rezim_kondicionirovania_pred_tk_me + vid_tkm_nastoasej_ptkm_pred_tk_me_pditkm + cd3_kg_ptkm_pdi + cd34_kg_x10_ptkm_pdi 
    ## 
    ##          C      se(C) 
    ## 0.71710526 0.07780922 
    ## Модель для Surv ( c_gvh_dtime , c_gvhd ) ~ d_z + restadirovanie_na_moment_tkm_stadia_pred_tk_me + vozrast_polnyh_let_na_moment_tkm + vozrastnaa_gruppa + sovmestimost_donora_recipienta_ptkm_pred_tk_me + rezim_kondicionirovania_pred_tk_me + vid_tkm_nastoasej_ptkm_pred_tk_me_pditkm + cd3_kg_ptkm_pdi + cd34_kg_x10_ptkm_pdi

    ## [[1]]
    ## NULL
    ## 
    ## [[2]]
    ## NULL
    ## 
    ## [[3]]
    ## NULL
    ## 
    ## [[4]]
    ## NULL
    ## 
    ## [[5]]
    ## NULL
    ## 
    ## [[6]]
    ## NULL

## Model for eventless mortality

``` r
zero_predictors <- c("d_z", "restadirovanie_na_moment_tkm_stadia_pred_tk_me",  
                    "vozrast_polnyh_let_na_moment_tkm", "vozrastnaa_gruppa", 
                    "sovmestimost_donora_recipienta_ptkm_pred_tk_me", 
                    "rezim_kondicionirovania_pred_tk_me", 
                    "vid_tkm_nastoasej_ptkm_pred_tk_me_pditkm", 
                     "cd34_kg_x10_ptkm_pdi")

additional_predictors <- c("cd3_abs", "cd4_abs", "cd8_abs", "cd19_abs", "cd56_abs", "cd16_abs", "cd56cd16_abs", "cd4cd8_abs", "cd3cd56_abs")


model_formula_base <- as.formula(paste("Surv(time= compete2time, event = ifelse(compete2==1,1,0)) ~", paste(zero_predictors, collapse = " + ")))
fit_base <- coxph(model_formula_base, data = main_df)


models_with_additional <- lapply(additional_predictors, function(pred) {
  model_formula <- update(model_formula_base, paste(". ~ . +", pred))
  fit <- coxph(model_formula, data = main_df)
  return(list(predictor = pred, model = fit))
})


cat("Base model:\n")
```

    ## Base model:

``` r
print(summary(fit_base)$concordance)
```

    ##          C      se(C) 
    ## 0.78331900 0.05746966

``` r
lapply(models_with_additional, function(model) {
  cat("\nModel with additional predictor:", model$predictor, "\n")
  print(summary(model$model)$concordance)
})
```

    ## 
    ## Model with additional predictor: cd3_abs 
    ##          C      se(C) 
    ## 0.78245916 0.05552492 
    ## 
    ## Model with additional predictor: cd4_abs 
    ##          C      se(C) 
    ## 0.78589854 0.05671543 
    ## 
    ## Model with additional predictor: cd8_abs 
    ##          C      se(C) 
    ## 0.79019776 0.05710599 
    ## 
    ## Model with additional predictor: cd19_abs 
    ##          C      se(C) 
    ## 0.78204010 0.05702563 
    ## 
    ## Model with additional predictor: cd56_abs 
    ##          C      se(C) 
    ## 0.78933792 0.05885554 
    ## 
    ## Model with additional predictor: cd16_abs 
    ##         C     se(C) 
    ## 0.8034979 0.0455542 
    ## 
    ## Model with additional predictor: cd56cd16_abs 
    ##          C      se(C) 
    ## 0.83127572 0.05378423 
    ## 
    ## Model with additional predictor: cd4cd8_abs 
    ##          C      se(C) 
    ## 0.78478825 0.05569284 
    ## 
    ## Model with additional predictor: cd3cd56_abs 
    ##          C      se(C) 
    ## 0.78046595 0.05615099

    ## [[1]]
    ##          C      se(C) 
    ## 0.78245916 0.05552492 
    ## 
    ## [[2]]
    ##          C      se(C) 
    ## 0.78589854 0.05671543 
    ## 
    ## [[3]]
    ##          C      se(C) 
    ## 0.79019776 0.05710599 
    ## 
    ## [[4]]
    ##          C      se(C) 
    ## 0.78204010 0.05702563 
    ## 
    ## [[5]]
    ##          C      se(C) 
    ## 0.78933792 0.05885554 
    ## 
    ## [[6]]
    ##         C     se(C) 
    ## 0.8034979 0.0455542 
    ## 
    ## [[7]]
    ##          C      se(C) 
    ## 0.83127572 0.05378423 
    ## 
    ## [[8]]
    ##          C      se(C) 
    ## 0.78478825 0.05569284 
    ## 
    ## [[9]]
    ##          C      se(C) 
    ## 0.78046595 0.05615099

- A loop that outputs bootstrap results and confidence intervals (10
  models for one outcome - null and models with +1 new predictor)

``` r
# concordance function
concordance_function <- function(data, indices, formula) {
  d <- data[indices,] 
  fit <- coxph(formula, data = d) 
  return(summary(fit)$concordance) 
}

formulas <- c(model_formula_base, 
              lapply(models_with_additional, function(model) update(model_formula_base, paste(". ~ . +", model$predictor))))

# bootstrap
bootobjects <- lapply(formulas, function(formula) {
  boot(data = main_df, statistic = concordance_function, R = 100, formula = formula)
})


lapply(seq_along(bootobjects), function(i) {
  cat("\nModel with additional predictor:", 
      if (i == 1) "Base model" else models_with_additional[[i-1]]$predictor, "\n")
  
  cat("Bootstrap Results:\n")
  print(bootobjects[[i]])
  
  cat("\n95% Confidence Interval (BCa method):\n")
  print(boot.ci(bootobjects[[i]], type = "bca"))
  cat("\n")
})
```

    ## 
    ## Model with additional predictor: Base model 
    ## Bootstrap Results:
    ## 
    ## ORDINARY NONPARAMETRIC BOOTSTRAP
    ## 
    ## 
    ## Call:
    ## boot(data = main_df, statistic = concordance_function, R = 100, 
    ##     formula = formula)
    ## 
    ## 
    ## Bootstrap Statistics :
    ##       original       bias    std. error
    ## t1* 0.78331900  0.057133976  0.05007756
    ## t2* 0.05746966 -0.008344028  0.01294184
    ## 
    ## 95% Confidence Interval (BCa method):
    ## BOOTSTRAP CONFIDENCE INTERVAL CALCULATIONS
    ## Based on 100 bootstrap replicates
    ## 
    ## CALL : 
    ## boot.ci(boot.out = bootobjects[[i]], type = "bca")
    ## 
    ## Intervals : 
    ## Level       BCa          
    ## 95%   ( 0.7104,  0.8224 )  
    ## Calculations and Intervals on Original Scale
    ## Warning : BCa Intervals used Extreme Quantiles
    ## Some BCa intervals may be unstable
    ## 
    ## 
    ## Model with additional predictor: cd3_abs 
    ## Bootstrap Results:
    ## 
    ## ORDINARY NONPARAMETRIC BOOTSTRAP
    ## 
    ## 
    ## Call:
    ## boot(data = main_df, statistic = concordance_function, R = 100, 
    ##     formula = formula)
    ## 
    ## 
    ## Bootstrap Statistics :
    ##       original       bias    std. error
    ## t1* 0.78245916  0.067117373  0.05041160
    ## t2* 0.05552492 -0.009338113  0.01318022
    ## 
    ## 95% Confidence Interval (BCa method):
    ## BOOTSTRAP CONFIDENCE INTERVAL CALCULATIONS
    ## Based on 100 bootstrap replicates
    ## 
    ## CALL : 
    ## boot.ci(boot.out = bootobjects[[i]], type = "bca")
    ## 
    ## Intervals : 
    ## Level       BCa          
    ## 95%   ( 0.7453,  0.8230 )  
    ## Calculations and Intervals on Original Scale
    ## Warning : BCa Intervals used Extreme Quantiles
    ## Some BCa intervals may be unstable
    ## 
    ## 
    ## Model with additional predictor: cd4_abs 
    ## Bootstrap Results:
    ## 
    ## ORDINARY NONPARAMETRIC BOOTSTRAP
    ## 
    ## 
    ## Call:
    ## boot(data = main_df, statistic = concordance_function, R = 100, 
    ##     formula = formula)
    ## 
    ## 
    ## Bootstrap Statistics :
    ##       original       bias    std. error
    ## t1* 0.78589854  0.059462635  0.05822936
    ## t2* 0.05671543 -0.009709923  0.01306577
    ## 
    ## 95% Confidence Interval (BCa method):
    ## BOOTSTRAP CONFIDENCE INTERVAL CALCULATIONS
    ## Based on 100 bootstrap replicates
    ## 
    ## CALL : 
    ## boot.ci(boot.out = bootobjects[[i]], type = "bca")
    ## 
    ## Intervals : 
    ## Level       BCa          
    ## 95%   ( 0.7021,  0.8232 )  
    ## Calculations and Intervals on Original Scale
    ## Warning : BCa Intervals used Extreme Quantiles
    ## Some BCa intervals may be unstable
    ## 
    ## 
    ## Model with additional predictor: cd8_abs 
    ## Bootstrap Results:
    ## 
    ## ORDINARY NONPARAMETRIC BOOTSTRAP
    ## 
    ## 
    ## Call:
    ## boot(data = main_df, statistic = concordance_function, R = 100, 
    ##     formula = formula)
    ## 
    ## 
    ## Bootstrap Statistics :
    ##       original      bias    std. error
    ## t1* 0.79019776  0.07113288  0.05348045
    ## t2* 0.05710599 -0.01233528  0.01504968
    ## 
    ## 95% Confidence Interval (BCa method):
    ## BOOTSTRAP CONFIDENCE INTERVAL CALCULATIONS
    ## Based on 100 bootstrap replicates
    ## 
    ## CALL : 
    ## boot.ci(boot.out = bootobjects[[i]], type = "bca")
    ## 
    ## Intervals : 
    ## Level       BCa          
    ## 95%   ( 0.7434,  0.8266 )  
    ## Calculations and Intervals on Original Scale
    ## Warning : BCa Intervals used Extreme Quantiles
    ## Some BCa intervals may be unstable
    ## 
    ## 
    ## Model with additional predictor: cd19_abs 
    ## Bootstrap Results:
    ## 
    ## ORDINARY NONPARAMETRIC BOOTSTRAP
    ## 
    ## 
    ## Call:
    ## boot(data = main_df, statistic = concordance_function, R = 100, 
    ##     formula = formula)
    ## 
    ## 
    ## Bootstrap Statistics :
    ##       original       bias    std. error
    ## t1* 0.78204010  0.050140819  0.05584148
    ## t2* 0.05702563 -0.007963482  0.01150229
    ## 
    ## 95% Confidence Interval (BCa method):
    ## BOOTSTRAP CONFIDENCE INTERVAL CALCULATIONS
    ## Based on 100 bootstrap replicates
    ## 
    ## CALL : 
    ## boot.ci(boot.out = bootobjects[[i]], type = "bca")
    ## 
    ## Intervals : 
    ## Level       BCa          
    ## 95%   ( 0.7087,  0.8531 )  
    ## Calculations and Intervals on Original Scale
    ## Warning : BCa Intervals used Extreme Quantiles
    ## Some BCa intervals may be unstable
    ## 
    ## 
    ## Model with additional predictor: cd56_abs 
    ## Bootstrap Results:
    ## 
    ## ORDINARY NONPARAMETRIC BOOTSTRAP
    ## 
    ## 
    ## Call:
    ## boot(data = main_df, statistic = concordance_function, R = 100, 
    ##     formula = formula)
    ## 
    ## 
    ## Bootstrap Statistics :
    ##       original      bias    std. error
    ## t1* 0.78933792  0.05416232  0.05537107
    ## t2* 0.05885554 -0.01112942  0.01233792
    ## 
    ## 95% Confidence Interval (BCa method):
    ## BOOTSTRAP CONFIDENCE INTERVAL CALCULATIONS
    ## Based on 100 bootstrap replicates
    ## 
    ## CALL : 
    ## boot.ci(boot.out = bootobjects[[i]], type = "bca")
    ## 
    ## Intervals : 
    ## Level       BCa          
    ## 95%   ( 0.7173,  0.8419 )  
    ## Calculations and Intervals on Original Scale
    ## Warning : BCa Intervals used Extreme Quantiles
    ## Some BCa intervals may be unstable
    ## 
    ## 
    ## Model with additional predictor: cd16_abs 
    ## Bootstrap Results:
    ## 
    ## ORDINARY NONPARAMETRIC BOOTSTRAP
    ## 
    ## 
    ## Call:
    ## boot(data = main_df, statistic = concordance_function, R = 100, 
    ##     formula = formula)
    ## 
    ## 
    ## Bootstrap Statistics :
    ##      original        bias    std. error
    ## t1* 0.8034979  0.0565113035  0.06146474
    ## t2* 0.0455542 -0.0002807603  0.01570803
    ## 
    ## 95% Confidence Interval (BCa method):
    ## BOOTSTRAP CONFIDENCE INTERVAL CALCULATIONS
    ## Based on 100 bootstrap replicates
    ## 
    ## CALL : 
    ## boot.ci(boot.out = bootobjects[[i]], type = "bca")
    ## 
    ## Intervals : 
    ## Level       BCa          
    ## 95%   ( 0.7328,  0.8724 )  
    ## Calculations and Intervals on Original Scale
    ## Warning : BCa Intervals used Extreme Quantiles
    ## Some BCa intervals may be unstable
    ## 
    ## 
    ## Model with additional predictor: cd56cd16_abs 
    ## Bootstrap Results:
    ## 
    ## ORDINARY NONPARAMETRIC BOOTSTRAP
    ## 
    ## 
    ## Call:
    ## boot(data = main_df, statistic = concordance_function, R = 100, 
    ##     formula = formula)
    ## 
    ## 
    ## Bootstrap Statistics :
    ##       original      bias    std. error
    ## t1* 0.83127572  0.05301989  0.05100849
    ## t2* 0.05378423 -0.01163062  0.01454348
    ## 
    ## 95% Confidence Interval (BCa method):
    ## BOOTSTRAP CONFIDENCE INTERVAL CALCULATIONS
    ## Based on 100 bootstrap replicates
    ## 
    ## CALL : 
    ## boot.ci(boot.out = bootobjects[[i]], type = "bca")
    ## 
    ## Intervals : 
    ## Level       BCa          
    ## 95%   ( 0.7196,  0.8586 )  
    ## Calculations and Intervals on Original Scale
    ## Warning : BCa Intervals used Extreme Quantiles
    ## Some BCa intervals may be unstable
    ## 
    ## 
    ## Model with additional predictor: cd4cd8_abs 
    ## Bootstrap Results:
    ## 
    ## ORDINARY NONPARAMETRIC BOOTSTRAP
    ## 
    ## 
    ## Call:
    ## boot(data = main_df, statistic = concordance_function, R = 100, 
    ##     formula = formula)
    ## 
    ## 
    ## Bootstrap Statistics :
    ##       original       bias    std. error
    ## t1* 0.78478825  0.057340954  0.06017464
    ## t2* 0.05569284 -0.006246538  0.01372138
    ## 
    ## 95% Confidence Interval (BCa method):
    ## BOOTSTRAP CONFIDENCE INTERVAL CALCULATIONS
    ## Based on 100 bootstrap replicates
    ## 
    ## CALL : 
    ## boot.ci(boot.out = bootobjects[[i]], type = "bca")
    ## 
    ## Intervals : 
    ## Level       BCa          
    ## 95%   ( 0.6955,  0.8472 )  
    ## Calculations and Intervals on Original Scale
    ## Warning : BCa Intervals used Extreme Quantiles
    ## Some BCa intervals may be unstable
    ## 
    ## 
    ## Model with additional predictor: cd3cd56_abs 
    ## Bootstrap Results:
    ## 
    ## ORDINARY NONPARAMETRIC BOOTSTRAP
    ## 
    ## 
    ## Call:
    ## boot(data = main_df, statistic = concordance_function, R = 100, 
    ##     formula = formula)
    ## 
    ## 
    ## Bootstrap Statistics :
    ##       original       bias    std. error
    ## t1* 0.78046595  0.054901423  0.04973291
    ## t2* 0.05615099 -0.005859657  0.01232968
    ## 
    ## 95% Confidence Interval (BCa method):
    ## BOOTSTRAP CONFIDENCE INTERVAL CALCULATIONS
    ## Based on 100 bootstrap replicates
    ## 
    ## CALL : 
    ## boot.ci(boot.out = bootobjects[[i]], type = "bca")
    ## 
    ## Intervals : 
    ## Level       BCa          
    ## 95%   ( 0.7033,  0.8346 )  
    ## Calculations and Intervals on Original Scale
    ## Warning : BCa Intervals used Extreme Quantiles
    ## Some BCa intervals may be unstable

    ## [[1]]
    ## NULL
    ## 
    ## [[2]]
    ## NULL
    ## 
    ## [[3]]
    ## NULL
    ## 
    ## [[4]]
    ## NULL
    ## 
    ## [[5]]
    ## NULL
    ## 
    ## [[6]]
    ## NULL
    ## 
    ## [[7]]
    ## NULL
    ## 
    ## [[8]]
    ## NULL
    ## 
    ## [[9]]
    ## NULL
    ## 
    ## [[10]]
    ## NULL
