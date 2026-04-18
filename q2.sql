-- 2
SELECT DISTINCT customer.name
FROM customer
JOIN borrower ON customer.name = borrower.cname
JOIN loan ON borrower.lno = loan.no
WHERE loan.type = 'jumbo mortgage'

UNION

SELECT name
FROM customer
WHERE credit >= 750;