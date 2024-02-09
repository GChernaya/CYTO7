library(survival)
library(glmnet)
library(boot)
library(mice)

source("data_preprocessing.R")

# Проверяем нулевые модели ------------------------------------------------
null_fits <- df %>% 
    select(all_of(c(null_model_predictors, outcomes))) %>% 
    mutate(pid = row_number()) %>% 
    pivot_longer(all_of(outcomes)) %>% 
    mutate(type = if_else(str_detect(name, "time"), "time", "event")) %>% 
    mutate(name = str_remove(name, "_?time")) %>% 
    pivot_wider(names_from = type, values_from = value) %>% 
    select(-pid) %>% 
    nest(data = -name) %>% 
    mutate(fit = map(
        data, \(d) coxph(Surv(time, event) ~ ., d)
    ))

null_fits %>% 
    mutate(
        concordance = map_dbl(fit, \(x) x$concordance[["concordance"]])
    ) %>% 
    select(name, concordance)

# bootstrap ---------------------------------------------------------------
## data for bootstrap with variable selection
df <- df %>% 
    drop_na(all_of(new_predictors)) %>% drop_na(all_of(contains("time"))) %>% 
    as.data.frame()

select_new_predictors <- function(data, time, event, new_predictors, type = "lambda.1se") {
    mat <- scale(data[, new_predictors])
    surv <- Surv(data[, time], data[, event])
    fit <- cv.glmnet(x = mat, y = surv, family = "cox", alpha = 1)
    fit <- glmnet(x = mat, y = surv, family = "cox", alpha = 1, lambda = fit[[type]])
    res <- as.matrix(coef(fit))
    rownames(res)[abs(res[, 1]) > 0]
}

models <- function(data, time, event, new_predictors, null_model_predictors, indices) {
    d <- data[indices, ]
    surv <- Surv(d[, time], d[, event])
    res_lasso <- select_new_predictors(d, time, event, new_predictors)
    preds <- c(null_model_predictors, res_lasso)
    new_preds <- ""
    if(length(res_lasso) > 0) {
        new_preds <- str_flatten(res_lasso, collapse = "|")
    }
    fit_null <- coxph(surv ~ ., select(d, all_of(null_model_predictors)))
    fit_full <- coxph(surv ~ ., select(d, all_of(preds)))
    
    ## returned values
    c_null <- as.numeric(fit_null$concordance["concordance"])
    c_full <- as.numeric(fit_full$concordance["concordance"])
    
    return(c(
        "new_preds" = length(res_lasso),
        "c_null" = c_null,
        "c_full" = c_full,
        "c_added" = c_full - c_null
    ))
}

run_boot <- function(data, statistic, time, event, new_predictors, null_model_predictors, R) {
    data <- data %>% drop_na(all_of(c(time, event)))
    res <- boot(
        data, models, time = time, event = event, 
        new_predictors = new_predictors, 
        null_model_predictors = null_model_predictors,
        R = R
    )
    return(res)
}

res <- run_boot(
    df, models, time = "rel2time", event = "rel2",
    new_predictors = new_predictors, 
    null_model_predictors = null_model_predictors,
    R = 1000
)

table(res$t[, 1])

boot.ci(res, type = "bca", index = 2)
boot.ci(res, type = "bca", index = 3)
boot.ci(res, type = "bca", index = 4)
 

hist(res$t[, 2], main = "Relapse: C-index, null model", xlab="C-index")
hist(res$t[, 3], main = "Relapse: C-index, with new predictors", xlab="C-index")
hist(res$t[, 4], main = "Relapse: Added value", xlab="Added value")



##################################################

res1 <- run_boot(
  df, models, time = "efs2time", event = "efs2",
  new_predictors = new_predictors, 
  null_model_predictors = null_model_predictors,
  R = 1000
)

table(res1$t[, 1])

boot.ci(res1, type = "bca", index = 2)
boot.ci(res1, type = "bca", index = 3)
boot.ci(res1, type = "bca", index = 4)


hist(res1$t[, 2])
hist(res1$t[, 3])
hist(res1$t[, 4])

##########################################################


res2 <- run_boot(
  df, models, time = "os2time", event = "os2",
  new_predictors = new_predictors, 
  null_model_predictors = null_model_predictors,
  R = 1000
)

table(res2$t[, 1])

boot.ci(res2, type = "bca", index = 2)
boot.ci(res2, type = "bca", index = 3)
boot.ci(res2, type = "bca", index = 4)


hist(res2$t[, 2])
hist(res2$t[, 3])
hist(res2$t[, 4])


##############################################################


