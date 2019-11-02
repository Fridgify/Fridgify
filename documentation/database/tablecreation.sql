CREATE TABLE users(
	userid SERIAL PRIMARY KEY NOT NULL,
	username TEXT NOT NULL UNIQUE,
	name TEXT NOT NULL,
	surname TEXT NOT NULL,
	email TEXT NOT NULL unique,
	password CHAR(60) NOT NULL,
	birthdate DATE NOT NULL,
	createdAt TIMESTAMP NOT NULL
);

CREATE TABLE providers(
	providerid SERIAL PRIMARY KEY NOT NULL,
	name VARCHAR(255) NOT NULL
);

CREATE TABLE accesstokens(
	accesstoken VARCHAR(255) NOT NULL,
	userid INT NOT NULL REFERENCES users(userid),
	providerid INT NOT NULL REFERENCES providers(providerid),
	expirationdate TIMESTAMP NOT NULL,
	PRIMARY KEY(accesstoken, userid, providerid)
);

CREATE TABLE fridges(
	fridgeid SERIAL PRIMARY KEY NOT NULL,
	name TEXT NOT NULL,
	description TEXT
);

CREATE TABLE userfridge(
	userid INT NOT NULL REFERENCES users(userid),
	fridgeid INT NOT NULL REFERENCES fridges(fridgeid),
	PRIMARY KEY(userid, fridgeid)
);

CREATE TABLE stores(
	storeid SERIAL PRIMARY KEY NOT NULL,
	name TEXT NOT NULL
);

CREATE TABLE items(
	itemid SERIAL PRIMARY KEY NOT NULL,
	storeid INT NOT NULL REFERENCES stores(storeid)
);

CREATE TABLE fridgecontent(
	fridgeid INT NOT NULL REFERENCES fridges(fridgeid),
	itemid INT NOT NULL REFERENCES items(itemid),
	expirationdate DATE NOT NULL,
	amount INT NOT NULL,
	createdAt DATE NOT NULL,
	PRIMARY KEY(fridgeid, itemid)
);

