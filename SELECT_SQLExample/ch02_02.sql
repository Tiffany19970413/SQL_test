#指定資料庫
USE world;

#顯示字串與計算結果
SELECT 'My name is Simon Johnson', 35 * 12;

#指定world資料庫的city表格
SELECT * FROM city;

#不使用「USE cmdev」則直接切換cmdev資料庫並指定emp表格
SELECT * FROM cmdev.emp;

# *字號：依表格欄位排序回傳查詢資料（設計表格時決定排序）
SELECT * FROM city;

#依照需求決定city表格的查詢欄位排序
SELECT ID, Name
FROM   city;


SELECT Name, ID
FROM   city


SELECT ID, Name, District
FROM   city

#使用cmdev資料庫的emp表格，計算員工年薪
SELECT ename, salary, salary * 12, #月薪乘以12計算出年薪
       (salary * 12) + (salary DIV 2) #年薪再加上半個月的獎金
FROM   cmdev.emp

#ＡＳ:幫欄位/資料/運算式另取別名
SELECT ename, salary AS MonthSalary,
       salary * 12 AS AnnualSalary,
       (salary * 12) + (salary DIV 2) AnnualFullSalary #不使用as,先空格再取別名
FROM   cmdev.emp

# 如果你的別名包含空格，要用單引號或雙引號
SELECT ename, salary * 12 AS 'Annual Salary'
FROM   cmdev.emp

# 用到SQL語法保留字，也要用單或雙引號
SELECT ename, salary * 12 AS 'select'
FROM   cmdev.emp
