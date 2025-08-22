drop database if exists LibraryDB;
create database LibraryDB;
use LibraryDB;

create table BooksMaster(
BookCode VARCHAR(10) primary key,
CategoryName VARCHAR(50) not null
);


INSERT INTO BooksMaster VALUES
('H001', 'Horror'), ('H002', 'Horror'), ('H003', 'Horror'), ('H004', 'Horror'),
('H005', 'Horror'), ('H006', 'Horror'), ('H007', 'Horror'), ('H008', 'Horror'),
('H009', 'Horror'), ('H010', 'Horror');

INSERT INTO BooksMaster VALUES
('C001', 'Comedy'), ('C002', 'Comedy'), ('C003', 'Comedy'), ('C004', 'Comedy'),
('C005', 'Comedy'), ('C006', 'Comedy'), ('C007', 'Comedy'), ('C008', 'Comedy'),
('C009', 'Comedy'), ('C010', 'Comedy');

INSERT INTO BooksMaster VALUES
('F001', 'Fantasy'), ('F002', 'Fantasy'), ('F003', 'Fantasy'), ('F004', 'Fantasy'),
('F005', 'Fantasy'), ('F006', 'Fantasy'), ('F007', 'Fantasy'), ('F008', 'Fantasy'),
('F009', 'Fantasy'), ('F010', 'Fantasy');

INSERT INTO BooksMaster VALUES
('S001', 'ScientificFiction'), ('S002', 'ScientificFiction'), ('S003', 'ScientificFiction'),
('S004', 'ScientificFiction'), ('S005', 'ScientificFiction'), ('S006', 'ScientificFiction'),
('S007', 'ScientificFiction'), ('S008', 'ScientificFiction'), ('S009', 'ScientificFiction'),
('S010', 'ScientificFiction');

INSERT INTO BooksMaster VALUES
('L001', 'LoveDrama'), ('L002', 'LoveDrama'), ('L003', 'LoveDrama'), ('L004', 'LoveDrama'),
('L005', 'LoveDrama'), ('L006', 'LoveDrama'), ('L007', 'LoveDrama'), ('L008', 'LoveDrama'),
('L009', 'LoveDrama'), ('L010', 'LoveDrama');

create table Horror(
BookCode VARCHAR(10) primary key,
BookName VARCHAR(100) NOT NULL,
AuthorName VARCHAR(100) NOT NULL,
ShelfNo INT NOT NULL,
RackNo INT NOT NULL,
FOREIGN key (BookCode) references
BooksMaster(BookCode)
);

create table Comedy(
BookCode VARCHAR(10) primary key,
BookName VARCHAR(100) NOT NULL,
AuthorName VARCHAR(100) NOT NULL,
ShelfNo INT NOT NULL,
RackNo INT NOT NULL,
FOREIGN key (BookCode) references
BooksMaster(BookCode)
);

create table Fantasy(
BookCode VARCHAR(10) primary key,
BookName VARCHAR(100) NOT NULL,
AuthorName VARCHAR(100) NOT NULL,
ShelfNo INT NOT NULL,
RackNo INT NOT NULL,
FOREIGN key (BookCode) references
BooksMaster(BookCode)
);

create table ScientificFiction(
BookCode VARCHAR(10) primary key,
BookName VARCHAR(100) NOT NULL,
AuthorName VARCHAR(100) NOT NULL,
ShelfNo INT NOT NULL,
RackNo INT NOT NULL,
FOREIGN key (BookCode) references
BooksMaster(BookCode)
);

create table LoveDrama(
BookCode VARCHAR(10) primary key,
BookName VARCHAR(100) NOT NULL,
AuthorName VARCHAR(100) NOT NULL,
ShelfNo INT NOT NULL,
RackNo INT NOT NULL,
FOREIGN key (BookCode) references
BooksMaster(BookCode)
);

INSERT INTO Horror(BookCode, BookName, AuthorName, ShelfNo, Rackno) VALUES
('H001', 'The Shining', 'Stephen King', 1, 1),
('H002', 'Dracula', 'Bram Stoker', 1, 2),
('H003', 'Frankenstein', 'Mary Shelley', 1, 3),
('H004', 'It', 'Stephen King', 1, 4),
('H005', 'Bird Box', 'Josh Malerman', 1, 5),
('H006', 'Pet Sematary', 'Stephen King', 2, 1),
('H007', 'House of Leaves', 'Mark Z. Danielewski', 2, 2),
('H008', 'The Haunting of Hill House', 'Shirley Jackson', 2, 3),
('H009', 'Coraline', 'Neil Gaiman', 2, 4),
('H010', 'Ghost Story', 'Peter Straub', 2, 5);

