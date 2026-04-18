-- 7
SELECT no AS loanNo
FROM loan
WHERE amount = (SELECT MAX(amount) FROM loan);