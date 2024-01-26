# Association of the donor immunological status with the outcomes of allogeneic hematopoietic stem cell transplantation using posttransplantation cyclophosphamide

## Background

Despite the active development of targeted and immunotherapy, allo-HSCT remains one of the important options for patients with hematological malignancies. However, this procedure is associated with a multitude of risks, and one of the main life-threatening complications is GVHD.

Numerous prophylactic regimens for GVHD have been developed, and in recent years, prophylaxis with cyclophosphamide has gained popularity due to its demonstrated high clinical efficacy. However, the biological effects of cyclophosphamide and its impact on recipient immune reconstitution remain not fully understood, and this issue is currently actively researched. A research team has already conducted a study involving patients receiving Cy, which demonstrated an association between the cellular composition of the transplant on one hand, and immune reconstitution (and consequently, survival) and the likelihood of developing severe GVHD on the other. Consequently, the idea of a possible association with the peripheral blood composition of the donor has emerged, which would allow predicting transplantation outcomes based on analysis of the donor's peripheral blood even before the donation procedure.

This suggests the potential for pre-transplant screening based on donor peripheral blood analysis, enhancing the ability to predict transplantation outcomes and tailor interventions accordingly.

## Purpose
The purpose of this study is to identify potential predictors of allo-HSCT (allogeneic hematopoietic stem cell transplantation) outcomes based on the immunological characteristics of the donor’s peripheral blood.

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



### Exploratory analysis:
### 1. Correlation analysis, clustering, PCA


![image](https://github.com/GChernaya/CYTO7/assets/75510914/e28f6ff5-796c-4e1b-bb9a-164bf81bac17)


![image](https://github.com/GChernaya/CYTO7/assets/75510914/4b9bc7ea-a470-4179-96a3-a3d3d5fb006d)


![image](https://github.com/GChernaya/CYTO7/assets/75510914/c06b2400-eddb-461f-b5ad-638fcddcf3fb)



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
![image](https://github.com/GChernaya/CYTO7/blob/9d782ae8f435f46cc2a6b07549f169c15831b226/Serebryakova/7.%20Heatmap.png)

### Multiple Cox regression models: selection of predictors, calculation of added value

![image](https://github.com/GChernaya/CYTO7/assets/75510914/2731d20a-979f-49e8-9f0a-7af1fc3c5bd0)


## Conclusion and further plans
Parameters considered as potential new predictors of outcomes (event-free survival, chronic GVHD) did not demonstrate significant clinical significance despite statistically significant differences in the available data.
The approach used to select for new predictors may not be suitable for rare outcomes; therefore, it may be worthwhile to consider alternative methods for new predictor selection.



Further plans:

1. Develop pipeline for appropriate imputation.   
2. Apply developed pipeline for selection of predictors to imputed data.
3. Apply methods for rare outcomes

### References
1. Moiseev IS, et al. High prevalence of CD3, NK, and NKT cells in the graft predicts adverse outcome after matched-related and unrelated transplantations with post transplantation cyclophosphamide. Bone Marrow Transplant. 2020 Mar;55(3):544-552. https://doi.org/10.1038/s41409-019-0665-3
2. Zhao, C., Bartock, M., Jia, B. et al. Post-transplant cyclophosphamide alters immune signatures and leads to impaired T cell reconstitution in allogeneic hematopoietic stem cell transplant. J Hematol Oncol 15, 64 (2022). https://doi.org/10.1186/s13045-022-01287-3
3. Nakamae H, Fujii K, Nanno S, et al. A prospective observational study of immune reconstitution following transplantation with post-transplant reduced-dose cyclophosphamide from HLA-haploidentical donors. Transpl Int. 2019;32(12):1322-1332. doi:10.1111/tri.13494
4. https://github.com/JanMarvin/openxlsx2
5. https://cran.r-project.org/web/packages/janitor/vignettes/janitor.html
6. https://r4ds.had.co.nz/strings.html#matching-patterns-with-regular-expressions
7. https://github.com/georgheinze/coxphf
8. 





