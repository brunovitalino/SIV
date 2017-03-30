
CREATE TABLE dbsiv.Funcionarios(
	id INT(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45),
    acesso VARCHAR(15),
    usuario VARCHAR(15),
    senha VARCHAR(15),
    PRIMARY KEY(id)
);

CREATE TABLE dbsiv.Artigo(
	id INT(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45),
    acesso VARCHAR(15),
    usuario VARCHAR(15),
    senha VARCHAR(15),
    PRIMARY KEY(id)
);

INSERT INTO dbsiv.Funcionario(nome, acesso, usuario, senha)
VALUES ('Bruno Vitalino', 'admin', 'brunovitalino', '123');
INSERT INTO dbsiv.Funcionario(nome, acesso, usuario, senha)
VALUES ('Breno Oliveira', 'user', 'brenooliveira', '123');
INSERT INTO dbsiv.Funcionario(nome, acesso, usuario, senha)
VALUES ('Felipe Abreu', 'user', 'felipeabreu', '123');


-- Procedimento Listar Funcionario
DELIMITER $$
DROP PROCEDURE IF EXISTS splistar_funcionario $$
CREATE PROCEDURE splistar_funcionario()
BEGIN
SELECT * FROM dbsiv.Funcionario
ORDER BY id DESC LIMIT 200;
END $$
DELIMITER ;

CALL splistar_funcionario;
-- -----------------------------------

-- Procedimento Buscar Funcionario - Nome
DELIMITER $$
DROP PROCEDURE IF EXISTS spbuscar_funcionario $$
CREATE PROCEDURE spbuscar_funcionario
(
	IN _nome VARCHAR(15)
)
BEGIN
	IF (_nome IS NULL) THEN
		CALL splistar_funcionario;
	ELSE
		SELECT * FROM dbsiv.funcionario
        WHERE nome LIKE CONCAT('%', _nome, '%');
	END IF;
END $$
DELIMITER ;

CALL spbuscar_funcionario('bre');
-- -----------------------------------

-- Procedimento Inserir Funcionario
-- -----------------------------------

-- Procedimento Editar Funcionario
-- -----------------------------------

-- Procedimento Remover Funcionario
-- -----------------------------------
