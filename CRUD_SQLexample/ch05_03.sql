# 資料內容更新語法
UPDATE cmdev.emp
SET    salary = salary + 100

# 加入更新的條件
UPDATE cmdev.emp
SET    salary = salary + 100
WHERE  salary < 1500

# 更新內容，若是出現索引重複，則出現錯誤訊息
UPDATE cmdev.dept
SET    deptno = 50
WHERE  deptno = 30

# 更新內容，若是出現索引重複，忽略錯誤
UPDATE IGNORE cmdev.dept
SET    deptno = 50
WHERE  deptno = 30

# 更新內容與欄位型態不符
UPDATE cmdev.emp
SET    salary = 'HELLO', comm = 1000
WHERE  empno = 7369

# 若加入 Ignore 更新內容與欄位型態不符，可能會導致部分資料錯誤
UPDATE IGNORE cmdev.emp
SET    salary = 'HELLO', comm = 1000
WHERE  empno = 7369


UPDATE   cmdev.emp
SET      salary = salary + 100
ORDER BY salary


UPDATE   cmdev.emp
SET      salary = salary + 100
LIMIT    3


UPDATE   cmdev.emp
SET      salary = salary + 100
ORDER BY salary
LIMIT    3


UPDATE   cmdev.emp
SET      salary = salary + 100
ORDER BY salary DESC
LIMIT    3
