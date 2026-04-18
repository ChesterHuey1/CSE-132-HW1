-- ============================================
-- BANK DATABASE SETUP + SAMPLE DATA
-- Run this in your terminal: sqlite3 bank.db < bank_setup.sql
-- Then test queries: sqlite3 bank.db < q1.sql
-- ============================================

DROP TABLE IF EXISTS borrower;
DROP TABLE IF EXISTS loan;
DROP TABLE IF EXISTS customer;

CREATE TABLE customer (
    name        TEXT PRIMARY KEY,
    credit      INTEGER
);

CREATE TABLE loan (
    no          TEXT PRIMARY KEY,
    type        TEXT,
    minCredit   INTEGER NOT NULL,
    amount      INTEGER NOT NULL
);

CREATE TABLE borrower (
    cname       TEXT REFERENCES customer(name),
    lno         TEXT REFERENCES loan(no),
    due         TEXT,
    PRIMARY KEY (cname, lno)
);

-- ============================================
-- SAMPLE DATA
-- ============================================

INSERT INTO customer VALUES ('John Smith',   780);
INSERT INTO customer VALUES ('Jane Doe',     720);
INSERT INTO customer VALUES ('Alice Brown',  800);
INSERT INTO customer VALUES ('Bob Lee',      650);
INSERT INTO customer VALUES ('Carol White',  760);
INSERT INTO customer VALUES ('Dave Green',   500);  -- low credit, no loans

INSERT INTO loan VALUES ('L001', 'jumbo mortgage', 700, 8000);
INSERT INTO loan VALUES ('L002', 'student',        600, 3000);
INSERT INTO loan VALUES ('L003', 'jumbo mortgage', 750, 9000);
INSERT INTO loan VALUES ('L004', 'personal',       650, 2000);
INSERT INTO loan VALUES ('L005', 'student',        620, 2500);
INSERT INTO loan VALUES ('L006', 'auto',           680, 9000);  -- ties L003 amount? no, tied with nothing; L001+L003 tie at max if we set L006=9000

INSERT INTO borrower VALUES ('John Smith',  'L001', '2026-12-01');
INSERT INTO borrower VALUES ('John Smith',  'L002', '2027-06-01');
INSERT INTO borrower VALUES ('John Smith',  'L003', '2028-01-01');
INSERT INTO borrower VALUES ('Jane Doe',    'L001', '2026-12-01');  -- shares L001 with John Smith
INSERT INTO borrower VALUES ('Jane Doe',    'L004', '2026-08-01');
INSERT INTO borrower VALUES ('Alice Brown', 'L003', '2027-03-01');  -- shares L003 with John Smith
INSERT INTO borrower VALUES ('Alice Brown', 'L005', '2025-11-01');
INSERT INTO borrower VALUES ('Bob Lee',     'L004', '2026-09-01');  -- shares L004 with Jane Doe
INSERT INTO borrower VALUES ('Carol White', 'L006', '2027-02-01');

-- ============================================
-- QUICK VERIFY (optional — comment out if you just want the setup)
-- ============================================
-- SELECT * FROM customer;
-- SELECT * FROM loan;
-- SELECT * FROM borrower;
