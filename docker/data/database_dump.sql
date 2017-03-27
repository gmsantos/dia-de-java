USE evento;

DROP TABLE IF EXISTS minicurso;
CREATE TABLE minicurso (
id INT(11) NOT NULL AUTO_INCREMENT ,
nome VARCHAR(128) NULL DEFAULT NULL ,
palestrante VARCHAR(128) NULL DEFAULT NULL ,
data VARCHAR(64) NULL DEFAULT NULL ,
local VARCHAR(128) NULL DEFAULT NULL ,
descricao VARCHAR(255) NULL DEFAULT NULL ,
PRIMARY KEY (id)
);

INSERT INTO minicurso (nome, palestrante, data, local, descricao) VALUES 
('JAVA EE', 'Joao', '2017-03-26', 'São Carlos', 'Introducao ao Java EE'),
('Laravel', 'Zizaco', '2017-03-26', 'Online', 'Aprenda sobre esse Framework PHP com o pioneiro'),
('PHP Avancado', 'David', '2017-03-26', 'Casa Branca', 'Hackeie na web com esse curso massa');

DROP TABLE IF EXISTS participante;
CREATE TABLE participante (
id INT(11) NOT NULL AUTO_INCREMENT ,
cpf VARCHAR(16) NULL DEFAULT NULL ,
nome VARCHAR(128) NULL DEFAULT NULL ,
email VARCHAR(128) NULL DEFAULT NULL ,
senha VARCHAR(128) NULL DEFAULT NULL ,
celular VARCHAR(20) NULL DEFAULT NULL ,
presenca VARCHAR(5) NULL DEFAULT NULL ,
minicurso_id INT(11) NOT NULL ,
PRIMARY KEY (id, minicurso_id) ,
INDEX fk_participante_minicurso (minicurso_id ASC) ,
CONSTRAINT fk_participante_minicurso
FOREIGN KEY (minicurso_id)
REFERENCES evento.minicurso (id )
ON DELETE NO ACTION
ON UPDATE NO ACTION
);