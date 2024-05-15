CREATE DATABASE LibraryManagementSystem
USE LibraryManagementSystem

-- Subjects Table
CREATE TABLE Subjects (
    Sub_Id INT PRIMARY KEY,
    Sub_Name VARCHAR(100)
)

-- Departments Table
CREATE TABLE Departments (
    Dept_Id INT PRIMARY KEY,
    Dept_Name VARCHAR(100)
)
ALTER TABLE Departments
ALTER COLUMN Dept_Name VARCHAR(100) NOT NULL;

ALTER TABLE Departments
ADD CONSTRAINT UQ_Dept_Name UNIQUE (Dept_Name);


-- Books_Details Table
CREATE TABLE Books_Details (
    Book_Id INT PRIMARY KEY,
    Book_Name VARCHAR(100),
    Author_Name VARCHAR(100),
    Book_Serialno VARCHAR(50),
    Sub_Id INT,
    Num_Of_Copy INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (Sub_Id) REFERENCES Subjects(Sub_Id)
)

-- Borrower_Detail Table
CREATE TABLE Borrower_Detail (
    Bor_Id INT PRIMARY KEY,
    Bor_Name VARCHAR(100),
    Bor_Contact VARCHAR(20),
    Bor_Email VARCHAR(100),
    Dept_Id INT,
    FOREIGN KEY (Dept_Id) REFERENCES Departments(Dept_Id)
)


-- Book_Borrowed Table
CREATE TABLE Book_Borrowed (
    Bookbor_Id INT PRIMARY KEY,
    Book_Id INT,
    Bor_Id INT,
    Bor_Name VARCHAR(100),
    Bor_Date DATE,
    Due_Date DATE,
    Return_Status VARCHAR(20),
    FOREIGN KEY (Book_Id) REFERENCES Books_Details(Book_Id),
    FOREIGN KEY (Bor_Id) REFERENCES Borrower_Detail(Bor_Id)
)

-- Inserting values into Subjects table
INSERT INTO Subjects (Sub_Id, Sub_Name) VALUES
(1, 'Computer Science'),
(2, 'Physics'),
(3, 'Mathematics'),
(4, 'History'),
(5, 'Literature'),
(6, 'Biology'),
(7, 'Chemistry'),
(8, 'Engineering'),
(9, 'Art'),
(10, 'Geography')

-- Inserting values into Departments table
INSERT INTO Departments (Dept_Id, Dept_Name) VALUES
(1, 'Computer Science'),
(2, 'Physics'),
(3, 'Mathematics'),
(4, 'History'),
(5, 'Literature'),
(6, 'Biology'),
(7, 'Chemistry'),
(8, 'Engineering'),
(9, 'Art'),
(10, 'Geography')

-- Inserting values into Books_Details table
INSERT INTO Books_Details (Book_Id, Book_Name, Author_Name, Book_Serialno, Sub_Id, Num_Of_Copy, Price) VALUES
(1, 'Introduction to Algorithms', 'Thomas H. Cormen', 'ISBN123456', 1, 5, 49.99),
(2, 'The Physics Book', 'Clifford A. Pickover', 'ISBN234567', 2, 3, 29.99),
(3, 'Calculus: Early Transcendentals', 'James Stewart', 'ISBN345678', 3, 7, 39.99),
(4, 'A Brief History of Time', 'Stephen Hawking', 'ISBN456789', 2, 4, 24.99),
(5, 'To Kill a Mockingbird', 'Harper Lee', 'ISBN567890', 5, 6, 19.99),
(6, 'The Art of War', 'Sun Tzu', 'ISBN678901', 9, 8, 14.99),
(7, 'The Elements of Style', 'William Strunk Jr.', 'ISBN789012', 5, 3, 9.99),
(8, 'Organic Chemistry', 'Paula Yurkanis Bruice', 'ISBN890123', 7, 5, 34.99),
(9, 'Introduction to Engineering', 'Wendy Hamrick', 'ISBN901234', 8, 10, 44.99),
(10, 'Geography: Realms, Regions, and Concepts', 'Harm J. De Blij', 'ISBN012345', 10, 4, 29.99)

INSERT INTO Borrower_Detail (Bor_Id, Bor_Name, Bor_Contact, Bor_Email, Dept_Id) VALUES
(1, 'John Smith', '123-456-7890', 'john.smith@example.com', 1),
(2, 'Emily Johnson', '234-567-8901', 'emily.johnson@example.com', 3),
(3, 'Michael Brown', '345-678-9012', 'michael.brown@example.com', 5),
(4, 'Emma Davis', '456-789-0123', 'emma.davis@example.com', 2),
(5, 'Daniel Wilson', '567-890-1234', 'daniel.wilson@example.com', 4),
(6, 'Sophia Martinez', '678-901-2345', 'sophia.martinez@example.com', 6),
(7, 'William Taylor', '789-012-3456', 'william.taylor@example.com', 7),
(8, 'Olivia Anderson', '890-123-4567', 'olivia.anderson@example.com', 8),
(9, 'Liam Thomas', '901-234-5678', 'liam.thomas@example.com', 9),
(10, 'Ava Garcia', '012-345-6789', 'ava.garcia@example.com', 10)

-- Inserting values into Book_Borrowed table
INSERT INTO Book_Borrowed (Bookbor_Id, Book_Id, Bor_Id, Bor_Name, Bor_Date, Due_Date, Return_Status) VALUES
(1, 1, 1, 'John Smith', '2024-05-01', '2024-06-01', 'Not Returned'),
(2, 2, 2, 'Emily Johnson', '2024-05-03', '2024-06-03', 'Not Returned'),
(3, 3, 3, 'Michael Brown', '2024-05-05', '2024-06-05', 'Returned'),
(4, 4, 4, 'Emma Davis', '2024-05-07', '2024-06-07', 'Not Returned'),
(5, 5, 5, 'Daniel Wilson', '2024-05-09', '2024-06-09', 'Returned'),
(6, 6, 6, 'Sophia Martinez', '2024-05-11', '2024-06-11', 'Not Returned'),
(7, 7, 7, 'William Taylor', '2024-05-13', '2024-06-13', 'Not Returned'),
(8, 8, 8, 'Olivia Anderson', '2024-05-15', '2024-06-15', 'Returned'),
(9, 9, 9, 'Liam Thomas', '2024-05-17', '2024-06-17', 'Not Returned'),
(10, 10, 10, 'Ava Garcia', '2024-05-19', '2024-06-19', 'Returned')

SELECT * FROM Subjects
SELECT * FROM Departments
SELECT * FROM Books_Details
SELECT * FROM Borrower_Detail
SELECT * FROM Book_Borrowed
