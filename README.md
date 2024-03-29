# Association of the donor immunological status with the outcomes of allogeneic hematopoietic stem cell transplantation using posttransplantation cyclophosphamide

## Background

Despite the active introduction of targeted and immunotherapy, allogeneic hematopoietic stem cell transplantation (HSCT) remains one of the most important options for patients with hematological malignancies. However, transplant recipients remain at high risk for serious and fatal complications, and one of the main life-threatening complications is  graft-versus-host disease (GVHD). During the last decade GVHD prophylaxis implementing posttransplantation cyclophosphamide (PTCy) has gained popularity worldwide. However, the biological effects of PTCy and its impact on recipient immune recovery still remain not completely understood. An investigational team reported a study involving patients with PTCy as GVHD prophylaxis, which demonstrated an association between the high content of NKT and NK cells in the graft and unsatisfactory immunological recovery, which translated into worse survival rates. It had been also revealed that the number of CD4+CD8+ cells in the graft was a predictor of chronic GVHD [1]. We further suggested that the effects observed for donor grafts can be translated to donors themselves and revealed already by analysis of blood samples before any procedures related to bone marrow donation.

## Purpose
The purpose of this study is to identify potential predictors of allo-HSCT outcomes based on the immunological characteristics of the donor’s peripheral blood.

### Objectives
1. Preprocessing complex data
2. Descriptive statistics to describe donor & patient characteristics, HSCT procedure and its outcomes
3. Identification of outcomes and their potential predictors
4. Exploratory analysis:
- Identification of correlated variables (correlation analysis, clustering, principal component analysis)
- Identification of associations (univariate regression analysis)
5. Assessment of the potential association between donor immunological characteristics and allogeneic HSCT outcomes
6. Development of a model including immunological and other characteristics to predict allogeneic HSCT outcomes
7. Model quality assessment (added predictive value)

## Results


### Describtive statistics
1. Description of HSCT outcomes: overall survival, event-free survival, death, acute and chronic GVHD and the time until each outcome
  ![](Burmakina/tab1.png)<!-- -->
* Missing values in outcomes:
  ![](Burmakina/unnamed-chunk-6-1.png)<!-- -->
2. Description of known HSCT predictors:
* We analyzed data from 95 patients diagnosed with acute leukemia (77%), myeloproliferative (16%), and lymphoproliferative disorders (7%). The majority (89%) of patients are currently in remission. Transplantations were conducted using both myeloablative (49%) and non-myeloablative (51%) regimens, with both related (57%) and unrelated (43%) donors. Donor-recipient pairs included both fully matched (37%) and partially matched (63%) cases. Additionally, the analysis encompassed patients across various age groups, including those under 18 years old (23%). Median follow-up time was 476 days.
  ![](Burmakina/tab2.png)<!-- -->
3. Description of potential HSCT predictors: absolut amounts of CD3+, CD4+, CD8+, CD19+, CD56+, CD16+, CD56CD16+, CD4CD8+, and CD3CD56+ cells х10^9/л
  ![](Burmakina/tab3.png)<!-- -->
* Missing values for potential predictors:
  ![](Burmakina/unnamed-chunk-5-1.png)<!-- -->
4. Descrition of outcomes in the whole group: 
  ![](Matvienko/OS_whole_group.png)<!-- -->
  ![](Matvienko/EFS_whole_group.png)<!-- -->
  ![](Matvienko/CIR_whole_group.png)<!-- -->
  ![](Matvienko/NRM_whole_group.png)<!-- -->
  ![](Matvienko/aGVHD_whole_group.png)<!-- -->
  ![](Matvienko/cGVHD_whole_group.png)<!-- -->

### Exploratory analysis:
### 1. Correlation analysis, clustering, PCA

![](Matvienko/clusters.png)<!-- -->

![](Matvienko/corrplot.png)<!-- -->

PCA results confirm the result of correlation analysis:

