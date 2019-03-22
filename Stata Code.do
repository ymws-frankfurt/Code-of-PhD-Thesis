* 0. setting

clear

cd "C:\Users\s9194518\Python\Lins2017\Excel Check"

import excel using MODEL1234_Crisis_One_ESGCY2006.xlsx, first

winsor2 CumCrisisRawReturn CumCrisisAbnormalReturn, cuts(1 99)
winsor2 ESG_Combined_Score, cuts(1 99)
winsor2 ESG_Score, cuts(1 99)
winsor2 Environment_Pillar_Score, cuts(1 99)
winsor2 Social_Pillar_Score, cuts(1 99)
winsor2 LN_Mark_Cap, cuts(1 99)
winsor2 LongTermDebt, cuts(1 99)
winsor2 ShortTermDebt, cuts(1 99)
winsor2 CashHoldings, cuts(1 99)
winsor2 Profitability, cuts(1 99)
winsor2 BM, cuts(1 99)
winsor2 Momentum_firm, cuts(1 99)
winsor2 Idiosyncratic_Risk, cuts(1 99)
winsor2 FF_Pre60_coef_VWIRF FF_Pre60_coef_SMB FF_Pre60_coef_HML FF_Pre60_coef_MOM, cuts(1 99)


ren CumCrisisRawReturn_w Rawreturn
ren CumCrisisAbnormalReturn_w Abnormalreturn

*****************************************************************************************************

* 1. Des stats and corre table WITHOUT WINSORZING
sum ESG_Score   Environment_Pillar_Score Social_Pillar_Score CumCrisisRawReturn CumCrisisAbnormalReturn MarketCapitalization LongTermDebt ShortTermDebt CashHoldings Profitability BM NegativeBM Momentum_firm Idiosyncratic_Risk

corr ESG_Score  Environment_Pillar_Score Social_Pillar_Score CumCrisisRawReturn CumCrisisAbnormalReturn MarketCapitalization LongTermDebt ShortTermDebt CashHoldings Profitability BM NegativeBM Momentum_firm Idiosyncratic_Risk


* To latex
sutex ESG_Score Environment_Pillar_Score Social_Pillar_Score CumCrisisRawReturn CumCrisisAbnormalReturn MarketCapitalization LongTermDebt ShortTermDebt CashHoldings Profitability BM NegativeBM Momentum_firm Idiosyncratic_Risk, minmax title(Descriptive Statistics) nobs 
corrtex ESG_Score Environment_Pillar_Score Social_Pillar_Score CumCrisisRawReturn CumCrisisAbnormalReturn  LN_Mark_Cap LongTermDebt ShortTermDebt CashHoldings Profitability BM NegativeBM Momentum_firm Idiosyncratic_Risk, file(correlationtable) replace

*****************************************************************************************************

* 2. 


*ESG only

reg Rawreturn ESG_Score_w FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w i.SIC, vce(robust)
est sto m1
reg Abnormalreturn ESG_Score_w FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w i.SIC, vce(robust)
est sto m2
reg Rawreturn ESG_Score_w LN_Mark_Cap_w LongTermDebt_w ShortTermDebt_w CashHoldings_w Profitability_w BM_w NegativeBM Momentum_firm_w Idiosyncratic_Risk_w FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w i.SIC, vce(robust)
est sto m3
reg Abnormalreturn ESG_Score_w LN_Mark_Cap_w LongTermDebt_w ShortTermDebt_w CashHoldings_w Profitability_w BM_w NegativeBM Momentum_firm_w Idiosyncratic_Risk_w FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w i.SIC, vce(robust)
est sto m4

esttab m1 m2 m3 m4 using ESG.tex, nogaps ar2 addnotes("ESG Score is measured in calendar year 2006" "Four-factor loadings and Industry dummies are included in the regression but not exhibited here") drop(*.SIC FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w) se replace


*Env

reg Rawreturn Environment_Pillar_Score_w FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w i.SIC, vce(robust)
est sto m1
reg Abnormalreturn Environment_Pillar_Score_w FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w i.SIC, vce(robust)
est sto m2
reg Rawreturn Environment_Pillar_Score_w LN_Mark_Cap_w LongTermDebt_w ShortTermDebt_w CashHoldings_w Profitability_w BM_w NegativeBM Momentum_firm_w Idiosyncratic_Risk_w FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w i.SIC, vce(robust)
est sto m3
reg Abnormalreturn Environment_Pillar_Score_w LN_Mark_Cap_w LongTermDebt_w ShortTermDebt_w CashHoldings_w Profitability_w BM_w NegativeBM Momentum_firm_w Idiosyncratic_Risk_w FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w i.SIC, vce(robust)
est sto m4

