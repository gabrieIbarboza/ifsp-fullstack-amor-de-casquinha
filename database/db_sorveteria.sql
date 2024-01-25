-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_sorveteria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_sorveteria` DEFAULT CHARACTER SET utf8 ;
USE `db_sorveteria` ;

-- -----------------------------------------------------
-- Table `db_sorveteria`.`tbEndereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sorveteria`.`tbEndereco` (
    `idEndereco` INT NOT NULL AUTO_INCREMENT,
    `cep` VARCHAR(20),
    `rua` VARCHAR(100),
    `numero` INT,
    `complemento` VARCHAR(15),
    `bairro` VARCHAR(45),
    PRIMARY KEY (`idEndereco`)
);


-- -----------------------------------------------------
-- Table `db_sorveteria`.`tbCliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sorveteria`.`tbCliente` (
    `idCliente` INT NOT NULL AUTO_INCREMENT,
    `isDeleted` TINYINT DEFAULT 0,
    `nomeCliente` VARCHAR(50),
    `emailCliente` VARCHAR(60) UNIQUE,
    `senhaCliente` VARCHAR(255),
    `telefoneCliente` VARCHAR(25),
    `profile` CHAR(4) DEFAULT 'CLIE',
    `tbEndereco_idEndereco` INT,
    PRIMARY KEY (`idCliente`),
    CONSTRAINT `fk_tbCliente_tbEndereco1` FOREIGN KEY (`tbEndereco_idEndereco`)
        REFERENCES `db_sorveteria`.`tbEndereco` (`idEndereco`)
);
/* alter table tbCliente
modify telefoneCliente varchar(25);
alter table tbCliente
add `profile` CHAR(4) DEFAULT 'CLIE';*/

-- -----------------------------------------------------
-- Table `db_sorveteria`.`tbFuncionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sorveteria`.`tbFuncionario` (
    `idFuncionario` INT NOT NULL AUTO_INCREMENT,
    `isDeleted` TINYINT DEFAULT 0,
    `isAdm` TINYINT,
    `profile` CHAR(4) DEFAULT 'FUNC',
    `nomeFuncionario` VARCHAR(50),
    `telefoneFuncionario` VARCHAR(25),
    `emailFuncionario` VARCHAR(60) UNIQUE,
    `senhaFuncionario` VARCHAR(255),
    PRIMARY KEY (`idFuncionario`)
);
/* alter table tbFuncionario
modify telefoneFuncionario varchar(25);
alter table tbFuncionario
add `profile` CHAR(4) DEFAULT 'FUNC'; */

-- -----------------------------------------------------
-- Table `db_sorveteria`.`tbPedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sorveteria`.`tbPedido` (
    `idPedido` INT NOT NULL AUTO_INCREMENT,
    `dataPedido` DATETIME,
    `totalPedido` DECIMAL(10 , 2 ),
    `isDelivery` TINYINT DEFAULT 1,
    `statusPedido` VARCHAR(20),
    `tbCliente_idCliente` INT,
    `tbFuncionario_idFuncionario` INT,
    `tbEndereco_idEndereco` INT,
    PRIMARY KEY (`idPedido`),
    CONSTRAINT `fk_tbPedido_tbCliente1` FOREIGN KEY (`tbCliente_idCliente`)
        REFERENCES `db_sorveteria`.`tbCliente` (`idCliente`),
    CONSTRAINT `fk_tbPedido_tbFuncionario1` FOREIGN KEY (`tbFuncionario_idFuncionario`)
        REFERENCES `db_sorveteria`.`tbFuncionario` (`idFuncionario`),
	CONSTRAINT `fk_tbPedido_tbEndereco1` FOREIGN KEY (`tbEndereco_idEndereco`)
        REFERENCES `db_sorveteria`.`tbEndereco` (`idEndereco`)
);


-- -----------------------------------------------------
-- Table `db_sorveteria`.`tbProduto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sorveteria`.`tbProduto` (
    `idProduto` INT NOT NULL AUTO_INCREMENT,
    `isDeleted` TINYINT DEFAULT 0,
    `isActive` TINYINT DEFAULT 1,
    `nomeProduto` VARCHAR(50) UNIQUE,
    `tipoProduto` VARCHAR(20),
    `fotoProduto` VARCHAR(255),
    PRIMARY KEY (`idProduto`)
);


-- -----------------------------------------------------
-- Table `db_sorveteria`.`tbVariacaoProduto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sorveteria`.`tbVariacaoProduto` (
    `idVariacao` INT NOT NULL AUTO_INCREMENT,
    `isActive` TINYINT DEFAULT 1,
    `nomeVariacao` VARCHAR(50) UNIQUE,
    `precoVariacao` DECIMAL(10 , 2 ),
    `fotoVariacao` VARCHAR(255),
    `tbProduto_idProduto` INT NOT NULL,
    PRIMARY KEY (`idVariacao`),
    CONSTRAINT `fk_tbVariacaoProduto_tbProduto1` FOREIGN KEY (`tbProduto_idProduto`)
        REFERENCES `db_sorveteria`.`tbProduto` (`idProduto`)
);


-- -----------------------------------------------------
-- Table `db_sorveteria`.`tbProdutoPedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sorveteria`.`tbProdutoPedido` (
	`idProdutoPedido` INT NOT NULL AUTO_INCREMENT,
    `tbPedido_idPedido` INT NOT NULL,
    `tbVariacaoProduto_idProduto` INT NOT NULL,
    `tbVariacaoProduto_idVariacao` INT NOT NULL,
    `quantidade` INT,
    `subTotal` DECIMAL(10 , 2 ),
    PRIMARY KEY (`idProdutoPedido`),
    CONSTRAINT `fk_tbPedido_has_tbProduto_tbPedido1` FOREIGN KEY (`tbPedido_idPedido`)
        REFERENCES `db_sorveteria`.`tbPedido` (`idPedido`),
    CONSTRAINT `fk_tbPedido_has_tbProduto_tbProduto1` FOREIGN KEY (`tbVariacaoProduto_idProduto` , `tbVariacaoProduto_idVariacao`)
        REFERENCES `db_sorveteria`.`tbVariacaoProduto` (`tbProduto_idProduto`, `idVariacao`)
);


-- -----------------------------------------------------
-- FUNCTIONS
-- -----------------------------------------------------
-- Retorna ID se existir, retorna Status se criar
DELIMITER $$
CREATE FUNCTION FN_GetEnderecoId(
	cepEnd varchar(20), ruaEnd varchar(100), numeroEnd int, complementoEnd varchar(15), bairroEnd varchar(45)
) RETURNS int
DETERMINISTIC
BEGIN
	IF EXISTS (SELECT idEndereco FROM tbEndereco 
				WHERE cep like cepEnd AND rua like ruaEnd AND numero = numeroEnd AND complemento like complementoEnd AND bairro like bairroEnd)
		THEN
			RETURN (SELECT idEndereco FROM tbEndereco 
					WHERE (cep like cepEnd AND rua like ruaEnd AND numero = numeroEnd AND complemento like complementoEnd AND bairro like bairroEnd)
                    LIMIT 1);
	ELSE
		INSERT INTO tbEndereco(`cep`, `rua`, `numero`, `complemento`, `bairro`) 
			VALUES (cepEnd, ruaEnd, numeroEnd, complementoEnd, bairroEnd
		);
        RETURN LAST_INSERT_ID();
    END IF;
END;
$$

-- Se Cliente existir retorna Id, senao retorna NULL 
DELIMITER $$
CREATE FUNCTION FN_GetClienteId(
	email varchar(60)
) RETURNS int
DETERMINISTIC
BEGIN
	IF EXISTS (SELECT idCliente FROM tbCliente WHERE emailCliente like email)
		THEN
			RETURN (SELECT idCliente FROM tbCliente WHERE emailCliente like email LIMIT 1);
	ELSE
        RETURN NULL;
    END IF;
END;
$$


-- -----------------------------------------------------
-- CRUD tbCliente
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE SP_ClienteCreate(
	cepEnd varchar(20), ruaEnd varchar(100), numeroEnd int, complementoEnd varchar(15), bairroEnd varchar(45),
    nomeClie varchar(50), emailClie varchar(60), senhaClie varchar(255), telefoneClie varchar(25)
)
BEGIN
	IF EXISTS (SELECT emailCliente from tbCliente where emailCliente like emailClie)
	THEN
		SELECT '403' AS 'Status', 'ERROR_EMAIL_CADASTRADO' AS 'Error', '' AS 'Message';
	ELSE
		INSERT INTO tbEndereco(`cep`, `rua`, `numero`, `complemento`, `bairro`) 
		VALUES (cepEnd, ruaEnd, numeroEnd, complementoEnd, bairroEnd
		);
        SET @last_id_in_tbEndereco = LAST_INSERT_ID();
        INSERT INTO tbCliente(
			`nomeCliente`,
			`emailCliente`,
			`senhaCliente`,
			`telefoneCliente`,
			`tbEndereco_idEndereco`) 
		VALUES (nomeClie, emailClie, senhaClie, telefoneClie, @last_id_in_tbEndereco
		);
		SELECT 
			'201' AS 'Status',
			'' AS 'Error',
			'SUCCESS_CREATED' AS 'Message';
	END IF; 
END;
//

DELIMITER //
CREATE PROCEDURE SP_ClienteReadByEmail(
	emailClie varchar(60)
)
BEGIN
	IF NOT EXISTS (SELECT emailCliente from tbCliente where emailCliente like emailClie)
	THEN
		SELECT '403' AS 'Status', 'ERROR_EMAIL_NAO_ENCONTRADO' AS 'Error', '' AS 'Message';
	ELSE
		SELECT * 
			FROM tbCliente 
			INNER JOIN tbEndereco
            ON tbCliente.tbEndereco_idEndereco = tbEndereco.idEndereco
            WHERE emailCliente like emailClie LIMIT 1;
	END IF;
END;
//

DELIMITER //
CREATE PROCEDURE SP_ClienteUpdate(
	emailClie varchar(60), newEmailClie varchar(60), nomeClie varchar(50), telefoneClie varchar(25),
	cepEnd varchar(20), ruaEnd varchar(100), numeroEnd int, complementoEnd varchar(15), bairroEnd varchar(45)
)
BEGIN
	IF NOT EXISTS (SELECT emailCliente from tbCliente where emailCliente like emailClie)
	THEN
		SELECT '403' AS 'Status', 'ERROR_EMAIL_NAO_ENCONTRADO' AS 'Error', '' AS 'Message';
	ELSE
		SET @enderecoId := (SELECT tbEndereco_idEndereco FROM tbCliente WHERE emailCliente like emailClie LIMIT 1);
		UPDATE tbEndereco SET
			cep = cepEnd, 
			rua = ruaEnd, 
			numero = numeroEnd, 
			complemento = complementoEnd, 
			bairro = bairroEnd
            WHERE idEndereco = @enderecoId;
		UPDATE tbCLiente SET
			nomeCliente = nomeClie,
			emailCliente = newEmailClie,
			telefoneCliente = telefoneClie
			WHERE emailCliente like emailClie;
		SELECT 
			'204' AS 'Status',
			'' AS 'Error',
			'SUCCESS_UPDATED' AS 'Message';
	END IF; 
END;
//

DELIMITER //
CREATE PROCEDURE SP_ClienteDeleteByEmail(
	emailClie varchar(60)
)
BEGIN
	IF NOT EXISTS (SELECT emailCliente from tbCliente where emailCliente like emailClie)
	THEN
		SELECT '403' AS 'Status', 'ERROR_EMAIL_NAO_ENCONTRADO' AS 'Error', '' AS 'Message';
	ELSE
		SET @enderecoId := (SELECT tbEndereco_idEndereco FROM tbCliente WHERE emailCliente like emailClie LIMIT 1);
		UPDATE tbEndereco SET
			cep = NULL, 
			rua = NULL, 
			numero = NULL, 
			complemento = NULL, 
			bairro = NULL
            WHERE idEndereco = @enderecoId;
        UPDATE tbCLiente SET
			isDeleted = 1,
			nomeCliente = NULL,
			emailCliente = NULL,
            senhaCliente = NULL,
			telefoneCliente = NULL
			WHERE emailCliente like emailClie;
        SELECT
			'204' AS 'Status',
			'' AS 'Error',
			'SUCCESS_DELETED' AS 'Message';
	END IF;
END;
//


-- -----------------------------------------------------
-- CRUD tbFuncionario
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE SP_FuncionarioCreate(
    emailF varchar(60), senhaF varchar(255), nomeF varchar(50), telefoneF varchar(25), adm tinyint
)
BEGIN
	IF EXISTS (SELECT emailFuncionario from tbFuncionario where emailFuncionario like emailF)
	THEN
		SELECT '403' AS 'Status', 'ERROR_EMAIL_CADASTRADO' AS 'Error', '' AS 'Message';
	ELSE
        INSERT INTO tbFuncionario(
			`nomeFuncionario`,
			`emailFuncionario`,
			`senhaFuncionario`,
			`telefoneFuncionario`,
			`isAdm`)
			VALUES (nomeF, emailF, senhaF, telefoneF, adm);
		SELECT 
			'201' AS 'Status',
			'' AS 'Error',
			'SUCCESS_CREATED' AS 'Message';
	END IF; 
END;
//

DELIMITER //
CREATE PROCEDURE SP_FuncionarioReadAllActive(
	limitF int, offsetF int
)
BEGIN
	SELECT * 
		FROM tbFuncionario 
        WHERE isDeleted != 1
		LIMIT limitF 
        OFFSET offsetF;
END;
//
DELIMITER //
CREATE PROCEDURE SP_FuncionarioReadByEmail(
	emailF varchar(60)
)
BEGIN
	IF NOT EXISTS (SELECT emailFuncionario from tbFuncionario where emailFuncionario like emailF)
	THEN
		SELECT '403' AS 'Status', 'ERROR_EMAIL_NAO_ENCONTRADO' AS 'Error', '' AS 'Message';
	ELSE
		SELECT * 
			FROM tbFuncionario 
            WHERE emailFuncionario like emailF 
            LIMIT 1;
	END IF;
END;
//

DELIMITER //
CREATE PROCEDURE SP_FuncionarioUpdate(
	emailF varchar(60), newEmailF varchar(60), nomeF varchar(50), telefoneF varchar(25), adm tinyint
)
BEGIN
	IF NOT EXISTS (SELECT emailFuncionario from tbFuncionario where emailFuncionario like emailF)
	THEN
		SELECT '403' AS 'Status', 'ERROR_EMAIL_NAO_ENCONTRADO' AS 'Error', '' AS 'Message';
	ELSE
		UPDATE tbFuncionario SET
			nomeFuncionario = nomeF,
			emailFuncionario = newEmailF,
			telefoneFuncionario = telefoneF,
            isAdm = adm
			WHERE emailFuncionario like emailF;
		SELECT 
			'204' AS 'Status',
			'' AS 'Error',
			'SUCCESS_UPDATED' AS 'Message';
	END IF; 
END;
//

DELIMITER //
CREATE PROCEDURE SP_FuncionarioDeleteByEmail(
	emailF varchar(60)
)
BEGIN
	IF NOT EXISTS (SELECT emailFuncionario FROM tbFuncionario WHERE emailFuncionario like emailF AND isDeleted != 1)
	THEN
		SELECT '403' AS 'Status', 'ERROR_EMAIL_ATIVO_NAO_ENCONTRADO' AS 'Error', '' AS 'Message';
	ELSE
        UPDATE tbFuncionario SET
			isDeleted = 1,
            senhaFuncionario = NULL
			WHERE emailFuncionario like emailF;
        SELECT
			'204' AS 'Status',
			'' AS 'Error',
			'SUCCESS_DELETED' AS 'Message';
	END IF;
END;
//

-- -----------------------------------------------------
-- Login
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE SP_Login(
	email varchar(60)
)
BEGIN
	IF EXISTS (SELECT emailFuncionario FROM tbFuncionario WHERE emailFuncionario like email)
    THEN
		SELECT * FROM tbFuncionario WHERE emailFuncionario LIKE email LIMIT 1;
	ELSEIF EXISTS (SELECT emailCliente FROM tbCliente WHERE emailCliente LIKE email)
		THEN
			SELECT * 
				FROM tbCliente 
				INNER JOIN tbEndereco
				ON tbCliente.tbEndereco_idEndereco = tbEndereco.idEndereco
				WHERE emailCliente LIKE email
                LIMIT 1;
	ELSE
		SELECT '403' AS 'Status', 'ERROR_EMAIL_NAO_ENCONTRADO' AS 'Error', '' AS 'Message', '' AS 'Body';
    END IF;
END;
//

DELIMITER //
CREATE PROCEDURE SP_UpdatePassword(
	email varchar(60), newPass varchar(255)
)
BEGIN
	IF EXISTS (SELECT emailFuncionario FROM tbFuncionario WHERE emailFuncionario like email)
    THEN
		UPDATE tbFuncionario SET
			senhaFuncionario = newPass
			WHERE emailFuncionario like email;
		SELECT 
			'204' AS 'Status',
			'' AS 'Error',
			'SUCCESS_UPDATED' AS 'Message';
	ELSEIF EXISTS (SELECT emailCliente from tbCliente where emailCliente like email)
		THEN
			UPDATE tbCliente SET
				senhaCliente = newPass
				WHERE emailCliente like email;
			SELECT 
				'204' AS 'Status',
				'' AS 'Error',
				'SUCCESS_UPDATED' AS 'Message';
	ELSE
		SELECT '403' AS 'Status', 'ERROR_EMAIL_NAO_ENCONTRADO' AS 'Error', '' AS 'Message';
    END IF;
END;
//


-- -----------------------------------------------------
-- CRUD Produto
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE SP_ProdutoCreate(
    nome varchar(50), tipo varchar(20), foto varchar(255)
)
BEGIN
	IF EXISTS (SELECT nomeProduto FROM tbProduto where nomeProduto like nome)
	THEN
		SELECT '403' AS 'Status', 'ERROR_NOME_CADASTRADO' AS 'Error', '' AS 'Message';
	ELSE
        INSERT INTO tbProduto(
			`nomeProduto`,
			`tipoProduto`,
			`fotoProduto`)
			VALUES (nome, tipo, foto);
		SELECT 
			'201' AS 'Status',
			'' AS 'Error',
			'SUCCESS_CREATED' AS 'Message';
	END IF; 
END;
//

DELIMITER //
CREATE PROCEDURE SP_ProdutoReadAll(
	limitF int, offsetF int
)
BEGIN
	SELECT * 
		FROM tbProduto 
        WHERE isDeleted = 0
		LIMIT limitF 
        OFFSET offsetF;
END;
//
DELIMITER //
CREATE PROCEDURE SP_ProdutoReadAllActive(
	limitF int, offsetF int
)
BEGIN
	SELECT * 
		FROM tbProduto 
        WHERE isDeleted = 0 AND isActive = 1
		LIMIT limitF 
        OFFSET offsetF;
END;
//
DELIMITER //
CREATE PROCEDURE SP_ProdutoReadByName(
	nome varchar(50)
)
BEGIN
	SELECT * 
		FROM tbProduto 
        WHERE isDeleted = 0 
        AND isActive = 1
		AND nomeProduto like nome;
END;
//

DELIMITER //
CREATE PROCEDURE SP_ProdutoUpdate(
	nome varchar(50), newNome varchar(50), tipo varchar(20), foto varchar(255), act tinyint
)
BEGIN
	IF NOT EXISTS (SELECT nomeProduto from tbProduto where nomeProduto like nome)
	THEN
		SELECT '403' AS 'Status', 'ERROR_NOME_NAO_ENCONTRADO' AS 'Error', '' AS 'Message';
	ELSE
		UPDATE tbProduto SET
			nomeProduto = newNome,
			tipoProduto = tipo,
			fotoProduto = foto,
            isActive = act
			WHERE nomeProduto like nome;
		SELECT 
			'204' AS 'Status',
			'' AS 'Error',
			'SUCCESS_UPDATED' AS 'Message';
	END IF; 
END;
//

DELIMITER //
CREATE PROCEDURE SP_ProdutoDeleteByName(
	nome varchar(50)
)
BEGIN
	IF NOT EXISTS (SELECT idProduto FROM tbProduto WHERE nomeProduto like nome AND isDeleted != 1)
	THEN
		SELECT '403' AS 'Status', 'ERROR_PRODUTO_NAO_ENCONTRADO' AS 'Error', '' AS 'Message';
	ELSE
        UPDATE tbProduto SET
			isDeleted = 1,
            isActive = 0
			WHERE nomeProduto like nome;
        SELECT
			'204' AS 'Status',
			'' AS 'Error',
			'SUCCESS_DELETED' AS 'Message';
	END IF;
END;
//


-- -----------------------------------------------------
-- CRUD VARIACAO
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE SP_VariacaoCreate(
    nome varchar(50), preco DECIMAL(10,2), foto varchar(255), produto varchar(50)
)
BEGIN
	IF EXISTS (SELECT nomeVariacao FROM tbvariacaoproduto WHERE nomeVariacao like nome)
    THEN
		SELECT '403' AS 'Status', 'ERROR_VARIACAO_CADASTRADA' AS 'Error', '' AS 'Message';
	ELSEIF NOT EXISTS (SELECT nomeProduto FROM tbProduto where nomeProduto like produto)
		THEN
			SELECT '403' AS 'Status', 'ERROR_PRODUTO_NAO_CADASTRADO' AS 'Error', '' AS 'Message';
	ELSE
		SET @produto_id := (SELECT idProduto FROM tbProduto WHERE nomeProduto like produto);
        INSERT INTO tbVariacaoProduto(
			`nomeVariacao`,
			`precoVariacao`,
			`fotoVariacao`,
            `tbProduto_idProduto`)
			VALUES (nome, preco, foto, @produto_id);
		SELECT 
			'201' AS 'Status',
			'' AS 'Error',
			'SUCCESS_CREATED' AS 'Message';
	END IF; 
END;
//

DELIMITER //
CREATE PROCEDURE SP_VariacaoReadAllActive(
	limitF int, offsetF int
)
BEGIN
	SELECT * 
		FROM tbVariacaoProduto 
        WHERE isActive = 1
		LIMIT limitF 
        OFFSET offsetF;
END;
//
DELIMITER //
CREATE PROCEDURE SP_VariacaoReadByProdutoId(
	idProduto int
)
BEGIN
	SELECT * 
		FROM tbVariacaoProduto 
        WHERE tbProduto_idProduto = idProduto;
END;
//
DELIMITER //
CREATE PROCEDURE SP_VariacaoReadByProduto(
	produto varchar(50)
)
BEGIN
	SET @produto_id := (SELECT idProduto FROM tbProduto WHERE nomeProduto like produto);
	SELECT * 
		FROM tbVariacaoProduto 
        WHERE tbProduto_idProduto = @produto_id;
END;
//
DELIMITER //
CREATE PROCEDURE SP_VariacaoReadById(
	id int
)
BEGIN
	SELECT * 
		FROM tbVariacaoProduto 
        WHERE isActive = 1
		AND idVariacao = id;
END;
//
DELIMITER //
CREATE PROCEDURE SP_VariacaoReadByName(
	nome varchar(50)
)
BEGIN
	SELECT * 
		FROM tbVariacaoProduto 
        WHERE isActive = 1
		AND nomeVariacao like nome;
END;
//

DELIMITER //
CREATE PROCEDURE SP_VariacaoUpdate(
	nome varchar(50), newNome varchar(50), preco DECIMAL(10,2), foto varchar(255), act tinyint
)
BEGIN
	IF NOT EXISTS (SELECT nomeVariacao from tbVariacaoProduto where nomeVariacao like nome)
	THEN
		SELECT '403' AS 'Status', 'ERROR_NOME_NAO_ENCONTRADO' AS 'Error', '' AS 'Message';
	ELSE
		UPDATE tbVariacaoProduto SET
			nomeVariacao = newNome,
			precoVariacao = preco,
			fotoVariacao = foto,
            isActive = act
			where nomeVariacao like nome;
		SELECT 
			'204' AS 'Status',
			'' AS 'Error',
			'SUCCESS_UPDATED' AS 'Message';
	END IF; 
END;
//

-- NO VARIACAO DELETE


-- -----------------------------------------------------
-- CRUD Pedido
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE SP_PedidoCreate(
    dataP datetime, isDeliveryP tinyint, email varchar(60), endereco int
)
BEGIN
	IF NOT EXISTS (SELECT rua FROM tbEndereco WHERE idEndereco = endereco)
	THEN
		SELECT '403' AS 'Status', 'ERROR_ENDERECO_NAO_ENCONTRADO' AS 'Error', '' AS 'Message';
	ELSE
		SET @status_pedido := 'Enviado';
        SET @id_cliente := (SELECT FN_GetClienteId(email));
        INSERT INTO tbPedido(
			`dataPedido`,
			`isDelivery`,
			`statusPedido`,
			`tbCliente_idCliente`,
			`tbEndereco_idEndereco`)
			VALUES (dataP, isDeliveryP, @status_pedido, @id_cliente, endereco);
		SELECT 
			'201' AS 'Status',
			'' AS 'Error',
			'SUCCESS_CREATED' AS 'Message',
            LAST_INSERT_ID() AS 'Body';
	END IF;
END;
//

DELIMITER //
CREATE PROCEDURE SP_PedidoReadByCliente(
	email varchar(60), limitF int, offsetF int
)
BEGIN
	SET @id_cliente := (SELECT FN_GetClienteId(email));
    IF (isnull(@id_cliente))
    THEN
		SELECT '403' AS 'Status', 'ERROR_CLIENTE_NAO_ENCONTRADO' AS 'Error', '' AS 'Message';
	ELSE
		SELECT * 
			FROM tbPedido 
            LEFT OUTER JOIN tbProdutoPedido
            ON tbPedido.idPedido = tbProdutoPedido.tbPedido_idPedido
			WHERE tbPedido.tbCliente_idCliente = @id_cliente
			LIMIT limitF 
			OFFSET offsetF;
	END IF;
END;
//
DELIMITER //
CREATE PROCEDURE SP_PedidoReadByStatus(
	statusP varchar(20)
)
BEGIN
	SELECT * 
		FROM tbPedido
        LEFT OUTER JOIN tbProdutoPedido
		ON tbPedido.idPedido = tbProdutoPedido.tbPedido_idPedido
        WHERE tbPedido.statusPedido like statusP;
END;
//
DELIMITER //
CREATE PROCEDURE SP_PedidoReadAllNotCompleted()
BEGIN
	SELECT * 
		FROM tbPedido
        LEFT OUTER JOIN tbProdutoPedido
		ON tbPedido.idPedido = tbProdutoPedido.tbPedido_idPedido
        WHERE (tbPedido.statusPedido not like 'Finalizado'
        AND tbPedido.statusPedido not like 'Entregue');
END;
//
DELIMITER //
CREATE PROCEDURE SP_PedidoReadById(
	idP int
)
BEGIN
	SELECT * 
		FROM tbPedido
        LEFT OUTER JOIN tbProdutoPedido
		ON tbPedido.idPedido = tbProdutoPedido.tbPedido_idPedido
        WHERE tbPedido.idPedido = idP;
END;
//

DELIMITER //
CREATE PROCEDURE SP_PedidoUpdate(
	idP int, dataP datetime, isDeliveryP tinyint, statusP varchar(20), funcionario int, endereco int
)
BEGIN
	SET @total_do_pedido := (SELECT sum(subtotal) FROM tbProdutoPedido WHERE tbPedido_idPedido = idP);
	UPDATE tbPedido SET
		dataPedido = dataP,
        totalPedido = @total_do_pedido,
		isDelivery = isDeliveryP,
		statusPedido = statusP,
		tbFuncionario_idFuncionario = funcionario,
		tbEndereco_idEndereco = endereco
		WHERE idPedido = idP;
	SELECT 
		'204' AS 'Status',
		'' AS 'Error',
		'SUCCESS_UPDATED' AS 'Message';
END;
//

-- NO DELETE PEDIDO

-- -----------------------------------------------------
-- C ProdutoPedido
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE SP_ProdutoPedidoCreate(
	pedido int, variacao int, qntd int
)
BEGIN
	SET @produto := (SELECT tbProduto_idProduto FROM tbVariacaoProduto WHERE idVariacao = variacao);
    SET @preco := (SELECT precoVariacao FROM tbVariacaoProduto WHERE idVariacao = variacao);
    SET @total := @preco * qntd;
	INSERT INTO tbProdutoPedido(
			`tbPedido_idPedido`,
			`tbVariacaoProduto_idProduto`,
			`tbVariacaoProduto_idVariacao`,
            `quantidade`,
            `subTotal`)
			VALUES (pedido, @produto, variacao, qntd, @total);
	SET @total_do_pedido := (SELECT sum(subtotal) FROM tbProdutoPedido WHERE tbPedido_idPedido = pedido);
    UPDATE tbPedido SET
		totalPedido = @total_do_pedido
		WHERE idPedido = pedido;
	SELECT
		'201' AS 'Status',
		'' AS 'Error',
		'SUCCESS_CREATED' AS 'Message';
END;
//

-- -----------------------------------------------------
-- "Debugging"
-- -----------------------------------------------------

-- Endereco Function
SELECT FN_GetEnderecoId('00000-000', 'Rua', 001, 'CS 00', 'Bairro') AS 'idEndereco';

-- CRUD CLIE
call SP_ClienteCreate(
	'07061-002', 'Av. ', 3845, 'Apt 72', 'Bairro Povão',
    'Mafe', 'rodrigo@gmail.com', 'jhkagkfasgkgafgwequiuijkasaa1', '(11) 99999-9999'
);

describe tbCliente;

insert into tbEndereco(
	`cep`, 
    `rua`, 
    `numero`, 
    `complemento`, 
    `bairro`) 
values ('07000-000',
	'Rua',
	'28',
	'CS 03',
	'Sítio dos Mortos'
);

insert into tbCliente(
	`nomeCliente`,
	`emailCliente`,
	`senhaCliente`,
	`telefoneCliente`,
	`tbEndereco_idEndereco`) 
values ('Nome',
	'Email',
	'hasjlhdsaldaslAHDA$#%@&@JKFIS',
	'(11) 99999-9999',
	'1'
);

select * from tbCliente;

SELECT * 
	FROM tbCliente 
	INNER JOIN tbEndereco
	ON tbCliente.tbEndereco_idEndereco = tbEndereco.idEndereco;
    
call SP_ClienteReadByEmail(
	'rodrigo@gmail.com'
);
call SP_ClienteReadByEmail(
	'invalid@email.com'
);

SELECT tbEndereco_idEndereco FROM tbCliente WHERE emailCliente like 'rodrigo@gmail.com' LIMIT 1;

call SP_ClienteUpdate(
	'rodrigo@gmail.com', 'mafe@gmail.com', 'Mafe', '(11) 99999-9999',
	'07061-002', 'Avenida Brasil', 3845, 'Apt 72', 'Bairro Povão'
);
call SP_ClienteReadByEmail(
	'mafe@gmail.com'
);

call SP_ClienteDeleteByEmail(
	'invalid@gmail.com'
);
call SP_ClienteDeleteByEmail(
	'mafe@gmail.com'
);
SELECT * FROM tbCliente;

-- CRUD FUNC
call SP_FuncionarioCreate(
	'func@gmail.com', 'sfkajsfhlasaasfthtyht', 'Funcionario Teste', '(11) 99999-9999', 1
);
call SP_FuncionarioReadAllActive(
	100, 0
);
call SP_FuncionarioReadByEmail(
	'func@gmail.com'
);
call SP_FuncionarioUpdate(
	'func@gmail.com', 'funcionario@gmail.com', 'Funcionario Teste', '(11) 99999-9999', 1
);
call SP_FuncionarioDeleteByEmail(
	'funcionario@gmail.com'
);
SELECT * FROM tbFuncionario;

-- Login
call SP_UpdatePassword (
	'funcionario@gmail.com', 'newPassHashed123'
);
SELECT * FROM tbFuncionario;

-- CRUD PROD
call SP_ProdutoCreate (
	'Produto Teste', 'Sorvete de Pote', '/img/teste.jpg'
);
call SP_ProdutoReadAll (
	100, 0
);
call SP_ProdutoReadAllActive (
	100, 0
);
call SP_ProdutoUpdate (
	'Produto Teste', 'Produto Testeee', 'Sorvete de Pote', '/img/teste.jpg', 0
);
call SP_ProdutoReadAllActive (
	100, 0
);
call SP_ProdutoDeleteByName (
	'Produto Testeee'
);

-- CRUD VARIACAO
call SP_ProdutoCreate (
	'Produto Teste', 'Picole', '/img/teste.jpg'
);
call SP_VariacaoCreate (
	'Picole Teste', 1.90, '/img/sorvete-teste.jpg', 'Produto Teste'
);
call SP_VariacaoReadAllActive (
	100, 0
);
call SP_VariacaoReadByName (
	'Picole Teste'
);
call SP_VariacaoUpdate (
	'Picole Teste', 'Picole Azul', 0.90, '/img/sorvete-teste.jpg', 0
);
call SP_VariacaoReadAllActive (
	100, 0
);

-- CRUD PEDIDO // TESTE FINAL E END TO END
call SP_ClienteCreate(
	'00000-777', 'Minha Rua', 123, 'CS 03', 'Meu Bairro',
    'Cliente Teste', 'teste@gmail.com', 'senhacomhash123', '(11) 99999-9999'
);
call SP_ClienteReadByEmail(
	'teste@gmail.com'
);
call SP_PedidoCreate(
	NOW(), 1, 'teste@gmail.com', 1
);
call SP_PedidoReadByCliente(
	'teste@gmail.com', 1000, 0
);
call SP_FuncionarioCreate(
	'teste@amornacasquinha.com', 'senhasegurahashed123', 'Funcionario Teste', '(11) 99999-9999', 0
);
call SP_ProdutoCreate(
    'Açaí Teste', 'Teste', 'img/acai.jpg'
);
call SP_VariacaoCreate(
	'Açaí com Banana', 10, 'img/acai/banana.jpg', 'Açaí Teste'
);
call SP_VariacaoCreate(
	'Açaí com Paçoca', 15, 'img/acai/pacoca.jpg', 'Açaí Teste'
);
call SP_VariacaoReadAllActive(
	1000, 0
);
call SP_ProdutoPedidoCreate(
	1, 1, 10
);
call SP_ProdutoPedidoCreate(
	1, 2, 1
);
call SP_PedidoReadByStatus(
	'Enviado'
);
call SP_FuncionarioReadByEmail(
	'teste@amornacasquinha.com'
);
call SP_PedidoUpdate(
	1, '2023-11-19 22:17:59', 1, 'Recebido', 1, 1
);
call SP_PedidoReadByStatus(
	'Recebido'
);


-- FRONTEND TEST
call SP_ProdutoCreate(
    'Sorvete em Bola', 'Bola', 'images/sorveteBolaDesktop.png'
);
call SP_ProdutoCreate(
    'Picolé', 'Picolé', 'images/picoleDesktop.png'
);
call SP_ProdutoReadAllActive(1000,0);
call SP_ProdutoUpdate(
	'Açaí', 'Açaí', 'Açaí', 'images/sorvetePoteDesktop.png', 1
);
call SP_VariacaoReadById(1);

call SP_ClienteReadByEmail('teste@gabriel.com');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
