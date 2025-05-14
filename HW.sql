
CREATE TABLE Genre (
    genre_id   SERIAL PRIMARY KEY,
    name       VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE Performer (
    performer_id SERIAL PRIMARY KEY,
    name         VARCHAR(100) NOT NULL,
);


CREATE TABLE Performer_Genre (
    performer_id INTEGER NOT NULL REFERENCES Performer(performer_id) ,
    genre_id     INTEGER NOT NULL REFERENCES Genre(genre_id) ,
    PRIMARY KEY (performer_id, genre_id)
);


CREATE TABLE Album (
    album_id   SERIAL PRIMARY KEY,
    title      VARCHAR(200) NOT NULL,
    release_year INTEGER NOT NULL,
    CONSTRAINT album_year_valid CHECK (release_year >= 1900)
);


CREATE TABLE Performer_Album (
    performer_id INTEGER NOT NULL REFERENCES Performer(performer_id),
    album_id     INTEGER NOT NULL REFERENCES Album(album_id),
    PRIMARY KEY (performer_id, album_id)
);


CREATE TABLE Track (
    track_id     SERIAL PRIMARY KEY,
    title        VARCHAR(200) NOT NULL,
    duration_sec INTEGER NOT NULL,
    album_id     INTEGER NOT NULL REFERENCES Album(album_id),
    CONSTRAINT duration_positive CHECK (duration_sec > 0)
);


CREATE TABLE Collection (
    collection_id  SERIAL PRIMARY KEY,
    title          VARCHAR(200) NOT NULL,
    release_year   INTEGER NOT NULL,
    CONSTRAINT collection_year_valid CHECK (release_year >= 1900)
);

CREATE TABLE Track_Collection (
    track_id      INTEGER NOT NULL REFERENCES Track(track_id) ,
    collection_id INTEGER NOT NULL REFERENCES Collection(collection_id) ,
    PRIMARY KEY (track_id, collection_id)
);


CREATE INDEX idx_performer_name ON Performer (name);
CREATE INDEX idx_album_year ON Album (release_year);
CREATE INDEX idx_collection_year ON Collection (release_year);