esttab m1 m2 m3 m4 using Env.tex, nogaps ar2 addnotes("Environment Pillar Score is measured in calendar year 2006") drop(*.SIC FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w) se replace


*Soc

reg Rawreturn Social_Pillar_Score_w FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w i.SIC, vce(robust)
est sto m1
reg Abnormalreturn Social_Pillar_Score_w FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w i.SIC, vce(robust)
est sto m2
reg Rawreturn Social_Pillar_Score_w LN_Mark_Cap_w LongTermDebt_w ShortTermDebt_w CashHoldings_w Profitability_w BM_w NegativeBM Momentum_firm_w Idiosyncratic_Risk_w FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w i.SIC, vce(robust)
est sto m3
reg Abnormalreturn Social_Pillar_Score_w LN_Mark_Cap_w LongTermDebt_w ShortTermDebt_w CashHoldings_w Profitability_w BM_w NegativeBM Momentum_firm_w Idiosyncratic_Risk_w FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w i.SIC, vce(robust)
est sto m4

esttab m1 m2 m3 m4 using Soc.tex, nogaps ar2 addnotes("Social Pillar Score is measured in calendar year 2006") drop(*.SIC FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w) se replace

*****************************************************************************************************

*ESG Quartile
reg Rawreturn  ESG2 ESG3 ESG4 FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w i.SIC, vce(robust)
est sto m1
reg Abnormalreturn  ESG2 ESG3 ESG4 FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w i.SIC, vce(robust)
est sto m2
reg Rawreturn  ESG2 ESG3 ESG4 LN_Mark_Cap_w LongTermDebt_w ShortTermDebt_w CashHoldings_w Profitability_w BM_w NegativeBM Momentum_firm_w Idiosyncratic_Risk_w FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w i.SIC, vce(robust)
est sto m3
reg Abnormalreturn  ESG2 ESG3 ESG4 LN_Mark_Cap_w LongTermDebt_w ShortTermDebt_w CashHoldings_w Profitability_w BM_w NegativeBM Momentum_firm_w Idiosyncratic_Risk_w FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w i.SIC, vce(robust)
est sto m4

esttab m1 m2 m3 m4 using ESGQuartile.tex, noconstant nogaps ar2 addnotes("ESG quartiles are measured in calendar year 2006") drop(*.SIC FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w) se replace


*Env Quartile
reg Rawreturn  Env2 Env3 Env4 FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w i.SIC, vce(robust)
est sto m1
reg Abnormalreturn  Env2 Env3 Env4 FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w i.SIC, vce(robust)
est sto m2
reg Rawreturn  Env2 Env3 Env4 LN_Mark_Cap_w LongTermDebt_w ShortTermDebt_w CashHoldings_w Profitability_w BM_w NegativeBM Momentum_firm_w Idiosyncratic_Risk_w FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w i.SIC, vce(robust)
est sto m3
reg Abnormalreturn  Env2 Env3 Env4 LN_Mark_Cap_w LongTermDebt_w ShortTermDebt_w CashHoldings_w Profitability_w BM_w NegativeBM Momentum_firm_w Idiosyncratic_Risk_w FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w i.SIC, vce(robust)
est sto m4

esttab m1 m2 m3 m4 using EnvQuartile.tex, noconstant nogaps ar2 addnotes("Environment Pillar Score quartiles are measured in calendar year 2006") drop(*.SIC FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w) se replace


*Soc Quartile
reg Rawreturn  Soc2 Soc3 Soc4 FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w i.SIC, vce(robust)
est sto m1
reg Abnormalreturn  Soc2 Soc3 Soc4 FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w i.SIC, vce(robust)
est sto m2
reg Rawreturn  Soc2 Soc3 Soc4 LN_Mark_Cap_w LongTermDebt_w ShortTermDebt_w CashHoldings_w Profitability_w BM_w NegativeBM Momentum_firm_w Idiosyncratic_Risk_w FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w i.SIC, vce(robust)
est sto m3
reg Abnormalreturn  Soc2 Soc3 Soc4 LN_Mark_Cap_w LongTermDebt_w ShortTermDebt_w CashHoldings_w Profitability_w BM_w NegativeBM Momentum_firm_w Idiosyncratic_Risk_w FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w i.SIC, vce(robust)
est sto m4

esttab m1 m2 m3 m4 using SocQuartile.tex, noconstant nogaps ar2 addnotes("Social Pillar Score quartiles are measured in calendar year 2006") drop(*.SIC FF_Pre60_coef_VWIRF_w FF_Pre60_coef_SMB_w FF_Pre60_coef_HML_w FF_Pre60_coef_MOM_w) se replace







*****************************************************************************************************
