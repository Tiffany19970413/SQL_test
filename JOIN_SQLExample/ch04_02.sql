#查詢多個表格資料

# world資料庫的city表格中,欄位Capital儲存首都id資料
# 前提：country沒有儲存城市名稱，所以對照欄位Capital的id
#「WHERE」結合查詢條件
SELECT country.Code, country.Capital, city.Name #指定有限的 表格名稱.欄位名稱
FROM   country, city #列出使用的表格名稱
WHERE  country.Capital = city.ID #設定結合條件

#不同表格有相同欄位名稱時，必需指定否則可以省略
SELECT Code, Capital, city.Name
FROM   country, city
WHERE  Capital = ID

#錯誤範例：country和city表格都有「Name」欄位，必須指定
SELECT Code, Capital, Name
FROM   country, city
WHERE  Capital = ID

#第一種：查詢「國家和首都的人口和比例」
SELECT country.name, country.Population coPop,
        city.Name, city.Population ciPop,
        city.Population / country.Population * 100 Scale
FROM   country, city
WHERE  Capital = ID

#「FROM」後取別名（a代表country;b代表city) 
SELECT country.name, country.Population coPop,
       city.Name, city.Population ciPop,
       city.Population / country.Population * 100
FROM   country a, city b
WHERE  Capital = ID

#所有使用country,city都使用別名取代
SELECT a.name, a.Population coPop,
       b.Name, b.Population ciPop,
       b.Population / a.Population * 100
FROM   country a, city b
WHERE  Capital = ID

#「INNER.JOIN」結合查詢
#「INNER」可省略; 「ON」＋結合條件 ＝> 原本的「WHERE」子句
SELECT Code, Capital, city.Name
FROM   country INNER JOIN city ON Capital = ID

#第二種：查詢「國家和首都的人口和比例」
SELECT a.name, a.Population coPop,
       b.Name, b.Population ciPop,
       b.Population / a.Population * 100
FROM   country a INNER JOIN city b ON Capital = ID

#查詢「cmdev」資料庫中，員工資料和其部門名稱
#第一種：
SELECT empno, ename, dname
FROM   cmdev.emp e, cmdev.dept d
WHERE  e.deptno = d.deptno

#第二種：
SELECT empno, ename, dname
FROM   cmdev.emp e INNER JOIN cmdev.dept d
       ON e.deptno = d.deptno

#第三種：
SELECT empno, ename, dname
FROM   cmdev.emp e INNER JOIN cmdev.dept d
       USING (deptno)
