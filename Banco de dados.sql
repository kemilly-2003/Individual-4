-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Jan-2023 às 16:18
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `curso`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `CodAlu` int(11) NOT NULL,
  `Nome` varchar(40) DEFAULT NULL,
  `Cpf` varchar(11) DEFAULT NULL,
  `Endereco` varchar(50) DEFAULT NULL,
  `Telefone` varchar(13) DEFAULT NULL,
  `Data_nasc` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`CodAlu`, `Nome`, `Cpf`, `Endereco`, `Telefone`, `Data_nasc`) VALUES
(1, 'Kemilly', '19042277689', 'Rua 1', '2199224567866', '2003-04-14'),
(2, 'Maria Julia', '14056789313', 'Rua 2', '2199543277076', '2009-05-07');

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE `curso` (
  `CodCur` int(11) NOT NULL,
  `Data_inicial` date DEFAULT NULL,
  `Data_final` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `curso`
--

INSERT INTO `curso` (`CodCur`, `Data_inicial`, `Data_final`) VALUES
(1, '2022-09-05', '2023-03-09'),
(2, '2022-10-06', '2023-04-08');

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `CodPro` int(11) NOT NULL,
  `Nome` varchar(40) DEFAULT NULL,
  `Cpf` varchar(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `professor`
--

INSERT INTO `professor` (`CodPro`, `Nome`, `Cpf`, `email`) VALUES
(1, 'Nicole', '12344578066', 'Nicole23@gmail.com'),
(2, 'Carol', '16088432975', 'Carol33@gamail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `CodTur` int(11) NOT NULL,
  `Carga_horaria` smallint(6) DEFAULT NULL,
  `CodAlu` int(11) DEFAULT NULL,
  `CodPro` int(11) DEFAULT NULL,
  `CodCur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `turma`
--

INSERT INTO `turma` (`CodTur`, `Carga_horaria`, `CodAlu`, `CodPro`, `CodCur`) VALUES
(7, 600, 1, 1, 1),
(8, 500, 2, 2, 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`CodAlu`);

--
-- Índices para tabela `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`CodCur`);

--
-- Índices para tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`CodPro`);

--
-- Índices para tabela `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`CodTur`),
  ADD KEY `CodAlu` (`CodAlu`),
  ADD KEY `CodPro` (`CodPro`),
  ADD KEY `CodCur` (`CodCur`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
  MODIFY `CodAlu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `curso`
--
ALTER TABLE `curso`
  MODIFY `CodCur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `professor`
--
ALTER TABLE `professor`
  MODIFY `CodPro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `turma`
--
ALTER TABLE `turma`
  MODIFY `CodTur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`CodAlu`) REFERENCES `aluno` (`CodAlu`),
  ADD CONSTRAINT `turma_ibfk_2` FOREIGN KEY (`CodPro`) REFERENCES `professor` (`CodPro`),
  ADD CONSTRAINT `turma_ibfk_3` FOREIGN KEY (`CodCur`) REFERENCES `curso` (`CodCur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
