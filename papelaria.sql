-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 19-Set-2023 às 17:24
-- Versão do servidor: 5.7.31
-- versão do PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `papelaria`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

DROP TABLE IF EXISTS `estoque`;
CREATE TABLE IF NOT EXISTS `estoque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idFornecedor` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `disponiveis` int(11) NOT NULL,
  `custo` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idFornecedor` (`idFornecedor`),
  KEY `idProduto` (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `estoque`
--

INSERT INTO `estoque` (`id`, `idFornecedor`, `idProduto`, `disponiveis`, `custo`) VALUES
(16, 1, 1, 100, 0.09),
(17, 1, 3, 200, 0.12),
(18, 1, 5, 50, 0.38),
(19, 2, 1, 75, 0.186667),
(20, 2, 3, 25, 0.04),
(21, 2, 8, 28, 1.92857),
(22, 3, 4, 10, 0.7),
(23, 3, 6, 33, 0.666667),
(24, 4, 5, 50, 0.18),
(25, 4, 6, 56, 0.267857),
(26, 5, 7, 99, 0.212121);

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores`
--

DROP TABLE IF EXISTS `fornecedores`;
CREATE TABLE IF NOT EXISTS `fornecedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `email` varchar(1024) NOT NULL,
  `telefone` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `fornecedores`
--

INSERT INTO `fornecedores` (`id`, `nome`, `email`, `telefone`) VALUES
(1, 'Vendedor de Caneta', 'caneta@email', '111-111'),
(2, 'Vendedor de Papel', 'papel@email', '222-111'),
(3, 'Vendedor de Clips', 'clips@email', '333-111'),
(4, 'Vendedor de Grampo', 'grampo@email', '444-111'),
(5, 'Vendedor de Lapis', 'lapis@email', '555-111');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idFornecedor` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idFornecedor` (`idFornecedor`),
  KEY `idProduto` (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedidos`
--

INSERT INTO `pedidos` (`id`, `idFornecedor`, `idProduto`, `quantidade`, `valor`) VALUES
(1, 1, 1, 100, 9),
(2, 1, 3, 100, 12),
(3, 1, 3, 100, 12),
(4, 2, 1, 75, 14),
(5, 2, 3, 25, 1),
(6, 3, 4, 10, 7),
(7, 4, 5, 50, 9),
(8, 4, 6, 56, 15),
(9, 5, 7, 99, 21),
(10, 1, 5, 50, 19),
(11, 2, 8, 28, 54),
(12, 3, 6, 33, 22);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `peso` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `descricao`, `peso`) VALUES
(1, 'Caneta', 'Caneta Preta', 50),
(2, 'Caneta A', 'Caneta Azul', 50),
(3, 'Clips A', 'Clips de Aço', 150),
(4, 'Clips P', 'Clips de Plastico', 25),
(5, 'Grampo N', 'Grampo Normal', 250),
(6, 'Grampo G', 'Grampo Grande', 550),
(7, 'Lapis2B', 'Lapis Normal', 35),
(8, 'LapisHB', 'Lapis de Desenho', 35);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `estoque_ibfk_1` FOREIGN KEY (`idFornecedor`) REFERENCES `fornecedores` (`id`),
  ADD CONSTRAINT `estoque_ibfk_2` FOREIGN KEY (`idProduto`) REFERENCES `produtos` (`id`);

--
-- Limitadores para a tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`idFornecedor`) REFERENCES `fornecedores` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`idProduto`) REFERENCES `produtos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
