CREATE DATABASE BookClub;
USE BookClub;

-- Create Members table
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    JoinDate DATE NOT NULL
);

-- Create Books table
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    PublishedYear YEAR NOT NULL,
    Genre VARCHAR(50)
);

-- Create BorrowingRecords table
CREATE TABLE BorrowingRecords (
    RecordID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT,
    BookID INT,
    BorrowDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Insert data into Members table
INSERT INTO Members (FullName, Email, JoinDate) VALUES
('John Doe', 'john.doe@example.com', '2023-01-15'),
('Jane Smith', 'jane.smith@example.com', '2023-02-20'),
('Alice Johnson', 'alice.j@example.com', '2023-03-05'),
('Bob Brown', 'bob.brown@example.com', '2023-04-10'),
('Charlie Black', 'charlie.black@example.com', '2023-05-14'),
('Daisy White', 'daisy.white@example.com', '2023-06-18'),
('Eve Green', 'eve.green@example.com', '2023-07-22'),
('Frank Blue', 'frank.blue@example.com', '2023-08-26');

-- Insert data into Books table
INSERT INTO Books (Title, Author, PublishedYear, Genre) VALUES
('1984', 'George Orwell', 1949, 'Dystopian'),
('To Kill a Mockingbird', 'Harper Lee', 1960, 'Fiction'),
('The Great Gatsby', 'F. Scott Fitzgerald', 1925, 'Classic'),
('Moby Dick', 'Herman Melville', 1851, 'Adventure'),
('War and Peace', 'Leo Tolstoy', 1869, 'Historical'),
('Pride and Prejudice', 'Jane Austen', 1813, 'Romance'),
('The Catcher in the Rye', 'J.D. Salinger', 1951, 'Fiction'),
('The Hobbit', 'J.R.R. Tolkien', 1937, 'Fantasy');

-- Insert data into BorrowingRecords table
INSERT INTO BorrowingRecords (MemberID, BookID, BorrowDate, ReturnDate) VALUES
(1, 1, '2023-03-01', '2023-03-10'),
(2, 2, '2023-03-05', '2023-03-12'),
(3, 3, '2023-03-08', '2023-03-15'),
(4, 4, '2023-03-10', '2023-03-20'),
(5, 5, '2023-03-12', '2023-03-22'),
(6, 6, '2023-03-15', '2023-03-25'),
(7, 7, '2023-03-18', '2023-03-28'),
(8, 8, '2023-03-20', '2023-03-30');

-- Retrieve all members
SELECT * FROM Members ORDER BY FullName;

-- Retrieve all books
SELECT * FROM Books ORDER BY PublishedYear;

-- Retrieve all borrowing records
SELECT * FROM BorrowingRecords ORDER BY BorrowDate;

-- Retrieve borrowing records with member names and book titles
SELECT br.RecordID, m.FullName, b.Title, br.BorrowDate, br.ReturnDate
FROM BorrowingRecords br
JOIN Members m ON br.MemberID = m.MemberID
JOIN Books b ON br.BookID = b.BookID
ORDER BY br.BorrowDate;

-- Retrieve the total number of books borrowed by each member
SELECT m.FullName, COUNT(br.RecordID) AS BooksBorrowed
FROM Members m
JOIN BorrowingRecords br ON m.MemberID = br.MemberID
GROUP BY m.FullName
ORDER BY BooksBorrowed DESC;

-- Update the return date if needed
UPDATE BorrowingRecords
SET ReturnDate = '2023-04-05'
WHERE RecordID = 1;

-- Delete a member
DELETE FROM Members WHERE MemberID = 8;

SELECT COUNT(*) AS TotalBooks FROM Books;

SELECT AVG(PublishedYear) AS AverageYear FROM Books;

SELECT MIN(JoinDate) AS EarliestJoinDate FROM Members;

SELECT MAX(BorrowDate) AS LatestBorrowDate FROM BorrowingRecords;

DELIMITER //

CREATE PROCEDURE GetBorrowingRecords(IN memberId INT)
BEGIN
    SELECT br.RecordID, b.Title, br.BorrowDate, br.ReturnDate
    FROM BorrowingRecords br
    JOIN Books b ON br.BookID = b.BookID
    WHERE br.MemberID = memberId
    ORDER BY br.BorrowDate;
END //

DELIMITER ;
