CREATE DATABASE Churners;
-- The dataset is imported from '/kaggle/Input/credit-card-customers/BankChurners.csv'
-- It was first opened in Excel where the last two columns were deleted 
-- Then saved into the already created database 'Churners' in MySQL
-- preview our datasets
use churners;
select * from bankchurners; 
alter table bankchurners;
-- rename column clientnum to client_num;

describe bankchurners;

-- checking for null values
select count(client_num)
from bankchurners where client_num is null;

-- checking for duplicates
select client_num, count(client_num) as count
from bankchurners
group by client_num
having count > 1;

-- ANALYSIS PHASE
-- what is the total number of client in the bankchurners dataset?
select count(distinct client_num) from bankchurners;

-- what is the percentage of existing and atrrittted customers?
select attrition_flag, count(attrition_flag) as count,
round((count(attrition_flag)/(select count(attrition_flag) from bankchurners)*100),1) as percentage
from bankchurners 
group by attrition_flag;

-- top 20 attrited customer by age 
select attrition_flag, customer_age, count(customer_age) as count
from bankchurners
group by attrition_flag, customer_age
having attrition_flag = 'attrited customer'
order by count desc limit 20;

-- top 20 existing customers by age
select attrition_flag, customer_age, count(customer_age) as count
from bankchurners
group by attrition_flag, customer_age
having attrition_flag = 'existing customer'
order by count desc limit 20;

-- top 20 customers by age
select attrition_flag, customer_age, count(customer_age) as count
from bankchurners
group by attrition_flag, customer_age
order by customer_age desc
limit 20;

-- total no of attrition_flag by gender
select attrition_flag, gender, count(gender) as count,
round((count(gender)/(select count(gender) from bankchurners)*100),1) as percentage_count
from bankchurners
group by attrition_flag, gender; 

-- attrition_flag by no of dependent_count 
select attrition_flag, dependent_count, count(dependent_count) as count
from bankchurners
group by attrition_flag, dependent_count
order by dependent_count asc, count desc;

-- attrition flag by education level
select attrition_flag, education_level, count(education_level) as count
from bankchurners
group by attrition_flag, education_level
order by count desc;

-- attrition flag by marital_status
select attrition_flag, marital_status, 
round(count(marital_status)/(select count(marital_status) from bankchurners)*100) as percentage_count
from bankchurners as count
group by attrition_flag, marital_status
order by percentage_count desc;

-- attrition flag by income category
select attrition_flag, income_category, count(income_category) as count
from bankchurners
group by attrition_flag, income_category
order by count desc;

-- attrition flag by card category
select attrition_flag, card_category, count(card_category) as count
from bankchurners
group by attrition_flag, card_category
order by count desc;

-- attrition_flag by month on book
select attrition_flag, months_on_book, count(months_on_book) as count
from bankchurners
group by attrition_flag, months_on_book
order by months_on_book desc, count desc;

-- total relationship count by attrition flag
select attrition_flag, total_relationship_count, 
round(count(total_relationship_count)/(select count(total_relationship_count) from bankchurners)*100) as percentage_count
from bankchurners as count
group by attrition_flag, total_relationship_count
order by total_relationship_count, percentage_count desc;

-- count of inactive months by attrition_flag
select attrition_flag, months_inactive_12_mon, count(months_inactive_12_mon) as count
from bankchurners
group by attrition_flag, months_inactive_12_mon
order by count desc;

-- top 20 highest customers with credit limit
select attrition_flag, credit_limit
from bankchurners
order by credit_limit desc
limit 20;

-- top 20 lowest customers with credit limit
select attrition_flag, credit_limit
from bankchurners
order by credit_limit 
limit 20;

-- top 20 lowest customers with total_revolving_bal
select attrition_flag, total_revolving_bal
from bankchurners
group by  attrition_flag, total_revolving_bal
order by total_revolving_bal 
limit 20;

-- top 20 highest customers with total_revolving_bal
select attrition_flag, total_revolving_bal
from bankchurners
group by  attrition_flag, total_revolving_bal
order by total_revolving_bal desc
limit 20;

-- top 20 highest customers with avg_open_to_buy
select attrition_flag, avg_open_to_buy
from bankchurners
group by  attrition_flag, avg_open_to_buy
order by avg_open_to_buy desc
limit 20;

-- top 20 lowest customers with avg_open_to_buy
select attrition_flag, avg_open_to_buy
from bankchurners
group by attrition_flag, avg_open_to_buy
order by avg_open_to_buy asc
limit 20;
-- All the analysis from above do not affect attrition_flag


