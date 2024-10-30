# BANK ATTRITION ANALYSIS

## Table of Contents
- [Project Overview](#project-overview)
- [Data Sources](#data-sources)
- [Tools Used](#tools-used)
- [Data Cleaning/Preparation](#data-cleaning/preparation)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [Data Analysis](#data-analysis)
- [Results/Findings](#results/findings)
- [Recommendations](#recommendations)
- [Limitation](#limitation)
### Project Overview

A manager at the bank is disturbed with more and more customers leaving their credit card services. They want to analyze the data to find out the reason behind customer attrition and predict customers who are going to get attrited so they can proactively go to the customers to provide them better services and hence stop them from leaving. 

This dataset consists of 10,000 customers mentioning their age, salary, marital_status, credit card limit, credit card category, etc. 

### Data Sources

Datasets used: I got the dataset from "[kaggle/Input/credit-card-customers/BankChurners.csv](https://www.kaggle.com/datasets/anwarsan/credit-card-bank-churn)"

### Tools Used
- Excel - Data Cleaning
- MySQL - Data Analysis
- PowerBI - Creating Reports

### Data Cleaning/Preparation
The dataset was first opened in Excel where the last two columns were deleted before saving into the already created database 'Churners' in MySQL

### Exploratory Data Analysis
Exploration of the datasets was done to find out exactly what influences customer's attrition. some of the questions that were answered include:
- what is the percentage of existing and atrrittted customers?
- what is the attrition flag by marital_status?
- what is the attrition flag by income_category?

### Data Analysis
Below is one of the interesting code I worked with to create a conditional column that show customers with different levels of attrition 
```sql
select client_num,
if (Total_Ct_Chng_Q4_Q1<=0.7 and Total_amt_Chng_Q4_Q1<=0.8 
and total_trans_amt<=4404.1 and total_trans_ct<=64.9, 'High Risk',
if (Total_Ct_Chng_Q4_Q1<=1.9 and Total_amt_Chng_Q4_Q1<=1.7 and total_trans_amt<=9242 and
total_trans_ct<=69.5, 'Medium Risk', 'low Risk')) as customers_attrition_risk
 from bankchurners
 where attrition_flag = 'existing customer';
```

### Results/Findings
From our analysis, it was found out that these four datasets greatly influenced customer atrrition:

- Total transaction Count (last 12 months)
- Total transaction Amount (last 12 months)
- Ratio of the total transaction count in 4th quarter and 1st quarter
- Ratio of the total transaction amount in 4th quarter and 1st quarter. 

### Recommendations
Based on our analysis, the following actions are recommended:
- Simplify transactions processes
- Improve transaction limit: Increase or adjust limits to meet customer needs
- Offer Incentives: Reward customers for continued loyalty
- Real-time transaction updates: Notify customers or transactions
- Automated savings tools: Encourage customers to save
- Fee reduction or waiver: Review and adjust fees

### Limitation
We have only 16.1% of customers who have attrited. Thus, it is a bit difficult to train our model to predict attricted customers.

The attached PowerBI report shows the customers who are at the risk of chunning and the level of risk.




