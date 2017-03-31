
CREATE DATABASE dbsiv;
USE dbsiv;


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


-- ---------------------------------------------------------------
-- Procedimento Listar Funcionario
-- ---------------------------------------------------------------
DELIMITER $$
DROP PROCEDURE IF EXISTS dbsiv.splistar_funcionario $$
CREATE PROCEDURE dbsiv.splistar_funcionario()
BEGIN
	SELECT * FROM dbsiv.Funcionario
	ORDER BY id DESC LIMIT 200;
END $$
DELIMITER ;
-- ---------------------------------------------------------------

CALL dbsiv.splistar_funcionario;


-- ---------------------------------------------------------------
-- Procedimento Buscar_por_nome Funcionario
-- ---------------------------------------------------------------
DELIMITER $$
DROP PROCEDURE IF EXISTS dbsiv.spbuscar_funcionario $$
CREATE PROCEDURE dbsiv.spbuscar_funcionario
(
	IN _nomeBuscado VARCHAR(15)
)
BEGIN
	IF !(_nomeBuscado IS NULL) THEN
		SELECT * FROM dbsiv.Funcionario
        WHERE nome LIKE CONCAT('%', _nomeBuscado, '%');
	ELSE
		SELECT * FROM dbsiv.Funcionario;
	END IF;
END $$
DELIMITER ;
-- ---------------------------------------------------------------

CALL dbsiv.spbuscar_funcionario('bre');


-- ---------------------------------------------------------------
-- Procedimento Inserir Funcionario
-- ---------------------------------------------------------------
DELIMITER $$
DROP PROCEDURE IF EXISTS dbsiv.spinserir_funcionario $$
CREATE PROCEDURE dbsiv.spinserir_funcionario
(
	IN _nome VARCHAR(45),
    IN _acesso VARCHAR(15),
    IN _usuario VARCHAR(15),
    IN _senha VARCHAR(15)
)
BEGIN
	INSERT INTO Funcionario(nome, acesso, usuario, senha)
    VALUES (_nome, _acesso, _usuario, _senha);
END $$
DELIMITER ;
-- ---------------------------------------------------------------

CALL dbsiv.spinserir_funcionario('Renato Viana', 'user', 'renatoviana', '123');
CALL dbsiv.splistar_funcionario;


-- ---------------------------------------------------------------
-- Procedimento Editar Funcionario
-- ---------------------------------------------------------------
DELIMITER $$
DROP PROCEDURE IF EXISTS speditar_funcionario $$
CREATE PROCEDURE speditar_funcionario
(
	IN _idEscolhido VARCHAR(45),
    IN _nome VARCHAR(45),
    IN _acesso VARCHAR(15),
    IN _usuario VARCHAR(15),
    IN _senha VARCHAR(15)
)
BEGIN
	UPDATE dbsiv.Funcionario
    SET nome=_nome, acesso=_acesso, usuario=_usuario, senha=_senha
    WHERE id = _idEscolhido;
END $$
DELIMITER ;
-- ---------------------------------------------------------------

CALL dbsiv.splistar_funcionario;

CALL dbsiv.speditar_funcionario(4, 'Felipe Vieira', 'user', 'felipevireira', '456');
CALL dbsiv.splistar_funcionario;

CALL dbsiv.speditar_funcionario(4, 'Renato Viana', 'user', 'renatoviana', '123');
CALL dbsiv.splistar_funcionario;


-- ---------------------------------------------------------------
-- Procedimento Remover Funcionario
-- ---------------------------------------------------------------
DELIMITER $$
DROP PROCEDURE IF EXISTS spremover_funcionario $$
CREATE PROCEDURE spremover_funcionario
(
	IN _idEscolhido VARCHAR(45)
)
BEGIN
	DELETE FROM dbsiv.Funcionario
    WHERE id=_idEscolhido;
END $$
DELIMITER ;
-- ---------------------------------------------------------------

CALL splistar_funcionario;

CALL spinserir_funcionario('teste', 'admin', 't1', '123');
CALL splistar_funcionario;

CALL spremover_funcionario(5);
CALL splistar_funcionario;
