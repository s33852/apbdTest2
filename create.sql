-- Table: Reviews
CREATE TABLE Reviews (
    MemberId int  NOT NULL,
    BookId int  NOT NULL,
    Rating int  NOT NULL,
    Comment varchar(500)  NOT NULL,
    ReviewDate date  NOT NULL,
    CONSTRAINT Reviews_pk PRIMARY KEY  (MemberId,BookId)
);

-- Table: Borrowings
CREATE TABLE Borrowings (
    BorrowingId int  NOT NULL IDENTITY,
    MemberId int  NOT NULL,
    BookId int  NOT NULL,
    BorrowDate date  NOT NULL,
    ReturnDate date  NULL,
    Status varchar(50)  NOT NULL,
    CONSTRAINT Borrowings_pk PRIMARY KEY  (BorrowingId)
);

-- Table: Authors
CREATE TABLE Authors (
    AuthorId int  NOT NULL IDENTITY,
    FirstName varchar(50)  NOT NULL,
    LastName varchar(100)  NOT NULL,
    Country varchar(50)  NOT NULL,
    BirthYear int  NOT NULL,
    CONSTRAINT Authors_pk PRIMARY KEY  (AuthorId)
);

-- Table: Books
CREATE TABLE Books (
    BookId int  NOT NULL IDENTITY,
    Title varchar(200)  NOT NULL,
    ISBN varchar(13)  NOT NULL,
    PublishedYear int  NOT NULL,
    AuthorId int  NOT NULL,
    CONSTRAINT Books_pk PRIMARY KEY  (BookId)
);

-- Table: Members
CREATE TABLE Members (
    MemberId int  NOT NULL IDENTITY,
    FirstName varchar(50)  NOT NULL,
    LastName varchar(100)  NOT NULL,
    Email varchar(100)  NOT NULL,
    Phone varchar(9)  NOT NULL,
    CONSTRAINT Members_pk PRIMARY KEY  (MemberId)
);

-- foreign keys
ALTER TABLE Reviews ADD CONSTRAINT Reviews_Members
    FOREIGN KEY (MemberId)
    REFERENCES Members (MemberId);

ALTER TABLE Reviews ADD CONSTRAINT Reviews_Books
    FOREIGN KEY (BookId)
    REFERENCES Books (BookId);

ALTER TABLE Borrowings ADD CONSTRAINT Borrowings_Members
    FOREIGN KEY (MemberId)
    REFERENCES Members (MemberId);

ALTER TABLE Borrowings ADD CONSTRAINT Borrowings_Books
    FOREIGN KEY (BookId)
    REFERENCES Books (BookId);

ALTER TABLE Books ADD CONSTRAINT Books_Authors
    FOREIGN KEY (AuthorId)
    REFERENCES Authors (AuthorId);

-- End of file.


-- Authors
INSERT INTO Authors (FirstName, LastName, Country, BirthYear) VALUES
('Adam', 'Mickiewicz', 'Poland', 1798),
('Jane', 'Austen', 'United Kingdom', 1775),
('Gabriel', 'Garcia Marquez', 'Colombia', 1927),
('Haruki', 'Murakami', 'Japan', 1949);

-- Books
INSERT INTO Books (Title, ISBN, PublishedYear, AuthorId) VALUES
('Pan Tadeusz', '9781234567890', 1834, 1),
('Pride and Prejudice', '9789876543210', 1813, 2),
('One Hundred Years of Solitude', '9781122334455', 1967, 3),
('Norwegian Wood', '9785566778899', 1987, 4),
('Sense and Sensibility', '9783344556677', 1811, 2);

-- Members
INSERT INTO Members (FirstName, LastName, Email, Phone) VALUES
('Anna', 'Kowalska', 'anna@email.com', '123456789'),
('Jan', 'Nowak', 'jan@email.com', '234567891'),
('Maria', 'Wisniewska', 'maria@email.com', '345678912'),
('Piotr', 'Zielinski', 'piotr@email.com', '456789123'),
('Katarzyna', 'Lewandowska', 'kasia@email.com', '567891234');

-- Borrowings
INSERT INTO Borrowings (MemberId, BookId, BorrowDate, ReturnDate, Status) VALUES
(1, 1, '2026-05-01', '2026-05-15', 'Returned'),
(2, 2, '2026-05-10', NULL, 'Active'),
(3, 3, '2026-05-12', '2026-05-20', 'Returned'),
(1, 4, '2026-06-01', NULL, 'Active'),
(4, 5, '2026-05-25', NULL, 'Active');

-- Reviews
INSERT INTO Reviews (MemberId, BookId, Rating, Comment, ReviewDate) VALUES
(1, 1, 5, 'A masterpiece of Polish literature', '2026-05-16'),
(2, 2, 4, 'A classic that still holds up well', '2026-05-18'),
(3, 3, 5, 'Magical realism at its finest', '2026-05-22'),
(1, 2, 3, 'Good but slow in places', '2026-05-20');