-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 12/12/2023 às 00:31
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_sorveteria`
--

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ClienteCreate` (`cepEnd` VARCHAR(20), `ruaEnd` VARCHAR(100), `numeroEnd` INT, `complementoEnd` VARCHAR(15), `bairroEnd` VARCHAR(45), `nomeClie` VARCHAR(50), `emailClie` VARCHAR(60), `senhaClie` VARCHAR(255), `telefoneClie` VARCHAR(25))   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ClienteDeleteByEmail` (`emailClie` VARCHAR(60))   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ClienteReadByEmail` (`emailClie` VARCHAR(60))   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ClienteUpdate` (`emailClie` VARCHAR(60), `newEmailClie` VARCHAR(60), `nomeClie` VARCHAR(50), `telefoneClie` VARCHAR(25), `cepEnd` VARCHAR(20), `ruaEnd` VARCHAR(100), `numeroEnd` INT, `complementoEnd` VARCHAR(15), `bairroEnd` VARCHAR(45))   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FuncionarioCreate` (`emailF` VARCHAR(60), `senhaF` VARCHAR(255), `nomeF` VARCHAR(50), `telefoneF` VARCHAR(25), `adm` TINYINT)   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FuncionarioDeleteByEmail` (`emailF` VARCHAR(60))   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FuncionarioReadAllActive` (`limitF` INT, `offsetF` INT)   BEGIN
	SELECT * 
		FROM tbFuncionario 
        WHERE isDeleted != 1
		LIMIT limitF 
        OFFSET offsetF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FuncionarioReadByEmail` (`emailF` VARCHAR(60))   BEGIN
	IF NOT EXISTS (SELECT emailFuncionario from tbFuncionario where emailFuncionario like emailF)
	THEN
		SELECT '403' AS 'Status', 'ERROR_EMAIL_NAO_ENCONTRADO' AS 'Error', '' AS 'Message';
	ELSE
		SELECT * 
			FROM tbFuncionario 
            WHERE emailFuncionario like emailF 
            LIMIT 1;
	END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FuncionarioUpdate` (`emailF` VARCHAR(60), `newEmailF` VARCHAR(60), `nomeF` VARCHAR(50), `telefoneF` VARCHAR(25), `adm` TINYINT)   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Login` (`email` VARCHAR(60))   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PedidoCreate` (`dataP` DATETIME, `isDeliveryP` TINYINT, `email` VARCHAR(60), `endereco` INT)   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PedidoReadByCliente` (`email` VARCHAR(60), `limitF` INT, `offsetF` INT)   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PedidoReadByStatus` (`statusP` VARCHAR(20))   BEGIN
	SELECT * 
		FROM tbPedido
        LEFT OUTER JOIN tbProdutoPedido
		ON tbPedido.idPedido = tbProdutoPedido.tbPedido_idPedido
        WHERE tbPedido.statusPedido like statusP;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PedidoUpdate` (`idP` INT, `dataP` DATETIME, `isDeliveryP` TINYINT, `statusP` VARCHAR(20), `funcionario` INT, `endereco` INT)   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ProdutoCreate` (`nome` VARCHAR(50), `tipo` VARCHAR(20), `foto` VARCHAR(255))   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ProdutoDeleteByName` (`nome` VARCHAR(50))   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ProdutoPedidoCreate` (`pedido` INT, `variacao` INT, `qntd` INT)   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ProdutoReadAll` (`limitF` INT, `offsetF` INT)   BEGIN
	SELECT * 
		FROM tbProduto 
        WHERE isDeleted = 0
		LIMIT limitF 
        OFFSET offsetF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ProdutoReadAllActive` (`limitF` INT, `offsetF` INT)   BEGIN
	SELECT * 
		FROM tbProduto 
        WHERE isDeleted = 0 AND isActive = 1
		LIMIT limitF 
        OFFSET offsetF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ProdutoReadByName` (`nome` VARCHAR(50))   BEGIN
	SELECT * 
		FROM tbProduto 
        WHERE isDeleted = 0 
        AND isActive = 1
		AND nomeProduto like nome;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ProdutoUpdate` (`nome` VARCHAR(50), `newNome` VARCHAR(50), `tipo` VARCHAR(20), `foto` VARCHAR(255), `act` TINYINT)   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UpdatePassword` (`email` VARCHAR(60), `newPass` VARCHAR(255))   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VariacaoCreate` (`nome` VARCHAR(50), `preco` DECIMAL(10,2), `foto` VARCHAR(255), `produto` VARCHAR(50))   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VariacaoReadAllActive` (`limitF` INT, `offsetF` INT)   BEGIN
	SELECT * 
		FROM tbVariacaoProduto 
        WHERE isActive = 1
		LIMIT limitF 
        OFFSET offsetF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VariacaoReadById` (`id` INT)   BEGIN
	SELECT * 
		FROM tbVariacaoProduto 
        WHERE isActive = 1
		AND idVariacao = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VariacaoReadByName` (`nome` VARCHAR(50))   BEGIN
	SELECT * 
		FROM tbVariacaoProduto 
        WHERE isActive = 1
		AND nomeVariacao like nome;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VariacaoReadByProduto` (`produto` VARCHAR(50))   BEGIN
	SET @produto_id := (SELECT idProduto FROM tbProduto WHERE nomeProduto like produto);
	SELECT * 
		FROM tbVariacaoProduto 
        WHERE tbProduto_idProduto = @produto_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VariacaoReadByProdutoId` (`idProduto` INT)   BEGIN
	SELECT * 
		FROM tbVariacaoProduto 
        WHERE tbProduto_idProduto = idProduto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VariacaoUpdate` (`nome` VARCHAR(50), `newNome` VARCHAR(50), `preco` DECIMAL(10,2), `foto` VARCHAR(255), `act` TINYINT)   BEGIN
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
END$$

