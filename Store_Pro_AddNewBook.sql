--Create a Stored Procedure to Add new book in the library (Add a entry in the BookDetails table)

ALTER PROCEDURE AddNewBook
    @BookName VARCHAR(100),
    @AuthorName VARCHAR(100),
    @BookSerialNo VARCHAR(50),
    @Sub_ID INT,
    @NumOfCopy INT,
    @Price DECIMAL(10, 2)
AS
BEGIN
    -- Check if the book name is not empty
    IF @BookName = ''
    BEGIN
        PRINT 'Error! Book name cannot be empty.';
        RETURN; -- Exit the stored procedure
    END

    -- Check if the author name is not empty
    IF @AuthorName = ''
    BEGIN
        PRINT 'Error! Author name cannot be empty.';
        RETURN; -- Exit the stored procedure
    END

    -- Check if Sub_ID is valid (assuming it's a foreign key referencing a Subjects table)
    IF NOT EXISTS (SELECT 1 FROM Subjects WHERE Sub_ID = @Sub_ID)
    BEGIN
        PRINT 'Error! Invalid Sub_ID.';
        RETURN; -- Exit the stored procedure
    END

    -- Check if NumOfCopy is not negative
    IF @NumOfCopy < 0
    BEGIN
        PRINT 'Error! Number of copies cannot be negative.';
        RETURN; -- Exit the stored procedure
    END

    BEGIN TRY
        DECLARE @bid INT;
        -- Get the next available Book_Id
        SELECT @bid = ISNULL(MAX(Book_Id), 0) + 1 FROM Books_Details;

        -- Insert new book entry into the Books_Details table
        INSERT INTO Books_Details (Book_Id, Book_Name, Author_Name, Book_Serialno, Sub_Id, Num_Of_Copy, Price)
        VALUES (@bid, @BookName, @AuthorName, @BookSerialNo, @Sub_ID, @NumOfCopy, @Price);

        PRINT 'New book successfully added to the library';
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END

EXEC AddNewBook 'The Great Gatsby','F. Scott Fitzgerald','XYZ456',6,5,56.99
-- Librarian Have these detils to Add a new book in Book_Details

EXEC AddNewBook '','F. Scott Fitzgerald','XYZ456',6,5,56.99
-- Error! Book name cannot be empty

EXEC AddNewBook 'The Great Gatsby','','XYZ456',6,5,56.99
--Error! Author name cannot be empty.

