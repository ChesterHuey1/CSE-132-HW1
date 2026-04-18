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