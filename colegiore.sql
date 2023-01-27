-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27-Jan-2023 às 15:43
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
-- Banco de dados: `colegiore`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `cod_aluno` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `idade` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`cod_aluno`, `nome`, `endereco`, `idade`) VALUES
(1, 'Larissa', 'Rua A lote 45', '32'),
(2, 'Thaires', 'Rua 71 lote 69', '28'),
(3, 'Marta', 'Rua 71 lote 55', '55');

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE `curso` (
  `cod_curso` int(11) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Tipo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `curso`
--

INSERT INTO `curso` (`cod_curso`, `Nome`, `Tipo`) VALUES
(1, 'Carlos', 'on-line'),
(2, 'Célio', 'presencial'),
(3, 'Maria', 'on-line');

-- --------------------------------------------------------

--
-- Estrutura da tabela `monitores`
--

CREATE TABLE `monitores` (
  `cod_monitor` int(11) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Sexo` varchar(100) DEFAULT NULL,
  `idade` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `monitores`
--

INSERT INTO `monitores` (`cod_monitor`, `Nome`, `Sexo`, `idade`) VALUES
(1, 'Amando', 'masculino', '32'),
(2, 'Fatima', 'feminino', '56'),
(3, 'Jully', 'feminino', '19');

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `cod_prof` int(11) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Sexo` varchar(100) DEFAULT NULL,
  `Especialidade` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `professor`
--

INSERT INTO `professor` (`cod_prof`, `Nome`, `Sexo`, `Especialidade`) VALUES
(1, 'Nivaldo', 'masculino', 'ciencia'),
(2, 'Marcia', 'feminino', 'soft'),
(3, 'Marcos', 'masculino', 'biologia');

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `cod_turma` int(11) NOT NULL,
  `cod_curso` int(11) DEFAULT NULL,
  `cod_aluno` int(11) DEFAULT NULL,
  `cod_prof` int(11) DEFAULT NULL,
  `cod_monitor` int(11) DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `sala` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `turma`
--

INSERT INTO `turma` (`cod_turma`, `cod_curso`, `cod_aluno`, `cod_prof`, `cod_monitor`, `data_inicio`, `sala`) VALUES
(1, NULL, NULL, NULL, NULL, '0000-00-00', 'sala 5'),
(2, NULL, NULL, NULL, NULL, '0000-00-00', 'sala 6'),
(3, NULL, NULL, NULL, NULL, '0000-00-00', 'sala 8');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`cod_aluno`);

--
-- Índices para tabela `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`cod_curso`);

--
-- Índices para tabela `monitores`
--
ALTER TABLE `monitores`
  ADD PRIMARY KEY (`cod_monitor`);

--
-- Índices para tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`cod_prof`);

--
-- Índices para tabela `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`cod_turma`),
  ADD KEY `cod_curso` (`cod_curso`),
  ADD KEY `cod_aluno` (`cod_aluno`),
  ADD KEY `cod_prof` (`cod_prof`),
  ADD KEY `cod_monitor` (`cod_monitor`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
  MODIFY `cod_aluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `curso`
--
ALTER TABLE `curso`
  MODIFY `cod_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `monitores`
--
ALTER TABLE `monitores`
  MODIFY `cod_monitor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `professor`
--
ALTER TABLE `professor`
  MODIFY `cod_prof` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `turma`
--
ALTER TABLE `turma`
  MODIFY `cod_turma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`cod_curso`) REFERENCES `curso` (`cod_curso`),
  ADD CONSTRAINT `turma_ibfk_2` FOREIGN KEY (`cod_aluno`) REFERENCES `aluno` (`cod_aluno`),
  ADD CONSTRAINT `turma_ibfk_3` FOREIGN KEY (`cod_prof`) REFERENCES `professor` (`cod_prof`),
  ADD CONSTRAINT `turma_ibfk_4` FOREIGN KEY (`cod_monitor`) REFERENCES `monitores` (`cod_monitor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
