-- ================================================
-- Customer Segmentation & Sales Insights Analysis
-- Dataset: Sample Superstore | FY2014-2017
-- Author: Milind Thapar
-- ================================================

-- Query 1: Segment Performance Overview
SELECT
    Segment,
    COUNT(DISTINCT Customer_ID) as total_customers,
    COUNT(DISTINCT Order_ID) as total_orders,
    ROUND(SUM(Sales), 2) as total_sales,
    ROUND(SUM(Profit), 2) as total_profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) as profit_margin_pct,
    ROUND(AVG(Discount)*100, 2) as avg_discount_pct,
    ROUND(SUM(Sales)/COUNT(DISTINCT Customer_ID), 2) as revenue_per_customer
FROM superstore
GROUP BY Segment
ORDER BY total_profit DESC;

-- Query 2: Top 10 Customers by Profit
SELECT
    Customer_ID,
    Customer_Name,
    Segment,
    COUNT(DISTINCT Order_ID) as total_orders,
    ROUND(SUM(Sales), 2) as total_sales,
    ROUND(SUM(Profit), 2) as total_profit,
    ROUND(AVG(Discount)*100, 2) as avg_discount_pct
FROM superstore
GROUP BY Customer_ID, Customer_Name, Segment
ORDER BY total_profit DESC
LIMIT 10;

-- Query 3: Bottom 10 Customers by Profit (Loss-Makers)
SELECT
    Customer_ID,
    Customer_Name,
    Segment,
    COUNT(DISTINCT Order_ID) as total_orders,
    ROUND(SUM(Sales), 2) as total_sales,
    ROUND(SUM(Profit), 2) as total_profit,
    ROUND(AVG(Discount)*100, 2) as avg_discount_pct
FROM superstore
GROUP BY Customer_ID, Customer_Name, Segment
ORDER BY total_profit ASC
LIMIT 10;

-- Query 4: Repeat Purchase & Efficiency Analysis by Segment
SELECT
    Segment,
    ROUND(COUNT(DISTINCT Order_ID)/COUNT(DISTINCT Customer_ID), 2) as avg_orders_per_customer,
    ROUND(SUM(Sales)/COUNT(DISTINCT Order_ID), 2) as avg_order_value,
    ROUND(SUM(Profit)/COUNT(DISTINCT Order_ID), 2) as avg_profit_per_order
FROM superstore
GROUP BY Segment
ORDER BY avg_orders_per_customer DESC;