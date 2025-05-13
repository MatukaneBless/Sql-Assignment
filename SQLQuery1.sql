-- Create the database
CREATE DATABASE LibraryDB;
GO

USE LibraryDB;
GO

-- Categories Table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL UNIQUE
);
GO

-- Authors Table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL
);
GO

-- Books Table
CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(200) NOT NULL,
    ISBN NVARCHAR(13) UNIQUE,
    PublicationYear INT,
    CategoryID INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
GO

-- BookAuthors Table (Many-to-Many between Books and Authors)
CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);
GO

-- Members Table
CREATE TABLE Members (
    MemberID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE,
    Phone NVARCHAR(20)
);
GO

-- Loans Table
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY IDENTITY(1,1),
    BookID INT NOT NULL,
    MemberID INT NOT NULL,
    LoanDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);
GO

INSERT INTO Categories (Name)
VALUES
('Science Fiction'),
('Mystery'),
('History'),
('Biography'),
('Philosophy');


INSERT INTO Authors (FirstName, LastName)
VALUES
('Isaac', 'Asimov'),
('Agatha', 'Christie'),
('Stephen', 'Hawking'),
('Yuval', 'Harari'),
('George', 'Orwell');

INSERT INTO Publishers (Name, Country)
VALUES
('Penguin Random House', 'USA'),
('HarperCollins', 'UK'),
('Macmillan', 'USA'),
('Oxford University Press', 'UK'),
('Bloomsbury Publishing', 'UK');

INSERT INTO Books (title, author, publication_year, isbn, publisher_id)
VALUES
('Foundation', 'Isaac Asimov', 1951, '9780008117498', 11),
('Murder on the Orient Express', 'Agatha Christie', 1934, '9780062693662', 12),
('A Brief History of Time', 'Stephen Hawking', 1988, '9780553380163', 13),
('Sapiens: A Brief History of Humankind', 'Yuval Harari', 2011, '9780062316097', 15),
('1984', 'George Orwell', 1949, '9780451524935', 11),
('Harry Potter and the Philosopher''s Stone', 'J.K. Rowling', 1997, '9780747532699', 16);

INSERT INTO Members (FirstName, LastName, Email, Phone)
VALUES
('Alice', 'Johnson', 'alice.j@example.com', '0712345678'),
('Bob', 'Smith', 'bob.s@example.com', '0723456789'),
('Charlie', 'Mokoena', 'charlie.m@example.com', '0734567890'),
('David', 'Nguyen', 'david.n@example.com', '0745678901'),
('Emily', 'Brown', 'emily.b@example.com', '0756789012');

INSERT INTO Staff (FirstName, LastName, Email, Role)
VALUES
('Lerato', 'Dlamini', 'lerato.d@example.com', 'Librarian'),
('John', 'Nkosi', 'john.n@example.com', 'Assistant'),
('Sibongile', 'Zulu', 'sibongile.z@example.com', 'Manager');

INSERT INTO Borrowings (BookID, MemberID, StaffID, BorrowDate, ReturnDate)
VALUES
(1, 1, 1, '2025-04-01', '2025-04-15'),
(2, 2, 2, '2025-04-03', NULL),
(3, 3, 1, '2025-04-05', '2025-04-20'),
(4, 4, 3, '2025-04-10', NULL),
(5, 5, 2, '2025-04-12', '2025-04-25');

INSERT INTO Transactions (BorrowingID, TransactionDate, Amount, PaymentMethod)
VALUES
(1, '2025-04-01', 20.00, 'Cash'),
(2, '2025-04-03', 15.00, 'Card'),
(3, '2025-04-05', 18.00, 'Cash'),
(4, '2025-04-10', 25.00, 'Card'),
(5, '2025-04-12', 22.00, 'Cash');
