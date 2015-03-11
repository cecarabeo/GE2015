-- General Elections Database
-- Created Feb 22, 2015

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `comelec`
--

CREATE DATABASE IF NOT EXISTS `comelec`;
USE `comelec`;

-- --------------------------------------------------------

--
-- Table structure for table `candidate`
--

CREATE TABLE IF NOT EXISTS `candidate` (
  `candidate_id` varchar(12) NOT NULL,
  `position` varchar(50) NOT NULL,
  PRIMARY KEY (`candidate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `candidate`
--

INSERT INTO `candidate` (`candidate_id`, `position`) VALUES
('11018399', 'USG President'),
('11143479', 'USG President'),
('11225394', 'VP Externals'),
('11032383', 'VP Externals'),
('11128658', 'VP Internals'),
('11049774', 'VP Internals'),
('11110422', 'Executive Secretary'),
('11008989', 'Executive Secretary'),
('11210737', 'Executive Treasurer'),
('11108754', 'Executive Treasurer'),
('11162880', 'STC President'),
('11179620', 'STC President'),
('11331038', 'Legislative Assembly Representative'),
('11346418', 'Legislative Assembly Representative'),
('11274530', 'Legislative Assembly Representative'),
('11271310', 'Legislative Assembly Representative'),
('11275510', 'CLA Representative'),
('11173890', 'CLA Representative'),
('11178620', 'COE Representative'),
('11177640', 'COE Representative'),
('11278390', 'COB Representative'),
('11279400', 'COB Representative'),
('11276630', 'CCS Representative'),
('11276460', 'CCS Representative'),
('11100958', 'VP Internals');
-- --------------------------------------------------------

--
-- Table structure for table `party`
--

CREATE TABLE IF NOT EXISTS `party` (
  `party_id` int(1) NOT NULL,
  `party_name` varchar(20) NOT NULL,
  PRIMARY KEY (`party_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Dumping data for party
--

INSERT INTO `party` (`party_id`, `party_name`) VALUES
(0, 'Independent'),
(1, 'Tapat'),
(2, 'Santugon');

-- --------------------------------------------------------
--
-- Table structure for table `party_candidate`
--

CREATE TABLE IF NOT EXISTS `party_candidate` (
  `party_id` int(1) NOT NULL,
  `candidate_id` varchar(12) NOT NULL,
  PRIMARY KEY (`party_id`,`candidate_id`),
  KEY `candidate_id` (`candidate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Dumping data for party_candidate
--

INSERT INTO `party_candidate` (`candidate_id`, `party_id`) VALUES
('11143479', 1),
('11018399', 2),
('11225394', 1),
('11032383', 2),
('11128658', 1),
('11049774', 0),
('11100958', 2),
('11110422', 1),
('11008989', 2),
('11210737', 1),
('11108754', 2),
('11162880', 1),
('11179620', 2),
('11274530', 1),
('11271310', 1),
('11331038', 2),
('11346418', 2),
('11275510', 1),
('11173890', 2),
('11178620', 2),
('11177640', 1),
('11278390', 2),
('11279400', 1),
('11276630', 1),
('11276460', 2);


--
-- Table structure for table `voter`
--

CREATE TABLE IF NOT EXISTS `voter` (
  `voter_id` varchar(12) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `college` enum('CCS','CLA','RVR-COB','GCOE','SOE','COS') NOT NULL,
  `password` varchar(7) NOT NULL,
  `voting` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`voter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voter`
--

INSERT INTO `voter` (`voter_id`, `first_name`, `last_name`, `college`, `password`, `voting`) VALUES
('11008989', 'France', 'Padilla', 'RVR-COB', '5T2S4M9', 'Y'),
('11018399', 'Carlo', 'Inocencio', 'RVR-COB', '5T2S4M1', 'Y'),
('11032383', 'Curt', 'Delfin', 'CLA', '5T2S4M8', 'Y'),
('11049774', 'Vani', 'Altomonte', 'CLA', '5T2S4M7', 'Y'),
('11100958', 'Pram', 'Menghrajani', 'RVR-COB', '421T67', 'Y'),
('11108754', 'Danica', 'Tan', 'CCS', '5T2S4M0', 'Y'),
('11110422', 'Janel', 'Tumpalan', 'SOE', '5T2S4M4', 'Y'),
('11128658', 'Jenn', 'Noblezada', 'RVR-COB', '5T2S4M3', 'Y'),
('11143479', 'Patrick', 'Lo', 'CLA', '5T2S4M6', 'Y'),
('11162880', 'Angel', 'Alva', 'RVR-COB', '10M15XI', 'Y'),
('11173890', 'Patricia', 'Lacap', 'CLA', '101310D', 'Y'),
('11177640', 'Aubrey', 'Tolentino', 'GCOE', '84323D8', 'Y'),
('11178620', 'Angel', 'Lizardo', 'GCOE', '1I23B3H', 'Y'),
('11179620', 'Mark', 'Belarmino', 'GCOE', '3VKJP1U', 'Y'),
('11210737', 'Rupert', 'Laurel', 'RVR-COB', '5T2S4M5', 'Y'),
('11225394', 'Maemae', 'Gonzales', 'RVR-COB', '5T2S4M2', 'Y'),
('11271310', 'Lisa', 'Venegas', 'RVR-COB', 'U2SBW76', 'Y'),
('11274530', 'Ping', 'Rivero', 'CCS', 'TZ31NT7', 'Y'),
('11275510', 'Julia', 'Cartago', 'CLA', 'TIW39KU', 'Y'),
('11276460', 'Gaston', 'Velarde', 'CCS', '218E951', 'Y'),
('11276630', 'Larissa', 'Ubungen', 'CCS', '101DR31', 'Y'),
('11278390', 'Raphaelo', 'Perez', 'RVR-COB', '88CXL65', 'Y'),
('11279400', 'Yani', 'Abonado', 'RVR-COB', 'EH1Z2EN', 'Y'),
('11331038', 'Stef', 'Rivera', 'CLA', '8YDM42S', 'Y'),
('11346418', 'Clifford', 'Espiritu', 'GCOE', '982U4HE', 'Y'),
('200507400443', 'KIMBERLY ANN', 'LAGANGAN', '', '2le0ow', 'Y'),
('200607402909', 'SEUNG LI', 'KIM', '', 'ded8wx', 'Y'),
('200707403204', 'ERIKA MARGARET', 'IBAY', '', 'sp0025', 'Y'),
('200707403240', 'DAVID BEN', 'VILLANUEVA', 'GCOE', '1er3e8', 'Y'),
('200707403330', 'JOHN LOUIE', 'ZARASPE', 'GCOE', 'z9i641', 'Y'),
('200707403402', 'CHEENKEE DIANE', 'RAZON', 'GCOE', '2jf4h6', 'Y'),
('200707403916', 'ALDRIN ELBERT', 'PARATI', 'GCOE', 'ghib8j', 'Y'),
('200707404203', 'ROBERT NIÑO', 'BERNARDO', 'GCOE', 'lgh2ub', 'Y'),
('200807404635', 'KRISTOFFER MARK', 'VERZOSA', 'GCOE', 'nywg3z', 'Y'),
('200807404879', 'REX', 'GUTIERREZ', 'GCOE', '65s07d', 'Y'),
('200807405166', 'RICHARD', 'CAYETANO', 'RVR-COB', 'l9fumf', 'Y'),
('200807405427', 'TAEK JIN', 'LIM', 'RVR-COB', 'pdziax', 'Y'),
('200807405517', 'DOYOUNG', 'IM', 'CLA', '7n99hs', 'Y'),
('200807405607', 'JOSHUA', 'TEODOSIO', 'GCOE', 'uhnu2r', 'Y'),
('200907405778', 'JOHN PHILIPS', 'NUFABLE', 'CCS', 'ka7h6q', 'Y'),
('200907405895', 'FRANCISCO RIGELO IV', 'ADRIANO', 'CLA', 'zevim3', 'Y'),
('200907405903', 'TAEHOON', 'KIM', 'RVR-COB', 'vvm5z2', 'Y'),
('200907405921', 'ROXANNE MAY', 'LIBATIQUE', 'CLA', 'a8wvgp', 'Y'),
('200907405958', 'KRISTOFFER ROSS', 'CRUZ', 'CCS', 'zxbut8', 'Y'),
('200907406038', 'JULES IAN', 'GILOS', 'GCOE', 'skpk12', 'Y'),
('200907406065', 'JOSE GERARDO', 'BAYOT', 'CLA', 'eluo7k', 'Y'),
('200907406083', 'ALLAN JOSEPH', 'COKIANGCO', 'RVR-COB', 'qwlevw', 'Y'),
('200907406128', 'JAN MASON', 'SANCHEZ', 'GCOE', 'mkjn50', 'Y'),
('200907406263', 'ARVIN NELL', 'PEIL', 'RVR-COB', 'c16f7g', 'Y'),
('200907406308', 'DON', 'CHANDUANGTO', 'GCOE', '4mffub', 'Y'),
('200907406326', 'ANALYN', 'DUEÑAS', 'RVR-COB', 's3lxjx', 'Y'),
('200907406335', 'SARAH JANE', 'GO', 'CCS', 'ng7eaj', 'Y'),
('200907406407', 'DANICA MARIE', 'SY', 'GCOE', 'l8yqis', 'Y'),
('200907406425', 'JUSTINE', 'PEREZ', 'GCOE', 'fxfskc', 'Y'),
('200907406597', 'JOHN KEVIN', 'AGUILLAS', 'RVR-COB', 't2mim7', 'Y'),
('200907406678', 'JESUS ANTONIO', 'SAULOG', 'RVR-COB', '55tiea', 'Y'),
('200907406731', 'JHEROME JASPHER', 'SANTOS', 'RVR-COB', '3zte2r', 'Y'),
('200907406740', 'GABRIELLE PAOLA', 'BUCAD', 'CLA', 'c3mkqa', 'Y'),
('200907406786', 'DENMARK', 'TALAMPAS', 'GCOE', '5ztab6', 'Y'),
('200907406894', 'MARIA ZAIRA', 'BESABE', 'GCOE', 'ginen5', 'Y'),
('200907406939', 'IRENE', 'LOH', 'RVR-COB', '5ofe9h', 'Y'),
('200907407028', 'IAN FREDERICK', 'DE JESUS', 'CCS', 'i9d2t2', 'Y'),
('200907407082', 'CHRISTIAN VALERIANO FRITZ', 'SIMONDAC', 'RVR-COB', '7p04ql', 'Y'),
('200907407091', 'JULIEANNE', 'BADAR', 'RVR-COB', 'p59i7m', 'Y'),
('200907407109', 'CAMILLE THERESE', 'CACHUELA', 'RVR-COB', 'o7xnmh', 'Y'),
('200907407118', 'ALIANE JEREMY', 'ROQUE', 'CLA', 'g9fplg', 'Y'),
('200907407136', 'ALMYR BENNEDICT', 'ALIPON', 'RVR-COB', 'ivtlz2', 'Y'),
('201007407153', 'CHARLES VINCENT', 'SAN JUAN', 'GCOE', 'z4bkr0', 'Y'),
('201007407162', 'STEPHEN ALBERT', 'CHAN', 'CCS', 'u63td4', 'Y'),
('201007407171', 'WILJAY', 'DE LEON', 'GCOE', 'zdp6b7', 'Y'),
('201007407180', 'JOHN ROBERT', 'DE LEON', 'GCOE', '0182zk', 'Y'),
('201007407199', 'RUM ALBERT', 'BORROMEO', 'GCOE', 'um229a', 'Y'),
('201007407207', 'ENRICO ANTONIO', 'YLANAN', 'CCS', 'a002rb', 'Y'),
('201007407216', 'SHARMAINE', 'BONGAR', 'RVR-COB', 'qmucgb', 'Y'),
('201007407225', 'NEDBIE FRANCIS', 'AMORANTO', 'CCS', 'ut4out', 'Y'),
('201007407270', 'EDWARD CHAIM', 'LOGDONIO', 'RVR-COB', 'em6xgu', 'Y'),
('201007407306', 'KENNETH', 'SUAREZ', 'GCOE', 'ywomxq', 'Y'),
('201007407360', 'REGINALD', 'HIZON', 'CLA', 'zu9gn5', 'Y'),
('201007407397', 'MA. KATRIZ', 'VERSOZA', 'RVR-COB', 'vckuhi', 'Y'),
('201007407432', 'KARLO', 'TABAQUIN', 'RVR-COB', 'h69g67', 'Y'),
('201007407478', 'JOHN ERNEST', 'RAMOS', 'CCS', 'd0d6ae', 'Y'),
('201007407496', 'VICTOR RAYMUND', 'VILLEGAS', 'RVR-COB', 'kgn3zw', 'Y'),
('201007407577', 'ANTHONY VINCENT', 'AGNO', 'RVR-COB', '0oorud', 'Y'),
('201007407586', 'CARLO ELICZAR', 'CARABEO', 'CCS', 'y9qque', 'Y'),
('201007407630', 'MERVIN JASPER', 'CLAVERIA', 'GCOE', '6r60ml', 'Y'),
('201007407667', 'KADMIEL', 'BERDOS', 'RVR-COB', '8yebt9', 'Y'),
('201007407720', 'BRIANA LAUREN', 'AMBROSIO', 'RVR-COB', 'jg9c4c', 'Y'),
('201007407739', 'MARYO KARLO', 'GONZALES', 'GCOE', 'khy4d7', 'Y'),
('201007407748', 'MARTIN JOSHUA', 'SAN MIGUEL', 'CCS', 'r4ywfi', 'Y'),
('201007407784', 'DARLENE', 'AÑOSO', 'RVR-COB', 'o6oqhw', 'Y'),
('201007407801', 'ROI JEVAN', 'SUGUE', 'CCS', '7qomiz', 'Y'),
('201007407856', 'CRISCHELLE MAE', 'PARAMIO', 'GCOE', 'tlu5lv', 'Y'),
('201007407865', 'JERVINNE LESTER', 'CRUZ', 'GCOE', 'dca76v', 'Y'),
('201007407883', 'DANNA COZETTE', 'RAYMUNDO', 'CLA', 'vcerny', 'Y'),
('201007407892', 'MARIEL LIAN', 'SANTISTEBAN', 'GCOE', 'nptrky', 'Y'),
('201007407928', 'JOHN CARLO', 'VICTORY', 'CCS', 'cemcrd', 'Y'),
('201007407955', 'JEN LOUIE', 'SAN JOSE', 'GCOE', 'tlqnko', 'Y'),
('201007407991', 'CARL RYAN', 'EDRADAN', 'GCOE', 'leh85q', 'Y'),
('201007408026', 'MITZELLE VENICE', 'BATIN', 'CLA', '7gjkym', 'Y'),
('201007408053', 'GABRIEL', 'DELA CRUZ', 'RVR-COB', '06qte3', 'Y'),
('201007408107', 'MA. CLARIZA', 'VELASCO', 'RVR-COB', '02gvuo', 'Y'),
('201007408125', 'FERDINAND', 'BELTRAN', 'RVR-COB', 'k0dy6e', 'Y'),
('201007408134', 'JOSE NIÑO MARIA', 'TALENS', 'GCOE', 'tac8as', 'Y'),
('201007408143', 'GABRIELLE NICOLO', 'MACALINO', 'RVR-COB', 'a7zbp9', 'Y'),
('201007408170', 'SO-EUN', 'PARK', 'RVR-COB', 'sj0jug', 'Y'),
('201007408189', 'CRISTOPHER', 'LIM', 'RVR-COB', 'ogl7dp', 'Y'),
('201007408224', 'BENNESON', 'ABRAO', 'GCOE', 'pasw79', 'Y'),
('201007408242', 'JHAYZEL', 'POMENTO', 'RVR-COB', '3d3sa5', 'Y'),
('201007408288', 'JOHN SADIRI', 'PEREZ', 'RVR-COB', 'fm1xpq', 'Y'),
('201007408350', 'JERIC ADRIAN', 'MONZON', 'GCOE', 'lwodmq', 'Y'),
('201007408378', 'MARIA MICHAELA', 'NOSCAL', 'GCOE', 'r2rds7', 'Y'),
('201007408431', 'PAOLO EDUARDO', 'GARCES', 'CCS', 'ftm37d', 'Y'),
('201007408459', 'ROMULO', 'ACIO', 'GCOE', 'xtmado', 'Y'),
('201007408477', 'ANGELO', 'LUDOVICO', 'RVR-COB', '6qh1s1', 'Y'),
('201007408503', 'RAMON EMMANUEL', 'AGBISIT', 'CLA', '4oqjpn', 'Y'),
('201007408521', 'ART CHRISTIAN', 'GOLIMLIM', 'GCOE', 'hv7oem', 'Y'),
('201007408530', 'NORMAN PATRICK', 'SANTOS', 'GCOE', '7r9gcm', 'Y'),
('201107408549', 'DIANE', 'ACLO', 'GCOE', 'vrayg2', 'Y'),
('201107408558', 'IAN ZEDRIC', 'MAUNAHAN', 'GCOE', 't40oc5', 'Y'),
('201107408567', 'ARIANE', 'AGUILAR', 'GCOE', 'soyka6', 'Y'),
('201107408576', 'EUNICE', 'AUSTRIA', 'GCOE', 'j68hhs', 'Y'),
('201107408585', 'MC JOREN', 'BANZON', 'GCOE', 'q0rcx6', 'Y'),
('201107408594', 'BRET MICHAEL', 'BARRAQUIO', 'GCOE', 'tngk6k', 'Y'),
('201107408648', 'JOY', 'GUTIERREZ', 'RVR-COB', 'yj93ge', 'Y'),
('201107408666', 'MELVIN', 'IPIL', 'GCOE', 'em9b9t', 'Y'),
('201107408675', 'JAMAICA GRACE', 'LAFUENTE', 'GCOE', 'ni736h', 'Y'),
('201107408693', 'ROXSAN', 'MARANAN', 'RVR-COB', '7f1rcn', 'Y'),
('201107408701', 'RONALYN', 'MARCELLANA', 'GCOE', 'al2ggb', 'Y'),
('201107408710', 'VINA KRIZZIA', 'MORALES', 'CLA', 'zxug7l', 'Y'),
('201107408729', 'FRANCESS RIZZA', 'NAMIA', 'GCOE', 'd8yo7w', 'Y'),
('201107408738', 'HERNAN FRANZ', 'OFREN', 'GCOE', 'loso39', 'Y'),
('201107408747', 'MAE ANNE', 'RABINO', 'RVR-COB', '5jdkk4', 'Y'),
('201107408756', 'ROBERT JOSHUA', 'RAMOS', 'GCOE', 'lnvqi1', 'Y'),
('201107408774', 'ERICKA CAMILLE', 'SALAZAR', 'GCOE', '8s6vd9', 'Y'),
('201107408800', 'JOEY', 'TABALNO', 'GCOE', '7zicsv', 'Y'),
('201107408828', 'ALEXA ANGELA', 'VILLANUEVA', 'GCOE', 'o01cij', 'Y'),
('201107408837', 'JAYBEE', 'YATCO', 'RVR-COB', 'ttt3nx', 'Y'),
('201107408845', 'ANDREA MAE', 'SAGRITALO', 'RVR-COB', 'etvqji', 'Y'),
('201107408863', 'JEFFREY', 'GARCIA', 'CCS', 'gbjwwj', 'Y'),
('201107408872', 'NIKKI', 'EBORA', 'CCS', 'ytkl7c', 'Y'),
('201107408881', 'FRANCIS RAYMOND', 'ALTEZ', 'RVR-COB', '71dtbz', 'Y'),
('201107408890', 'JO RUPERT', 'COPIACO', 'CCS', '6fbjxs', 'Y'),
('201107408908', 'LEMUEL JASON', 'UBUNGEN', 'GCOE', 'rjgwdd', 'Y'),
('201107408917', 'KARL MICHAEL', 'YU', 'RVR-COB', 'rppxma', 'Y'),
('201107408926', 'ADRIAN JOSEPH RAE', 'ABIERA', 'GCOE', 'onomqc', 'Y'),
('201107408935', 'JAMES NICK', 'LAUS', 'GCOE', '9ydmdx', 'Y'),
('201107408944', 'MIKO ANGELO', 'PALMOS', 'RVR-COB', '1j7sh3', 'Y'),
('201107408953', 'JOHANNA MAY', 'DE JESUS', 'CLA', 'kc4340', 'Y'),
('201107408962', 'JANAE', 'PARMAN', 'CCS', 'h4lifd', 'Y'),
('201107408971', 'RYEL CHRISTIAN', 'MEDINA', 'CLA', 'gnn5xb', 'Y'),
('201107408980', 'ADRIAN JHUMIL', 'MAGCALAS', 'GCOE', 'wk6ywt', 'Y'),
('201107408999', 'JAN PAULO', 'GONZALES', 'RVR-COB', '7jukiy', 'Y'),
('201107409006', 'JAN MARA', 'LORETO', 'GCOE', 'rpb7be', 'Y'),
('201107409015', 'MITA CHABELI', 'PANGAN', 'CLA', '2wt5r9', 'Y'),
('201107409033', 'ELISHA GILES', 'RAMOS', 'CLA', 'qyqs57', 'Y'),
('201107409042', 'KURT FRANCIS', 'LAZARTE', 'GCOE', '0n9cpx', 'Y'),
('201107409051', 'MIGUEL ANTONIO', 'CATIBOG', 'CLA', 'nbnwb3', 'Y'),
('201107409079', 'LADY KIMBERLY', 'CABREROS', 'CCS', 'ouk3nl', 'Y'),
('201107409088', 'ED LORENCE', 'DE GUZMAN', 'GCOE', 'kw3c1u', 'Y'),
('201107409097', 'LOURDES VIRGINIA', 'ANDRADA', 'CCS', 'wnqrwt', 'Y'),
('201107409105', 'MA. ANGELICA', 'COLLADO', 'CLA', '0prtvj', 'Y'),
('201107409114', 'MARY JOY', 'YALA', 'RVR-COB', 'b63wwz', 'Y'),
('201107409123', 'JOHN CHRISTOPHER', 'CARLOS', 'RVR-COB', '5lk882', 'Y'),
('201107409132', 'NICOLE', 'CRISOSTOMO', 'CLA', 'uolysf', 'Y'),
('201107409141', 'MARIA GIANNE BEATRICE', 'ITARALDE', 'RVR-COB', 'vs4g3u', 'Y'),
('201107409150', 'PATRICIA LOUISE', 'ESTEBAN', 'CLA', 'o7f0ot', 'Y'),
('201107409169', 'MA. JOANNA', 'VENUS', 'GCOE', 'dn3nwg', 'Y'),
('201107409187', 'JOANNES PAOLO', 'VILLEGAS', 'RVR-COB', '4bps37', 'Y'),
('201107409204', 'SAIRAH CAMILLE', 'BELONIA', 'RVR-COB', 'v7n0r7', 'Y'),
('201107409213', 'JOSHUA RUEL', 'MARFIL', 'GCOE', '29kp4k', 'Y'),
('201107409222', 'AEYSOL', 'ROSALDO', 'GCOE', 'ihw4kf', 'Y'),
('201107409268', 'ROXANNE', 'DEL ROSARIO', 'RVR-COB', '5dzysr', 'Y'),
('201107409277', 'JONATHAN', 'MACARAIG', 'GCOE', '10ub50', 'Y'),
('201107409295', 'KEITH MARY', 'VILLAR', 'RVR-COB', 'hvra27', 'Y'),
('201107409303', 'ARVIN', 'MAGLANQUE', 'RVR-COB', '30zx4m', 'Y'),
('201107409312', 'FATIMA CAMILLE', 'DIZON', 'GCOE', 'q1m3a2', 'Y'),
('201107409321', 'CLARK DAVID', 'MALANOG', 'RVR-COB', '9up8f0', 'Y'),
('201107409330', 'YVES KESTREL', 'VENTANILLA', 'RVR-COB', '9kb7r2', 'Y'),
('201107409349', 'DARIAN DANE', 'BAMBA', 'RVR-COB', '2c7srp', 'Y'),
('201107409358', 'JHONAS', 'PRIMAVERA', 'GCOE', 'mihwsi', 'Y'),
('201107409376', 'ANABELL', 'TAPANG', 'RVR-COB', '0a4zgt', 'Y'),
('201107409385', 'JARRET RENZO', 'PANTIG', 'RVR-COB', 'xefc24', 'Y'),
('201107409394', 'GABRIEL', 'BERMUDEZ', 'RVR-COB', 'x1t70x', 'Y'),
('201107409402', 'NIKKA ELIA KIM', 'RAMOS', 'CLA', 'l770qh', 'Y'),
('201107409420', 'MARCO ALFONSO', 'CANTALEJO', 'RVR-COB', 'glmuhk', 'Y'),
('201107409439', 'CHRISTIAN DAVE', 'CRUZ', 'GCOE', 'lczcfq', 'Y'),
('201107409448', 'JONATHAN', 'DE LEON', 'RVR-COB', '8izarj', 'Y'),
('201107409457', 'CHIN-CHIN', 'SUAREZ', 'CLA', 'nwqehx', 'Y'),
('201107409466', 'STEPHANIE JULIA', 'VALENZUELA', 'CCS', 'kszprq', 'Y'),
('201107409475', 'AENON MARI VIEL', 'CUNANAN', 'GCOE', 'i600x3', 'Y'),
('201107409484', 'SEAN ELIJAH', 'LAZO', 'GCOE', 'k2364g', 'Y'),
('201107409501', 'JIN', 'FURUKAWA', 'RVR-COB', 'r09det', 'Y'),
('201107409510', 'JESUS MARIA MARTIN', 'OCAMPO', 'GCOE', '95702f', 'Y'),
('201107409529', 'JOSE ENRIQUE AGERICO', 'KANAPI', 'RVR-COB', '9n6f6f', 'Y'),
('201107409538', 'MIKHAELA', 'CALIMAG', 'RVR-COB', 'i2zlzo', 'Y'),
('201107409547', 'MARIE BERNADETTE', 'TRIVIÑO', 'CLA', 'a428x2', 'Y'),
('201107409556', 'EUN-JUNG', 'KIM', 'RVR-COB', 'pleyry', 'Y'),
('201107409583', 'KRIZCHIEL EMMANUELLE', 'ALVAREZ', 'RVR-COB', '8iv9fs', 'Y'),
('201107409592', 'STEPHANIE KEI', 'MA', 'RVR-COB', '7h5wj6', 'Y'),
('201107409628', 'SEAN FRANCIS', 'NATIVIDAD', 'GCOE', 'pwpfdg', 'Y'),
('201107409637', 'JUNICO MARIEL', 'POTESTAD', 'CLA', 'lbdq39', 'Y'),
('201107409655', 'MARIA ANA LYSSA', 'REPIL', 'RVR-COB', 'hnjc3e', 'Y'),
('201107409664', 'DANIEL FRANCISCO', 'NAVARRETE', 'GCOE', '4khqk8', 'Y'),
('201107409673', 'BENJAMIN CHRIST', 'MANALON', 'RVR-COB', '4n8t3p', 'Y'),
('201107409691', 'LEONARD KYLE', 'NALLANA', 'GCOE', 'zmodmt', 'Y'),
('201107409718', 'HANNAH ALAYSSA', 'CORTEZ', 'RVR-COB', 'tf2cz4', 'Y'),
('201107409727', 'JEROME', 'CANSADO', 'GCOE', 'mzsjxa', 'Y'),
('201107409736', 'JAN MARGARETTE', 'VASQUEZ', 'RVR-COB', 'u0rel1', 'Y'),
('201107409745', 'PRINCESS SUSHMITA ANJELIKA', 'JULAG-AY', 'RVR-COB', 'jjxslh', 'Y'),
('201107409754', 'JAN RITCHIVAL', 'IBUNA', 'GCOE', 'm6fb1m', 'Y'),
('201107409781', 'PATRICK', 'MISOLAS', 'GCOE', '374rkm', 'Y'),
('201107409790', 'JAYVEE', 'LACAMBRA', 'GCOE', '6cf4oq', 'Y'),
('201107409817', 'JOHN LENCY', 'TIONGCO', 'GCOE', 'dfucw9', 'Y'),
('201107409835', 'PAUL JHON', 'BUENVENIDA', 'GCOE', '0dxzry', 'Y'),
('201107409844', 'ROXETTE', 'SIOCHI', 'CLA', 'n85nt1', 'Y'),
('201107409853', 'XAVIER', 'PALOMARES', 'GCOE', '2y07ev', 'Y'),
('201107409880', 'ANDRIAN EARL', 'MAGNO', 'CLA', 'vrkat7', 'Y'),
('201107409899', 'ABRAHAM', 'ALPINO', 'RVR-COB', 'eruwok', 'Y'),
('201107409907', 'WEDNESDAY', 'AFRICA', 'RVR-COB', 'xtmbbv', 'Y'),
('201107409916', 'ADORRA PAOLA', 'MAÑOSCA', 'GCOE', '41vvje', 'Y'),
('201107409934', 'RYAN', 'DETECIO', 'RVR-COB', 'rocwfb', 'Y'),
('201107409952', 'PAUL JAN', 'RODELAS', 'CLA', 'oxisnj', 'Y'),
('201107409961', 'VIRGILIE ALYANA', 'DEL MUNDO', 'RVR-COB', 'erddj6', 'Y'),
('201107409970', 'DANA', 'CHANDUANGTO', 'RVR-COB', 'uj6nfc', 'Y'),
('201107409998', 'MAY ANN', 'DALUMPINES', 'CLA', '55xxxw', 'Y'),
('201107410004', 'PATRICIA ROSE', 'ALBANO', 'RVR-COB', 's11m0o', 'Y'),
('201107410013', 'JOHN JOSEPH', 'PEDRIGAL', 'GCOE', 'jrmah9', 'Y'),
('201107410031', 'JUMBELL', 'POMENTO', 'CLA', 'z60skt', 'Y'),
('201107410068', 'KYNDRA', 'PUNTANAR', 'RVR-COB', 'x88wc6', 'Y'),
('201107410077', 'LOURAINE', 'MANANGAT', 'RVR-COB', 'ot2ink', 'Y'),
('201107410086', 'JED', 'GUILLERGAN', 'RVR-COB', 'um1w5y', 'Y'),
('201107410095', 'JHUSTINE LOIS', 'SANTOS', 'CLA', 'ch6xvq', 'Y'),
('201107410112', 'NICOLE KEREN', 'DE GUZMAN', 'CLA', 'zvon1x', 'Y'),
('201107410130', 'CHRISTIAN GLENN', 'HATOL', 'GCOE', 'zwnyg1', 'Y'),
('201107410149', 'ALYSSA DENISE', 'TAGAMOLILA', 'GCOE', '0gfhli', 'Y'),
('201107410158', 'FRANZ CYRILE', 'MAGBANUA', 'RVR-COB', '3ud1bm', 'Y'),
('201107410167', 'ANTONIO', 'VENADAS', 'RVR-COB', '0achz3', 'Y'),
('201107410176', 'CATHERINE MARTINA', 'ABDON', 'CLA', 'o2cg5z', 'Y'),
('201107410185', 'KAMILLE KLAIRE', 'CARLOS', 'GCOE', 'l6d43y', 'Y'),
('201107410202', 'PRINCESS MARIANNE', 'GAYTANO', 'RVR-COB', 'o8dvfx', 'Y'),
('201107410211', 'RINALDO ELI', 'DIA', 'RVR-COB', 'qvs9tc', 'Y'),
('201107410257', 'KATHLEEN JOY', 'BARAIRO', 'RVR-COB', 'rsvxfp', 'Y'),
('201107410284', 'GERARD LOU', 'LIBBY', 'GCOE', 'cj12oe', 'Y'),
('201107410293', 'ROSE NICOLE', 'LEYSON', 'RVR-COB', 'loag0l', 'Y'),
('201107410301', 'JESELYN', 'ROSEMA', 'RVR-COB', 'ix3v39', 'Y'),
('201107410310', 'JOHN DOMINIQUE', 'GALANG', 'RVR-COB', 'bvtquk', 'Y'),
('201107410329', 'JAIMIE', 'PANGANIBAN', 'RVR-COB', 'mirl50', 'Y'),
('201107410338', 'JOSHUA', 'GUILLERMO', 'GCOE', '12r6s3', 'Y'),
('201107410356', 'SOPHIA ANGELA', 'ALMENDRALA', 'RVR-COB', '14hadi', 'Y'),
('201107410365', 'RYANNA LEZZA', 'MUHI', 'RVR-COB', 'eeuyes', 'Y'),
('201107410392', 'JI HYEON', 'KIM', 'RVR-COB', '1icrn3', 'Y'),
('201107410400', 'TROY MARCO', 'MARQUICIAS', 'RVR-COB', 'h8xtfm', 'Y'),
('201107410419', 'REYNADEL', 'REBAÑO', 'RVR-COB', 'pd14w1', 'Y'),
('201107410446', 'GARWYN', 'GALZA', 'RVR-COB', 'al1kn6', 'Y'),
('201107410455', 'JOHN CARLO', 'ALARCON', 'CLA', 'ozabiq', 'Y'),
('201107410482', 'MICHELLE ANN', 'ALIPASPAS', 'GCOE', '8aoez8', 'Y'),
('201107410509', 'PATRICK JULES', 'RONAS', 'RVR-COB', 'il38th', 'Y'),
('201107410518', 'KIMBERLY', 'BLANQUERA', 'CCS', 'tyieqr', 'Y'),
('201107410527', 'CHRISTINE MARIE', 'CRUZ', 'CLA', 'm8axpq', 'Y'),
('201107410536', 'JUAN PAOLO', 'DELA PEÑA', 'GCOE', 'yxwtn4', 'Y'),
('201107410545', 'EARL', 'SILVESTRE', 'GCOE', '04ksx3', 'Y'),
('201107410554', 'BRIAN EDWARD', 'HARRIS', 'GCOE', '20az69', 'Y'),
('201107410563', 'ANA PATRICIA', 'TOLOD', 'CLA', '0cabie', 'Y'),
('201107410572', 'LOUISE NICOLE', 'HATOL', 'RVR-COB', 'qcwe5w', 'Y'),
('201107410626', 'SHULAMMITE', 'CASUPANG', 'RVR-COB', 'esz9lz', 'Y'),
('201107410635', 'CARLO MARTIN', 'CHUA', 'RVR-COB', 'q73p59', 'Y'),
('201107410644', 'KENNETH MAIKO', 'NARVAEZ', 'GCOE', 'pcpvdd', 'Y'),
('201107410662', 'LEO JAMES', 'ALDABE', 'RVR-COB', 'cr0387', 'Y'),
('201107410671', 'JETHRO', 'COMETA', 'CCS', 'sknvmr', 'Y'),
('201107410680', 'CHRISTIAN EARL', 'TUVERA', 'GCOE', 'yw754a', 'Y'),
('201107410707', 'MIKHAIL', 'ULANDAY', 'GCOE', '67hepv', 'Y'),
('201207410715', 'LEINELL KRISMAN', 'TAMISIN', 'RVR-COB', '83qya2', 'Y'),
('201207410724', 'KAREN TRIXY', 'KALALO', 'CLA', 'y73j9s', 'Y'),
('201207410733', 'HAZEL', 'LANGIT', 'CLA', '0wvk4e', 'Y'),
('201207410742', 'YANINA', 'LIM', 'CLA', 'e4v1vm', 'Y'),
('201207410751', 'MARIA LISSBET', 'MANZANARES', 'CLA', '11hsj7', 'Y'),
('201207410779', 'NICOLE ANNE', 'VICENCIO', 'RVR-COB', 'bafr5m', 'Y'),
('201207410788', 'EUNICE', 'ZETA', 'CLA', 'ordsjh', 'Y'),
('201207410805', 'DEAN NICHOL', 'AMORANTO', 'RVR-COB', '983eas', 'Y'),
('201207410814', 'JANINE CLARIS', 'BAYONA', 'RVR-COB', '7n31xf', 'Y'),
('201207410823', 'REHAM SNOW', 'CAMAMA', 'RVR-COB', 'j9z90a', 'Y'),
('201207410841', 'HYE MIN', 'KIM', 'RVR-COB', 'sk7546', 'Y'),
('201207410850', 'ARVIN GABRIEL', 'NATIVIDAD', 'GCOE', 'w2qx6b', 'Y'),
('201207410869', 'PATRICIA KIRSTAN', 'PENALES', 'RVR-COB', '5aa2ac', 'Y'),
('201207410887', 'MARGARITA ALBERTO', 'REYES', 'RVR-COB', '70awv8', 'Y'),
('201207410896', 'ALEXANDRA', 'SANTOS', 'RVR-COB', 'mor7on', 'Y'),
('201207410904', 'HAZEL RY', 'TORRES', 'RVR-COB', 'zof6az', 'Y'),
('201207410913', 'MICHAEL CARLO', 'DEL ROSARIO', 'GCOE', '7b3s9n', 'Y'),
('201207410922', 'PATRICK JOSHUA', 'GONZALES', 'GCOE', 'twsl8m', 'Y'),
('201207410931', 'JHO NATHAN SINGH', 'KUDHAL', 'GCOE', 'dsj42o', 'Y'),
('201207410940', 'CARL VINSON', 'MATULAC', 'GCOE', '4rxjl0', 'Y'),
('201207410968', 'ANGEL FATIMA', 'OPULENCIA', 'GCOE', 'm2kagh', 'Y'),
('201207410977', 'PAOLO', 'PASCUAL', 'GCOE', 'yvlkdq', 'Y'),
('201207410986', 'ELDRINE JAY', 'PEREZ', 'GCOE', '0k1ds6', 'Y'),
('201207411002', 'RENZO LUIS', 'DIMAYUGA', 'CCS', 'cshd21', 'Y'),
('201207411011', 'CARLOS MIGUEL', 'DIGNADICE', 'CCS', 'kbj0l6', 'Y'),
('201207411020', 'IAN PAUL', 'VILORIA', 'CLA', '1ccxuf', 'Y'),
('201207411039', 'ISAAC', 'ATIENZA', 'GCOE', 'iyo6yg', 'Y'),
('201207411084', 'PATRICK CARL', 'ILAO', 'CCS', 'wn90rh', 'Y'),
('201207411093', 'JOSE RAMON', 'SAN BUENAVENTURA', 'GCOE', 'wwnic8', 'Y'),
('201207411101', 'EIRAH RITZEL', 'PADEN', 'GCOE', 'muwx7z', 'Y'),
('201207411110', 'JOHN CARL', 'BAUTISTA', 'GCOE', 'zlu5cb', 'Y'),
('201207411138', 'AIAHNNA', 'DE LA MERCED', 'CLA', 't0x81w', 'Y'),
('201207411156', 'ALYSSA DENISE', 'PABLO', 'RVR-COB', 'axcw7m', 'Y'),
('201207411192', 'RALPH EMILIO', 'BALLESTEROS', 'CLA', '1zvlw3', 'Y'),
('201207411219', 'ALECXANDRIA LAURIE', 'GONZALES', 'CLA', 'qtw26b', 'Y'),
('201207411237', 'MARIAN', 'MAGSAYSAY', 'CLA', 'yo8uvk', 'Y'),
('201207411246', 'ALEXANDRA', 'MERCADO', 'CLA', '488qvn', 'Y'),
('201207411273', 'KIMBERLEY ROSE', 'RODOLFO', 'CLA', 'o7o1lf', 'Y'),
('201207411309', 'LEVIN JAERON', 'CRUZ', 'GCOE', '6ynwfr', 'Y'),
('201207411318', 'BEA SAMANTHA', 'RODRIGO', 'RVR-COB', 'kevc16', 'Y'),
('201207411327', 'CHARLENE', 'ALIBUDBUD', 'RVR-COB', 'd8mda0', 'Y'),
('201207411336', 'MARY EMMANUELLE', 'PAYUMO', 'GCOE', 'hvav5w', 'Y'),
('201207411354', 'JOHN ZACHARY', 'RADUBAN', 'CCS', '8taukr', 'Y'),
('201207411372', 'MICKEL GIAN', 'MAJARAIS', 'GCOE', 'la6qaw', 'Y'),
('201207411390', 'PAULO JOSHUA', 'ALCARAZ', 'RVR-COB', 'cn7jlo', 'Y'),
('201207411408', 'Amiel Christopher', 'CRUZ', 'RVR-COB', 'xgu68x', 'Y'),
('201207411426', 'CARLO LUIS', 'LAURENTE', 'RVR-COB', 'r5oj20', 'Y'),
('201207411444', 'NERO GABRIEL', 'CAMELLO', 'RVR-COB', '78ctt6', 'Y'),
('201207411453', 'FIANNE MIGUEL', 'MACANDOG', 'RVR-COB', 'g6azph', 'Y'),
('201207411462', 'MARWEN KAYE', 'MANAGUIT', 'RVR-COB', 'ie4uzo', 'Y'),
('201207411499', 'ROSHIELA TERESA', 'OÑA', 'RVR-COB', 'hn5hzo', 'Y'),
('201207411507', 'MICHAELA PATRICE', 'PAPA', 'RVR-COB', 'lb1hlq', 'Y'),
('201207411516', 'JUAN CARLOS', 'PUCAY', 'RVR-COB', '3wguho', 'Y'),
('201207411525', 'KEITH MARCUS', 'TABUSO', 'RVR-COB', 'bo72k9', 'Y'),
('201207411534', 'MAYUKI', 'TAKEDA', 'RVR-COB', 'gb4xtg', 'Y'),
('201207411552', 'VERONICA ANGELA', 'VELASCO', 'CLA', 'z80wwb', 'Y'),
('201207411561', 'PATRICIA BIANCA', 'CELESTIAL', 'GCOE', '6e62hg', 'Y'),
('201207411589', 'ELVIN MARTIN', 'CABRERA', 'CLA', 'ndkex0', 'Y'),
('201207411606', 'MARIENE', 'PORTAL', 'CLA', 'd3rk6c', 'Y'),
('201207411615', 'SHAUN CASSIDY', 'CALAGOS', 'CCS', '8aeljt', 'Y'),
('201207411624', 'CHELSEA DIONE', 'JUNIO', 'RVR-COB', 'mp72vl', 'Y'),
('201207411633', 'HAZEL MAE', 'LEE', 'CLA', '0l706j', 'Y'),
('201207411642', 'KENNETH EMMANUEL', 'BERNARDO', 'RVR-COB', '48hna7', 'Y'),
('201207411660', 'MYKAH ELLAINE', 'WONG', 'CLA', 'mbgsxc', 'Y'),
('201207411688', 'MARIE LAUREEN', 'HALILI', 'RVR-COB', '95mkz5', 'Y'),
('201207411705', 'PAUL GILBERT', 'ARROYO', 'GCOE', '7ijqa6', 'Y'),
('201207411714', 'JAZMINE CLAIRE', 'GONZALES', 'RVR-COB', 'mfzrzu', 'Y'),
('201207411723', 'JUSTIN BRUCE', 'GONZALES', 'RVR-COB', 'eag4l9', 'Y'),
('201207411732', 'ANNENICOLAI', 'RIVERA', 'RVR-COB', '1goaxg', 'Y'),
('201207411741', 'FRANCO', 'MULIMBAYAN', 'RVR-COB', '5mncr4', 'Y'),
('201207411769', 'JHOMAR', 'MAMARIL', 'GCOE', '8mt53t', 'Y'),
('201207411813', 'ANTHONY', 'LOBIGAS', 'CLA', 'xqah7w', 'Y'),
('201207411822', 'RAVEN', 'SOLIGUEN', 'GCOE', 'j6c7ux', 'Y'),
('201207411831', 'JEAN JYN', 'ABUEVA', 'RVR-COB', 'u1dnux', 'Y'),
('201207411840', 'MIA KRISTEL', 'VILLAPANDO', 'GCOE', 'rtf7ck', 'Y'),
('201207411859', 'JOAN', 'OPALO', 'RVR-COB', 'p6fvcb', 'Y'),
('201207411868', 'MA LUZ JOY', 'NAVAL', 'GCOE', 'ncffmu', 'Y'),
('201207411903', 'ZENDREL', 'GACUYA', 'GCOE', 'ehnj7y', 'Y'),
('201207411930', 'KYMBERLY', 'GOTLADERA', 'GCOE', 'kustpq', 'Y'),
('201207411958', 'ROWELLA ZOSIMA', 'GIMENA', 'GCOE', 'pxgnwr', 'Y'),
('201207411967', 'JOSE', 'ABALOS II', 'CLA', 'gqyyzt', 'Y'),
('201207411976', 'MARK GENESIS', 'ROMANTIGUE', 'CCS', 'vfl3c8', 'Y'),
('201207411985', 'DANICA', 'SALAZAR', 'RVR-COB', 's5vkgz', 'Y'),
('201207411994', 'PAULO MIGUEL', 'AMBION', 'GCOE', '9q39sy', 'Y'),
('201207412029', 'HANNA CORAZON', 'YATCO', 'GCOE', 'c41fpy', 'Y'),
('201207412038', 'RAMON PAOLO', 'ALFAR', 'CLA', 'gvraia', 'Y'),
('201207412047', 'RICHARD', 'ABELLA', 'RVR-COB', 'nah09l', 'Y'),
('201207412056', 'DANNIELYN', 'DACALCAP', 'GCOE', '9x30rb', 'Y'),
('201207412074', 'MARC JULIUS', 'CLAVERIA', 'GCOE', 'l7mtwx', 'Y'),
('201207412083', 'MIGUEL ERNESTO LUIS', 'GONZALEZ', 'GCOE', 'gif9ke', 'Y'),
('201207412092', 'FELIPE', 'DE VERA', 'RVR-COB', 'mnt48a', 'Y'),
('201207412100', 'LEONETTE', 'OLIVEROS', 'CLA', 'xqkb8c', 'Y'),
('201207412119', 'ROSEANNE KAROL', 'SAN AGUSTIN', 'RVR-COB', 'mh0n08', 'Y'),
('201207412137', 'JAMES MARVIN', 'MAMON', 'GCOE', 'vzrlry', 'Y'),
('201207412146', 'SHEILA EDEN', 'GIBAS', 'RVR-COB', 'vpftd2', 'Y'),
('201207412155', 'CLYDE JUSTINE', 'PARAMIO', 'RVR-COB', '49xs94', 'Y'),
('201207412164', 'JULIE DIAN', 'CAMINONG', 'RVR-COB', 'vfmm9t', 'Y'),
('201207412173', 'JUSTIN ROI', 'NOGRALES', 'RVR-COB', 'k7kuer', 'Y'),
('201207412182', 'DAPHNE ERIN', 'RAZO', 'GCOE', 'azwy43', 'Y'),
('201207412191', 'JOHN RICHMOND', 'SATURNO', 'RVR-COB', 'a4g6eb', 'Y'),
('201207412218', 'YSABEL', 'OBVIAR', 'RVR-COB', 'z61749', 'Y'),
('201207412227', 'CATHERINE FAYE', 'GOÑE', 'RVR-COB', 'nunss1', 'Y'),
('201207412245', 'LOUISE AHNE', 'FABIE', 'CLA', '6wm5xb', 'Y'),
('201207412272', 'AILEEN BENZ', 'SABELLON', 'CCS', 'c0drgi', 'Y'),
('201207412281', 'ABIGAIL', 'SORIANO', 'GCOE', '124dzg', 'Y'),
('201207412308', 'CHARLEGNE MAY', 'RAMOS', 'RVR-COB', 'd3laqa', 'Y'),
('201207412317', 'HANNA', 'DIAZ', 'RVR-COB', '4bd3wu', 'Y'),
('201207412326', 'FRANCHETTE IANE', 'REBUGIO', 'RVR-COB', 'to0a2m', 'Y'),
('201207412335', 'CHRISTINE ANNE', 'NARVADEZ', 'GCOE', '2olns2', 'Y'),
('201207412344', 'ANDRE', 'ALEJO', 'RVR-COB', 'u4uqy8', 'Y'),
('201207412353', 'MIGUEL ALFONZO', 'SUNIGA', 'CCS', '8oxbph', 'Y'),
('201207412371', 'IRON ENAR', 'GUDA', 'RVR-COB', 'o1krjp', 'Y'),
('201207412380', 'JASON ROLAND', 'ELAZEGUI', 'RVR-COB', '4op6hu', 'Y'),
('201207412399', 'RIA ANGELA', 'ALEJAR', 'CLA', '72zevv', 'Y'),
('201207412407', 'CAMILLE BIANCA', 'GOMEZ', 'GCOE', 'd47idf', 'Y'),
('201207412416', 'STEPHANIE MARIE', 'AMBROSIO', 'RVR-COB', '2dzo47', 'Y'),
('201207412425', 'KENNETH', 'DE VERA', 'CCS', 'n15zxr', 'Y'),
('201207412434', 'ELYONAH EMILLE', 'ENVERGA', 'RVR-COB', 'azwr5l', 'Y'),
('201207412443', 'MJ IAN', 'SERVANCIA', 'RVR-COB', 'tqxymc', 'Y'),
('201207412452', 'JAN MICHAEL', 'DAYUPAY', 'CCS', 'f1g23f', 'Y'),
('201207412470', 'ADRIAN GIUSEPPE FRANCIS', 'FERNAN', 'GCOE', '898ku6', 'Y'),
('201207412498', 'JOAN', 'GUDITO', 'CLA', '9dwdn9', 'Y'),
('201207412506', 'JOHN LAWRENCE', 'CARBONELL', 'CLA', 'shsmvv', 'Y'),
('201207412515', 'WALDOLF JOACHIM', 'CARBONELL', 'RVR-COB', '60uulx', 'Y'),
('201207412524', 'PATRICK JOHN', 'GOTUACO', 'RVR-COB', 'issm9q', 'Y'),
('201207412533', 'RALPH MATTHEW', 'AGUILLON', 'RVR-COB', '52nd40', 'Y'),
('201207412551', 'DINO DOMINIC', 'LIGUTAN', 'GCOE', 'v6bmur', 'Y'),
('201207412560', 'MARC DOUGLAS', 'SERZO', 'GCOE', '4crtp8', 'Y'),
('201207412588', 'LORAINE', 'RUIZ', 'CLA', 'ru3xf8', 'Y'),
('201207412597', 'CARL DEXTER IAN', 'TRINOS', 'RVR-COB', '6af00d', 'Y'),
('201207412614', 'BENDRHICK', 'CO', 'CCS', 'o5gudx', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `votes_for`
--

CREATE TABLE IF NOT EXISTS `votes_for` (
  `voter_id` varchar(12) NOT NULL,
  `candidate_id` varchar(12) NOT NULL,
  PRIMARY KEY (`voter_id`,`candidate_id`),
  KEY `candidate_id` (`candidate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
