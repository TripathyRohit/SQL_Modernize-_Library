-- 	Create a Stored Procedure to borrow a New book (Add a entry to BookBorrowed table)


ALTER PROCEDURE BorrowNewBook
    @BookName VARCHAR(100),
    @BorrowerName VARCHAR(100)
AS
BEGIN
    DECLARE @BookId INT, @BorrowerId INT, @DueDate DATE, @Bookbor_Id INT

	 -- Check if both book name and borrower name are valid
    IF NOT EXISTS (SELECT * FROM Books_Details WHERE Book_Name = @BookName) 
        AND NOT EXISTS (SELECT * FROM Borrower_Detail WHERE Bor_Name = @BorrowerName)
    BEGIN
        PRINT 'Error! Neither the book nor the borrower exists in the library.'
        RETURN
    END

    -- Check if book exists and is available
    IF NOT EXISTS (SELECT * FROM Books_Details WHERE Book_Name = @BookName)
    BEGIN
        PRINT 'Error! Book does not exist in the library: ' + @BookName
        RETURN
    END

    SELECT @BookId = Book_Id
    FROM Books_Details
    WHERE Book_Name = @BookName


    -- Check if borrower exists
    IF NOT EXISTS (SELECT * FROM Borrower_Detail WHERE Bor_Name = @BorrowerName)
    BEGIN
        PRINT 'Error! Not a member of the library: ' + @BorrowerName
        RETURN
    END


    SELECT @BorrowerId = Bor_Id
    FROM Borrower_Detail
    WHERE Bor_Name = @BorrowerName

    -- Calculate due date
    SELECT @DueDate = DATEADD(DAY, 30, GETDATE()) -- Example: Due date is set to 30 days from borrowing date

    -- Generate a unique Bookbor_Id
    SELECT @Bookbor_Id = ISNULL(MAX(Bookbor_Id), 0) + 1 FROM Book_Borrowed

    -- Insert new entry into BookBorrowed table
    INSERT INTO Book_Borrowed (Bookbor_Id, Book_Id, Bor_Id, Bor_Name, Bor_Date, Due_Date, Return_Status)
    VALUES (@Bookbor_Id, @BookId, @BorrowerId, @BorrowerName, GETDATE(), @DueDate, 'Not Returned')

    PRINT 'Book successfully borrowed'
END

EXEC BorrowNewBook 'To Kill a Mockingbird', 'John Smith' --(Validated and Entry done Successfully)

EXEC BorrowNewBook 'The Art Of Living', 'John Smith' --(Error-Book does not exist in the library:The Art Of Living)

EXEC BorrowNewBook 'The Art of War', 'Sirgeo' --(Error -Not a member of the library: Sirgeo)

EXEC BorrowNewBook 'One night @ Call Center', 'Chao' --(Error! Neither the book nor the borrower exists in the library)