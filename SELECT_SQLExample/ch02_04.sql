SELECT   CountryCode, Name
FROM     city
ORDER BY CountryCode ASC


SELECT   CountryCode, Name
FROM     city
ORDER BY CountryCode


SELECT   CountryCode, Name
FROM     city
ORDER BY CountryCode DESC


SELECT   CountryCode, Name
FROM     city
ORDER BY CountryCode


SELECT   CountryCode, Name
FROM     city
ORDER BY CountryCode, Name


SELECT   CountryCode, Name
FROM     city
ORDER BY CountryCode DESC, Name ASC


SELECT   ename, salary * 12 AS AnnualSalary
FROM     cmdev.emp
ORDER BY salary * 12


SELECT   ename, salary * 12 AS AnnualSalary
FROM     cmdev.emp
ORDER BY AnnualSalary

# 2 是指排序使用的欄位順序編號
SELECT   ename, salary * 12 AS AnnualSalary
FROM     cmdev.emp
ORDER BY 2


SELECT   CountryCode, Name
FROM     city
ORDER BY Population
