CREATE TABLE Customer (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Age NUMBER,
    Balance NUMBER,
    IsVIP VARCHAR2(5)
);


CREATE TABLE Loan (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    InterestRate NUMBER,
    DueDate DATE,
    FOREIGN KEY (CustomerID)
    REFERENCES Customer(CustomerID)
);


INSERT INTO Customer VALUES (1,'Ravi',65,12000,'FALSE');
INSERT INTO Customer VALUES (2,'Priya',45,8000,'FALSE');
INSERT INTO Customer VALUES (3,'Arun',70,15000,'FALSE');
INSERT INTO Customer VALUES (4,'Meena',35,5000,'FALSE');

INSERT INTO Loan VALUES (101,1,10,SYSDATE+15);
INSERT INTO Loan VALUES (102,2,12,SYSDATE+45);
INSERT INTO Loan VALUES (103,3,11,SYSDATE+20);
INSERT INTO Loan VALUES (104,4,9,SYSDATE+5);

COMMIT;


SELECT * FROM Customer;
SELECT * FROM Loan;

-- Scenario 1

SET SERVEROUTPUT ON;

BEGIN
    FOR cust IN (
        SELECT CustomerID
        FROM Customer
        WHERE Age > 60
    )
    LOOP
        UPDATE Loan
        SET InterestRate = InterestRate - 1
        WHERE CustomerID = cust.CustomerID;

        DBMS_OUTPUT.PUT_LINE(
            'Discount applied for Customer ID : '
            || cust.CustomerID
        );
    END LOOP;

    COMMIT;
END;
/

-- AFTER SCENARIO 1


SELECT * FROM Loan;

-- Scenario 2

BEGIN
    FOR cust IN (
        SELECT CustomerID
        FROM Customer
        WHERE Balance > 10000
    )
    LOOP
        UPDATE Customer
        SET IsVIP = 'TRUE'
        WHERE CustomerID = cust.CustomerID;

        DBMS_OUTPUT.PUT_LINE(
            'Customer '
            || cust.CustomerID
            || ' promoted to VIP'
        );
    END LOOP;

    COMMIT;
END;
/


-- AFTER SCENARIO 2


SELECT * FROM Customer;


-- Scenario 3

BEGIN
    FOR loan_rec IN (
        SELECT c.Name,
               l.LoanID,
               l.DueDate
        FROM Customer c
        JOIN Loan l
        ON c.CustomerID = l.CustomerID
        WHERE l.DueDate BETWEEN SYSDATE
                            AND SYSDATE + 30
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Reminder : '
            || loan_rec.Name
            || ' , Loan ID '
            || loan_rec.LoanID
            || ' is due on '
            || TO_CHAR(
                   loan_rec.DueDate,
                   'DD-MON-YYYY'
               )
        );
    END LOOP;
END;
/

-- AFTER SCENARIO 3

SELECT * FROM Customer;
SELECT * FROM Loan;