-- Our findings from the analysis below shows that attrition_flag is greatly affected by it
-- top 20 lowest attrition_flag by Total_Amt_Chng_Q4_Q1
select attrition_flag, Total_Amt_Chng_Q4_Q1
from bankchurners
group by attrition_flag, Total_Amt_Chng_Q4_Q1
order by Total_Amt_Chng_Q4_Q1 asc
limit 20;

-- top 20 highest attrition_flag by Total_Amt_Chng_Q4_Q1
select attrition_flag, Total_Amt_Chng_Q4_Q1
from bankchurners
group by attrition_flag, Total_Amt_Chng_Q4_Q1
order by Total_Amt_Chng_Q4_Q1 desc
limit 20;

-- top 20 lowest attrition_flag by Total_Trans_Amt
select attrition_flag, Total_Trans_Amt
from bankchurners
group by attrition_flag, Total_Trans_Amt
order by Total_Trans_Amt asc
limit 20;

-- top 20 highest attrition_flag by Total_Trans_Amt
select attrition_flag, Total_Trans_Amt
from bankchurners
group by attrition_flag, Total_Trans_Amt
order by Total_Trans_Amt desc
limit 20;

-- top 20 lowest attrition_flag by Total_Trans_Ct
select attrition_flag, Total_Trans_Ct
from bankchurners
group by attrition_flag, Total_Trans_Ct
order by Total_Trans_Ct asc
limit 20;

-- top 20 highest attrition_flag by Total_Trans_Ct
select attrition_flag, Total_Trans_Ct
from bankchurners
group by attrition_flag, Total_Trans_Ct
order by Total_Trans_Ct desc
limit 20;

-- top 20 lowest attrition_flag by Total_Ct_Chng_Q4_Q1
select attrition_flag, Total_Ct_Chng_Q4_Q1
from bankchurners
group by attrition_flag, Total_Ct_Chng_Q4_Q1
order by Total_Ct_Chng_Q4_Q1 asc
limit 20;

-- top 20 highest attrition_flag by Total_Ct_Chng_Q4_Q1
select attrition_flag, Total_Ct_Chng_Q4_Q1
from bankchurners
group by attrition_flag, Total_Ct_Chng_Q4_Q1
order by Total_Ct_Chng_Q4_Q1 desc
limit 20;

-- top 20 highest attrition_flag by Avg_Utilization_Ratio
select attrition_flag, Avg_Utilization_Ratio
from bankchurners
group by attrition_flag, Avg_Utilization_Ratio
order by Avg_Utilization_Ratio desc
limit 20;

-- top 20 lowest attrition_flag by Avg_Utilization_Ratio
select attrition_flag, Avg_Utilization_Ratio
from bankchurners
group by attrition_flag, Avg_Utilization_Ratio
order by Avg_Utilization_Ratio asc
limit 20;

-- averages of the four columns that affect attrition flag
select round(avg(Total_Ct_Chng_Q4_Q1),1), round(avg(Total_amt_Chng_Q4_Q1),1),
round(avg(total_trans_amt),1), round(avg(total_trans_ct),1)
from bankchurners;

-- max number of the four columns that affect attrition flag
select round(max(Total_Ct_Chng_Q4_Q1)/2,1), round(max(Total_amt_Chng_Q4_Q1)/2,1),
round(max(total_trans_amt)/2,1), round(max(total_trans_ct)/2,1)
from bankchurners;

-- Based on the four columns, a conditional column was created to show customers with different levels of attrition 
select client_num,
if (Total_Ct_Chng_Q4_Q1<=0.7 and Total_amt_Chng_Q4_Q1<=0.8 
and total_trans_amt<=4404.1 and total_trans_ct<=64.9, 'High Risk',
if (Total_Ct_Chng_Q4_Q1<=1.9 and Total_amt_Chng_Q4_Q1<=1.7 and total_trans_amt<=9242 and
total_trans_ct<=69.5, 'Medium Risk', 'low Risk')) as customers_attrition_risk
 from bankchurners
 where attrition_flag = 'existing customer';
 
 select client_num,
if (Total_Ct_Chng_Q4_Q1<=0.7 or Total_amt_Chng_Q4_Q1<=0.8 
or total_trans_amt<=4404.1 or total_trans_ct<=64.9, 'High Risk',
if (Total_Ct_Chng_Q4_Q1<=1.9 or Total_amt_Chng_Q4_Q1<=1.7 or total_trans_amt<=9242 or
total_trans_ct<=69.5, 'Medium Risk', 'low Risk')) as customers_attrition_risk
 from bankchurners
 where attrition_flag = 'attrited customer';
 




















