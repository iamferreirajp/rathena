CREATE TABLE IF NOT EXISTS news (
id int NOT NULL AUTO_INCREMENT,
title varchar(255) NOT NULL,
category varchar(255) NOT NULL,
body varchar(3000) NOT NULL,
publication_date datetime NOT NULL DEFAULT NOW(),
PRIMARY KEY (id)
);