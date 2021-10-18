#UNION語法

#獨立查詢「東北亞地區而且人口數小於 兩百萬 的國家」
SELECT Region, Name, Population
FROM   country
WHERE  Region = 'Southeast Asia' AND Population < 2000000

#獨立查詢「東北亞地區而且人口數小於 一百萬 的國家」
SELECT Region, Name, Population
FROM   country
WHERE  Region = 'Eastern Asia' AND Population < 1000000

#使用UNION語法，包含兩個查詢記錄，回傳一個查詢結果欄位
SELECT Region, Name, Population
FROM   country
WHERE  Region = 'Southeast Asia' AND Population < 2000000
UNION
SELECT Region, Name, Population
FROM   country
WHERE  Region = 'Eastern Asia' AND Population < 1000000


SELECT Region, Name, Population #使用第一個查詢欄位名稱
FROM   country
WHERE  Region = 'Southeast Asia' AND Population < 2000000
UNION
SELECT Region, Name, Population
FROM   country
WHERE  Region = 'Eastern Asia' AND Population < 1000000
UNION
SELECT ename, job, salary
FROM   cmdev.emp
WHERE  salary < 1000 #慢慢查詢


SELECT Region, Name, Population #查詢三個欄位
FROM   country
WHERE  Region = 'Southeast Asia' AND Population < 2000000
UNION
SELECT Region, Name, Population #查詢三個欄位
FROM   country
WHERE  Region = 'Eastern Asia' AND Population < 1000000
UNION
SELECT ename, job, salary, comm #所有使用UNION合併的查詢欄位個數須一樣
FROM   cmdev.emp
WHERE  salary < 1000

#範例：原本查詢條件過於冗長
SELECT Region, Name, Population
FROM   country
WHERE  (Region = 'Southeast Asia' AND Population < 2000000) OR
       (Region = 'Eastern Asia' AND Population < 1000000)

#改善範例：拆開成兩個查詢條件
SELECT Region, Name, Population
FROM   country
WHERE  Region = 'Southeast Asia' AND Population < 2000000
UNION
SELECT Region, Name, Population
FROM   country
WHERE  Region = 'Eastern Asia' AND Population < 1000000
