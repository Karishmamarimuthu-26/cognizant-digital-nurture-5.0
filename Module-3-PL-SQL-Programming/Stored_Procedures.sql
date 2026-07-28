--Scenario 1

CREATE TABLE SavingsAccount (
    AccountID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50),
    Balance NUMBER(10,2)
);

INSERT INTO SavingsAccount VALUES (101,'Ravi',10000);
INSERT INTO SavingsAccount VALUES (102,'Priya',20000);
INSERT INTO SavingsAccount VALUES (103,'Arun',15000);

COMMIT;

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
IS
BEGIN
    UPDATE SavingsAccount
    SET Balance = Balance + (Balance * 0.01);

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Monthly Interest Applied Successfully');
END;
/

SET SERVEROUTPUT ON;

BEGIN
    ProcessMonthlyInterest;
END;
/

SELECT * FROM SavingsAccount;



--Scenario 2


CREATE TABLE Employee (
    EmployeeID NUMBER PRIMARY KEY,
    EmployeeName VARCHAR2(50),
    Department VARCHAR2(30),
    Salary NUMBER(10,2)
);

INSERT INTO Employee VALUES (1,'John','IT',50000);
INSERT INTO Employee VALUES (2,'Alice','IT',60000);
INSERT INTO Employee VALUES (3,'Bob','HR',45000);

COMMIT;

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
    p_department IN VARCHAR2,
    p_bonus_percent IN NUMBER
)
IS
BEGIN
    UPDATE Employee
    SET Salary = Salary + (Salary * p_bonus_percent/100)
    WHERE Department = p_department;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Bonus Updated Successfully');
END;
/

SET SERVEROUTPUT ON;

BEGIN
    UpdateEmployeeBonus('IT',10);
END;
/

SELECT * FROM Employee;


--Scenario 3

CREATE TABLE BankAccount (
    AccountID NUMBER PRIMARY KEY,
    AccountHolder VARCHAR2(50),
    Balance NUMBER(10,2)
);

INSERT INTO BankAccount VALUES (1001,'Ravi',10000);
INSERT INTO BankAccount VALUES (1002,'Priya',5000);

COMMIT;

CREATE OR REPLACE PROCEDURE TransferFunds(
    p_from_account IN NUMBER,
    p_to_account IN NUMBER,
    p_amount IN NUMBER
)
IS
    v_balance NUMBER;
BEGIN

    SELECT Balance
    INTO v_balance
    FROM BankAccount
    WHERE AccountID = p_from_account;

    IF v_balance >= p_amount THEN

        UPDATE BankAccount
        SET Balance = Balance - p_amount
        WHERE AccountID = p_from_account;

        UPDATE BankAccount
        SET Balance = Balance + p_amount
        WHERE AccountID = p_to_account;

        COMMIT;

        DBMS_OUTPUT.PUT_LINE('Transfer Successful');

    ELSE

        DBMS_OUTPUT.PUT_LINE('Insufficient Balance');

    END IF;

END;
/

SET SERVEROUTPUT ON;

BEGIN
    TransferFunds(1001,1002,2000);
END;
/

SELECT * FROM BankAccount;