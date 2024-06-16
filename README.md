# CFG-Project-3-HDD
# BookClub Database Project

This project is a SQL-based solution for managing a book club. The database includes tables for members, books, and borrowing records. The purpose of this database is to keep track of book borrowing activities within the club, including details about members, books, and borrowing history.

## Features

- **Database Design:** Includes three tables: Members, Books, and BorrowingRecords.
- **Data Insertion:** Populates tables with sample data.
- **Data Retrieval:** Queries to retrieve and display data in various formats.
- **Aggregate Functions:** COUNT, AVG, MIN, and MAX functions.
- **Stored Procedure:** A stored procedure to retrieve borrowing records for a specific member.

## Requirements

- MySQL Server
- MySQL Workbench 

## Installation and Setup

1. **Download and Install MySQL**

2. **Clone the Repository:**

git clone https://github.com/HanaDevonaldDavies/CFG-Project-3-HDD.git
  
  cd CFG-assignment-3

## Potential Server Issues
MySQL had some issues connecting to the server, therefore I have added here some images of the code I created for this project.

# Code Sections and Relevance 
## Database and Table formation
 '''SQL
 CREATE DATABASE BookShop;
USE BookShop;

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    JoinDate DATE NOT NULL
);

CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    PublishedYear YEAR NOT NULL,
    Genre VARCHAR(50)
);

CREATE TABLE PurchaseRecords (
    RecordID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    BookID INT,
    PurchaseDate DATE NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);



