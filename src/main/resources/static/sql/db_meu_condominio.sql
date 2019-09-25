/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  BrunoFeijo
 * Created: 07/08/2019
 */

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
-- Table structure for table `tb_moradores`
--

CREATE TABLE `tb_moradores` (
  `id_morador` int(11) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `cpf` int(11) NOT NULL,
  `rg` varchar(40) NOT NULL,
  `dt_nascimento` date NOT NULL,
  `email` varchar(40) NOT NULL,
  `telefone` int(11) NOT NULL,
  `id_apartamento` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `id_cadastro` int(11) NOT NULL,
  `dt_cadastro` date NOT NULL,
  `tipo_morador` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_unidades`
--

CREATE TABLE `tb_unidades` (
  `id_unidade` int(11) NOT NULL,
  `proprietario` varchar(40) NOT NULL,
  `cpf` int(11) NOT NULL,
  `telefone` int(11) NOT NULL,
  `id_morador` int(11) NOT NULL,
  `id_vaga` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_usuarios`
--

CREATE TABLE `tb_usuarios` (
  `id_usuario` int(11) DEFAULT NULL,
  `nome` varchar(40) NOT NULL,
  `email` varchar(100) NOT NULL,
  `id_unidade` int(11) NOT NULL,
  `senha` varchar(8) NOT NULL,
  `perfil` varchar(20) NOT NULL,
  `status` int(11) NOT NULL,
  `dt_cadastro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_veiculos`
--

CREATE TABLE `tb_veiculos` (
  `id_veiculo` int(11) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `ano` int(11) NOT NULL,
  `cor` varchar(20) NOT NULL,
  `id_apartamento` int(11) NOT NULL,
  `dt_cadastro` date NOT NULL,
  `id_cadastro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;