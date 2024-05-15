/*
Problem statement: 
We have a library in our college which is managed by a librarian
Borrowers are college students from various departments 
there are college admin staff as well in the library 
the borrowers are mainly from the college
The library is maintained manually
Details stored physically 

Requirement: We need to onboard the environment into a database
The Library Management System is a computer-based application used to automate a library.
It allows the librarian to maintain the information about books, magazines and other library materials.
It also allows the librarian to maintain and organize the information about its borrowers.
This project focuses on the automation of system process of adding newly acquired books, 
borrowing books and borrower’s information, returning of books, searching for the location of the books and 
printing of the inventory of books in the library.

List of Tables:

Subjects - Sub_Id , Sub_Name, 
Departments - Dept_Id, Dept_Name
Books -  Book_Id, Book_Name, Book_Author, Book_Edition, Sub_Id, num_copy, Book_Pub
Borrowers - Bor_Id, Bor_Name, Bor_Mob, Dept_Id, reg_date,
Book_borrowed - Bookbor_Id, Book_Id, Bor_Id, Bor_name, bor_date, due_date, return_status
*/