res3 <- run_boot(
  df %>% filter(c_gvhd_time > 0), models, time = "c_gvhd_time", event = "c_gvhd",
  new_predictors = new_predictors, 
  null_model_predictors = null_model_predictors,
  R = 1000
)

table(res3$t[, 1])

boot.ci(res3, type = "bca", index = 2)
boot.ci(res3, type = "bca", index = 3)
boot.ci(res3, type = "bca", index = 4)


hist(res3$t[, 2])
hist(res3$t[, 3])
hist(res3$t[, 4])


#####################################################################


res4 <- run_boot(
  df %>% filter(c_gvhd_time > 0), models, time = "a_gvhd24time", event = "a_gvhd24",
  new_predictors = new_predictors, 
  null_model_predictors = null_model_predictors,
  R = 1000
)

table(res4$t[, 1])

boot.ci(res4, type = "bca", index = 2)
boot.ci(res4, type = "bca", index = 3)
boot.ci(res4, type = "bca", index = 4)


hist(res4$t[, 2])
hist(res4$t[, 3])
hist(res4$t[, 4])


#####################################################################

res5 <- run_boot(
  df %>% filter(c_gvhd_time > 0), models, time = "compete2time", event = "compete2",
  new_predictors = new_predictors, 
  null_model_predictors = null_model_predictors,
  R = 1000
)

table(res5$t[, 1])

boot.ci(res5, type = "bca", index = 2)
boot.ci(res5, type = "bca", index = 3)
boot.ci(res5, type = "bca", index = 4)


hist(res5$t[, 2])
hist(res5$t[, 3])
hist(res5$t[, 4])


# Visualization

data_C_null <- data.frame(value = c(res$t[, 2], res1$t[, 2], res2$t[, 2], res3$t[, 2]),
                   group = rep(c("Relapse", "EFS", "OS", "Chronic GVHD"), each = nrow(res$t)))

ggplot(data_C_null, aes(x = value)) +
  geom_histogram(binwidth = 0.1, color="black", fill="grey") +
  facet_wrap(~ group, scales = "free") +
  labs(title = "C-index, null model, bootstrap (R = 1000)", x = "Hurrell's C-index") +
  theme_minimal() -> null_graph


data_added <- data.frame(value = c(res$t[, 4], res1$t[, 4], res2$t[, 4], res3$t[, 4]),
                          group = rep(c("Relapse", "EFS", "OS", "Chronic GVHD"), each = nrow(res$t)))

ggplot(data_added, aes(x = value)) +
  geom_histogram(binwidth = 0.02, color="black", fill="grey") +
  facet_wrap(~ group, scales = "free") +
  labs(title = "Added value, bootstrap (R = 1000)", x = "Hurrell's C-index, added value") +
  theme_minimal() -> added_graph






###################################
results_list <- list(
  boot.ci(res, type = "bca", index = 2),
  boot.ci(res, type = "bca", index = 3),
  boot.ci(res, type = "bca", index = 4),
  boot.ci(res1, type = "bca", index = 2),
  boot.ci(res1, type = "bca", index = 3),
  boot.ci(res1, type = "bca", index = 4),
  boot.ci(res2, type = "bca", index = 2),
  boot.ci(res2, type = "bca", index = 3),
  boot.ci(res2, type = "bca", index = 4),
  boot.ci(res3, type = "bca", index = 2),
  boot.ci(res3, type = "bca", index = 3),
  boot.ci(res3, type = "bca", index = 4)
)


extracted_results <- lapply(results_list, function(x) {
  c(level = rownames(x$bca), bca_lower = x$bca[, 4], bca_upper = x$bca[, 5])
})

# Преобразование списка в data frame
result_df <- do.call(rbind.data.frame, extracted_results)

# Добавление информации о вызовах boot.ci в качестве столбца
result_df$Metrics <- c("Relapse: C-index, null model", "Relapse: C-index, with new predictors", "Relapse: added value", 
                       "EFS: C-index, null model", "EFS: C-index, with new predictors", "EFS: added value", 
                       "OS: C-index, null model", "OS: C-index, with new predictors", "OS: added value", 
                       "Chronic GVHD: C-index, null model", "Chronic GVHD: C-index, with new predictors", "Chronic GVHD: added value")


result_df %>%
  select(Metrics,
         `c.0.594256259204713..0.594256259204713...0.0679681851048446..`,
         `c.0.713051030119814..0.707539782661456..0..0.611674151028981..`) %>%
  rename(`CI_lower` = `c.0.594256259204713..0.594256259204713...0.0679681851048446..`,
         `CI_upper` = `c.0.713051030119814..0.707539782661456..0..0.611674151028981..`) -> tab

# Printing the modified dataframe
result_table <- knitr::kable(tab)
# Вывод таблицы
print(result_table)