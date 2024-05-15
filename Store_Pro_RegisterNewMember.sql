--Create a Stored Procedure to register a new member in the library (Add a entry in the BorrowerDetails table)

ALTER PROCEDURE RegisterNewMember
    @BorName VARCHAR(100),
    @BorContact VARCHAR(20),
    @BorEmail VARCHAR(100),
    @DeptId INT
AS
BEGIN
    -- Check if BorName, BorContact, or BorEmail is empty
    IF @BorName = '' OR @BorContact = '' OR @BorEmail = ''
    BEGIN
        PRINT 'Error! Borrower name, contact, and email cannot be empty.'
        RETURN; -- Exit the stored procedure
    END

    DECLARE @bor_ID INT = NULL;

    -- Get the maximum Bor_Id from the Borrower_Detail table
    SELECT @bor_ID = ISNULL(MAX(Bor_Id), 0) + 1 FROM Borrower_Detail;

    BEGIN TRY
        -- Insert new member entry into BorrowerDetails table
        INSERT INTO Borrower_Detail (Bor_Id, Bor_Name, Bor_contact, Bor_Email, Dept_ID)
        VALUES (@bor_ID, @BorName, @BorContact, @BorEmail, @DeptId);

        PRINT 'New member successfully registered in the library';
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END



EXEC RegisterNewMember 'John Doe',15467897,'john.doe@example.com',2 --New member successfully registered in the library
EXEC RegisterNewMember '',15467897,'john.doe@example.com',2 --Error! Borrower name cannot be empty
EXEC RegisterNewMember 'John Doe','','john.doe@example.com',2 --Error! Borrower contact cannot be empty.
EXEC RegisterNewMember 'John Doe',15467897,'',2 --Error! Borrower email cannot be empty.

DELETE FROM Borrower_Detail
WHERE Bor_Id IN (12,13,14)

DELETE FROM Books_Details
WHERE Book_Id =12

DELETE FROM Book_Borrowed
WHERE Bookbor_Id in (11,12)