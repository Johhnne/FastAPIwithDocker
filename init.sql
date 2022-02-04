CREATE TABLE product_names (
    product_id character varying(36) NOT NULL,
    product_name character varying(255)
);

INSERT INTO product_names
VALUES 
	('a', 'hamburguer'),
	('b', 'coca cola'),
	('c', 'batata frita'),
	('d', 'salada'),
	('e', 'coxinha'),
	('f', 'chocolate'),
	('g', 'brigadeiro');