INSERT INTO Comedy(BookCode, BookName, AuthorName, ShelfNo, Rackno) VALUES
('C001', 'Bossypants', 'Tina Fey', 1, 1),
('C002', 'Me Talk Pretty One Day', 'David Sedaris', 1, 2),
('C003', 'Catch-22', 'Joseph Heller', 1, 3),
('C004', 'Good Omens', 'Neil Gaiman & Terry Pratchett', 1, 4),
('C005', 'The Hitchhiker’s Guide to the Galaxy', 'Douglas Adams', 1, 5),
('C006', 'Three Men in a Boat', 'Jerome K. Jerome', 2, 1),
('C007', 'The Secret Diary of Adrian Mole', 'Sue Townsend', 2, 2),
('C008', 'Bridget Jones’s Diary', 'Helen Fielding', 2, 3),
('C009', 'Is Everyone Hanging Out Without Me?', 'Mindy Kaling', 2, 4),
('C010', 'Yes Please', 'Amy Poehler', 2, 5);

INSERT INTO ScientificFiction(BookCode, BookName, AuthorName, ShelfNo, Rackno) VALUES
('S001', 'Dune', 'Frank Herbert', 1, 1),
('S002', 'Neuromancer', 'William Gibson', 1, 2),
('S003', 'Foundation', 'Isaac Asimov', 1, 3),
('S004', 'Snow Crash', 'Neal Stephenson', 1, 4),
('S005', 'Hyperion', 'Dan Simmons', 1, 5),
('S006', 'The Left Hand of Darkness', 'Ursula K. Le Guin', 2, 1),
('S007', 'Ender’s Game', 'Orson Scott Card', 2, 2),
('S008', 'The Martian', 'Andy Weir', 2, 3),
('S009', 'Brave New World', 'Aldous Huxley', 2, 4),
('S010', '1984', 'George Orwell', 2, 5);

INSERT INTO Fantasy(BookCode, BookName, AuthorName, ShelfNo, Rackno) VALUES
('F001', 'The Hobbit', 'J.R.R. Tolkien', 1, 1),
('F002', 'Harry Potter and the Philosopher’s Stone', 'J.K. Rowling', 1, 2),
('F003', 'The Name of the Wind', 'Patrick Rothfuss', 1, 3),
('F004', 'A Game of Thrones', 'George R.R. Martin', 1, 4),
('F005', 'American Gods', 'Neil Gaiman', 1, 5),
('F006', 'Mistborn: The Final Empire', 'Brandon Sanderson', 2, 1),
('F007', 'The Lies of Locke Lamora', 'Scott Lynch', 2, 2),
('F008', 'The Last Unicorn', 'Peter S. Beagle', 2, 3),
('F009', 'The Once and Future King', 'T.H. White', 2, 4),
('F010', 'Earthsea: A Wizard of Earthsea', 'Ursula K. Le Guin', 2, 5);

INSERT INTO LoveDrama(BookCode, BookName, AuthorName, ShelfNo, Rackno) VALUES
('L001', 'Pride and Prejudice', 'Jane Austen', 1, 1),
('L002', 'Jane Eyre', 'Charlotte Brontë', 1, 2),
('L003', 'Wuthering Heights', 'Emily Brontë', 1, 3),
('L004', 'Anna Karenina', 'Leo Tolstoy', 1, 4),
('L005', 'Gone with the Wind', 'Margaret Mitchell', 1, 5),
('L006', 'The Fault in Our Stars', 'John Green', 2, 1),
('L007', 'Me Before You', 'Jojo Moyes', 2, 2),
('L008', 'Call Me by Your Name', 'André Aciman', 2, 3),
('L009', 'Norwegian Wood', 'Haruki Murakami', 2, 4),
('L010', 'The Notebook', 'Nicholas Sparks', 2, 5);

SELECT BookCode, BookName, AuthorName 
FROM Horror
WHERE AuthorName LIKE '%King%';

SELECT BM.BookCode, BM.CategoryName, H.BookName, H.AuthorName, H.ShelfNo, H.RackNo
FROM BooksMaster BM
JOIN Horror H ON BM.BookCode = H.BookCode
UNION ALL
SELECT BM.BookCode, BM.CategoryName, C.BookName, C.AuthorName, C.ShelfNo, C.RackNo
FROM BooksMaster BM
JOIN Comedy C ON BM.BookCode = C.BookCode
UNION ALL
SELECT BM.BookCode, BM.CategoryName, F.BookName, F.AuthorName, F.ShelfNo, F.RackNo
FROM BooksMaster BM
JOIN Fantasy F ON BM.BookCode = F.BookCode
UNION ALL
SELECT BM.BookCode, BM.CategoryName, S.BookName, S.AuthorName, S.ShelfNo, S.RackNo
FROM BooksMaster BM
JOIN ScientificFiction S ON BM.BookCode = S.BookCode
UNION ALL
SELECT BM.BookCode, BM.CategoryName, L.BookName, L.AuthorName, L.ShelfNo, L.RackNo
FROM BooksMaster BM
JOIN LoveDrama L ON BM.BookCode = L.BookCode;


