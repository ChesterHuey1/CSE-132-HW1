-- 3
SELECT DISTINCT b1.cname AS name
FROM borrower b1
JOIN loan l1 ON b1.lno = l1.no
JOIN borrower b2 ON b1.cname = b2.cname
JOIN loan l2 ON b2.lno = l2.no
WHERE l1.type = 'jumbo mortgage'
AND l2.type = 'student';