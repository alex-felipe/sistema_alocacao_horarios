-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 21, 2018 at 11:51 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ALOHA`
--

-- --------------------------------------------------------

--
-- Table structure for table `combo`
--

CREATE TABLE `combo` (
  `id` int(11) NOT NULL,
  `codigo_modelo` varchar(8) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `combo`
--

INSERT INTO `combo` (`id`, `codigo_modelo`) VALUES
(1, 'CMB0001'),
(2, 'CMB0002'),
(3, 'CMB0003'),
(4, 'CMB0004');

-- --------------------------------------------------------

--
-- Table structure for table `combo_dias`
--

CREATE TABLE `combo_dias` (
  `id_combo` int(11) NOT NULL,
  `id_dia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `combo_dias`
--

INSERT INTO `combo_dias` (`id_combo`, `id_dia`) VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 2),
(4, 1),
(4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `curso_semestre`
--

CREATE TABLE `curso_semestre` (
  `id` int(11) NOT NULL,
  `curso` varchar(45) COLLATE utf8_bin NOT NULL,
  `semestre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `disciplina`
--

CREATE TABLE `disciplina` (
  `id` int(11) NOT NULL,
  `codigo_modelo` varchar(9) COLLATE utf8_bin NOT NULL,
  `codigo_disciplina` varchar(12) COLLATE utf8_bin NOT NULL,
  `nome` varchar(45) COLLATE utf8_bin NOT NULL,
  `cr_praticos` int(11) NOT NULL,
  `cr_teoricos` int(11) NOT NULL,
  `vagas` int(11) NOT NULL,
  `tipo_sala` varchar(45) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `disciplina`
--

INSERT INTO `disciplina` (`id`, `codigo_modelo`, `codigo_disciplina`, `nome`, `cr_praticos`, `cr_teoricos`, `vagas`, `tipo_sala`) VALUES
(5, 'DISC00001', 'RUS0014', 'Fundamentos de Programação', 1, 1, 13, 'Laboratório de Informática'),
(6, 'DISC00002', 'RUS0014', 'Estrutura de Dados', 1, 1, 10, 'Sala'),
(7, 'DISC00003', 'RUS0014', 'Matemática Computacional', 4, 1, 22, 'Laboratório de Química'),
(8, 'DISC00004', 'RUS0013', 'PPCT', 0, 2, 39, 'Sala');

-- --------------------------------------------------------

--
-- Table structure for table `disciplina_curso_semestre`
--

CREATE TABLE `disciplina_curso_semestre` (
  `id` int(11) NOT NULL,
  `id_disciplina` int(11) NOT NULL,
  `curso` varchar(45) COLLATE utf8_bin NOT NULL,
  `semestre` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `disciplina_curso_semestre`
--

INSERT INTO `disciplina_curso_semestre` (`id`, `id_disciplina`, `curso`, `semestre`) VALUES
(3, 5, 'Ciência da Computação', 1),
(4, 5, 'Engenharia de Software', 1),
(5, 6, 'Ciência da Computação', 3),
(6, 7, 'Ciência da Computação', 4),
(7, 8, 'Ciência da Computação', 7),
(8, 8, 'Engenharia de Software', 7);

-- --------------------------------------------------------

--
-- Table structure for table `docente`
--

CREATE TABLE `docente` (
  `id` int(11) NOT NULL,
  `codigo_modelo` varchar(11) COLLATE utf8_bin NOT NULL,
  `nome` varchar(120) COLLATE utf8_bin NOT NULL,
  `cr_minimo` int(11) NOT NULL,
  `cr_maximo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `docente`
--

INSERT INTO `docente` (`id`, `codigo_modelo`, `nome`, `cr_minimo`, `cr_maximo`) VALUES
(1, 'DOC0001', 'Dmontier', 2, 6),
(3, 'DOC0003', 'asdasd', 2, 8),
(4, 'DOC0004', 'aaaaa', 10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `docente_combo`
--

CREATE TABLE `docente_combo` (
  `id_docente` int(11) NOT NULL,
  `id_combo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `docente_dias_semana`
--

CREATE TABLE `docente_dias_semana` (
  `id_docente` int(11) NOT NULL,
  `dia_semana` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `preferencia`
--

CREATE TABLE `preferencia` (
  `id_docente` int(11) NOT NULL,
  `id_disciplina` int(11) NOT NULL,
  `preferencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `preferencia`
--

INSERT INTO `preferencia` (`id_docente`, `id_disciplina`, `preferencia`) VALUES
(1, 5, 24),
(1, 6, 45),
(1, 7, 66),
(1, 8, 64),
(2, 5, 0),
(2, 6, 0),
(2, 7, 0),
(2, 8, 0),
(3, 5, 0),
(3, 6, 0),
(3, 7, 0),
(3, 8, 0),
(4, 5, 63),
(4, 6, 0),
(4, 7, 0),
(4, 8, 0),
(5, 5, 63),
(5, 6, 0),
(5, 7, 0),
(5, 8, 0),
(6, 5, 63),
(6, 6, 0),
(6, 7, 0),
(6, 8, 0),
(7, 5, 63),
(7, 6, 0),
(7, 7, 0),
(7, 8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sala`
--

CREATE TABLE `sala` (
  `id` int(11) NOT NULL,
  `codigo_modelo` varchar(8) COLLATE utf8_bin NOT NULL,
  `nome` varchar(45) COLLATE utf8_bin NOT NULL,
  `tipo` varchar(45) COLLATE utf8_bin NOT NULL,
  `capacidade` int(11) NOT NULL,
  `bloco` varchar(45) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `sala`
--

INSERT INTO `sala` (`id`, `codigo_modelo`, `nome`, `tipo`, `capacidade`, `bloco`) VALUES
(1, 'SAL001', 'Sala 002', 'Sala', 60, 'Bloco A'),
(3, 'Sal0002', 'Sala Teste', 'Sala', 50, 'Bloco A');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `combo`
--
ALTER TABLE `combo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigoModelo` (`codigo_modelo`);

--
-- Indexes for table `curso_semestre`
--
ALTER TABLE `curso_semestre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disciplina_curso_semestre`
--
ALTER TABLE `disciplina_curso_semestre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `docente_combo`
--
ALTER TABLE `docente_combo`
  ADD PRIMARY KEY (`id_docente`,`id_combo`);

--
-- Indexes for table `preferencia`
--
ALTER TABLE `preferencia`
  ADD PRIMARY KEY (`id_docente`,`id_disciplina`);

--
-- Indexes for table `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `combo`
--
ALTER TABLE `combo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `curso_semestre`
--
ALTER TABLE `curso_semestre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disciplina`
--
ALTER TABLE `disciplina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `disciplina_curso_semestre`
--
ALTER TABLE `disciplina_curso_semestre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `docente`
--
ALTER TABLE `docente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sala`
--
ALTER TABLE `sala`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