SELECT CategoryName, AVG(ShelfNo) AS AvgShelf
FROM BooksMaster BM
JOIN (
  SELECT BookCode, ShelfNo FROM Horror
  UNION ALL
  SELECT BookCode, ShelfNo FROM Comedy
  UNION ALL
  SELECT BookCode, ShelfNo FROM Fantasy
  UNION ALL
  SELECT BookCode, ShelfNo FROM ScientificFiction
  UNION ALL
  SELECT BookCode, ShelfNo FROM LoveDrama
) AS B ON BM.BookCode = B.BookCode
GROUP BY CategoryName
HAVING AVG(ShelfNo) > (
  SELECT AVG(ShelfNo)
  FROM (
    SELECT ShelfNo FROM Horror
    UNION ALL
    SELECT ShelfNo FROM Comedy
    UNION ALL
    SELECT ShelfNo FROM Fantasy
    UNION ALL
    SELECT ShelfNo FROM ScientificFiction
    UNION ALL
    SELECT ShelfNo FROM LoveDrama
  ) AS AllShelves
);


SELECT BookCode, BookName, AuthorName, ShelfNo, CategoryName,
       RANK() OVER (PARTITION BY CategoryName ORDER BY ShelfNo) AS ShelfRank
FROM (
  SELECT BM.BookCode, H.BookName, H.AuthorName, H.ShelfNo, BM.CategoryName FROM BooksMaster BM JOIN Horror H ON BM.BookCode = H.BookCode
  UNION ALL
  SELECT BM.BookCode, C.BookName, C.AuthorName, C.ShelfNo, BM.CategoryName FROM BooksMaster BM JOIN Comedy C ON BM.BookCode = C.BookCode
  UNION ALL
  SELECT BM.BookCode, F.BookName, F.AuthorName, F.ShelfNo, BM.CategoryName FROM BooksMaster BM JOIN Fantasy F ON BM.BookCode = F.BookCode
  UNION ALL
  SELECT BM.BookCode, S.BookName, S.AuthorName, S.ShelfNo, BM.CategoryName FROM BooksMaster BM JOIN ScientificFiction S ON BM.BookCode = S.BookCode
  UNION ALL
  SELECT BM.BookCode, L.BookName, L.AuthorName, L.ShelfNo, BM.CategoryName FROM BooksMaster BM JOIN LoveDrama L ON BM.BookCode = L.BookCode
) AS AllBooks;

CREATE VIEW AllBooksView AS
SELECT BM.BookCode, BM.CategoryName, H.BookName, H.AuthorName, H.ShelfNo, H.RackNo
FROM BooksMaster BM
JOIN Horror H ON BM.BookCode = H.BookCode

UNION ALL

SELECT BM.BookCode, BM.CategoryName, C.BookName, C.AuthorName, C.ShelfNo, C.RackNo
FROM BooksMaster BM
JOIN Comedy C ON BM.BookCode = C.BookCode

UNION ALL

SELECT BM.BookCode, BM.CategoryName, F.BookName, F.AuthorName, F.ShelfNo, F.RackNo
FROM BooksMaster BM
JOIN Fantasy F ON BM.BookCode = F.BookCode

UNION ALL

SELECT BM.BookCode, BM.CategoryName, S.BookName, S.AuthorName, S.ShelfNo, S.RackNo
FROM BooksMaster BM
JOIN ScientificFiction S ON BM.BookCode = S.BookCode

UNION ALL

SELECT BM.BookCode, BM.CategoryName, L.BookName, L.AuthorName, L.ShelfNo, L.RackNo
FROM BooksMaster BM
JOIN LoveDrama L ON BM.BookCode = L.BookCode;

SELECT * FROM AllBooksView WHERE ShelfNo = 1 ORDER BY CategoryName;

DELIMITER //

CREATE PROCEDURE GetBooksByCategory(IN catName VARCHAR(50))
BEGIN
  IF catName = 'Horror' THEN
    SELECT * FROM Horror;
  ELSEIF catName = 'Comedy' THEN
    SELECT * FROM Comedy;
  ELSEIF catName = 'Fantasy' THEN
    SELECT * FROM Fantasy;
  ELSEIF catName = 'ScientificFiction' THEN
    SELECT * FROM ScientificFiction;
  ELSEIF catName = 'LoveDrama' THEN
    SELECT * FROM LoveDrama;
  ELSE
    SELECT 'Category not found' AS Message;
  END IF;
END //

DELIMITER ;

CALL GetBooksByCategory('Fantasy');
