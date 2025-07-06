Create database KMS_db
SELECT * FROM Dbo.[KMS SQL case study]


----CASE SCENARIO I
----Question 1
-----Which product category had the highest sales? 


SELECT TOP 1
 [Product_Category],
 SUM(Sales) AS Total_Sales
FROM
   Dbo.[KMS SQL case study]
GROUP BY
  [Product_Category]
ORDER BY
  Total_Sales DESC;


  ----CASE SCENARIO I
  ----Question 2
  -----Top 3 Regions by sales 


  SELECT TOP 3
      Region,
      SUM(Sales) AS Total_Sales
FROM
   Dbo.[KMS SQL case study]
GROUP BY
     Region
ORDER BY
     Total_Sales DESC;


-----CASE SCENARIO I
-----Question 3
-----Bottom 3 regions by sales 


SELECT TOP 3
    Region,
    SUM(Sales) AS Total_Sales
FROM
   Dbo.[KMS SQL case study]
GROUP BY
   Region
ORDER BY
  Total_Sales ASC;


 -----CASE SCENARIO I
 -----Question 4
 ----Total sales of appliances in Ontario


  SELECT TOP 3
    SUM(Sales) AS Total_Sales
FROM
   Dbo.[KMS SQL case study]
WHERE
    [Product_Category] = 'Appliances'
    AND Province = 'Ontario';


 -----CASE SCENARIO I
 -----Question 5
 -----Bottom 10 customers by total sales 


 SELECT TOP 10
    CustomerName,
    SUM(Sales) AS Total_Sales
FROM
    Dbo.[KMS SQL case study]
GROUP BY
   CustomerName
ORDER BY
   Total_Sales ASC;


    -----CASE SCENARIO II
 -----Question 6
 -----Shipping method with higest shipping cost


 SELECT TOP 1 
      [Ship_Mode],
      SUM(Shipping_Cost) AS Total_Shipping_Cost
FROM
     Dbo.[KMS SQL case study]
GROUP BY 
      [Ship_Mode]
ORDER BY
     Total_Shipping_Cost DESC;
    

  -----CASE SCENARIO II
 -----Question 7
 -----Most valuable customers & products they buy'


SELECT TOP 10
     [Customer_Name],
     SUM(Sales) AS Total_Sales
FROM
   Dbo.[KMS SQL case study]
GROUP BY
      [Customer_Name]
ORDER BY
     Total_Sales DESC;


  -----CASE SCENARIO II
 -----Question 8
 -----Small business customer with highest sales


 SELECT TOP 1
     [Customer_Name],
     SUM(Sales) AS Total_Sales
FROM
   Dbo.[KMS SQL case study]
WHERE
    Segment = 'Small_Business'
GROUP BY
      [Customer_Name]
ORDER BY
     Total_Sales DESC;


  -----CASE SCENARIO II
 -----Question 9
 -----Corporate customer with most orders (2009-2012)


 SELECT TOP 1
     [Customer Name],
     COUNT(DISTINCT [Order ID]) AS Number_of_Orders
FROM
   Dbo.[KMS SQL case study]
   WHERE
      Segment = 'corporate'
      AND DATEPART(year , [Order Date])
BETWEEN 2009 AND 2012
GROUP BY
      [Customer Name]
ORDER BY
     Number_of_Orders DESC;


  -----CASE SCENARIO II
 -----Question 10
 -----Most profitable customemr


 SELECT TOP 1
     [Customer_Name],
     SUM(Profit) AS Total_Profit
FROM
   Dbo.[KMS SQL case study]
WHERE 
    Segment = 'Consumer'
GROUP BY
      [Customer_Name]
ORDER BY
     Total_Profit DESC;


  -----CASE SCENARIO II
 -----Question 11
 -----Cusomers who retunrned items + segments


 SELECT 
     o.[Customer_Name],
     o.segment
FROM
   Dbo.[KMS SQL case study] o
INNER JOIN
      Dbo.[KMS SQL case study] r
      ON o.[Row ID] = r.[Row ID]
WHERE
    r.Status = 'Returend'
ORDER BY
     o.[Customer_Name], o.segment;