
CREATE TABLE if not exists Genre (
    genre_id   SERIAL PRIMARY KEY,
    name       VARCHAR(100) NOT NULL UNIQUE
);


CREATE table if not exists Performer (
    performer_id SERIAL PRIMARY KEY,
    name         VARCHAR(100) NOT NULL
);


CREATE TABLE if not exists Performer_Genre (
    performer_id INTEGER NOT NULL REFERENCES Performer(performer_id) ,
    genre_id     INTEGER NOT NULL REFERENCES Genre(genre_id) ,
    PRIMARY KEY (performer_id, genre_id)
);


CREATE TABLE if not exists Album (
    album_id   SERIAL PRIMARY KEY,
    title      VARCHAR(200) NOT NULL,
    release_year INTEGER NOT NULL,
    CONSTRAINT album_year_valid CHECK (release_year >= 1900)
);


CREATE TABLE if not exists Performer_Album (
    performer_id INTEGER NOT NULL REFERENCES Performer(performer_id),
    album_id     INTEGER NOT NULL REFERENCES Album(album_id),
    PRIMARY KEY (performer_id, album_id)
);


CREATE TABLE if not exists Track (
    track_id     SERIAL PRIMARY KEY,
    title        VARCHAR(200) NOT NULL,
    duration_sec INTEGER NOT NULL,
    album_id     INTEGER NOT NULL REFERENCES Album(album_id),
    CONSTRAINT duration_positive CHECK (duration_sec > 0)
);


CREATE TABLE if not exists Collection (
    collection_id  SERIAL PRIMARY KEY,
    title          VARCHAR(200) NOT NULL,
    release_year   INTEGER NOT NULL,
    CONSTRAINT collection_year_valid CHECK (release_year >= 1900)
);

CREATE TABLE if not exists Track_Collection (
    track_id      INTEGER NOT NULL REFERENCES Track(track_id) ,
    collection_id INTEGER NOT NULL REFERENCES Collection(collection_id) ,
    PRIMARY KEY (track_id, collection_id)
);