![image](https://github.com/GChernaya/CYTO7/assets/75510914/289474e0-0e3a-4f79-be40-a1fc53213754) ![image](https://github.com/GChernaya/CYTO7/assets/75510914/aeb91786-f5de-4cb9-892c-17c8ec8afa86)


### 2. Univariate regression analysis
1. Overall survival
![image](https://github.com/GChernaya/CYTO7/blob/9d782ae8f435f46cc2a6b07549f169c15831b226/Serebryakova/1.%20Overall_survival_forest_plot_univariate_cox.png)
2. Relapse
![image](https://github.com/GChernaya/CYTO7/blob/9d782ae8f435f46cc2a6b07549f169c15831b226/Serebryakova/2.%20Relapse_forest_plot_univariate_cox.png)
3. Event-free survival
![image](https://github.com/GChernaya/CYTO7/blob/9d782ae8f435f46cc2a6b07549f169c15831b226/Serebryakova/3.%20Event_free_survival_forest_plot_univariate_cox.png)
4. Event-free mortality
![image](https://github.com/GChernaya/CYTO7/blob/9d782ae8f435f46cc2a6b07549f169c15831b226/Serebryakova/4.%20Event_free_mortality_forest_plot_univariate_cox.png)
5. Acute GVHD
![image](https://github.com/GChernaya/CYTO7/blob/9d782ae8f435f46cc2a6b07549f169c15831b226/Serebryakova/5.%20Acute_GVHD_forest_plot_univariate_cox.png)
6. Chronic GVHD
![image](https://github.com/GChernaya/CYTO7/blob/9d782ae8f435f46cc2a6b07549f169c15831b226/Serebryakova/6.%20Chronic_GVHD_forest_plot_univariate_cox.png)

Heatmap with p-values
![image](https://github.com/GChernaya/CYTO7/blob/bf11a36dc3e76866ca8f26db237ece837330bd5d/Serebryakova/Heatmap.png)

Then preliminary univariate Cox regression screening without adjustment for multiple comparisons was performed for initial features extraction. Association between OS and the amount of CD16CD56+ cells was found: HR 0.51 (95% CI 0.26 - 1.01). Association between CIR and the CD19+ cell: HR 1.42 (95% CI 1.11 - 1.81), and association between NRM and the CD56+ cell amounts were found: HR 1.34 (95% CI 0.99 - 1.79).

### Multiple Cox regression models: selection of predictors, calculation of added value

In the Cox regression model for assessing outcomes (overall survival, event-free survival, death, acute and chronic GVHD), the predictors included were age, diagnosis, disease stage, conditioning regimen, donor-recipient compatibility, type of transplantation, and the number of CD34 cells/kg. This model was taken as the null model, followed by the calculation of Harrell's C-index for this model and for a model with new potential predictors selected using LASSO method with resampling. Resampling was conducted using the bootstrap method (R = 1000). Subsequently, the distributions of metrics were evaluated with 95 % confidence intervals for the C-index values distribution, along with the distribution of added value for each outcome. This method was successfully applied to the outcomes of relapse, event-free survival, overall survival and chronic GVHD, and failed to death and acute GVHD possibly due to the limited number of outcomes, sample size, and distribution of values of categorical predictors.

![image](https://github.com/GChernaya/CYTO7/assets/75510914/0df148e0-a262-4033-80aa-348ffba57b9b)

![image](https://github.com/GChernaya/CYTO7/assets/75510914/d669e7bf-f827-4b73-b6c6-c3b01725f57e)


95% CI for Harrell's C-index values and added value are present in [Table 1](https://github.com/GChernaya/CYTO7/blob/main/Table%201.md). Parameters considered as potential new predictors of outcomes (relapse, overall survival, event-free survival, chronic GVHD) demonstrated added value less than 0.05 in most cases.There vere no potential new predictors selected by LASSO regression in percentage of cases from 55,5% of samples for overall survival to 68,1% for chronic GVHD.

## Conclusion and further plans
The clinical significance of the effect of parametres, included in analysis, raises doubts. 
The approach used to select for new predictors may not be suitable for rare outcomes.

Further plans:
Apply another suitable methods for rare outcomes.


### References
1. Moiseev IS, et al. High prevalence of CD3, NK, and NKT cells in the graft predicts adverse outcome after matched-related and unrelated transplantations with post transplantation cyclophosphamide. Bone Marrow Transplant. 2020 Mar;55(3):544-552. https://doi.org/10.1038/s41409-019-0665-3
2. Zhao, C., Bartock, M., Jia, B. et al. Post-transplant cyclophosphamide alters immune signatures and leads to impaired T cell reconstitution in allogeneic hematopoietic stem cell transplant. J Hematol Oncol 15, 64 (2022). https://doi.org/10.1186/s13045-022-01287-3
3. Nakamae H, Fujii K, Nanno S, et al. A prospective observational study of immune reconstitution following transplantation with post-transplant reduced-dose cyclophosphamide from HLA-haploidentical donors. Transpl Int. 2019;32(12):1322-1332. doi:10.1111/tri.13494
4. https://github.com/JanMarvin/openxlsx2
5. https://cran.r-project.org/web/packages/janitor/vignettes/janitor.html
6. https://r4ds.had.co.nz/strings.html#matching-patterns-with-regular-expressions
7. https://github.com/georgheinze/coxphf







