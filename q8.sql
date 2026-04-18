-- 8
SELECT COALESCE(SUM(loan.amount), 0) AS borrowedAmount
FROM borrower
JOIN loan ON borrower.lno = loan.no
WHERE borrower.cname = 'John Smith';