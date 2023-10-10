-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 10-Out-2023 às 17:26
-- Versão do servidor: 8.0.31
-- versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `webcomerce`
-- 

DELIMITER $$
--
-- Procedimentos
--
-- --------------------------------------------------------
-- 01. Dados o id de um produto obter o nome do produto e a porcentagem de desconto do produto;
-- CALL fn_obter_nome_e_porcentagem_desconto(1); 
-- Substitua '1' pelo ID do produto desejado
-- --------------------------------------------------------
DROP PROCEDURE IF EXISTS `fn_obter_nome_e_porcentagem_desconto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `fn_obter_nome_e_porcentagem_desconto` (IN `produto_id` INT)   BEGIN
  DECLARE produto_nome VARCHAR(1024);
  DECLARE desconto INT;

  -- Recuperar o nome do produto
  SELECT nome INTO produto_nome FROM produtos WHERE id = produto_id;

  -- Recuperar a porcentagem de desconto do produto
  SELECT porcentagem INTO desconto FROM descontos WHERE idProduto = produto_id;

  -- Retornar o nome do produto e a porcentagem de desconto
  SELECT produto_nome AS 'Nome do Produto', desconto AS 'Desconto (%)';
END$$

-- --------------------------------------------------------
-- 02. Dados o id de um produto obter o preço com desconto do produto, use stored procedures;
-- CALL fn_obter_preco_com_desconto(1); 
-- Substitua '1' pelo ID do produto desejado
-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS `fn_obter_preco_com_desconto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `fn_obter_preco_com_desconto` (IN `produto_id` INT)   BEGIN
  DECLARE preco_desconto DECIMAL(10,2);

  -- Recuperar o preço original do produto
  SELECT preco INTO preco_desconto FROM produtos WHERE id = produto_id;

  -- Verificar se há desconto para o produto
  SELECT porcentagem INTO @desconto FROM descontos WHERE idProduto = produto_id;

  -- Se houver desconto, calcular o preço com desconto
  IF @desconto IS NOT NULL THEN
    SET preco_desconto = preco_desconto - (preco_desconto * (@desconto / 100));
  END IF;

  -- Retornar o preço com desconto
  SELECT preco_desconto AS 'Preço com Desconto';
END$$


-- --------------------------------------------------------
-- 03. Obter a listagem completa de produtos com o preço original, o desconto e o preço com o desconto aplicado, use stored procedures.
-- CALL fn_calcula_preco_com_desconto(1); 
-- Substitua '1' pelo ID do produto desejado
-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS `fn_calcula_preco_com_desconto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `fn_calcula_preco_com_desconto` (IN `produto_id` INT)   BEGIN
  DECLARE produto_nome VARCHAR(1024);
  DECLARE preco_original DECIMAL(10,2);
  DECLARE desconto INT;
  DECLARE preco_desconto DECIMAL(10,2);

  -- Recuperar o nome do produto
  SELECT nome INTO produto_nome FROM produtos WHERE id = produto_id;

  -- Recuperar o preço original do produto
  SELECT preco INTO preco_original FROM produtos WHERE id = produto_id;

  -- Recuperar o desconto do produto
  SELECT porcentagem INTO desconto FROM descontos WHERE idProduto = produto_id;

  -- Calcular o preço com desconto
  SET preco_desconto = preco_original - (preco_original * (desconto / 100));

  -- Retornar o nome do produto, preço original, desconto e preço com desconto
  SELECT produto_nome AS 'Nome do Produto', preco_original AS 'Preço Original', desconto AS 'Desconto (%)', preco_desconto AS 'Preço com Desconto';
END$$

DELIMITER ;

-- --------------------------------------------------------
-- CASOS DE USO:
-- --------------------------------------------------------
-- 01. Dados o id de um produto obter o nome do produto e a porcentagem de desconto do produto;
-- CALL fn_obter_nome_e_porcentagem_desconto(1); 
-- Substitua '1' pelo ID do produto desejado
-- --------------------------------------------------------
-- 02. Dados o id de um produto obter o preço com desconto do produto, use stored procedures;
-- CALL fn_obter_preco_com_desconto(1); 
-- Substitua '1' pelo ID do produto desejado
-- --------------------------------------------------------
-- 03. Obter a listagem completa de produtos com o preço original, o desconto e o preço com o desconto aplicado, use stored procedures.
-- CALL fn_calcula_preco_com_desconto(1); 
-- Substitua '1' pelo ID do produto desejado
-- --------------------------------------------------------

--
-- Estrutura da tabela `descontos`
--

DROP TABLE IF EXISTS `descontos`;
CREATE TABLE IF NOT EXISTS `descontos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idProduto` int NOT NULL,
  `porcentagem` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idProduto` (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Inserindo dados na tabela `descontos`
--

INSERT INTO `descontos` (`id`, `idProduto`, `porcentagem`) VALUES
(1, 1, 10),
(2, 3, 15);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(1024) NOT NULL,
  `descricao` text NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Inserindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `descricao`, `preco`) VALUES
(1, 'papel', 'papel branco', '100.00'),
(2, 'caneta', 'caneta azul', '50.00'),
(3, 'lapis', 'lapis preto', '30.00'),
(4, 'grampos', '100 grampos', '70.00');

--
-- Limitadores para a tabela `descontos`
--
ALTER TABLE `descontos`
  ADD CONSTRAINT `descontos_ibfk_1` FOREIGN KEY (`idProduto`) REFERENCES `produtos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
