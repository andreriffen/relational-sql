-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 02-Ago-2023 às 04:48
-- Versão do servidor: 8.0.31
-- versão do PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `exemplos`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoas`
--

DROP TABLE IF EXISTS `pessoas`;
CREATE TABLE IF NOT EXISTS `pessoas` (
  `ID_PESSOA` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_PESSOA`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `pessoas`
--

INSERT INTO `pessoas` (`ID_PESSOA`, `nome`, `email`) VALUES
(1, 'Andre', 'andre@email'),
(2, 'Bruno', 'bruno@email'),
(3, 'Carlos', 'carlos@email'),
(4, 'Daniel', 'daniel@email'),
(5, 'Eduardo', 'eduardo@email');

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefones`
--

DROP TABLE IF EXISTS `telefones`;
CREATE TABLE IF NOT EXISTS `telefones` (
  `ID_NUMERO` int NOT NULL AUTO_INCREMENT,
  `FK_PESSOA` int DEFAULT NULL,
  `telefone1` varchar(45) DEFAULT NULL,
  `telefone2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_NUMERO`),
  KEY `FK_PESSOA` (`FK_PESSOA`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `telefones`
--

INSERT INTO `telefones` (`ID_NUMERO`, `FK_PESSOA`, `telefone1`, `telefone2`) VALUES
(1, 1, '(48) 9111', '(48) 9222'),
(2, 2, '(48) 9333', '(48) 9444'),
(3, 3, '(48) 9555', '(48) 9666'),
(4, 4, '(48) 9777', '(48) 9888'),
(5, 5, NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
