# Capstone Project: Comparing Courier Service Performance in the U.S.
## Dataset Source
**Dataset: ** [Logistics Regression Analysis Dataset](https://www.kaggle.com/datasets/prachi13/customer-analytics) (Kaggle)  

**Autor: **Prachi13 dataset available for educational purposes

## Database Schema 
## table 1: courier_data (from Train.csv)
Column                   Description               Type
ID                       Shipment                  Integer (Primary Key)
Date                     Shipment date             Date
Warehouse                Warehouse area            Text
Mode_of_Shipment         Air, Ship, or Road        Text
Customer_care_calls      Number of calls           Integer
Customer_rating          Rating from 1-5           Integer
Cost_of_the_product      Price of the shipment     Integer
Prior_purposes           Previous purcharses       Integer
Product_Importance       Low/ Medium/ High         Text
Gender                   Customer gender           Text
Discount_offered         Discount percent          Integer
Weight_in_gms            Package weight            Integer
Reached_on_Time_Y_N      1 = Late 0 = on Time      Integer

## Table 2: freight_tsi (from freight_tsi.csv)
Column                     Description             Type
observation_date           Date of record          Date (Primary Key)
TSIFRGHT                   Freight index value     Float/Real 

## Relationship Between Tables
Connection: courier_Data.Date > freight_tsi.observation_date
Type: One-to-many (one TSI date applies to many courier shipments that day)


ERD
## Entity Relationship Diagram (ERD)

```mermaid
erDiagram
  FREIGHT_TSI ||--o{ COURIER_DATA : "observation_date = Date"

  FREIGHT_TSI {
    DATE observation_date PK
    REAL TSIFRGHT
  }

  COURIER_DATA {
    INT  ID PK
    DATE Date FK
    TEXT Warehouse_block
    TEXT Mode_of_Shipment
    INT  Customer_care_calls
    INT  Customer_rating
    INT  Cost_of_the_Product
    INT  Prior_purchases
    TEXT Product_importance
    TEXT Gender
    INT  Discount_offered
    INT  Weight_in_gms
    INT  Late_Indicator
  }}