-- 6
SELECT borrower.cname AS name
FROM borrower
JOIN loan ON borrower.lno = loan.no
GROUP BY borrower.cname
HAVING SUM(loan.amount) >= 13000;