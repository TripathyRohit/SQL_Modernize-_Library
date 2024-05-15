/*
create a report/view to see bookname, authorname, subjectname and price.
To create a report or view that displays the book name, author name, subject name, and price, 
we'll need to join multiple tables (Books_Details, Subjects) to fetch the required information. 
Here's how you can create a view for this purpose
*/

CREATE VIEW Book_Report AS
SELECT 
    bd.Book_Name,
    bd.Author_Name,
    s.Sub_Name AS Subject_Name,
    bd.Price
FROM 
    Books_Details AS bd
JOIN 
    Subjects AS s ON bd.Sub_Id = s.Sub_Id

SELECT * FROM Book_Report --(Now, Librarian can query this view to retrieve the required information 
--without needing to know the underlying database schema or SQL syntax)

/*
create a report/view to see Borrowername, BorrowerContact, DepartmentName and Email 
To create a report or view that displays the borrower's name, contact information, department name, and email,
we'll need to join multiple tables (Borrower_Detail, Departments) to fetch the required information.
Here's how you can create a view for this purpose.
*/

CREATE VIEW Borrower_Report AS
SELECT 
    bd.Bor_Name AS Borrower_Name,
    bd.Bor_Contact AS Borrower_Contact,
    d.Dept_Name AS Department_Name,
    bd.Bor_Email AS Email
FROM 
    Borrower_Detail AS bd
JOIN 
    Departments AS d ON bd.Dept_Id = d.Dept_Id

SELECT * FROM Borrower_Report --(Now, Librarian can query this view to retrieve the required information
--without needing to know the underlying database schema or SQL syntax.)

/*
create a report/view to see borrowd book details: BookName, BorrowerName, BorrowerContact, AuthorName, 
Borrowed_DATE, Due_Date.)
To create a report or view that displays details of borrowed books including the book name, borrower name,
borrower contact, author name, borrowed date, and due date, we'll need to join multiple tables 
(Book_Borrowed, Books_Details, Borrower_Detail) to fetch the required information. 
Here's how you can create a view for this purpose.
*/

CREATE VIEW Borrowed_Books_Report AS
SELECT 
    bd.Book_Name AS Book_Name,
    brd.Bor_Name AS Borrower_Name,
    brd.Bor_Contact AS Borrower_Contact,
    bd.Author_Name AS Author_Name,
    bb.Bor_Date AS Borrowed_Date,
    bb.Due_Date AS Due_Date
FROM 
    Book_Borrowed AS bb
JOIN 
    Books_Details AS bd ON bb.Book_Id = bd.Book_Id
JOIN 
    Borrower_Detail AS brd ON bb.Bor_Id = brd.Bor_Id

SELECT * FROM Borrowed_Books_Report --(Now, Librarian can query this view to retrieve the required information 
--without needing to know the underlying database schema or SQL syntax.)