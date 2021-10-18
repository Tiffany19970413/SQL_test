# OUTER.JOIN語法

# cmdev資料庫的emp表格，deptno欄位儲存員工部門編號
#資料包含null的部門編號
SELECT empno, ename, deptno
FROM   cmdev.emp

# OUTER.JOIN：使用內部結合查詢
#資料必須符合條件才會出現（沒有null的部門編號）
SELECT empno, ename, e.deptno, d.dname
FROM   cmdev.emp e, cmdev.dept d
WHERE  e.deptno = d.deptno

# LEFT OUTER.JOIN：查詢「包含部門名稱的員工資料，沒有分派部門的員工也要出現」
#LEFT以 左邊emp表格為主，無論有無符合條件都會出現
SELECT empno, ename, e.deptno, d.dname
FROM   cmdev.emp e LEFT OUTER JOIN cmdev.dept d
       ON e.deptno = d.deptno

# RIGHT OUTER.JOIN：查詢「包含部門名稱的員工資料，沒有分派部門的員工也要出現」
# RIGHT以 右邊emp表格為主，無論有無符合條件都會出現
SELECT empno, ename, e.deptno, d.dname
FROM   cmdev.dept d RIGHT OUTER JOIN cmdev.emp e
       ON e.deptno = d.deptno


SELECT empno, ename, e.deptno, d.dname
FROM   cmdev.emp e LEFT OUTER JOIN cmdev.dept d
       ON e.deptno = d.deptno


SELECT empno, ename, e.deptno, d.dname
FROM   cmdev.emp e RIGHT OUTER JOIN cmdev.dept d
       ON e.deptno = d.deptno
