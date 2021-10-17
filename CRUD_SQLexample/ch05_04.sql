DELETE FROM cmdev.emp


DELETE FROM  cmdev.emp
WHERE  salary < 1500

# 內容刪除語法
DELETE FROM cmdev.emp
ORDER BY salary


DELETE FROM cmdev.emp
LIMIT    3


DELETE FROM cmdev.emp
ORDER BY salary
LIMIT    3


DELETE FROM cmdev.emp
ORDER BY salary DESC
LIMIT    3

# 刪除整個表格內容，但是表格仍然存在
DELETE FROM cmdev.emp

# 效率比Delete快，會喪失Delete log
TRUNCATE TABLE cmdev.emp
