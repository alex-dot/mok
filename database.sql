CREATE TABLE video(id INTEGER PRIMARY KEY, title VARCHAR(80), subtitle VARCHAR(80), pathname VARCHAR(120), urlname VARCHAR(60), release INTEGER, description TEXT);
CREATE TABLE category_type (id INTEGER PRIMARY KEY, title VARCHAR(30), escaped_title VARCHAR(30), type_id SMALLINT NOT NULL DEFAULT 0);
CREATE TABLE category_value (id INTEGER PRIMARY KEY, ctid INTEGER NOT NULL, title VARCHAR(40), escaped_title VARCHAR(40), FOREIGN KEY(ctid) REFERENCES category_type(id));
CREATE TABLE video_category (vid INTEGER NOT NULL, cvid INTEGER NOT NULL, FOREIGN KEY(vid) REFERENCES video(id), FOREIGN KEY(cvid) REFERENCES category_value(id));
CREATE TABLE users (id integer primary key, username varchar(20), password varchar(64), salt varchar(64), token varchar(64), token_expiry integer);
