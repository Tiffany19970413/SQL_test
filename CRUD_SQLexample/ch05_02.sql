# 第一種 INSERT 語法 
INSERT INTO cmdev.dept VALUES (60, 'EDU', 'NEW YORK')

# 插入資料時，部分欄位使用預設值
INSERT INTO cmdev.dept
VALUES (70, 'MARKETING', DEFAULT)

# 錯誤寫法，欄位數量不一致
INSERT INTO cmdev.dept
VALUES (80, 'PURCHASING')

# 資料順序不對
INSERT INTO cmdev.dept
VALUES ('PURCHASING', 80, 'NEW YORK')

# 第二種 INSERT 語法：指定欄位
INSERT INTO cmdev.dept (dname, deptno, location)
VALUES ('PURCHASING', 80, 'NEW YORK')

# 欄位 與 內容數量不一致
INSERT INTO cmdev.dept (deptno, dname, location)
VALUES (90, 'SHIPPING')


INSERT INTO cmdev.dept
VALUES (90, 'SHIPPING', DEFAULT)
DELETE FROM cmdev.dept WHERE deptno=90

# 欄位若有預設值，再新增資料時若未指定該欄位，將填入預設值
INSERT INTO cmdev.dept (deptno, dname)
VALUES (90, 'SHIPPING')
SELECT * FROM cmdev.dept where deptno=90

# 未指定的欄位沒有預設值，所以不能沒指定
INSERT INTO cmdev.dept (deptno, location)
VALUES (80, 'NEW YORK')

# 整筆資料都採用預設值新增
INSERT INTO cmdev.dept () VALUES ()


# 第三種 INSERT 語法
# INSERT INTO cmdev.dept (deptno, dname)
# VALUES (90, 'SHIPPING')
INSERT INTO cmdev.dept 
SET deptno = 90, dname = 'SHIPPING'

# 同時新增多筆資料
INSERT INTO cmdev.emp VALUES 
(8001, 'SIMON', 'MANAGER', 7369, '2001-02-03', 3300, NULL, 50),
(8002, 'JOHN', 'PROGRAMMER', 8001, '2002-01-01', 2300, NULL, 50),
(8003, 'GREEN', 'ENGINEER', 8001, '2003-05-01', 2000, NULL, 50)

# 索引概念介紹
INSERT INTO cmdev.dept
VALUES (50, 'MIS', DEFAULT);

# 忽略錯誤，但是不新增
INSERT IGNORE INTO cmdev.dept
VALUES (50, 'MIS', DEFAULT);

INSERT IGNORE INTO cmdev.dept
VALUES (500, 'MIS', DEFAULT);


SELECT *
FROM   cmdev.travel
WHERE  empno = 7900 AND 
       location = 'BOSTON'

# 新增一筆資料
INSERT INTO cmdev.travel
VALUES (7900, 'BOSTON', 1);

# 更新一筆資料內容
UPDATE cmdev.travel
SET    counter = counter + 1
WHERE  empno = 7900 AND 
       location = 'BOSTON'

# 綜合上述兩項，若不存在就新增；否則更新數量
INSERT INTO cmdev.travel
VALUES (7900, 'BOSTON', 1)
ON DUPLICATE KEY UPDATE counter = counter + 1

# 新增一筆資料，若已經存在會出現錯誤
INSERT INTO cmdev.dept
VALUES (50, 'MIS', DEFAULT)

# 新增一筆資料，若已經存在會忽略錯誤，但是也不會新增
INSERT IGNORE INTO cmdev.dept
VALUES (50, 'MIS', DEFAULT) 

# 新增一筆資料，若已經存在，會進行覆蓋取代
REPLACE INTO cmdev.dept
VALUES (50, 'MIS', DEFAULT)
