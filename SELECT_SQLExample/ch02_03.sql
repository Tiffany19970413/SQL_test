#SELECT.FROM皆為查詢敘述（回傳表格紀錄），加入查詢條件「WHERE」，依需求設定比較運算子

#沒有使用「WHERE」，回傳所有紀錄
SELECT *
FROM   city

#使用「WHERE」，回傳台灣的紀錄
SELECT *
FROM   city
WHERE  CountryCode = 'TWN'

#使用「WHERE」，回傳人口小於800的紀錄
SELECT *
FROM   city
WHERE  Population < 800

#使用「WHERE」，回傳人口小於等於800的紀錄
SELECT *
FROM   city
WHERE  Population <= 800

#使用「＝」，表示指定條件為某一天
SELECT *
FROM   cmdev.emp
WHERE  hiredate = '1981-09-08'

#使用「>」，表示指定條件為某一天以後
SELECT *
FROM   cmdev.emp
WHERE  hiredate > '1981-09-08'

#使用「<」，表示指定條件為某一天以前
SELECT *
FROM   cmdev.emp
WHERE  hiredate < '1981-09-08'

#加入多個查詢條件

SELECT *
FROM   city
WHERE  CountryCode != 'TWN' #國家不是台灣

#國家不是台灣
SELECT *
FROM   city
WHERE  NOT CountryCode = 'TWN' 

#查詢國家代碼是「台灣」，而且人口數小於十萬的城市
SELECT *
FROM   city
WHERE  CountryCode = 'TWN' AND Population < 100000

#查詢國家代碼是「台灣」，或是「USA」的城市
SELECT *
FROM   city
WHERE  CountryCode = 'TWN' OR CountryCode='USA'

#因為AND比OR優先，所以先查詢「非洲」小於一萬的人口數，再查詢「歐洲」
SELECT Name, Continent, Population
FROM   country
WHERE  Continent='Europe' OR Continent='Africa' AND Population<10000

#依照需求使用括號優先判斷執行（順序：括號>AND>OR)
SELECT Name, Continent, Population
FROM   country
WHERE  (Continent='Europe' OR Continent='Africa') AND Population<10000

#其他條件運算子

#查詢人口數介於八萬至九萬之間的城市
SELECT *
FROM   city
WHERE  Population >= 80000 AND Population <= 90000 


SELECT *
FROM   city
WHERE  Population BETWEEN 80000 AND 90000 


SELECT *
FROM   city
WHERE  Population > 80000 AND Population < 90000

#包含80000和90000
SELECT *
FROM   city
WHERE  Population BETWEEN 80000 AND 90000

#使用「BETWEEN.AND」判斷某一日期範圍
SELECT ename, hiredate
FROM   cmdev.emp
WHERE  hiredate BETWEEN '1981-01-01' AND '1981-06-30'

#以下是查詢國家代碼的資料
SELECT *
FROM   city
WHERE  CountryCode = 'TWN' OR 
       CountryCode = 'USA' OR
       CountryCode = 'JPN' OR
       CountryCode = 'ITA' OR
       CountryCode = 'KOR'

#使用「IN(載入國家代碼資料）」替代
SELECT *
FROM   city
WHERE  CountryCode IN ('TWN','USA','JPN','ITA','KOR')

#查詢沒有平均壽命資料的國家（欄位：NULL)，沒回傳紀錄不代表不符合查詢條件
SELECT Name, LifeExpectancy
FROM   country
WHERE  LifeExpectancy = NULL

#必須加入「IS」搭配「NULL」判斷
SELECT Name, LifeExpectancy
FROM   country
WHERE  LifeExpectancy IS NULL

#必須加入「<=>」搭配「NULL」判斷
SELECT Name, LifeExpectancy
FROM   country
WHERE  LifeExpectancy <=> NULL

#使用「<>」不會得到任何資料
SELECT Name, LifeExpectancy
FROM   country
WHERE  LifeExpectancy <> NULL

#必須加入「IS.NOT」搭配「NULL」判斷
SELECT Name, LifeExpectancy
FROM   country
WHERE  LifeExpectancy IS NOT NULL

#相似（模糊）字串查詢
#想要查詢名稱以w字元開始的城市」
SELECT Name FROM   city WHERE  Name = 'w'

# 「LIKE」＋「樣板」字串

#只有一個字元w
SELECT Name
FROM   city
WHERE  Name LIKE 'w' 

# w後面可加0到個任何字元
SELECT Name
FROM   city
WHERE  Name LIKE 'w%' 

#延伸其他查詢設定

#表示第一個字元是w字元
SELECT Name
FROM   city
WHERE  Name LIKE 'w%' 

#最後一個字元是w字元
SELECT Name
FROM   city
WHERE  Name LIKE '%w' 

#不論什麼位置都有w字元
SELECT Name
FROM   city
WHERE  Name LIKE '%w%' 

#第一個字元必須是w,再加五個任何字元（五個底線）
SELECT Name
FROM   city
WHERE  Name LIKE 'w_____'

#五個任何字元（五個底線），再加最後一個字元必須是w
SELECT Name
FROM   city
WHERE  Name LIKE '_____w'

#五個任何字元（五個底線），再加最後w字元可有0到多個字元，
SELECT Name
FROM   city
WHERE  Name LIKE '_____w%'

#名稱是三十（包含）個字元以上的城市
SELECT Name
FROM   city
WHERE  Name LIKE '______________________________%'
