-- 1
SELECT DISTINCT customer.name
FROM customer
JOIN borrower ON customer.name = borrower.cname
JOIN loan ON borrower.lno = loan.no
WHERE loan.type = 'jumbo mortgage';

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

-- 3
SELECT DISTINCT b1.cname AS name
FROM borrower b1
JOIN loan l1 ON b1.lno = l1.no
JOIN borrower b2 ON b1.cname = b2.cname
JOIN loan l2 ON b2.lno = l2.no
WHERE l1.type = 'jumbo mortgage'
AND l2.type = 'student';

-- 4
SELECT DISTINCT b1.cname AS name1, b2.cname AS name2
FROM borrower b1
JOIN borrower b2 ON b1.lno = b2.lno
WHERE b1.cname < b2.cname
ORDER BY name1, name2;

-- 5
SELECT DISTINCT lno AS loanNo
FROM borrower
GROUP BY lno
HAVING COUNT(DISTINCT cname) >= 2;

-- 6
SELECT borrower.cname AS name
FROM borrower
JOIN loan ON borrower.lno = loan.no
GROUP BY borrower.cname
HAVING SUM(loan.amount) >= 13000;

-- 7
SELECT no AS loanNo
FROM loan
WHERE amount = (SELECT MAX(amount) FROM loan);

-- 8
SELECT COALESCE(SUM(loan.amount), 0) AS borrowedAmount
FROM borrower
JOIN loan ON borrower.lno = loan.no
WHERE borrower.cname = 'John Smith';

-- 9
SELECT borrower.lno AS loanNo
FROM borrower
JOIN loan ON borrower.lno = loan.no
WHERE borrower.cname = 'John Smith'
AND loan.minCredit = (
    SELECT MAX(l2.minCredit)
    FROM borrower b2
    JOIN loan l2 ON b2.lno = l2.no
    WHERE b2.cname = 'John Smith'
);