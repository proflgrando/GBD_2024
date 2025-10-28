``` 
select version();
```
| version() |
|:----------|
| 8.4.3 |

``` 
create database leo;
use leo;
```


``` 
CREATE TABLE artist (
  id INT AUTO_INCREMENT,
  name VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
) ENGINE=InnoDB;
```

``` 
CREATE TABLE album (
  id INT AUTO_INCREMENT,
  title VARCHAR(128) UNIQUE,
  artist_id INT,
  PRIMARY KEY(id),
  CONSTRAINT fk_album_artist FOREIGN KEY (artist_id)
    REFERENCES artist(id) ON DELETE CASCADE
) ENGINE=InnoDB;
```

``` 
INSERT INTO artist (name) VALUES
  ('Pink Floyd'),
  ('The Beatles'),
  ('Nirvana'),
  ('Iron Maiden');
```

> ``` status
> Records: 4  Duplicates: 0  Warnings: 0
> ```

``` 
select * from artist;
```
| id | name |
|---:|:-----|
| 4 | Iron Maiden |
| 3 | Nirvana |
| 1 | Pink Floyd |
| 2 | The Beatles |

[fiddle](https://dbfiddle.uk/HmQJ9ada)
