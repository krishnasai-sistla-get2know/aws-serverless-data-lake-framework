 Tutorial 1 Sample queries on TPC-H data

Prerequisites
This tutorial requires the Snowflake provided
snowflake_sample_data database.  If you don't
have this database already in your account 
please add it by following these instructions
httpsdocs.snowflake.netmanualsuser-guidesample-data-using.html
 
Pricing Summary Report Query (Q1) 
This query demonstrates basic SQL 
functionality using the included TPC-H sample
data.  The results are the amount of business
that was billed, shipped, and returned. 

Business Question The Pricing Summary Report
Query provides a summary pricing report for 
all line items shipped as of a given date. The
date is within 60 - 120 days of the greatest 
ship date contained in the database. The query
lists totals for extended price, discounted 
extended price, discounted extended price plus
tax, average quantity, average extended price,
and average discount. These aggregates are 
grouped by RETURNFLAG and LINESTATUS, and 
listed in ascending order of RETURNFLAG and 
LINESTATUS. A count of the number of line items
in each group is included. 


use schema snowflake_sample_data.tpch_sf1; 
-- or tpch_sf100, tpcds_sf10tcl

SELECT
l_returnflag,
l_linestatus,
sum(l_quantity) as sum_qty,
sum(l_extendedprice) as sum_base_price,
sum(l_extendedprice  (1-l_discount)) 
  as sum_disc_price,
sum(l_extendedprice  (1-l_discount)  
  (1+l_tax)) as sum_charge,
avg(l_quantity) as avg_qty,
avg(l_extendedprice) as avg_price,
avg(l_discount) as avg_disc,
count() as count_order
FROM
lineitem
WHERE
l_shipdate = dateadd(day, -90, to_date('1998-12-01'))
GROUP BY
l_returnflag,
l_linestatus
ORDER BY
l_returnflag,
l_linestatus;

COPY INTO s3://snowflake-ftwtyci-is41662/tpcds_sf10tcl/call_center/ 
from snowflake_sample_data.tpcds_sf10tcl.call_center
storage_integration = s3_int;

COPY INTO s3://snowflake-ftwtyci-is41662/tpcds_sf10tcl/catalog_page/ 
from snowflake_sample_data.tpcds_sf10tcl.catalog_page
storage_integration = s3_int;

COPY INTO s3://snowflake-ftwtyci-is41662/tpcds_sf10tcl/catalog_returns/ 
from snowflake_sample_data.tpcds_sf10tcl.catalog_returns
storage_integration = s3_int;

COPY INTO s3://snowflake-ftwtyci-is41662/tpcds_sf10tcl/catalog_sales/ 
from snowflake_sample_data.tpcds_sf10tcl.catalog_sales
storage_integration = s3_int;

COPY INTO s3://snowflake-ftwtyci-is41662/tpcds_sf10tcl/customer/ 
from snowflake_sample_data.tpcds_sf10tcl.customer
storage_integration = s3_int;

COPY INTO s3://snowflake-ftwtyci-is41662/tpcds_sf10tcl/customer_address/ 
from snowflake_sample_data.tpcds_sf10tcl.customer_address
storage_integration = s3_int;

COPY INTO s3://snowflake-ftwtyci-is41662/tpcds_sf10tcl/customer_demographics/ 
from snowflake_sample_data.tpcds_sf10tcl.customer_demographics
storage_integration = s3_int;

COPY INTO s3://snowflake-ftwtyci-is41662/tpcds_sf10tcl/date_dim/
from snowflake_sample_data.tpcds_sf10tcl.date_dim
storage_integration = s3_int;

COPY INTO s3://snowflake-ftwtyci-is41662/tpcds_sf10tcl/household_demographics/
from snowflake_sample_data.tpcds_sf10tcl.household_demographics
storage_integration = s3_int;

COPY INTO s3://snowflake-ftwtyci-is41662/tpcds_sf10tcl/income_band/
from snowflake_sample_data.tpcds_sf10tcl.income_band
storage_integration = s3_int;

COPY INTO s3://snowflake-ftwtyci-is41662/tpcds_sf10tcl/inventory/
from snowflake_sample_data.tpcds_sf10tcl.inventory
storage_integration = s3_int;

COPY INTO s3://snowflake-ftwtyci-is41662/tpcds_sf10tcl/item/
from snowflake_sample_data.tpcds_sf10tcl.item
storage_integration = s3_int;

COPY INTO s3://snowflake-ftwtyci-is41662/tpcds_sf10tcl/promotion/
from snowflake_sample_data.tpcds_sf10tcl.promotion
storage_integration = s3_int;

COPY INTO s3://snowflake-ftwtyci-is41662/tpcds_sf10tcl/reason/
from snowflake_sample_data.tpcds_sf10tcl.reason
storage_integration = s3_int;

COPY INTO s3://snowflake-ftwtyci-is41662/tpcds_sf10tcl/ship_mode/
from snowflake_sample_data.tpcds_sf10tcl.ship_mode
storage_integration = s3_int;

COPY INTO s3://snowflake-ftwtyci-is41662/tpcds_sf10tcl/store/
from snowflake_sample_data.tpcds_sf10tcl.store
storage_integration = s3_int;

COPY INTO s3://snowflake-ftwtyci-is41662/tpcds_sf10tcl/store_returns/
from snowflake_sample_data.tpcds_sf10tcl.store_returns
storage_integration = s3_int;

COPY INTO s3://snowflake-ftwtyci-is41662/tpcds_sf10tcl/store_sales/
from snowflake_sample_data.tpcds_sf10tcl.store_sales
storage_integration = s3_int;

COPY INTO s3://snowflake-ftwtyci-is41662/tpcds_sf10tcl/time_dim/
from snowflake_sample_data.tpcds_sf10tcl.time_dim
storage_integration = s3_int;

COPY INTO s3://snowflake-ftwtyci-is41662/tpcds_sf10tcl/warehouse/
from snowflake_sample_data.tpcds_sf10tcl.warehouse
storage_integration = s3_int;

COPY INTO s3://snowflake-ftwtyci-is41662/tpcds_sf10tcl/web_page/
from snowflake_sample_data.tpcds_sf10tcl.web_page
storage_integration = s3_int;

COPY INTO s3://snowflake-ftwtyci-is41662/tpcds_sf10tcl/web_returns/
from snowflake_sample_data.tpcds_sf10tcl.web_returns
storage_integration = s3_int;

COPY INTO s3://snowflake-ftwtyci-is41662/tpcds_sf10tcl/web_sales/
from snowflake_sample_data.tpcds_sf10tcl.web_sales
storage_integration = s3_int;

COPY INTO s3://snowflake-ftwtyci-is41662/tpcds_sf10tcl/web_site/
from snowflake_sample_data.tpcds_sf10tcl.web_site
storage_integration = s3_int;

call_center
catalog_page
catalog_returns
catalog_sales
customer
customer_address
customer_demographics
date_dim
household_demographics
income_band
inventory
item
promotion
reason
ship_mode
store
store_returns
store_sales
time_dim
warehouse
web_page
web_returns
web_sales
web_site