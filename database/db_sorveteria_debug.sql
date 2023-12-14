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
	'00000-777', 'Minha Rua', 123, 'Apt 72', 'Bairro Povão',
    'Cliente Teste', 'clienteteste@gmail.com', 'senhacomhash123', '(11) 99999-9999'
);
call SP_ClienteReadByEmail(
	'clienteteste@gmail.com'
);
call SP_PedidoCreate(
	NOW(), 1, 'teste@gmail.com', 1
);
select * from tbPedido;
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
call SP_PedidoReadByCliente (
	'clienteteste@gmail.com', 1000, 0
);
call SP_PedidoUpdate(
	1, '2023-11-19 22:17:59', 1, 'Recebido', 1, 1
);
call SP_PedidoReadByStatus(
	'Recebido'
);


-- FRONTEND TEST
call SP_ProdutoCreate(
    'Sorvete em Bola', 'Bola', 'images/sorveteBola'
);
call SP_ProdutoCreate(
    'Picolé', 'Picolé', 'images/picole'
);
call SP_VariacaoCreate(
	'Bola de Morango', 3, 'img/bolamorango.png', 'Sorvete em Bola'
);
call SP_VariacaoCreate(
	'Bola de Céu Azul', 15, 'img/bolazul.png', 'Sorvete em Bola'
);
call SP_VariacaoCreate(
	'Picolé de Manga', 1.99, 'img/picoleManga.png', 'Picolé'
);
call SP_VariacaoCreate(
	'Picolé de Limão', 1.99, 'img/picoleLimao.png', 'Picolé'
);
call SP_VariacaoCreate(
	'Picolé de Morango', 1.99, 'img/picoleMorango.png', 'Picolé'
);
CALL SP_PedidoCreate(NOW(), 0, 'clienteteste@gmail.com', 4);
call SP_PedidoReadByCliente(
	'clienteteste@gmail.com', 1000, 0
);
/*call SP_ClienteCreate(
	cepEnd varchar(20), ruaEnd varchar(100), numeroEnd int, complementoEnd varchar(15), bairroEnd varchar(45),
    nomeClie varchar(50), emailClie varchar(60), senhaClie varchar(255), telefoneClie varchar(25)
);
call SP_PedidoCreate(
    dataP datetime, isDeliveryP tinyint, email varchar(60), endereco int
);
call SP_ProdutoPedidoCreate(
	pedido int, variacao int, qntd int
);
call SP_PedidoUpdate(
	idP int, dataP datetime, isDeliveryP tinyint, statusP varchar(20), funcionario int, endereco int
);*/
SELECT * FROM tbCLiente LIMIT 100;
CALL SP_FuncionarioCreate(
	'funcionario@teste.com', '$2y$10$Mie1Ce7E0/QlJ1SjPy43deAomSVIB98xeYjjUjRWXoWUy2obJgru.', 'Funcionario Teste', '11999999999', 1
);
SELECT * FROM tbFuncionario LIMIT 100;
CALL SP_Login('funcionario@teste.com');
SELECT * FROM tbCliente LIMIT 100;
CALL SP_Login('gvrocha14@gmail.com');

CALL SP_PedidoReadAllNotCompleted();
CALL SP_PedidoUpdate(
	1, '2023-12-11 23:56:28', 1, 'Entregue', null, 1
);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
