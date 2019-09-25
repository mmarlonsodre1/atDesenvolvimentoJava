-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 23-Ago-2019 às 13:15
-- Versão do servidor: 10.1.38-MariaDB
-- versão do PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_meucondominio`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_boletos`
--

CREATE TABLE `tb_boletos` (
  `id` int(11) NOT NULL,
  `id_unidade` int(11) NOT NULL,
  `id_mes` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL,
  `boleto` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_funcionarios`
--

CREATE TABLE `tb_funcionarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `funcao` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `dt_admicao` date DEFAULT NULL,
  `dt_desligamento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_funcionarios`
--

INSERT INTO `tb_funcionarios` (`id`, `nome`, `funcao`, `status`, `dt_admicao`, `dt_desligamento`) VALUES
(1, 'Marlon', 'Porteiro', 1, '2019-08-01', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_moradores`
--

CREATE TABLE `tb_moradores` (
  `id_morador` int(11) DEFAULT NULL,
  `nome` varchar(40) NOT NULL,
  `cpf` varchar(255) NOT NULL,
  `rg` varchar(40) NOT NULL,
  `dt_nascimento` date NOT NULL,
  `email` varchar(40) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  `id_apartamento` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `dt_cadastro` date NOT NULL,
  `tipo_morador` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_moradores`
--

INSERT INTO `tb_moradores` (`id_morador`, `nome`, `cpf`, `rg`, `dt_nascimento`, `email`, `telefone`, `id_apartamento`, `status`, `dt_cadastro`, `tipo_morador`) VALUES
(NULL, 'Marlon Sodre', '168.889.227-31', '276272416', '2019-08-01', 'mmarlonsodre@gmail.com', '21964987793', 1, 1, '2019-08-23', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_unidades`
--

CREATE TABLE `tb_unidades` (
  `id_unidade` int(11) DEFAULT NULL,
  `proprietario` varchar(40) DEFAULT NULL,
  `cpf` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `id_morador` int(11) DEFAULT NULL,
  `id_vaga` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_unidades`
--

INSERT INTO `tb_unidades` (`id_unidade`, `proprietario`, `cpf`, `telefone`, `id_morador`, `id_vaga`, `status`) VALUES
(NULL, 'Marlon', '16888922731', '21964987793', 15, 155, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuarios`
--

CREATE TABLE `tb_usuarios` (
  `id_usuario` int(11) DEFAULT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `id_unidade` int(11) DEFAULT NULL,
  `senha` varchar(8) DEFAULT NULL,
  `perfil` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `dt_cadastro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_usuarios`
--

INSERT INTO `tb_usuarios` (`id_usuario`, `nome`, `email`, `id_unidade`, `senha`, `perfil`, `status`, `dt_cadastro`) VALUES
(NULL, '1', '1', 1, '1', '1', 1, '2019-08-01'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-15'),
(NULL, '1', '1@1.1', 1, '1', '1', 1, '2019-08-15'),
(NULL, 'Marlon', 'marlon@gmail.com', 12, 'root', '1', 1, '2019-08-15');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_veiculos`
--

CREATE TABLE `tb_veiculos` (
  `id_veiculo` int(11) DEFAULT NULL,
  `placa` varchar(10) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `ano` int(11) NOT NULL,
  `cor` varchar(20) NOT NULL,
  `id_apartamento` int(11) NOT NULL,
  `dt_cadastro` date NOT NULL,
  `id_cadastro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_veiculos`
--

INSERT INTO `tb_veiculos` (`id_veiculo`, `placa`, `marca`, `modelo`, `ano`, `cor`, `id_apartamento`, `dt_cadastro`, `id_cadastro`) VALUES
(1, '1', '1', '1', 1, '11', 1, '2019-08-12', 1),
(1, '1', '1', '1', 1, '1', 1, '2019-08-08', 1),
(2, '2', '2', '2', 2, '2', 2, '2019-08-09', 2),
(NULL, 'lmo4h84', 'Audi', 'tsi', 2019, 'branco', 103, '2019-08-15', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_boletos`
--
ALTER TABLE `tb_boletos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_funcionarios`
--
ALTER TABLE `tb_funcionarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_boletos`
--
ALTER TABLE `tb_boletos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_funcionarios`
--
ALTER TABLE `tb_funcionarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
