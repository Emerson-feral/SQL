CREATE TABLE Users(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    email VARCHARACTER(255) NOT NULL UNIQUE,
    bio TEXT,
    country VARCHARACTER(2)
);

-- @BLOCK
INSERT INTO Users(email,bio,country)
VALUES(
    'emerson@xy.com',
    'Hello world',
    'BR'
);

-- @BLOCK
INSERT INTO Users(email,bio,country)
VALUES
    ('Gian@xy.com', 'foo', 'US'),
    ('Max@xy.com', 'bar', 'SP'),
    ('Paola@xy.com', 'baz', 'JP');


-- @BLOCK
SELECT * FROM Users;

-- @BLOCK
SELECT email, id FROM Users

WHERE country = 'BR'
AND id < 2

ORDER BY id ASC
LIMIT 2;


-- @BLOCK
SELECT email, id FROM Users

WHERE id > 1
AND email LIKE 'g%'

ORDER BY id ASC
LIMIT 2;

-- @BLOCK
CREATE INDEX email_index ON Users(email);

-- @BLOCK
CREATE TABLE Rooms(
    id INTEGER AUTO_INCREMENT,
    street VARCHAR(255),
    owner_id INTEGER NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(owner_id) REFERENCES Users(id)
);

-- @BLOCK
INSERT INTO Rooms(owner_id,street)
VALUES
    (1 , 'Atalia'),
    (1 ,'d antonni borrell'),
    (1 ,'maquinista');

-- @BLOCK
SELECT * FROM Users  
INNER JOIN Rooms
ON Rooms.owner_id = Users.id;
