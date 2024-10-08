CREATE TABLE entity_hotel (
id bigint generated BY DEFAULT AS IDENTITY,
name VARCHAR(255),
city VARCHAR(255) CHECK (city IN ('ROSARIO','CARACAS','NEW_YORK','ATLAS','MANHATTAN')),
room_type VARCHAR(255) CHECK (room_type IN ('TOURIST','PREMIUM','EXECUTIVE','VIP')),
price_per_night FLOAT(53),
PRIMARY KEY (id, city)) PARTITION BY LIST (city);

CREATE TABLE part_hotel_city_rosario PARTITION OF entity_hotel FOR VALUES IN ('ROSARIO');
CREATE TABLE part_hotel_city_caracas PARTITION OF entity_hotel FOR VALUES IN ('CARACAS');
CREATE TABLE part_hotel_city_new_york PARTITION OF entity_hotel FOR VALUES IN ('NEW_YORK');
CREATE TABLE part_hotel_city_atlas PARTITION OF entity_hotel FOR VALUES IN ('ATLAS');
CREATE TABLE part_hotel_city_manhattan PARTITION OF entity_hotel FOR VALUES IN ('MANHATTAN');