## Comparing Courier Service Performance in the U.S.

This project analyzes courier shipment data to evaluate delivery performance, customer sastifaction, and shipping companies.
the analysis uses **SQL and Python** to explore how shipping mode, cost, and company service quality relate to on-time performance.     

    Data Sources
1. Logistics Regression Analysis Dataset
   Source: Kaggle (Prachi13, for educational use)
   Link: https://www.kaggle.com/datasets/prachi13/customer-analytics

   Contains:
   *  Shipment-level records
   *  Mode of shipment
   *  Product cost & weight
   *  Customer rating 
   *  Delivery timeliness (on time/late)  

2. [courier_companies.csv](data/courier_companies.csv)  
   Source: Created for this project to represent major U.S. couriers (FedEx, UPS, USPS, DHL, Amazon Logistics).

Contains:
   *  Average shipment cost
   *  Average delivery days
   *  Customer rating
   *  Market share
   *  Dominant shipping mode

3. Freight_tsi.csv 
   Source: U.S. Bureau of Transportation Statistics

  Contains:
   *  Daily Freight Transportation Services Index (TSI)
   *  National-level logistics demand trends 

   - Why These Datasets Were Combined
  
   1. Shipment-level

    *  Delivery delays
    *  Costs
    *  Mode of shipment
    *  Product attributes
    *  Customer interactions
 
   2. Company-level
    
    *  Efficiency
    *  Pricing 
    *  Market share
    *  Customer ratings
      
  By linking courier shipments with company performance and national freight trends (TSI), this project evaluates:

    *  Which couriers deliver more reliably
    *  How shipping mode influences delays
    *  Whether freight demand affects delivery times 
    *  How customer satisfaction correlates with courier performance
    
  This integrated design supports a comprehensive U.S. courier performance comparison.     


  Database Schema
The database was designed using SQLite to support relational analysis between shipments, products, customers, companies, and freight index trends.  
It contains **five normalized tables**: 'courier_data', 'customer', 'product', 'freight_tsi', and 'courier_companies'.



Table 1: courier_data (from Train.csv)
Column                 Description                          Type                      
----------------------------------------------------------------------------
 ID                   Shipment ID (PK)                        Integer (Primary Key)     
 observation_date     Shipment date > freight_tsi FK          Date    
 customer_ID          Customer identifier > customer FK       Integer 
 product_ID           Product identifier > product FK         Integer     
 company_ID           Courier company > courier_companies FK  Integer 
 warehouse_block      Warehouse zone                          Text                      
 mode_of_shipment     Air / Ship / Road                       Text                      
 discount_offered     Discount percent                        Integer                   
 late_indicator       1 = Late, 0 = On Time                   Integer                   

 Table 2: customer
 Column               Description                 Type                      
----------------------------------------------------------------------------
customer_ID          Customer ID                  Integer (Primary Key)     
gender               Customer gender              Text                      
customer_care_calls  Calls made to support        Integer                   
customer_rating      Rating  1–5                  Integer                   

Table 3: product
 Column               Description                 Type                      
------------------------------------------------------------------------------------------------
 product_ID (PK)      Product ID                  Integer (Primary Key)     
 product_importance   Low / Medium / High         Text                      
 cost_of_the_product  Product cost                Integer                   
 weight_in_gms        Package weight (grams)      Integer                   
 prior_purchases      Previous purchases          Integer                   

Table 4: freight_tsi (from freight_tsi.csv)
 Column               Description                 Type                      
------------------------------------------------------------------------------------------------
 observation_date PK   Date of record              Date (Primary Key)        
 TSIFRGHT             Freight index value          Float 

Table 5: courier_companies (new dataset)
 Column               Description                                          Type                      
------------------------------------------------------------------------------------------------
 company_ID PK        Courier identifier                                   Integer (Primary Key)     
 company_name         Courier company name (FedEx, UPS, USPS, DHL, etc.)   Text 
 mode                 Dominant shipping mode                               Text                      
 avg_cost             Avg shipment cost                                    Integer                   
 avg_delivery_days    Avg delivery time                                    Float                   
 customer_rating      Avg customer rating                                  Float                     
 market_share          market share (%)                                    Float                     

### Relationships
- courier_data.customer_ID > customer.customer_ID  
- courier_data.product_ID  > product.product_ID  
- courier_data.company_ID  > courier_companies.company_ID 
- courier_data.observation_date > freight_tsi.observation_date 

All relationships are one-to-many.


ERD Diagram

![ERD Diagram](reports/images/courier_service_ERD.png)

The updated ERD includes a new table, **courier_companies**, which represents major courier service providers such as UPS, FedEx, USPS, DHL, and Amazon Logistics.  
It connects to the **courier_data** table through the 'company_ID' field, allowing comparisons of cost, delivery performance, and customer ratings across multiple courier companies.

Mermaid Source Code

erDiagram
    CUSTOMER ||--o{ COURIER_DATA : "customer_ID"
    PRODUCT  ||--o{ COURIER_DATA : "product_ID"
    COURIER_COMPANIES ||--o{ COURIER_DATA : "company_ID"
    FREIGHT_TSI ||--o{ COURIER_DATA : "observation_date"

    CUSTOMER {
        int customer_ID PK
        string gender
        int customer_care_calls
        int customer_rating
    }

    PRODUCT {
        int product_ID PK
        string product_importance
        int cost_of_the_product
        int weight_in_gms
        int prior_purchases
    }

    FREIGHT_TSI {
        date observation_date PK
        float TSIFRGHT
    }

    COURIER_COMPANIES {
        int company_ID PK
        string company_name
        string mode
        int avg_cost
        float avg_delivery_days
        float customer_rating
        float market_share
    }

    COURIER_DATA {
        int ID PK
        date observation_date FK
        int customer_ID FK
        int product_ID FK
        int company_ID FK
        string mode_of_shipment
        string warehouse_block
        int discount_offered
        int late_indicator
    }



Project Workflow
1. Loaded and cleaned raw data in Python
2. Designed and created a normalized SQLite database 
3. Built an ERD to map table relationships
4. Executed SQL queries to compare courier efficiency 
5. Used Python (Pandas, Matplotlib, Seaborn) to analyze trends 
6. Visualized performance differences across companies and modes
    
Tools Used

* Ptthon (Pandas, SQLite, Matphotlib, Seaborn)
* SQL
* Jupitor Notebook
* GitHub for version control 
* (GPT) were used to support documentation refinement and formatting during the projec

## Author 
J. W. Blevins
