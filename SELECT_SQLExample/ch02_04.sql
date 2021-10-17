#查詢結果排序,若無則依照國家代碼排序（自然排序）

#查詢城市資料時，依照需求使用「ORDER.BY」排序，「ASC」由小排到大
SELECT   CountryCode, Name
FROM     city
ORDER BY CountryCode ASC

#「ASC」由小排到大（也可不必指定）
SELECT   CountryCode, Name
FROM     city
ORDER BY CountryCode

#「DESC」由大排到小
SELECT   CountryCode, Name
FROM     city
ORDER BY CountryCode DESC

#只有依照CountryCode欄位排序
SELECT   CountryCode, Name
FROM     city
ORDER BY CountryCode

#先依CountryCode欄位排序，再以Name欄位排序
SELECT   CountryCode, Name
FROM     city
ORDER BY CountryCode, Name

#CountryCode欄位由大到小，Name欄位由小到大
SELECT   CountryCode, Name
FROM     city
ORDER BY CountryCode DESC, Name ASC

#直接使用運算後的資料排序
SELECT   ename, salary * 12 AS AnnualSalary
FROM     cmdev.emp
ORDER BY salary * 12

#使用欄位別名排序
SELECT   ename, salary * 12 AS AnnualSalary
FROM     cmdev.emp
ORDER BY AnnualSalary

# 2 是指排序使用的欄位順序編號
SELECT   ename, salary * 12 AS AnnualSalary
FROM     cmdev.emp
ORDER BY 2

# 雖然「Population」欄位沒有在查詢資料中，也可用來排序
SELECT   CountryCode, Name
FROM     city
ORDER BY Population