--
-- Funções
--
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_GetClienteId` (`email` VARCHAR(60)) RETURNS INT(11) DETERMINISTIC BEGIN
	IF EXISTS (SELECT idCliente FROM tbCliente WHERE emailCliente like email)
		THEN
			RETURN (SELECT idCliente FROM tbCliente WHERE emailCliente like email LIMIT 1);
	ELSE
        RETURN NULL;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `FN_GetEnderecoId` (`cepEnd` VARCHAR(20), `ruaEnd` VARCHAR(100), `numeroEnd` INT, `complementoEnd` VARCHAR(15), `bairroEnd` VARCHAR(45)) RETURNS INT(11) DETERMINISTIC BEGIN
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
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbcliente`
--

CREATE TABLE `tbcliente` (
  `idCliente` int(11) NOT NULL,
  `isDeleted` tinyint(4) DEFAULT 0,
  `nomeCliente` varchar(50) DEFAULT NULL,
  `emailCliente` varchar(60) DEFAULT NULL,
  `senhaCliente` varchar(255) DEFAULT NULL,
  `telefoneCliente` varchar(25) DEFAULT NULL,
  `profile` char(4) DEFAULT 'CLIE',
  `tbEndereco_idEndereco` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tbcliente`
--

INSERT INTO `tbcliente` (`idCliente`, `isDeleted`, `nomeCliente`, `emailCliente`, `senhaCliente`, `telefoneCliente`, `profile`, `tbEndereco_idEndereco`) VALUES
(1, 0, 'Laura Barros', 'laurabarros2541@gmail.com', '$2y$10$yy9LKdz0kbC72v8q7kDfZurvpKJ9Bmqo3HDjYYE4GfwhyOi8oDXUq', '(11) 99798-4601', 'CLIE', 1),
(2, 0, 'Jéssica Bueno', 'jessicabuenoramos5@gmail.com', '$2y$10$GO8dl47jSaFm4.dKMgPSQuTeR8551BBtAItG2LjACltggNLI0J03a', '(11) 99268-4686', 'CLIE', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbendereco`
--

CREATE TABLE `tbendereco` (
  `idEndereco` int(11) NOT NULL,
  `cep` varchar(20) DEFAULT NULL,
  `rua` varchar(100) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `complemento` varchar(15) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tbendereco`
--

INSERT INTO `tbendereco` (`idEndereco`, `cep`, `rua`, `numero`, `complemento`, `bairro`) VALUES
(1, '08110-600', 'Rua Padre Montoya', 37, 'Casa', 'Vila Alabama'),
(2, '09190-804', 'Rua Euclides Pacheco', 3321000, 'Apto 903', 'Vila Gomes Cardim');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbfuncionario`
--

CREATE TABLE `tbfuncionario` (
  `idFuncionario` int(11) NOT NULL,
  `isDeleted` tinyint(4) DEFAULT 0,
  `isAdm` tinyint(4) DEFAULT NULL,
  `profile` char(4) DEFAULT 'FUNC',
  `nomeFuncionario` varchar(50) DEFAULT NULL,
  `telefoneFuncionario` varchar(25) DEFAULT NULL,
  `emailFuncionario` varchar(60) DEFAULT NULL,
  `senhaFuncionario` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tbfuncionario`
--

INSERT INTO `tbfuncionario` (`idFuncionario`, `isDeleted`, `isAdm`, `profile`, `nomeFuncionario`, `telefoneFuncionario`, `emailFuncionario`, `senhaFuncionario`) VALUES
(1, 0, 0, 'FUNC', 'Caroliny Rocha', '(11)998984901', 'carolinyr9@gmail.com', '1234'),
(2, 0, 0, 'FUNC', 'Gabriel Barboza', '(11)975864309', 'gabrielbarb@gmail.com', '1234'),
(3, 1, 0, 'FUNC', 'Peter Costa', '(11)948985648', 'petercosta663@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbpedido`
--

CREATE TABLE `tbpedido` (
  `idPedido` int(11) NOT NULL,
  `dataPedido` datetime DEFAULT NULL,
  `totalPedido` decimal(10,2) DEFAULT NULL,
  `isDelivery` tinyint(4) DEFAULT 1,
  `statusPedido` varchar(20) DEFAULT NULL,
  `tbCliente_idCliente` int(11) DEFAULT NULL,
  `tbFuncionario_idFuncionario` int(11) DEFAULT NULL,
  `tbEndereco_idEndereco` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbproduto`
--

CREATE TABLE `tbproduto` (
  `idProduto` int(11) NOT NULL,
  `isDeleted` tinyint(4) DEFAULT 0,
  `isActive` tinyint(4) DEFAULT 1,
  `nomeProduto` varchar(50) DEFAULT NULL,
  `tipoProduto` varchar(20) DEFAULT NULL,
  `fotoProduto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tbproduto`
--

INSERT INTO `tbproduto` (`idProduto`, `isDeleted`, `isActive`, `nomeProduto`, `tipoProduto`, `fotoProduto`) VALUES
(2, 0, 1, 'Pote de Sorvete', 'Pote', 'poteLogo.png'),
(3, 0, 1, 'Picolé', 'Picolé', 'picoleLogo.png'),
(4, 0, 1, 'Açaí', 'Açaí', 'acaiLogo.png'),
(5, 0, 1, 'ChupChup', 'ChupChup', 'chupLogo.png'),
(6, 0, 1, 'Sundae', 'Sundae', 'sundaeLogo.png');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbprodutopedido`
--

CREATE TABLE `tbprodutopedido` (
  `idProdutoPedido` int(11) NOT NULL,
  `tbPedido_idPedido` int(11) NOT NULL,
  `tbVariacaoProduto_idProduto` int(11) NOT NULL,
  `tbVariacaoProduto_idVariacao` int(11) NOT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `subTotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbvariacaoproduto`
--

CREATE TABLE `tbvariacaoproduto` (
  `idVariacao` int(11) NOT NULL,
  `isActive` tinyint(4) DEFAULT 1,
  `nomeVariacao` varchar(50) DEFAULT NULL,
  `precoVariacao` decimal(10,2) DEFAULT NULL,
  `fotoVariacao` varchar(255) DEFAULT NULL,
  `tbProduto_idProduto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tbvariacaoproduto`
--

INSERT INTO `tbvariacaoproduto` (`idVariacao`, `isActive`, `nomeVariacao`, `precoVariacao`, `fotoVariacao`, `tbProduto_idProduto`) VALUES
(1, 1, 'Morango - Pote 2L', 34.50, 'morangoPote.png', 2),
(2, 1, 'Coco Branco - Pote 2L', 34.50, 'cocoPote.png', 2),
(3, 1, 'Leite Condensado - Pote 2L', 34.50, 'leite-condensadoPote.png', 2),
(4, 1, 'Milho Verde - Pote 2L', 34.50, 'milho-verdePote.png', 2),
(5, 1, 'Napolitano - Pote 2L', 36.50, 'napolitanoPote.png', 2),
(6, 1, 'Havaiano', 36.50, 'havaianoPote.png', 2),
(7, 1, 'Chocolitano', 36.50, 'chocolitanoPote.png', 2),
(8, 1, 'Picolé - Grego Morango', 7.99, 'grego-morangoPicole.png', 3),
(9, 1, 'Picolé - Mousse de Doce de Leite', 7.99, 'mousse-doce-leitePicole.png', 3),
(10, 1, 'Picolé - Açaí', 7.99, 'acaiPicole.png', 3),
(11, 1, 'Picolé - Flocos', 7.99, 'flocosPicole.png', 3),
(12, 1, 'Pote 2L - Açaí com Morango ', 46.50, 'acai-morangoAcai.png', 4),
(13, 1, 'Pote 2L - Açaí com Banana ', 46.50, 'acai-bananaAcai.png', 4),
(14, 1, 'Pote 2L - Açaí com Guaraná', 46.50, 'acai-guaranaAcai.png', 4),
(15, 1, 'Pote 2L - Açaí com Iogurte', 46.50, 'acai-iogurteAcai.png', 4),
(16, 1, 'Pote 2L - Açaí com Leitinho', 46.50, 'acai-leitinhoAcai.png', 4),
(17, 1, 'Picolé - Coraçãozinho', 7.99, 'coracaozinhoPicole.png', 3),
(18, 1, 'ChupChup - Unicórnio', 3.99, 'unicornioChup.png', 5),
(19, 1, 'Chup Chup - Coco', 3.99, 'cocoChup.png', 5),
(20, 1, 'Chup Chup - Morango', 3.99, 'morangoChup.png', 5),
(21, 1, 'ChupChup - Maracujá', 3.99, 'maracujaChup.png', 5),
(22, 1, 'Chup Chup - Leite Condensado', 3.99, 'leite-condensadoChup.png', 5),
(23, 1, 'Sundae - Morango', 6.99, 'morangoSundae.png', 6),
(24, 1, 'Sundae - Baunilha', 6.99, 'baunilhaSundae.png', 6);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tbcliente`
--
ALTER TABLE `tbcliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `emailCliente` (`emailCliente`),
  ADD KEY `fk_tbCliente_tbEndereco1` (`tbEndereco_idEndereco`);

--
-- Índices de tabela `tbendereco`
--
ALTER TABLE `tbendereco`
  ADD PRIMARY KEY (`idEndereco`);

--
-- Índices de tabela `tbfuncionario`
--
ALTER TABLE `tbfuncionario`
  ADD PRIMARY KEY (`idFuncionario`),
  ADD UNIQUE KEY `emailFuncionario` (`emailFuncionario`);

--
-- Índices de tabela `tbpedido`
--
ALTER TABLE `tbpedido`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `fk_tbPedido_tbCliente1` (`tbCliente_idCliente`),
  ADD KEY `fk_tbPedido_tbFuncionario1` (`tbFuncionario_idFuncionario`),
  ADD KEY `fk_tbPedido_tbEndereco1` (`tbEndereco_idEndereco`);

--
-- Índices de tabela `tbproduto`
--
ALTER TABLE `tbproduto`
  ADD PRIMARY KEY (`idProduto`),
  ADD UNIQUE KEY `nomeProduto` (`nomeProduto`);

--
-- Índices de tabela `tbprodutopedido`
--
ALTER TABLE `tbprodutopedido`
  ADD PRIMARY KEY (`idProdutoPedido`),
  ADD KEY `fk_tbPedido_has_tbProduto_tbPedido1` (`tbPedido_idPedido`),
  ADD KEY `fk_tbPedido_has_tbProduto_tbProduto1` (`tbVariacaoProduto_idProduto`,`tbVariacaoProduto_idVariacao`);

--
-- Índices de tabela `tbvariacaoproduto`
--
ALTER TABLE `tbvariacaoproduto`
  ADD PRIMARY KEY (`idVariacao`),
  ADD UNIQUE KEY `nomeVariacao` (`nomeVariacao`),
  ADD KEY `fk_tbVariacaoProduto_tbProduto1` (`tbProduto_idProduto`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbcliente`
--
ALTER TABLE `tbcliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tbendereco`
--
ALTER TABLE `tbendereco`
  MODIFY `idEndereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tbfuncionario`
--
ALTER TABLE `tbfuncionario`
  MODIFY `idFuncionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tbpedido`
--
ALTER TABLE `tbpedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbproduto`
--
ALTER TABLE `tbproduto`
  MODIFY `idProduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `tbprodutopedido`
--
ALTER TABLE `tbprodutopedido`
  MODIFY `idProdutoPedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbvariacaoproduto`
--
ALTER TABLE `tbvariacaoproduto`
  MODIFY `idVariacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tbcliente`
--
ALTER TABLE `tbcliente`
  ADD CONSTRAINT `fk_tbCliente_tbEndereco1` FOREIGN KEY (`tbEndereco_idEndereco`) REFERENCES `tbendereco` (`idEndereco`);

--
-- Restrições para tabelas `tbpedido`
--
ALTER TABLE `tbpedido`
  ADD CONSTRAINT `fk_tbPedido_tbCliente1` FOREIGN KEY (`tbCliente_idCliente`) REFERENCES `tbcliente` (`idCliente`),
  ADD CONSTRAINT `fk_tbPedido_tbEndereco1` FOREIGN KEY (`tbEndereco_idEndereco`) REFERENCES `tbendereco` (`idEndereco`),
  ADD CONSTRAINT `fk_tbPedido_tbFuncionario1` FOREIGN KEY (`tbFuncionario_idFuncionario`) REFERENCES `tbfuncionario` (`idFuncionario`);

--
-- Restrições para tabelas `tbprodutopedido`
--
ALTER TABLE `tbprodutopedido`
  ADD CONSTRAINT `fk_tbPedido_has_tbProduto_tbPedido1` FOREIGN KEY (`tbPedido_idPedido`) REFERENCES `tbpedido` (`idPedido`),
  ADD CONSTRAINT `fk_tbPedido_has_tbProduto_tbProduto1` FOREIGN KEY (`tbVariacaoProduto_idProduto`,`tbVariacaoProduto_idVariacao`) REFERENCES `tbvariacaoproduto` (`tbProduto_idProduto`, `idVariacao`);

--
-- Restrições para tabelas `tbvariacaoproduto`
--
ALTER TABLE `tbvariacaoproduto`
  ADD CONSTRAINT `fk_tbVariacaoProduto_tbProduto1` FOREIGN KEY (`tbProduto_idProduto`) REFERENCES `tbproduto` (`idProduto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
