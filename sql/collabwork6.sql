-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 21 fév. 2022 à 14:45
-- Version du serveur : 8.0.27
-- Version de PHP : 7.4.26

START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `collabwork`
--

-- --------------------------------------------------------

--
-- Structure de la table `brouillons`
--

DROP TABLE IF EXISTS `brouillons`;
CREATE TABLE IF NOT EXISTS `brouillons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_compte` int NOT NULL,
  `titre` varchar(255) NOT NULL,
  `texte` text NOT NULL,
  `last_modif` text,
  PRIMARY KEY (`id`),
  KEY `brouillons_fk0` (`id_compte`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `brouillons`
--

TRUNCATE TABLE `brouillons`;
--
-- Déchargement des données de la table `brouillons`
--

INSERT INTO `brouillons` (`id`, `id_compte`, `titre`, `texte`, `last_modif`) VALUES
(1, 1, 'Réflexions sur la vie et l\'univers', 'Comment tuer les gens efficacement ?&#60;br /&#62;&#60;br /&#62;$$f(x) - \\frac{1+n}{n-1} = \\sum_{k=0}^{n} \\frac{k!}{n!}$$&#60;br /&#62;&#60;br /&#62;Ah ah ah !&#60;br /&#62;&#60;br /&#62;**gras**&#60;br /&#62;&#60;br /&#62;*italique*&#60;br /&#62;&#60;br /&#62;~~je sais pas~~&#60;br /&#62;&#60;br /&#62;==surligne==&#60;br /&#62;&#60;br /&#62;**_italique et gras_**', '2022-02-08 23:34:11'),
(2, 1, 'Brouillon 2', '', '2022-02-09 21:20:51');

-- --------------------------------------------------------

--
-- Structure de la table `brouillons_comptes`
--

DROP TABLE IF EXISTS `brouillons_comptes`;
CREATE TABLE IF NOT EXISTS `brouillons_comptes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_compte` int NOT NULL,
  `id_brouillon` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `brouillons_comptes_fk0` (`id_compte`),
  KEY `brouillons_comptes_fk1` (`id_brouillon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `brouillons_comptes`
--

TRUNCATE TABLE `brouillons_comptes`;
-- --------------------------------------------------------

--
-- Structure de la table `brouillon_exercice`
--

DROP TABLE IF EXISTS `brouillon_exercice`;
CREATE TABLE IF NOT EXISTS `brouillon_exercice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_exercice` int NOT NULL,
  `id_compte` int NOT NULL,
  `titre` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_modif` text,
  PRIMARY KEY (`id`),
  KEY `brouillon_exercice_fk0` (`id_exercice`),
  KEY `brouillon_exercice_fk1` (`id_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `brouillon_exercice`
--

TRUNCATE TABLE `brouillon_exercice`;
-- --------------------------------------------------------

--
-- Structure de la table `chapitres`
--

DROP TABLE IF EXISTS `chapitres`;
CREATE TABLE IF NOT EXISTS `chapitres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `id_compte` int NOT NULL,
  `_description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_compte` (`id_compte`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `chapitres`
--

TRUNCATE TABLE `chapitres`;
--
-- Déchargement des données de la table `chapitres`
--

INSERT INTO `chapitres` (`id`, `titre`, `id_compte`, `_description`) VALUES
(1, 'Chapitre n°13 : Suites numériques', 1, ''),
(2, 'Chapitre n°1 - Logique est raisonnements', 1, '<i>En effet, l\'effet fait le même effet à la cause que l\'effet que la cause lui a causé de fait.</i><br/>(Professeur Shadoko par Jacques Rouxier)'),
(3, 'Chapitre n°2 - Ensembles', 1, ''),
(4, 'Chapitre n°4 - Sommes et produits', 1, ''),
(5, 'Chapitre n°5 - Relations', 1, ''),
(6, 'Chapitre n°6 - Nombres réels', 1, ''),
(7, 'Chapitre n°7 - Nombres complexes', 1, ''),
(8, 'Chapitre n°8 - Cardinaux et dénombrement', 1, ''),
(9, 'Chapitre n°3 - Applications', 1, ''),
(10, 'Chapitre n°10 - Les fonctions usuelles', 1, ''),
(11, 'Chapitre n°11 - Calcul intégral', 1, ''),
(12, 'Chapitre n°12 - Equations différentielles linéaires', 1, ''),
(13, 'Chapitre n°9 - Dérivation de fonctions', 1, ''),
(14, 'Chapitre n°14 - Propriété des fonctions $C^0$ ou $D^1$ sur un intervalle', 1, ''),
(15, 'Chapitre n°15 - Calcul asymptotique', 1, ''),
(16, 'Chapitre n°16 - Approximations polynomiales', 1, ''),
(17, 'Chapitre n°17 - Séries numériques', 1, ''),
(18, 'Chapitre n°18 - Intégration', 1, ''),
(19, 'Chapitre n°19 - Structures algébriques', 1, ''),
(20, 'Chapitre n°20 - Calcul matriciel', 1, ''),
(21, 'Chapitre n°21 - Arithmétique des entiers', 1, ''),
(22, 'Chapitre n°22 - Polynômes et fractions rationnelles', 1, '');

-- --------------------------------------------------------

--
-- Structure de la table `chapitres_elements`
--

DROP TABLE IF EXISTS `chapitres_elements`;
CREATE TABLE IF NOT EXISTS `chapitres_elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_chapitre` int NOT NULL,
  `id_element` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chapitres_elements_fk0` (`id_chapitre`),
  KEY `chapitres_elements_fk1` (`id_element`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `chapitres_elements`
--

TRUNCATE TABLE `chapitres_elements`;
--
-- Déchargement des données de la table `chapitres_elements`
--

INSERT INTO `chapitres_elements` (`id`, `id_chapitre`, `id_element`) VALUES
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 1, 21),
(22, 1, 22),
(23, 1, 23),
(24, 1, 24),
(25, 1, 25),
(26, 1, 26),
(27, 1, 27),
(28, 1, 28),
(29, 1, 29),
(30, 1, 30),
(31, 1, 31),
(32, 1, 32),
(33, 1, 33),
(34, 1, 34),
(35, 1, 35),
(36, 1, 36),
(37, 1, 37),
(38, 1, 38),
(39, 1, 39),
(40, 1, 40),
(41, 1, 41),
(42, 1, 42),
(43, 1, 43),
(44, 1, 44),
(45, 1, 45),
(46, 1, 46),
(47, 1, 47),
(48, 1, 48),
(49, 1, 49),
(50, 1, 50),
(51, 19, 51),
(52, 19, 52),
(53, 19, 53),
(54, 19, 54),
(55, 19, 55),
(56, 19, 56),
(57, 19, 57),
(58, 19, 58),
(60, 19, 60),
(61, 19, 61),
(62, 19, 62),
(63, 19, 63),
(64, 19, 64),
(65, 19, 65),
(66, 19, 66),
(67, 19, 67),
(68, 19, 68),
(69, 19, 69),
(70, 19, 70),
(71, 19, 71),
(72, 19, 72),
(74, 14, 74),
(75, 14, 75),
(76, 14, 76),
(77, 14, 77),
(78, 14, 78),
(79, 14, 79),
(80, 14, 80),
(81, 14, 81),
(82, 14, 82),
(83, 14, 83),
(84, 14, 84),
(85, 14, 85),
(86, 14, 86),
(87, 14, 87),
(88, 14, 88),
(89, 14, 89),
(90, 14, 90),
(91, 14, 91),
(92, 14, 92),
(93, 14, 93),
(94, 14, 94),
(95, 14, 95),
(96, 14, 96),
(97, 14, 97),
(98, 14, 98),
(99, 15, 99),
(100, 15, 100),
(101, 15, 101),
(102, 15, 102),
(103, 15, 103),
(104, 15, 104),
(105, 15, 105),
(106, 15, 106),
(107, 15, 107),
(108, 15, 108),
(109, 15, 109),
(110, 15, 110),
(111, 15, 111),
(112, 15, 112),
(113, 15, 113),
(114, 15, 114),
(115, 15, 115),
(116, 15, 116),
(117, 15, 117),
(118, 15, 118),
(119, 15, 119),
(120, 15, 120),
(121, 15, 121),
(122, 15, 122),
(123, 15, 123),
(124, 15, 124),
(125, 15, 125),
(126, 15, 126),
(127, 15, 127),
(128, 15, 128),
(129, 15, 129),
(130, 15, 130),
(131, 15, 131),
(132, 15, 132),
(133, 1, 133),
(134, 1, 134),
(135, 1, 135),
(136, 1, 136),
(137, 1, 137),
(138, 1, 138),
(139, 1, 139),
(140, 1, 140),
(141, 1, 141),
(142, 1, 142),
(143, 1, 143),
(144, 1, 144),
(145, 1, 145),
(146, 1, 146),
(147, 1, 147),
(148, 1, 148),
(149, 1, 149),
(150, 1, 150),
(151, 16, 151),
(152, 16, 152),
(153, 16, 153),
(154, 16, 154),
(155, 16, 155),
(156, 16, 156),
(157, 16, 157),
(158, 16, 158),
(159, 16, 159),
(160, 16, 160),
(161, 16, 161),
(162, 16, 162),
(163, 16, 163),
(164, 16, 164),
(165, 16, 165),
(166, 16, 166),
(167, 16, 167),
(168, 16, 168),
(169, 16, 169),
(170, 16, 170),
(171, 16, 171),
(172, 16, 172),
(173, 16, 173),
(174, 16, 174),
(175, 16, 175),
(176, 16, 176),
(177, 16, 177),
(178, 16, 178),
(179, 16, 179),
(180, 16, 180),
(181, 16, 181),
(182, 16, 182),
(183, 16, 183),
(184, 16, 184),
(185, 16, 185),
(186, 16, 186),
(187, 16, 187),
(188, 16, 188),
(189, 16, 189),
(190, 16, 190),
(191, 16, 191),
(192, 16, 192),
(193, 16, 193),
(194, 16, 194),
(195, 16, 195),
(196, 19, 196),
(197, 19, 197),
(198, 19, 198),
(199, 19, 199),
(200, 19, 200),
(201, 19, 201),
(202, 19, 202),
(203, 19, 203),
(204, 19, 204),
(205, 19, 205),
(206, 19, 206),
(207, 19, 207),
(208, 19, 208),
(209, 19, 209),
(210, 19, 210),
(211, 19, 211),
(212, 19, 212);

-- --------------------------------------------------------

--
-- Structure de la table `chapitres_exercices`
--

DROP TABLE IF EXISTS `chapitres_exercices`;
CREATE TABLE IF NOT EXISTS `chapitres_exercices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_chapitre` int NOT NULL,
  `id_exercice` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chapitres_exercices_fk0` (`id_chapitre`),
  KEY `chapitres_exercices_fk1` (`id_exercice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `chapitres_exercices`
--

TRUNCATE TABLE `chapitres_exercices`;
-- --------------------------------------------------------

--
-- Structure de la table `comptes`
--

DROP TABLE IF EXISTS `comptes`;
CREATE TABLE IF NOT EXISTS `comptes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(255) NOT NULL,
  `_password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `est_verifie` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(255) NOT NULL,
  `compile_auto` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `comptes`
--

TRUNCATE TABLE `comptes`;
--
-- Déchargement des données de la table `comptes`
--

INSERT INTO `comptes` (`id`, `pseudo`, `_password`, `email`, `est_verifie`, `token`, `compile_auto`) VALUES
(1, 'nathan', 'd1e0c3f827c573021da3df234c07a2ec', 'nathan@nathan', 0, 'RVGEIkjtLPaLp9sKIZ1pLDYQBZjMZR35', 0);

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

DROP TABLE IF EXISTS `cours`;
CREATE TABLE IF NOT EXISTS `cours` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_createur` int NOT NULL,
  `titre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `est_public` tinyint(1) NOT NULL,
  `_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cours_fk0` (`id_createur`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `cours`
--

TRUNCATE TABLE `cours`;
--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id`, `id_createur`, `titre`, `est_public`, `_description`) VALUES
(1, 1, 'MP2I - LLG - Mathématiques', 1, 'Le cours de l\'année scolaire 2021-2022, de la classe de MP2I du Lycée Louis-Le-Grand de Paris, tiré des pdfs du professeur de mathématiques Alain Troesch.<br />Pour plus d\'informations, <a href=\"http://alain.troesch.free.fr\">vous pouvez aller sur son site</a>');

-- --------------------------------------------------------

--
-- Structure de la table `cours_chapitres`
--

DROP TABLE IF EXISTS `cours_chapitres`;
CREATE TABLE IF NOT EXISTS `cours_chapitres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cour` int NOT NULL,
  `id_chapitre` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cours_chapitres_fk0` (`id_cour`),
  KEY `cours_chapitres_fk1` (`id_chapitre`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `cours_chapitres`
--

TRUNCATE TABLE `cours_chapitres`;
--
-- Déchargement des données de la table `cours_chapitres`
--

INSERT INTO `cours_chapitres` (`id`, `id_cour`, `id_chapitre`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 1, 21),
(22, 1, 22),
(23, 1, 23);

-- --------------------------------------------------------

--
-- Structure de la table `cours_groupes`
--

DROP TABLE IF EXISTS `cours_groupes`;
CREATE TABLE IF NOT EXISTS `cours_groupes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cour` int NOT NULL,
  `id_groupe` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cours_groupes_fk0` (`id_cour`),
  KEY `cours_groupes_fk1` (`id_groupe`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `cours_groupes`
--

TRUNCATE TABLE `cours_groupes`;
--
-- Déchargement des données de la table `cours_groupes`
--

INSERT INTO `cours_groupes` (`id`, `id_cour`, `id_groupe`) VALUES
(2, 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `demonstrations`
--

DROP TABLE IF EXISTS `demonstrations`;
CREATE TABLE IF NOT EXISTS `demonstrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_element` int NOT NULL,
  `id_compte` int NOT NULL,
  `titre` varchar(255) NOT NULL,
  `texte` text NOT NULL,
  `nb_accepte` int NOT NULL DEFAULT '0',
  `nb_refus` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `demonstrations_fk0` (`id_element`),
  KEY `demonstrations_fk1` (`id_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `demonstrations`
--

TRUNCATE TABLE `demonstrations`;
-- --------------------------------------------------------

--
-- Structure de la table `dernier_action`
--

DROP TABLE IF EXISTS `dernier_action`;
CREATE TABLE IF NOT EXISTS `dernier_action` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_compte` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `id_brouillon` int DEFAULT NULL,
  `id_brouillon_exo` int DEFAULT NULL,
  `id_fiche` int DEFAULT NULL,
  `id_chapitre` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dernier_action_fk0` (`id_compte`),
  KEY `dernier_action_fk1` (`id_brouillon`),
  KEY `dernier_action_fk2` (`id_brouillon_exo`),
  KEY `dernier_action_fk3` (`id_fiche`),
  KEY `dernier_action_fk4` (`id_chapitre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `dernier_action`
--

TRUNCATE TABLE `dernier_action`;
-- --------------------------------------------------------

--
-- Structure de la table `discussions`
--

DROP TABLE IF EXISTS `discussions`;
CREATE TABLE IF NOT EXISTS `discussions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `id_groupe` int DEFAULT NULL,
  `id_compte1` int DEFAULT NULL,
  `id_compte2` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discussions_fk0` (`id_groupe`),
  KEY `discussions_fk1` (`id_compte1`),
  KEY `discussions_fk2` (`id_compte2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `discussions`
--

TRUNCATE TABLE `discussions`;
-- --------------------------------------------------------

--
-- Structure de la table `discussions_messages`
--

DROP TABLE IF EXISTS `discussions_messages`;
CREATE TABLE IF NOT EXISTS `discussions_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_discussion` int NOT NULL,
  `id_message` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discussions_messages_fk0` (`id_discussion`),
  KEY `discussions_messages_fk1` (`id_message`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `discussions_messages`
--

TRUNCATE TABLE `discussions_messages`;
-- --------------------------------------------------------

--
-- Structure de la table `element`
--

DROP TABLE IF EXISTS `element`;
CREATE TABLE IF NOT EXISTS `element` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `texte` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_compte` int NOT NULL,
  `_type` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `element`
--

TRUNCATE TABLE `element`;
--
-- Déchargement des données de la table `element`
--

INSERT INTO `element` (`id`, `titre`, `texte`, `id_compte`, `_type`) VALUES
(1, 'Suite numérique', 'Une%20suite%20num%C3%A9rique%20(r%C3%A9elle%20ou%20complexe)%20est%20une%20famille%20$(u_n)_n%7B%5Cin%20%5CN%7D$%20d\'%C3%A9l%C3%A9ments%20dans%20$%5CR$%20ou%20$%5CC$%20index%C3%A9e%20sur%20$%5CN$%20(parfois%20sur%20$%5CN%5E*$%20ou%20sur%20$%5CN%20%5Cbackslash%20%5C%20%5C%7B0,%20%5Cdots,%20n_0-1%5C%7D$).%0AIl%20s\'agit%20donc%20d\'une%20fonction%20de%20$%5CN$%20dans%20$%5CR$%20ou%20$%5CC$.', 1, 2),
(2, 'Limite d\'une suite, convergente, divergente', '-%20Une%20suite%20$(u_n)_%7Bn%20%5Cin%20%5CN%7D$%20%C3%A0%20valeurs%20dans%20$%5CK%20=%20%5CR$%20ou%20$%5CC$%20admet%20une%20limite%20$l%20%5Cin%20%5CK$%20si%20et%20seulement%20si%20%20$$%5Cforall%20%5Cvarepsilon%20%5Cgt%200,%20%5Cexists%20N%20%5Cin%20%5CN,%20%5Cforall%20n%20%5C%20%5Cgt%20N,u_n%20%5Cin%20B(l,%20%5Cve)$$.%0A%0A-%20Si%20$(u_n)_%7Bn%20%5Cin%20%5CN%7D$%20admet%20une%20limite%20$l%20%5Cin%20%5CK$,%20on%20dit%20qu\'elle%20est%20**convergente**.%0A%0A-%20Si%20$(u_n)_%7Bn%5Cin%20%5CN%7D$%20n\'admet%20aucun%20$l$%20de%20$%5CK$%20comme%20limite,%20alors%20on%20dit%20que%20$(u_n)_%7Bn%5Cin%5CN%7D$%20est%20**divergente**.', 1, 2),
(3, 'Formule propositionnelle', '', 1, 2),
(4, 'Unicité de la limite', 'La%20limite%20d\'une%20suite%20r%C3%A9elle%20ou%20complexe,%20si%20elle%20existe%20(dans%20$%5Col%7BR%7D$%20ou%20dans%20$%5CC$%20par%20exemple),%20est%20unique', 1, 5),
(5, 'Diverses caractérisations de la convergence', 'Soit%20$(u_n)_%7Bn%20%5Cin%20%5CN%7D$%20une%20suite%20r%C3%A9elle%20ou%20complexe.%0A%0ALes%20propositions%20suivantes%20sont%20%C3%A9quivalentes%20:%20%0A%0A-%20$(i)$%20$(u_n)_%7Bn%5Cin%5CN%7D$%20converge%20vers%20$l$%0A-%20$(ii)$%20$%5Cforall%20%5Cve%20%5Cgt%200,%20%5Cexists%20N%20%5Cin%20%5CN,%20%5Cforall%20n%20%5Cgt%20N,%20%7Cu_n-l%7C%20%5Clt%20%5Cve$%0A-%20$(iii)$%20pour%20tout%20voisinage%20$V$%20de%20$l$,%20il%20existe%20$N$%20tel%20que%20pour%20tout%20$n%20%5Cgeqslant%20N$,%20$u_n%20%5Cin%20V$', 1, 4),
(6, 'Limite $+\\infty$ ou $-\\infty$ d\'une suite réelle', 'Soit%20$(u_n)_%7Bn%5Cin%20%5CN%7D$%20une%20suite%20r%C3%A9elle%0A%0A**1.**%20On%20dit%20que%20$(u_n)_%7Bn%5Cin%5CN%7D$%20admet%20la%20limite%20$%20%5Cinfty$%20si%20et%20seulement%20si%20:%20$%5Cforall%20A%20%5Cin%20%5CR,%20%5Cexists%20N%20%5Cin%20%5CN,%20%5Cforall%20n%20%5Cgeqslant%20N,%20u_n%5Cgt%20A$%0A%0A%0A**2.**%20On%20dit%20que%20$(u_n)_%7Bn%5Cin%5CN%7D$%20admet%20la%20limite%20$-%5Cinfty$%20si%20et%20seulement%20si%20:%20$%5Cforall%20A%20%5Cin%20%5CR,%20%5Cexists%20N%20%5Cin%20%5CN,%20%5Cforall%20n%20%5Cgeqslant%20N,%20u_n%5Clt%20A$%0A', 1, 2),
(7, 'Caractérisation par voisinage pour les limites dans $\\ol{R}$', 'Soit%20$(u_n)_%7Bn%5Cin%5CN%7D$%20une%20suite%20r%C3%A9elle,%20et%20$l%20%5Cin%20%5Col%7B%5CR%7D$.%0A%0AAlors%20$(u_n)_%7Bn%5Cin%20%5CN%7D$%20admet%20la%20limite%20$l$%20si%20et%20seulement%20si%20pour%20tout%20voisinage%20$V$%20de%20$l$,%20il%20existe%20$N$%20tel%20que%20pour%20tout%20$n%20%5Cgeqslant%20N,%20u_n%20%5Cin%20V$', 1, 4),
(8, 'Suite stationnaire', 'Une%20suite%20$(u_n)$%20est%20dite%20stationnaire%20s\'il%20existe%20$N%20%5Cin%20%5CN$%20tel%20que%20pour%20tout%20$n%20%5Cgeqslant%20N$,%20$u_n%20=%20u_N$', 1, 2),
(9, 'Suites stationnaires à valeurs entières', 'Soit%20$(u_n)_%7Bn%20%5Cin%20%5CN%7D$%20une%20suite%20%C3%A0%20valeurs%20dans%20$%5CZ$.%0A%0ALa%20suite%20$(u_n)$%20est%20convergente%20si%20et%20seulement%20si%20elle%20est%20stationnaire.', 1, 4),
(10, 'Caractérisation de la convergence pour d\'une suite complexe', 'Soit%20$(u_n)_%7Bn%5Cin%5CN%7D$%20une%20suite%20complexe.%0A%0AAlors%20$(u_n)_%7Bn%5Cin%5CN%7D$%20converge%20dans%20$%5CC$%20si%20et%20seulement%20$(%5CRe(u_n))_%7Bn%5Cin%5CN%7D$%20et%20$(%5CIm(u_n))_%7Bn%5Cin%5CN%7D$%20convergent%20dans%20$%5CR$,%20et%20dans%20ce%20cas%20:%20$%5Clim%20u_n%20=%20%5Clim%20%5CRe(u_n)%20%20%5C%20%20i%5Clim%20%5CIm(u_n)$%0A%0A', 1, 4),
(11, 'Suite numérique', 'Une suite num&#233;rique (r&#233;elle ou complexe) est une famille $(u_n)_{n\\in\\N}$ d\'&#233;l&#233;ments de $\\R$ ou de $\\C$ index&#233;e sur $\\N$ (ou sur $\\N \\backslash \\{0, \\dots, n_0\\}$).&#60;br /&#62;&#60;br /&#62;Il s\'agit donc d\'une fonction de $\\N$ dans $\\R$ ou dans $\\C$', 1, 2),
(12, 'Limite d\'une suite, convergence, divergence', '- Une suite $(u_n)_{n\\in\\N}$ &#224; valeurs dans $\\K = \\R$ ou $\\C$ admet une limite $l \\in \\K$ si et seulement si : $$\\forall \\ve \\gt 0, \\exists N \\in \\N, \\forall n \\gt \\N, u_n \\in B(l, \\ve)$$&#60;br /&#62;&#60;br /&#62;- Si $(u_n)_{n\\in\\N}$ admet une limite $l \\in \\K$, alors on dit qu\'elle est convergente &#60;br /&#62;&#60;br /&#62;- Si $(u_n)_{n\\in\\N}$ n\'admet aucun $l$ de $\\K$ comme limite, alors on dit que $(u_n)_{n\\in\\N}$ est divergente (dans $\\K$)', 1, 2),
(13, 'Diverses caractérisations de la convergence', 'Soit $(u_n)_{n \\in \\N}$ une suite r&#233;elle ou complexe.&#60;br /&#62;&#60;br /&#62;Les propositions suivantes sont &#233;quivalentes :&#60;br /&#62;&#60;br /&#62;$(i)$ : $(u_n)_{n \\in \\N}$ converge vers $l \\in \\C$&#60;br /&#62;&#60;br /&#62;$(ii)$ : $\\forall \\ve \\gt 0, \\exists N \\in \\N, \\forall n \\gt N, |u_n-l| \\lt \\ve$&#60;br /&#62;&#60;br /&#62;$(iii)$ : Pour tout voisinage $V$ de $l$, il existe $N$ tel que pour tout $n \\gt N$, $u_n \\in V$', 1, 4),
(14, 'Limite en $+\\infty$ ou $-\\infty$ d\'une suite réelle', 'Soit $(u_n)_{n \\in \\N}$ une suite r&#233;elle.&#60;br /&#62;&#60;br /&#62;**1.** On dit que $(u_n)_{n \\in \\N}$ admet la limite $+\\infty$ si et seulement si : $$\\forall A \\in \\R, \\exists N \\in \\N, \\forall n \\gt N, u_n\\gt A$$&#60;br /&#62;&#60;br /&#62;**2.** On dit que $(u_n)_{n \\in \\N}$ admet la limite $-\\infty$ si et seulement si : $$\\forall A \\in \\R, \\exists N \\in \\N, \\forall n \\gt N, u_n\\lt A$$', 1, 2),
(15, 'Unicité de la limite', 'La limite d\'une suite r&#233;elle ou complexe, si elle existe (dans $\\ol{R}$ ou dans $\\C$), est unique', 1, 5),
(16, 'Caractérisation par voisinage pour les limites', 'Soit $(u_n)_{n \\in \\N}$ une suite r&#233;elle, et $l \\in \\ol{\\R}$.&#60;br /&#62;&#60;br /&#62;Alors $(u_n)_{n \\in \\N}$ admet la limite $l$ si et seulement si pour tout voisinage $V$ de $l$, il existe $N$ tel que pour tout $n \\geqslant N, u_n \\in V$', 1, 4),
(17, 'Suite stationnaire', 'Une suite $(u_n)_{n \\in \\N}$ est dite stationnaire s\'il existe $N \\in \\N$ tel que pour tout $n \\geqslant N, u_n = u_N$', 1, 2),
(18, 'Suite stationnaire à valeurs entières', 'Soit $(u_n)_{n \\in \\N}$ une suite &#224; valeurs dans $\\Z$.&#60;br /&#62;&#60;br /&#62;La suite $(u_n)_{n \\in \\N}$ est convergente si et seulement si elle est stationnaire.', 1, 4),
(19, 'Caractérisation de la convergence d\'une suite complexe', 'Soit $(u_n)_{n \\in \\N}$ une suite complexe.&#60;br /&#62;&#60;br /&#62;Alors $(u_n)_{n \\in \\N}$ converge dans $\\C$ si et seulement si $(\\Re(u_n))_{n\\in\\N}$  et $(\\Im(u_n))_{n\\in\\N}$ convergent dans $\\R$, et dans ce cas : $$\\lim u_n = \\lim \\Re(u_n) + i\\lim\\Im(u_n)$$', 1, 4),
(20, 'Caractérisation de la suite de vecteur', 'Soit $(u_n)_{n \\in \\N}$ une suite de vecteur dans $\\R^p$.&#60;br /&#62;On note pour tout $n$, $\\left ( \\begin{array}{ll} u_{n,1} \\\\ \\ \\ . \\\\ \\ \\  . \\\\ \\ \\ . \\\\ u_{n,p} \\end{array} \\right )$ les coordonn&#233;es de $u_n$.&#60;br /&#62;&#60;br /&#62;Alors $(u_n)_{n\\in\\N}$ converge dans $\\R^p$ si et seulement si pour tout $k \\in [\\![1, p]\\!]$, $(u_{n,k})_{n\\in\\N}$ converge dans $\\R$.&#60;br /&#62;Dans ce cas : &#60;br /&#62;$$\\lim u_n = \\left ( \\begin{array}{ll} \\lim u_{n,1} \\\\ \\ \\ . \\\\ \\ \\  . \\\\ \\ \\ . \\\\ \\lim u_{n,p} \\end{array} \\right )$$', 1, 4),
(21, 'Limite d\'un translaté ', 'Si $(u_n)_{n \\in \\N}$ tend vers $l$, alors $(u_{n+1})_{n \\in \\N}$ et $(u_{n-1})_{n \\in \\N}$ aussi', 1, 4),
(22, 'Caractérisation d\'une suite bornée grâce à la convergence', 'Toute suite convergente (dans $\\R$ ou dans $\\C$, mais pas dans $\\ol{\\R}$) est born&#233;e', 1, 4),
(23, 'Lemme du tunnel', 'Soit $(u_n)_{n \\in \\N}$ une suite, et $l \\in \\R$.&#60;br /&#62;&#60;br /&#62;Alors $(u_n)_{n \\in \\N}$ converge vers $l$ si et seulement si pour tout $(l\', l\'\') \\in \\R^2$ tels que $l\' \\lt l \\lt l\'\'$, il existe $N$ tel que $$\\forall n \\geqslant N, l\' \\lt u_n \\lt l\'\'$$', 1, 4),
(24, 'Caractérisation séquentielle de la limite', 'Soit $X$ un sous-ensemble de $\\R$ (ou $\\R^2$), $f:X\\to \\R$ (ou $\\C$), et $a \\in \\ol{X}$.&#60;br /&#62;&#60;br /&#62;Alors $f$ admet une limite $l$ en $a$ si et seulement si pour toute suite $(u_n)$ &#224; valeurs dans $X$ et telle que $u_n \\to a$, on a $f(u_n) \\to l$', 1, 5),
(25, 'Caractérisation séquentielle de la continuité', 'Soit $X$ un sous-ensemble de $\\R$, $f: X \\to \\R$ (ou $\\C$), et $a \\in X$.&#60;br /&#62;&#60;br /&#62;Alors $f$ est continue en $a$ si et seulement si pour tout suite $(u_n)$ &#224; valeurs dans $X$ et telle que $u_n\\to a$, on a $f(u_n) \\to f(a)$', 1, 5),
(26, 'Opérations sur les limites finies', 'Soit $(u_n)_{n\\in\\N}$ et $(v_n)_{n\\in\\N}$ deux suites r&#233;elles ou complexes convergentes, et $\\lambda$ et $\\mu$ deux scalaires. Alors : &#60;br /&#62;&#60;br /&#62;**1.** $(|u_n|)_{n\\in\\N}$ est convergente, et $\\lim |u_n| = |\\lim u_n|$&#60;br /&#62;&#60;br /&#62;**2.** $(\\lambda u_n + \\mu v_n)$ est convergente, et $\\lim (\\lambda u_n + \\mu v_n) = \\lambda \\cdot \\lim u_n + \\mu \\cdot \\lim v_n$&#60;br /&#62;&#60;br /&#62;**3.** $(u_n v_n)_{n\\in \\N}$ est convergente, et $\\lim (u_nv_n) = \\lim u_n \\cdot \\lim v_n$&#60;br /&#62;&#60;br /&#62;**4.** si $\\lim vu_n \\neq 0$, alors $v_n \\neq 0$ &#224; partir d\'un certain rang; ainsi $(\\frac{u_n}{v_n})$ est d&#233;finie &#224; partir d\'un certain rang, est convergente, et $\\lim \\frac{u_n}{v_n} = \\frac{\\lim u_n}{\\lim v_n}$', 1, 5),
(27, 'Opérations impliquant des limites infinies', 'Dans le cas o&#249; $(u_n)_{n\\in\\N}$ et $(v_n)_{n\\in\\N}$ sont des suites r&#233;elles, les r&#233;sultats ci-dessus restent vrais si la limite de $(u_n)_{n\\in\\N}$ et/ou $(v_n)_{n\\in\\N}$ est infinie, avec les r&#232;gles suivante : &#60;br /&#62;&#60;br /&#62; - $a + \\infty = +\\infty$&#60;br /&#62;&#60;br /&#62; - $+\\infty + \\infty = + \\infty$&#60;br /&#62;&#60;br /&#62; - $a \\cdot (+\\infty) = \\pm \\infty$&#60;br /&#62;&#60;br /&#62; - $(\\pm \\infty) \\cdot ( \\pm \\infty) = \\pm \\infty$&#60;br /&#62;&#60;br /&#62; - $\\frac{1}{\\pm\\infty}  = 0$', 1, 5),
(28, 'Avertissement : Formes indéterminées', 'En revanche, les op&#233;rations arithm&#233;tiques suivantes ne sont pas d&#233;finies, et donnent des formes ind&#233;termin&#233;es : &#60;br /&#62;&#60;br /&#62; - $\\infty - \\infty$&#60;br /&#62;&#60;br /&#62; - $0 \\cdot \\infty$&#60;br /&#62;&#60;br /&#62; - $\\frac{\\infty}{\\infty}$&#60;br /&#62;&#60;br /&#62; - $\\frac{0}{0}$', 1, 1),
(29, 'Produit $0 \\times$borné', 'Soit $(u_n)_{n\\in\\N}$ et $(v_n)_{n\\in\\N}$ deux suites r&#233;elles ou complexes telles que $(u_n)_{n\\in\\N}$ tende vers $0$ et $(v_n)_{n\\in\\N}$ soit born&#233;e.&#60;br /&#62;&#60;br /&#62;Alors $(u_nv_n)_{n\\in\\N}$ tend vers $0$.', 1, 4),
(30, 'Passage à la limite pour les puissances', 'Soit $(u_n)_{n\\in\\N}$ et $(v_n)_{n\\in\\N}$ deux suites r&#233;elles, $(u_n)$ &#233;tant de plus strictement positive.&#60;br /&#62;&#60;br /&#62;On suppose que $u_n \\to l$ et $v_n \\to l\'$, et que $(l, l\') \\notin \\{ (+\\infty, 0), (0,0), (1, +\\infty), (1, -\\infty) \\}$&#60;br /&#62;&#60;br /&#62;Alors : $\\lim u_n^{v_n}  = l^{l\'}$', 1, 4),
(31, 'Formes indéterminées pour les puissances', 'On notera les formes ind&#233;termin&#233;es relatives aux exponentiations :&#60;br /&#62;&#60;br /&#62;$\\infty^0$, $0^0$, et $1^{\\infty}$', 1, 1),
(32, 'Opérations sur les limites des fonctions', 'Les r&#232;gles relatives aux limites des suites restent valables pour les limites des fonctions en un point fini ou infini.', 1, 5),
(33, 'Conservation des inégalités larges', 'Soit $(u_n)_{n\\in\\N}$ et $(v_n)_{n\\in\\N}$ deux suites r&#233;elles, et $N \\in \\N$ tels que : &#60;br /&#62;$\\forall n \\gt N, u_n \\leqslant v_n$.&#60;br /&#62;&#60;br /&#62;Alors, si $(u_n)_{n\\in\\N}$ et $(v_n)_{n\\in\\N}$ admettent des limites dans $\\ol{\\R}$, $\\lim\\limits_{n \\to +\\infty} u_n \\leqslant \\lim\\limits_{n \\to \\infty} v_n$', 1, 1),
(34, 'Théorème de convergence vers encadrement', 'Soit $(u_n)_{n\\in\\N}$, $(v_n)_{n\\in\\N}$ et $(w_n)_{n\\in\\N}$ trois suites r&#233;elles, et $N \\in \\N$, tels que : $\\forall n \\geqslant N, u_n \\leqslant v_n \\leqslant w_n$.&#60;br /&#62;&#60;br /&#62;Si $(u_n)_{n\\in\\N}$ et $(w_n)_{n\\in\\N}$ convergent toutes deux vers une m&#234;me limite finie, alors $(v_n)_{n\\in\\N}$ converge aussi, et &#60;br /&#62;$\\lim u_n = \\lim v_n = \\lim w_n$', 1, 5),
(35, 'Théorème de divergence par minoration ou majoration', 'Soit $(u_n)_{n\\in\\N}$, $(v_n)_{n\\in\\N}$ et $N \\in \\N$ tels que pour tout $n \\geqslant N$, $u_n \\leqslant v_n$&#60;br /&#62;&#60;br /&#62;**1.** Si $(u_n)_{n\\in\\N}$ tend vers $+\\infty$, alors $(v_n)_{n\\in\\N}$ tend vers $+\\infty$&#60;br /&#62;&#60;br /&#62;**2.** Si $(v_n)_{n\\in\\N}$ tend vers $-\\infty$, alors $(u_n)_{n\\in\\N}$ tend vers $-\\infty$', 1, 5),
(36, 'Méthode de calcul de limites par majoration/minoration', '- Si on parvient &#224; trouver une majoration : $\\forall n \\geqslant N, |u_n - l | \\leqslant v_n$, o&#249; $(v_n)_{n\\in\\N}$ est une suite de limite nulle, alors $(u_n)_{n\\in\\N}$ tend vers $l$.&#60;br /&#62;&#60;br /&#62;- Si on parvient &#224; minorer $(u_n)_{n\\in\\N}$ par une suite de limite $+\\infty$, alors $(u_n)_{n\\in\\N}$ tend vers $+\\infty$&#60;br /&#62;&#60;br /&#62;&#60;br /&#62;- Si on parvient &#224; majorer $(u_n)_{n\\in\\N}$ par une suite de limite $-\\infty$, alors $(u_n)_{n\\in\\N}$ tend vers $-\\infty$', 1, 7),
(37, 'Comparaison à une suite géométrique', '- Etududier l\'existence et le cas &#233;ch&#233;ant la valeur de $\\lim \\left |  \\frac{u_{n+1}}{u_n} \\right  |$&#60;br /&#62;&#60;br /&#62;&#60;br /&#62;- En cas d\'existence, notons $l = \\lim \\left | \\frac{u{n+1}}{u_n} \\right |$.&#60;br /&#62;&#60;br /&#62;    * Si $l\\lt 1$, on peut majorer &#224; partir d\'un certain rang $(|u_n|)_{n\\in\\N}$ par une suite g&#233;om&#233;trique de raison $r \\in ]l, 1[$, et on peut en d&#233;duire que $(u_n)_{n\\in\\N}$ tend vers $0$.&#60;br /&#62;&#60;br /&#62;    * Si $l \\lt 1$, on peut minorer &#224; partir d\'un certain rang $(|u_n|)_{n\\in\\N}$ par une suite g&#233;om&#233;trique de raison $r \\in ]1, l[$, donc $(|u_n|)_{n\\in\\N}$ tend vers  $+\\infty$. Si $(u_n)$ est de signe constant pour $n$ assez grand, on en d&#233;duit sa convergence vers un des deux infinis, sinon, la suite ne converge pas dans $\\ol{\\R}$.&#60;br /&#62;&#60;br /&#62;    * Si $l=1$, on ne peut pas conclure &#60;br /&#62; ', 1, 7),
(38, 'Conservation des inégalités et encadrements pour les fonctions', 'Les th&#233;or&#232;mes de conservations des in&#233;galit&#233;s et d\'encadrements pour les suites restent valables pour les fonctions (en un point fini ou infini)', 1, 1),
(39, 'Théorème de la convergence monotone', 'Soit $(u_n)_{n\\in\\N}$ une suite r&#233;elle.&#60;br /&#62;&#60;br /&#62;**1.** Si $(u_n)_{n\\in\\N}$ est croissante et major&#233;e, alors $(u_n)_{n\\in\\N}$ converge dans $\\R$.&#60;br /&#62;&#60;br /&#62;**2.** Si $(u_n)_{n\\in\\N}$ est croissante et non major&#233;e, alors $(u_n)_{n\\in\\N}$ diverge vers $+\\infty$&#60;br /&#62;&#60;br /&#62;**3.** Si $(u_n)_{n\\in\\N}$ est d&#233;croissante et minor&#233;e, alors $(u_n)_{n\\in\\N}$ converge dans $\\R$&#60;br /&#62;&#60;br /&#62;**4.** Si $(u_n)_{n\\in\\N}$ est d&#233;croissante et non minor&#233;e, alors $(u_n)_{n\\in\\N}$ diverge vers $-\\infty$', 1, 5),
(40, 'Suites adjacentes', 'Soit $(u_n)_{n\\in\\N}$ et $(v_n)_{n\\in\\N}$ deux suites adjacentes.&#60;br /&#62;&#60;br /&#62;On dit qu\'elles sont adjacentes si et seulement si :&#60;br /&#62;&#60;br /&#62;**1.** l\'une est croissante et l\'autre d&#233;croissante&#60;br /&#62;&#60;br /&#62;**2.** $(v_n - u_n)_{n\\in\\N}$ tend vers $0$', 1, 2),
(41, 'Comparaison de deux suites adjacentes', 'Soit $(u_n)_{n\\in\\N}$ et $(v_n)_{n\\in\\N}$ deux suites adjacentes (avec $(u_n)_{n\\in\\N}$ croissante et $(v_n)_{n\\in\\N}$ d&#233;croissante).&#60;br /&#62;&#60;br /&#62;Alors, pour tout $n \\in \\N$, $u_n \\leqslant v_n$', 1, 4),
(42, 'Théorème des suites adjacentes', 'Soit $(u_n)_{n\\in\\N}$ et $(v_n)_{n\\in\\N}$ deux suites r&#233;elles adjacentes.&#60;br /&#62;&#60;br /&#62;Alors $(u_n)_{n\\in\\N}$ et $(v_n)_{n\\in\\N}$ convergent, et $\\lim\\limits_{n \\to +\\infty} u_n = \\lim\\limits_{n \\to \\infty} v_n$', 1, 5),
(43, 'Critère spécial de convergence des séries alternées, CSCSA', 'Soit $\\sum_{n\\neq0} (-1)^na_n$ une s&#233;rie altern&#233;e, c\'est &#224; dire telle que $(a_n)$ soit d&#233;croissante et de limite nulle.&#60;br /&#62;&#60;br /&#62;Alors $\\sum (-1)^na_n$ converge. De plus, le \"reste\" de la s&#233;rie v&#233;rifie &#60;br /&#62;$$\\left | \\sum_{k=n+1}^{+\\infty} (-1)^k a_n \\right | \\leqslant a_{n+1}$$', 1, 5),
(44, 'Suite extraite, fonction extractrice', '**1.** Soit $(u_n)_{n\\in\\N}$. Une **suite extraite** de $(u_n)_{n\\in\\N}$ est une suite $(v_n)_{n\\in\\N}$ telle qu\'il existe $ \\varphi : \\N \\to \\N$ strictement croissante telle que pour tout $n \\in \\N, v_n = u_{\\varphi(n)}$*&#60;br /&#62;&#60;br /&#62;**2.** La fonction $\\varphi$ est appell&#233;e **fonction extractrice** de la suite extraite $(v_n)_{n\\in\\N}$', 1, 2),
(45, 'Lemme des pics ou lemme du soleil levant', 'De toute suite r&#233;elle on peut extraire une suite monotone', 1, 8),
(46, 'Théorème de convergence des suites extraites', 'Soit $(u_n)_{n\\in\\N}$ une suite convergente dans $\\ol{\\R}$ ou dans $\\C$.&#60;br /&#62;&#60;br /&#62;Alors toutes les suites extraites de $(u_n)_{n\\in\\N}$ sont convergentes, de m&#234;me limite que $(u_n)$.', 1, 5),
(47, 'Convergence des suites extraites paires et impaires', 'Soit $(u_n)_{n\\in\\N}$ une suite r&#233;elle ou complexe.&#60;br /&#62;&#60;br /&#62;Alors $(u_n)_{n\\in\\N}$ converge dans $\\ol{\\R}$ ou $\\C$ si et seulement si $(u_{2n})_{n\\in\\N}$ et $(u_{2n+1})_{n\\in\\N}$ convergent vers une m&#234;me limite $l$, et dans ce cas $\\lim u_n = l$.', 1, 4),
(48, 'Valeur d\'adhérence', 'Soit $(u_n)_{n\\in\\N}$ une suite de r&#233;els (ou complexes). On dit que le r&#233;el (ou complexe, ou $\\pm \\infty$) $x$ est une **valeur d\'adh&#233;rence** de la suite $(u_n)_{n\\in\\N}$ s\'il existe une suite extraite $(v_n)$ de $(u_n)$ telle que $\\lim v_n = x$', 1, 2),
(49, 'Unicité de la valeur d\'adhérence', 'Si $u_n \\to l \\in \\ol{\\R}$, alors $l$ est valeur d\'adh&#233;rence de $(u_n)$ et c\'est la seule dans $\\ol{\\R}$', 1, 4),
(50, 'Caractérisation des valeurs d\'adhérence', 'Soit $(u_n)_{n\\in\\N}$ une suite r&#233;elle, et $a \\in \\ol{\\R}$.&#60;br /&#62;&#60;br /&#62;Alors $a$ est valeur d\'adh&#233;rence de $(u_n)_{n\\in\\N}$ si et seulement si pour tout voisinage $V$ de $a$, il existe une infinit&#233; d\'indices $n$ tels que $u_n \\in V$, c\'est-&#224;-dire s\'il existe un sous-ensemble infini I de $\\N$ tel que pour tout $n \\in I$, $u_n \\in V$', 1, 4),
(51, 'Lois de composition', 'On distingue deux types de lois de compositions (op&#233;rations), suivant que la loi d&#233;crit une op&#233;ration entre deux &#233;l&#233;ments de l\'ensemble $E$, ou entre un &#233;l&#233;ment de $E$ et un &#233;l&#233;ment d\'un ensemble externe $\\Omega$, appel&#233; domaine d\'op&#233;rateur.&#60;br /&#62;&#60;br /&#62; - Une **loi de composition interne** est une application de $\\varphi : E \\times \\!\\! E$ dans $E$, souvent not&#233;e de fa&#231;on op&#233;rationnelle plut&#244;t que fonctionnelle (par exemple $x + y$ au lieu de $\\varphi(x,y)$ pour d&#233;signer une addition)&#60;br /&#62;&#60;br /&#62; - Une **loi de composition externe &#224; gauche** sur $E$, d\'ensemble d\'op&#233;rateurs $\\Omega$, est une application de $\\Omega \\times \\!\\! E$ dans $E$, &#233;galement not&#233;e de fa&#231;on op&#233;rationnelle le plus souvent (par exemple $\\lambda \\cdot x$ au lieu de $\\varphi(\\lambda,x)$)&#60;br /&#62;&#60;br /&#62; - Une **loi de composition externe &#224; droite** sur $E$ d\'ensemble d\'op&#233;rateurs $\\Omega$ est une application $E \\times \\!\\! \\Omega \\to E$', 1, 2),
(52, 'Associativité, commutativité', ' - On dit que $\\bs $ est **associative** ssi : $\\forall (x, y, z) \\in E^3, (x \\bs y) \\bs z = x \\bs (y \\bs z)$&#60;br /&#62;&#60;br /&#62;- On dit que $\\bs $ est **commutative** ssi : $\\forall (x, y) \\in E^2, x \\bs y = y \\bs x$', 1, 2),
(53, 'Parenthésage admissible', 'Un parenth&#233;sage admissible d\'une expression form&#233;e de produits $\\bs $ d\'&#233;l&#233;ments $x_1, \\dots, x_n$ de $E$ est un parenth&#233;sage qui permet de regrouper 2 par 2 des &#233;l&#233;ments de $x1, \\dots, x_n$, ou des termes calcul&#233;s &#224; partir de ceux-ci par un parenth&#233;sage plus fin. De fa&#231;on plus rigoureuse, on d&#233;finit cette notion par induction structurelle : &#60;br /&#62;&#60;br /&#62; - (initialisation) les expressions $x$ constitu&#233;s d\'un unique &#233;l&#233;ments sont munis d\'un parenth&#233;sage admissible&#60;br /&#62;&#60;br /&#62; - si $A_1$ et $A_2$ sont deux expressions en $x1, \\dots, x_k$ et $x_{k+1}, \\dots, x_n$ munis d\'un parenth&#233;sage admissible, alors $(A_1 \\bs A_2)$ est muni d\'un parenth&#233;sage admissible.', 1, 2),
(54, 'Associativité généralisée', 'Soit $\\bs $ une loi associative sur $E$, et $x_1, \\dots, x_n$ des &#233;l&#233;ments de $E$.&#60;br /&#62;&#60;br /&#62;Alors l\'expression de $x_1 \\bs x_2 \\bs \\dots \\bs x_n$ ne d&#233;pend pas du parenth&#233;sage admissible choisi pour cette expression (donc de l\'ordre dans lequel on effectue ces op&#233;rations).', 1, 5),
(55, 'Commutativité généralisée', 'Soit $\\bs $ une loi commutative et associative sur $E$, et $x_1, \\dots, x_n$ des &#233;l&#233;ments de $E$.&#60;br /&#62;&#60;br /&#62;Alors pour tout $\\sigma \\in \\mathfrak{S}_n$, $$x_1 \\bs x_2 \\bs \\dots \\bs x_n = x_{\\sigma(1)} \\bs x_{\\sigma(2)} \\bs \\dots \\bs x_{\\sigma(n)}$$ ', 1, 5),
(56, 'Notation : Itération d\'une loi', 'Soit $\\bs $ une loi associative sur $E$, $n$ un &#233;l&#233;ment de $\\N^*$ et $x$ un &#233;l&#233;ment de $E$.&#60;br /&#62;&#60;br /&#62;On note $x^{\\bs n}$, ou plus simplement $x^n$ lorsqu\'il n\'y a pas d\'ambigu&#239;t&#233;, l\'it&#233;ration de la loi $\\bs $, c\'est &#224; dire $$x^{\\bs n} = x \\bs x \\bs \\dots \\bs x,$$&#60;br /&#62;le nombre de termes $x$ &#233;tant &#233;gal &#224; $n$.&#60;br /&#62;&#60;br /&#62;Pour une d&#233;finition plus rigoureuse, par r&#233;currence, $x^{\\bs 1} = x$, et pour tout $n \\in \\N^*$, $x^{\\bs (n+1)} = x^{\\bs n} \\bs x$', 1, 1),
(57, 'Element neutre', 'Soit $e$ un &#233;l&#233;ment de $E$.&#60;br /&#62;&#60;br /&#62;On dit que $e$ est un **&#233;l&#233;ment neutre** pour la loi $\\bs $ si pour tout $x\\in E$, $e\\bs x = x = x \\bs e$.&#60;br /&#62;&#60;br /&#62;On trouve aussi la notion de neutre &#224; gauche ou &#224; droite si une seule de ces deux &#233;galit&#233;s est satisfaite.', 1, 2),
(58, 'Unicité du neutre', 'L\'&#233;l&#233;ment neutre, s\'il existe, est unique', 1, 4),
(59, 'Element n°9', '', 1, 1),
(60, 'Element symétrique', 'Supposons que $E$ admet un &#233;l&#233;ment neutre $e$ pour la loi $\\bs $. Soit $x \\in E$.&#60;br /&#62;&#60;br /&#62; - On dit que $y$ est sym&#233;trique &#224; gauche de $x$ pour la loi $\\bs $, si $y \\bs x = e$&#60;br /&#62;&#60;br /&#62; - On dit que $y$ est sym&#233;trique &#224; droite de $x$ pour la loi $\\bs $, si $x \\bs y = e$&#60;br /&#62;&#60;br /&#62; - On dit que $y$ est sym&#233;trique de $x$ pour la loi $\\bs $, si $y$ est un sym&#233;trique &#224; droite et &#224; gauche de $x$.&#60;br /&#62;&#60;br /&#62; - On dit que $x$ est sym&#233;trisable si $x$ admet au moins un sym&#233;trique.', 1, 2),
(61, 'Unicité du symétrique', 'Si $\\star$ est associative, alors, en cas d\'existence, le sym&#233;trique est unique.', 1, 4),
(62, 'Symétrique de $x \\bs y$', 'Supposons $\\bs$ associative.&#60;br /&#62;Soit $(x,y) \\in E^2$.&#60;br /&#62;&#60;br /&#62;Si $x$ et $y$ sont sym&#233;trisables, de sym&#233;triques $x^s$ et $y^s$, alors $x \\bs y$ est sym&#233;trique $y^s \\bs x^s$', 1, 4),
(63, 'Element absorbant', 'Soit $x \\in E$.&#60;br /&#62;&#60;br /&#62; - On dit que $x$ est un **&#233;l&#233;ment absorbant &#224; gauche** pour $\\bs$ ssi : $\\forall \\ y \\in E$, $x \\bs y = x$&#60;br /&#62;&#60;br /&#62; - On dit que $x$ est un **&#233;l&#233;ment absorbant &#224; droite** pour $\\bs$ ssi : $\\forall \\ y \\in E$, $y \\bs x = x$&#60;br /&#62;&#60;br /&#62; - On dit que $x$ est **absorbant** s\'il est &#224; la fois absorbant &#224; gauche et &#224; droite', 1, 2),
(64, 'Elément régulier (ou simplifiable)', '- Un &#233;l&#233;ment $x$ est dit r&#233;gulier (ou simplifiable) &#224; gauche ssi : $$\\fa (x, y) \\in E^2, x \\bs y = x \\bs z \\implies y = z$$&#60;br /&#62;&#60;br /&#62;- Un &#233;l&#233;ment $x$ est dit r&#233;gulier (ou simplifiable) &#224; droite ssi : $$\\fa (x, y) \\in E^2, y \\bs x = z \\bs x \\implies y = z$$&#60;br /&#62;&#60;br /&#62;- Un &#233;l&#233;ment $x$ est dit r&#233;gulier (ou simplifiable) s\'il est &#224; la fois r&#233;gulier &#224; gauche et &#224; droite', 1, 2),
(65, 'Régularité des éléments symétrisables', 'Supposons que $E$ soit muni d\'une loi $\\bs$ associative&#60;br /&#62; - Soit $x$ un &#233;l&#233;ment admettant un sym&#233;trique &#224; gauche, alors $x$ est r&#233;gulier &#224; gauche.&#60;br /&#62; - Soit $x$ un &#233;l&#233;ment admettant un sym&#233;trique &#224; droite, alors $x$ est r&#233;gulier &#224; droite.&#60;br /&#62; - Soit $x$ un &#233;l&#233;ment admettant un sym&#233;trique, alors $x$ est r&#233;gulier.', 1, 4),
(66, 'Distributivité', '- On dit que la loi $\\bs$ est distributive &#224; gauche sur $\\diamond$ ssi : $\\fa (x, y, z) \\in E^3, x\\bs(y\\diamond z) = (x \\bs y) \\diamond (x \\bs z)$&#60;br /&#62;- On dit que la loi $\\bs$ est distributive &#224; gauche sur $\\diamond$ ssi : $\\fa (x, y, z) \\in E^3, (y\\diamond z) \\bs x= (y \\bs x) \\diamond (z \\bs x)$&#60;br /&#62;- On dit que la loi $\\bs$ est distributive sur $\\diamond$ si elle est distributive &#224; droite et &#224; gauche.', 1, 2),
(67, 'Distributivité généralisée', 'Soit $E$ muni de deux lois $\\times$ et $+$ associatives, et $+$ commutatives.&#60;br /&#62;On suppose que $\\times$ est distributive sur $+$.&#60;br /&#62;&#60;br /&#62;On a alors, pour tout $n$ de $\\N^*$ et tous ensembles finis $J_1, \\dots, J_n$ non vides, les $x_{i,j}$ &#233;tant des &#233;l&#233;ments de $E$, on a :&#60;br /&#62;$$\\prod_{i=1}^{n} \\sum_{j\\in J_1} x_{i,j} = \\sum_{(j_1, \\dots, j_n) \\in J_1 \\times \\dots J_n} \\prod{i=1}^{n} x_{i,j}$$&#60;br /&#62;&#60;br /&#62;La loi $\\times$ n\'&#233;tant pas suppos&#233; commutative, les produits $\\prod$ sont &#224; prendre dans l\'ordre croissant des indices.', 1, 5),
(68, 'Associativité externe', 'Soit $E$ un ensemble muni d\'une loi de composition externe $\\diamond$ sur $\\K$, lui m&#234;me muni d\'une loi de composition interne $\\bs$.&#60;br /&#62;&#60;br /&#62;On dit que les lois $\\bs$ et $\\diamond$ v&#233;rifient une propri&#233;t&#233; d\'associativit&#233; externe si pour tout $(\\lambda, \\mu) \\in \\K^2$ et $x \\in E$, $$(\\lambda \\bs \\mu) \\diamond x = \\lambda \\diamond (\\mu \\diamond x)$$', 1, 2),
(69, 'Stabilité', 'Soit $E$ un ensemble muni d\'une loi $\\bs$ et &#60;br /&#62;$F\\subset E$ un sous ensemble de $E$.&#60;br /&#62;&#60;br /&#62;On dit que $F$ est stable par $\\bs$, si la restriction de la loi de $E$ &#224; $F\\times F$ peut se corestreindre &#224; $F$, autrement dit si : $$\\fa (x,y) \\in F^2, x \\bs y \\in F$$&#60;br /&#62;Dans ce cas, la loi de $E$ se restreint en une loi $\\bs_F$ : $F \\times F \\to F$, appel&#233;e **loi induite** sur $F$ par $\\bs$.', 1, 2),
(70, 'Structure', '- Une structure de \"truc\" est la donn&#233;e d\'un certain nombre d\'axiomes (d&#233;finissant ce qu\'on appelle un \"truc\") portant sur un ensemble fini de lois de composition (internes et/ou externes).&#60;br /&#62;- On dit qu\'un ensemble $E$ est muni d\'une structure de truc ssi $E$ est muni d\'un nombre fini de lois de compositions v&#233;rifiant les axiomes de structure de truc.', 1, 2),
(71, 'Structure induite', 'Soit $E$ un ensemble muni d\'une structure de truc, et $F$ un sous-ensemble de $E$.&#60;br /&#62;&#60;br /&#62;Si $F$ est stable pour chacune des lois de $E$, l\'ensemble $F$ muni des lois induites sur $F$ par les lois de $E$ est muni d\'une structure induite sur $F$ par la structure de $E$.', 1, 2),
(72, 'Sous-truc', 'Soit $E$ un ensemble muni d\'une structure de truc et $F$ un sous-ensemble de $E$.&#60;br /&#62;&#60;br /&#62;On dit que $F$ est un sous-truc de $E$ si $F$ est stable par les lois de $E$, si $F$ contient les neutres impos&#233;s de $E$, et si les lois induites sur $F$ par les lois de $E$ v&#233;rifient les axiomes de la structure de truc.', 1, 2),
(73, 'Element n°22', '', 1, 1),
(74, 'Fonction continue sur un intervalle', 'On dit que $f$ est continue sur $I$ si et seulement si $f$ est continue en tout &#60;br /&#62;$a$ de $I$.', 1, 2),
(75, 'Fonction continue par morceau sur un intervalle', '**1.** On dit que $f$ est continue par morceaux sur un segment $I = [a,b]$ si et seulement s\'il existe des r&#233;els $a= x_0 \\lt x_1 \\lt \\dots \\lt x_n =b $ tels que : &#60;br /&#62;&#60;br /&#62;  - $(i)$ $f$ soit continue sur chaque intervall $]x_i, x_{i+1}[$, $i\\in \\[0, n-1\\]$&#60;br /&#62;  - $(ii)$ $f$ admette des limites &#224; gauches finies en $x_1, \\dots x_n$ et des limites &#224; droites finies en $x_0, \\dots x_{n-1}$&#60;br /&#62;&#60;br /&#62;**2.** On dit que $f$ est continue par morceaux sur un intervall $I$ quelconque, si pour tout segment $J \\subset I$, $f$ est continue par morceaux sur $J$.', 1, 2),
(76, 'TVI, version 1 : existence d\'un zéro', 'Soit $f$ une fonction continue sur un intervalle $I$ d\'extr&#233;mit&#233;s $a$ et $b$ dans $\\ol{\\R}$ (avec existence des limites dans le cas de bornes infinies). Alors, si $f(a) \\gt 0$ et $f(b) \\lt 0$ (ou l\'inverse), il existe $c \\in ]a,b[$ tel que $f(c) = 0$.', 1, 5),
(77, 'TVI, version 2 : réalisation des valeurs intermédiaires', 'Soit $f$ une fonction continue sur un intervalle $I$, et soit $M= \\sup(f(x))$ et $m = \\inf\\limits_{x \\in X} f(x)$.&#60;br /&#62;&#60;br /&#62;Alors $f$ prend toutes les valeurs de l\'intervalle $]m, M[$ : $\\forall x_0 \\in ]m, M[$, $\\exists c \\in I$, $f(c) = x_0$. ', 1, 5),
(78, 'TVI, version 3 : image d\'un intervalle', 'L\'image d\'un intervalle quelconque par une fonction continue est un intervalle.', 1, 5),
(79, 'Continuité uniforme', 'Soit $f$ une fonction d&#233;finie sur un sous-ensemble $X$ de $\\R$. On dit que $f$ est uniform&#233;ment continue sur $X$ si : $$\\fa \\ve \\gt 0, \\exists \\mu \\gt 0, \\fa (x,y) \\in X^2, |x-y| \\lt \\mu \\implies |f(x) - f(y)| \\lt \\ve$$.&#60;br /&#62;&#60;br /&#62;Le r&#233;el $\\mu$ est appel&#233; **module de continuit&#233; uniforme de $f$ pour l\'approximation $\\ve$**.', 1, 2),
(80, 'Critère séquentiel de la continuité uniforme', 'Soit $f$ une fonction d&#233;finie sur un sous-ensemble $X$ de $\\R$.&#60;br /&#62;Les deux propri&#233;t&#233;s suivantes sont &#233;quivalentes :&#60;br /&#62; - $(i)$ $f$ est uniform&#233;ment continue en $X$&#60;br /&#62; - $(ii)$ Pour tout suites $(x_n)$ et $(y_n)$ d\'&#233;l&#233;ments de $X$ telles que $x_n - y_n \\to 0$, on a aussi $f(x_n) - f(y_n) \\to 0$.', 1, 4),
(81, 'Théorème de Heine', 'Soit $I = [a,b]$ un segment, et $f$ une fonction continue sur $I$.&#60;br /&#62;&#60;br /&#62;Alors $f$ est uniform&#233;ment continue sur $I$.', 1, 5),
(82, 'Compacité', 'Soit $K \\subset \\R$. On dit que $K$ est compact si de toute suite $(x_n)$ d\'&#233;l&#233;ments de $K$, on peut extraire une suite convergeant vers un &#233;l&#233;ment $a$ de $K$.', 1, 2),
(83, 'Caractérisation des intervalles compacts', 'Les intervalles compacts sont exactement les segments, i.e. les intervalles ferm&#233;s born&#233;s $[a,b]$.', 1, 8),
(84, 'Image d\'un compact par une fonction continue', 'Soit $f$ une fonction d&#233;finie et continue sur un compact $K$.&#60;br /&#62;Alors $f(K)$ est un compact.', 1, 8),
(85, 'Image d\'un segment par une fonction continue', 'Soit $f$ continue sur un segment $I$. Alors $f(I)$ est un segment.', 1, 9),
(86, 'Théorème de compacité, ou théorème de la borne atteinte', 'Soit $I = [a,b]$ un segment (c\'est-&#224;-dire un intervalle ferm&#233; born&#233;), et soit $f: I \\to \\R$ une fonction continue sur $I$. Alors $f$ est born&#233;e, et atteint ses bornes.', 1, 5),
(87, 'Caractérisation de l\'injection par la monotonie', 'Soit $I$ un intervalle, et $f: I \\to \\R$ une fonction continue.&#60;br /&#62;&#60;br /&#62;Alors $f$ est injective si et seulement si $f$ est strictement monotone.', 1, 5),
(88, 'Caractérisation de la continuité par la monotonie', 'Soit $I$ un intervalle, et $f: I \\to \\R$ monotone.&#60;br /&#62;&#60;br /&#62;Si $f(I)$ est un intervalle, alors $f$ est continue.', 1, 5),
(89, 'Homéomorphisme', 'Soit $A,B \\subset \\R$.&#60;br /&#62;&#60;br /&#62;Un **hom&#233;omorphisme** $f: A \\to B$ est une application continue bijective dont la r&#233;ciproque est continue.', 1, 2),
(90, 'Théorème de la bijection', 'Soit $I$ un intervalle d\'extr&#233;mit&#233;s $a$ et $b$.&#60;br /&#62;Soit $f: I \\to \\R$ strictement monotone et continue. &#60;br /&#62;Soit : $\\alpha = \\lim\\limits_{x \\to a} f(x)$ et $\\beta = \\lim\\limits_{x \\to b} f(x)$ (ces limites existent car $f$ est monotone).&#60;br /&#62;&#60;br /&#62;Alors $f(I)$ est un intervalle d\'extr&#233;mit&#233;s $\\alpha$ et $\\beta$, et $f$ est un **hom&#233;omorphisme** de $I$ sur $f(I)$.&#60;br /&#62;&#60;br /&#62;Plus pr&#233;cis&#233;ment, la borne $\\alpha$ de $f(I)$ est ouverte si et seulement si la borne $a$ de $I$ est ouberte, et de m&#234;me pour $\\beta$.', 1, 5),
(91, 'Théorème de Rolle', 'Soit $f:[a,b] \\to \\R$ continue sur $[a,b]$ et d&#233;rivable sur $]a,b[$.&#60;br /&#62;&#60;br /&#62;Alors, si $f(a) = f(b)$, il existe $c\\in ]a,b[$ tel que $f\'(c) = 0$.', 1, 5),
(92, 'Rolle sur un intervalle infini d\'un côté', 'Soit $f:[a, +\\infty[ \\to \\R$  continue, d&#233;rivable sur $]a, +\\infty[$ et telle que $f(a) = \\lim\\limits_{x \\to +\\infty} f(x)$.&#60;br /&#62;&#60;br /&#62;Alors il existe $c\\in ]a, +\\infty[$ tel que $f\'(c) = 0$.', 1, 9),
(93, 'Rolle sur $\\R$', 'Soit $f: \\R \\to \\R$ d&#233;rivable sur $\\R$, et telle que $\\lim\\limits_{x\\to -\\infty} f(x) = \\lim\\limits_{x\\to+\\infty} f(x)$.&#60;br /&#62;&#60;br /&#62;Alors il existe $c \\in \\R$ tel que $f\'(c) = 0$.', 1, 9),
(94, 'Rolle en cascade', 'Soit $n \\in \\N^*$.&#60;br /&#62;Soit $f: [a,b] \\to \\R$ continue sur $[a,b]$, $n$ fois d&#233;rivable sur $]a,b[$, et telle qu\'il existe $n+1$ r&#233;els $a \\leqslant a_0 \\leqslant \\dots \\leqslant a_n \\leqslant b$ tels que $f(a_0) = f(a_1) = \\dots = f(a_n)$.&#60;br /&#62;&#60;br /&#62;Alors il existe $c\\in ]a,b[$ tel que $f^{(n)}(c) = 0$.', 1, 9),
(95, 'Théorème des accroissements finis, TAF', 'Soit $f:[a,b]\\to \\R$ continue sur $[a,b]$, d&#233;rivable sur $]a,b[$.&#60;br /&#62;&#60;br /&#62;Alors il existe $c \\in ]a,b[$ tel que :$$f(b)-f(a) = (b-a)f\'(c)$$', 1, 5),
(96, 'Inégalité des accroissements finis, IAF', 'Soit $f:[a,b] \\to \\R$ continue sur $[a,b]$, d&#233;rivable sur $]a,b[$.&#60;br /&#62;Soit $M$ un majorant de $f\'$ sur $]a,b[$, et $m$ un minorant de $f\'$ sur $]a,b[$.&#60;br /&#62;&#60;br /&#62;Alors : $$m(b-a) \\leqslant f(b) - f(a) \\leqslant M(b-a)$$&#60;br /&#62;&#60;br /&#62;En particulier, si $M$ est un majorant de $|f\'|$, alors $|f(b)-f(a)| \\leqslant M|b-a|$.', 1, 9),
(97, 'Caractérisation d\'une fonction lipschitzienne par une fonction bornée', 'Soit $f$ une fonction d&#233;rivable sur un intervalle $I$. Si $f\'$ est born&#233;e sur $I$, alors $f$ est lipschitzienne sur $I$. Plus pr&#233;cis&#233;ment, si $k$ est un majorant de $|f\'|$, alors $f$ est $k$-lipschitzienne.&#60;br /&#62;&#60;br /&#62;La r&#233;ciproque est vraie pour une fonction d&#233;rivable.', 1, 9),
(98, 'IAF pour des fonction à valeurs dans $\\C$', 'Soit $f:[a,b] \\to \\C$ continue sur $[a,b]$ et d&#233;rivable sur $]a,b[$, et $M$ un r&#233;el tel que $|f\'| \\leqslant M$ sur $]a,b[$.&#60;br /&#62;&#60;br /&#62;Alors $$|f(b)-f(a)| \\leqslant M|b-a|.$$&#60;br /&#62;', 1, 5),
(99, 'Domination, cas des suites', 'Soit $(u_n)_{n\\in\\N}$ et $(v_n)_{n\\in\\N}$ deux suites r&#233;elles. On dit que $(u_n)$ est **domin&#233;e** par $(v_n)$ si et seulement s\'il existe un r&#233;el $M$ tel que &#224; partir d\'un certain rang $n_0$, $|u_n| \\leqslant M|v_n|$, soit formellement : &#60;br /&#62;$$\\exists M \\in \\R \\exists n_0 \\in \\N, \\forall n \\geqslant n_0, |u_n| \\leqslant M|v_n|.$$&#60;br /&#62;&#60;br /&#62;De mani&#232;re &#233;quivalente, $(u_n)$ est domin&#233;e par $(v_n)$ si et seulement s\'il existe une suite $(\\mu_n)$ telle que pour tout $n$ assez grand, $u_n = \\mu_n v_n$, et $(\\mu_n)$ born&#233;e.', 1, 2),
(100, 'Négligeabilité, cas des suites', 'Soit $(u_n)_{n\\in\\N}$ et $(v_n)_{n\\in\\N}$ deux suites r&#233;elles. On dit que $(u_n)$ est **n&#233;gligeable** devant $(v_n)$ si pour tout $\\ve \\gt 0$, il existe $n_0 \\in \\N$ tel que pour tout $n \\geqslant n_0$, $$|u_n| \\leqslant \\ve|v_n|.$$&#60;br /&#62;&#60;br /&#62;De mani&#232;re &#233;quivalente, $(u_n)$ est n&#233;gligeable devant $(v_n)$ si et seulement s\'il existe une suite $(\\ve_n)_{n\\in\\N}$ et un entier $n_0$ tel que :&#60;br /&#62;&#60;br /&#62;$\\quad \\quad \\fa n \\geqslant n_0, u_n = \\ve_n v_n \\quad$     et   $\\quad \\lim \\ve_n = 0$.', 1, 2),
(101, 'Réécriture de la domination et de la négligeabilité', 'Si $(v_n)$ ne s&#8217;annule pas (&#224; partir d\'un certain rang au moins), alors : &#60;br /&#62;&#60;br /&#62; - **1.** $(u_n)$ est domin&#233;e par $(v_n)$ si et seulement si $\\left ( \\frac{u_n}{v_n} \\right )$ est born&#233;e&#60;br /&#62;&#60;br /&#62; - **2.** $(u_n)$ est n&#233;gligeable devant $(v_n)$ si et seulement si $\\lim \\frac{u_n}{v_n} = 0$. ', 1, 4),
(102, 'Notations de Bachmann et de Landau', '**1.** Si $(u_n)$ est domin&#233;e par $(v_n)$, on note $u_n = O(v_n)$&#60;br /&#62;&#60;br /&#62;**2.** Si $(u_n)$ est n&#233;gligeable devant $(v_n)$, on note $u_n = o(v_n)$', 1, 1),
(103, 'Négligeabilité implique domination', 'Si $u_n = o(v_n)$, alors $u_n = O(v_n)$', 1, 4),
(104, '$o(1)$ et $O(1)$', 'Soit $(u_n)$ une suite r&#233;elle.&#60;br /&#62;&#60;br /&#62;**1.** $u_n = O(1)$ si et seulement si $(u_n)_{n\\in\\N}$ est born&#233;e&#60;br /&#62;&#60;br /&#62;**2.** $u_n = o(1)$ si et seulement si $(u_n)_{n\\in\\N}$ tend vers $0$&#60;br /&#62;&#60;br /&#62;**3.** $\\lim u_n = l$ si et seulement si $u_n = l + o(1)$', 1, 4),
(105, 'Transitivités strictes et larges de $o$ et $O$', '**1.** Si $u_n = O(v_n)$ et $v_n = O(w_n)$, alors $u_n = O(w_n)$&#60;br /&#62;&#60;br /&#62;**2.** Si $u_n = o(v_n)$ et $v_n = o(w_n)$, alors $u_n = o(w_n)$&#60;br /&#62;&#60;br /&#62;**3.** Si $u_n = o(v_n)$ et $v_n = O(w_n)$, alors $u_n = o(w_n)$&#60;br /&#62;&#60;br /&#62;**4.** Si $u_n = O(v_n)$ et $v_n = o(w_n)$, alors $u_n = o(w_n)$', 1, 3),
(106, 'Sommes de $o$ et $O$', '**1.** Si $u_n = o(w_n)$ et $v_n = o(w_n)$, alors $u_n + v_n = o(w_n)$&#60;br /&#62;&#60;br /&#62;**2.** Si $u_n = O(w_n)$ et $v_n = O(w_n)$, alors $u_n + v_n = O(w_n)$&#60;br /&#62;&#60;br /&#62;**3.** Si $u_n = o(w_n)$ et $v_n = O(w_n)$, alors $u_n + v_n = O(w_n)$&#60;br /&#62;&#60;br /&#62;**4.** Si $u_n = O(w_n)$ et $v_n = o(w_n)$, alors $u_n + v_n = O(w_n)$', 1, 3),
(107, 'Produits de $o$ et $O$', '**1.** Si $u_n = o(w_n)$ et $v_n = o(x_n)$, alors $u_n  v_n = o(w_n x_n)$&#60;br /&#62;&#60;br /&#62;**2.** Si $u_n = O(w_n)$ et $v_n = o(x_n)$, alors $u_n  v_n = o(w_n x_n)$&#60;br /&#62;&#60;br /&#62;**3.** Si $u_n = o(w_n)$ et $v_n = O(x_n)$, alors $u_n  v_n = o(w_n x_n)$&#60;br /&#62;&#60;br /&#62;**4.** Si $u_n = O(w_n)$ et $v_n = O(x_n)$, alors $u_n  v_n = O(w_n x_n)$', 1, 3),
(108, '$o$ se comporte comme une inégalité stricte', 'La relation $o$ est une relation d\'ordre stricte sur l\'ensemble des suites non ultimement nulles (i.e. nulles &#224; partir d\'un certain rang).', 1, 4),
(109, 'Pourquoi $O$ se comporte presque comme une inégalité large', 'La relation $\\Theta$ est une relation d\'&#233;quivalence sur $\\R^{\\N}$. La relation $O$ passe au quotient et d&#233;finit une relation d\'ordre large sur $\\R^{\\N} / \\Theta$.', 1, 4),
(110, 'Domination, cas des fonctions', 'Soit $f$ et $g$ deux fonctions d&#233;finies sur $X$ et $a \\in \\ol{X}$.&#60;br /&#62;&#60;br /&#62;On dit que $f$ est domin&#233;e par $g$ au voisinage de $a$ si et seulement s\'il existe un voisinage $V$ de $a$ et une application $h$ d&#233;finie sur $V \\cap X$, et born&#233;e, telle que $f = hg$ sur $V\\cap X$.&#60;br /&#62;&#60;br /&#62;On note $f(x) = O_{x\\to a}(g(x))$ ou $f = O_a(g)$.', 1, 2),
(111, 'Négligeabilité, cas des fonctions', 'Soit $f$ et $g$ deux fonctions d&#233;finies sur $X$, et $a \\in \\ol{X}$.&#60;br /&#62;&#60;br /&#62;On dit que $f$ est **n&#233;gligeable** devant $g$ s\'il existe un voisinage $V$ de $a$, et une fonction $h$ d&#233;finie sur $V$, tels que &#60;br /&#62;&#60;br /&#62;$\\fa x \\in V, f(x) = h(x)g(x) \\quad $ et $\\quad \\lim\\limits_{x\\to a} h(x) = 0$.&#60;br /&#62;&#60;br /&#62;On note $f(x) = o_{x \\to a}(g(x))$ ou $f = o_a(g)$.', 1, 2),
(112, 'Caractérisation par $\\ve$', 'Soit $f$ et $g$ deux fonctions d&#233;finies sur $X$, et $a \\in \\ol{X}$.&#60;br /&#62;&#60;br /&#62;**1.** $f(x) = O_{x\\to a}(g(x))$ si et seulement s\'il existe un r&#233;el $M$ et un voisinage $V$ de $a$ tel que pour tout $x \\in V \\cap X$, $|f(x)| \\leqslant M|g(x)|$.&#60;br /&#62;&#60;br /&#62;**2.** $f(x) = o_{x\\to a}(g(x))$ si et seulement si pour tout $\\ve \\gt 0$, il existe un voisinage $V$ de $a$ tel que pour tout $x \\in V \\cap X$, $|f(x)| \\leqslant \\ve|g(x)|$.', 1, 5),
(113, 'Caractérisation séquentielle de la domination et la négligeabilité', 'Soit $f$ et $g$ deux fonctions d&#233;finies sur $X$, et $a \\in \\ol{X}$.&#60;br /&#62;Alors : &#60;br /&#62;&#60;br /&#62;**1.** $f(x) = O_{x \\to a}(g(x))$ si et seulement si pour toute suite $u_n \\to a$ &#224; valeurs dans $X$, $f(u_n) = O(g(u_n))$.&#60;br /&#62;&#60;br /&#62;**2.** $f(x) = o_{x \\to a}(g(x))$ si et seulement si pour toute suite $u_n \\to a$ &#224; valeurs dans $X$, $f(u_n) = o(g(u_n))$.', 1, 5),
(114, 'Equivalence', 'Deux suites r&#233;elles $(u_n)$ et $(v_n)$ sont dites **&#233;quivalentes** s\'il existe une suite $(\\alpha_n)$ et un entier $n_0$ tel que &#60;br /&#62;&#60;br /&#62;$\\quad \\quad \\fa n \\geqslant n_0, u_n = \\alpha_n v_n\\quad $ et $\\quad \\lim \\alpha_n = 1$.', 1, 2),
(115, 'Notation de l\'équivalence', 'Si $(u_n)$ et $(v_n)$ sont &#233;quivalentes, on notes $u_n \\mathop{\\sim}\\limits_{+\\infty} v_n$, ou simplement $u_n \\sim v_n$.&#60;br /&#62;', 1, 1),
(116, 'Caractérisation de l\'équivalence par la négligeabilité', '$u_n \\mathop{\\sim}\\limits_{+\\infty} v_n \\iff u_n = v_n + o(v_n)$', 1, 4),
(117, 'Equivalent d\'un polynôme', 'Soit $P$ un polyn&#244;me de mon&#244;me dominant $a_dX^d$.&#60;br /&#62;&#60;br /&#62;Alors $P(n) \\sim a_dn^d$.', 1, 4),
(118, 'Equivalence de deux suites', 'Soit $(u_n)$ et $(v_n)$ deux suites telles que $v_n$ ne s\'annule pas (au moins &#224; partir d\'un certain rang).&#60;br /&#62;&#60;br /&#62;Alors $u_n \\mathop{\\sim}\\limits_{+\\infty} v_n \\iff \\lim \\frac{u_n}{v_n} = 1$.', 1, 4),
(119, '$\\sim$ est une relation d\'équivalence', 'La relation $\\sim$ est une relation d\'&#233;quivalence sur l\'ensemble des suites r&#233;elles.', 1, 4),
(120, 'Conservation des limites par équivalence', 'Si $u_n \\mathop{\\sim}\\limits_{+\\infty} v_n$, et si $(u_n)_{n\\in\\N}$ converge vers $l$ dans $\\ol{\\R}$. alors $(v_n)_{n\\in\\N}$ converge, et sa limite est $l$. ', 1, 5),
(121, 'Conservation du signe', 'Soit $(u_n)$ et $(v_n)$ deux suites &#233;quivalentes. Alors il existe $n_0$ tel que pour tout $n\\geqslant n_0$, $u_n$ et $v_n$ soient de m&#234;me signe.', 1, 4),
(122, 'Equivalents de produits, quotients et puissances', 'Soit $(u_n)$, $(v_n)$, $(u_n\')$ et $(v_n\')$ quatre suites r&#233;elles.&#60;br /&#62;&#60;br /&#62;**1.** Si $u_n \\sim u_n\'$ et $v_n \\sim v_n\'$, alors $u_nv_n \\sim u_n\'v_n\'$&#60;br /&#62;&#60;br /&#62;**2.** Si de plus, $v_n$ est non nulle &#224; partir d\'un certain rang, alors $\\frac{u_n}{v_n} \\sim \\frac{u_n\'}{v_n\'}$&#60;br /&#62;&#60;br /&#62;**3.** Si $u_n \\sim u_n\'$ et si $a$ est un r&#233;el fix&#233;, alors $(u_n)^a \\sim (u_n\')^a$.', 1, 4),
(123, 'Equivalence et négligeabilité', 'Les relations $o$ et $O$ au voisinage de $a$ sont ind&#233;pendantes des classes d\'&#233;quivalences pour la relation $\\mathop{\\sim}\\limits_{a}$.&#60;br /&#62;&#60;br /&#62;Ainsi, si $u_n \\mathop{\\sim}\\limits_{a} u_n\'$ et $v_n \\mathop{\\sim}\\limits_{a} v_n\'$, alors $u_n = o(v_n)$ si et seulement si $u_n\' = o(v_n\')$ (et de m&#234;me pour $O$).', 1, 4),
(124, 'Equivalence entre fonctions', 'Deux fonctions $f$ et $g$ d&#233;finies sur $X$ sont dites **&#233;quivalentes** au point $a \\in \\ol{X}$ s\'il existe un voisinage $V$ de $a$ et une fonction $h$ d&#233;finie sur $V \\cap X$ de $a$ tel que &#60;br /&#62;&#60;br /&#62;$\\quad \\quad \\fa x \\in V \\cap X, f(x) = h(x)g(x) \\quad$ et $\\quad \\lim\\limits_{x\\to a} h(x) = 1$.&#60;br /&#62;&#60;br /&#62;On note $f(x) \\mathop{\\sim}\\limits_{x\\to a} g(x).$', 1, 2),
(125, 'Caractérisation séquentielle de l\'équivalence', 'Soit $f$ et $g$ deux fonctions d&#233;finies sur $X$ et $a \\in \\ol{X}$. &#60;br /&#62;&#60;br /&#62;Alors $f(x) \\mathop{\\sim}\\limits_{x \\to a} g(x)$ si et seulement si pour toute suite $(x_n)$ d\'&#233;l&#233;ments de $X$ telle que $x_n \\to a$, $f(x_n) \\sim g(x_n)$.', 1, 5),
(126, 'Equivalents classiques', '**1.** $\\ln(1+x) \\mathop{\\sim}\\limits_{0} x$&#60;br /&#62;&#60;br /&#62;**2.** $e^x - 1 \\mathop{\\sim}\\limits_{0} x$&#60;br /&#62;&#60;br /&#62;**3.** $(1+x)^{\\alpha} - 1 \\mathop{\\sim}\\limits_{0} ax$, $(a \\neq 0)$&#60;br /&#62;&#60;br /&#62;**4.** $\\sin(x) \\mathop{\\sim}\\limits_{0} x$&#60;br /&#62;&#60;br /&#62;**5.** $\\cos(x) - 1 \\mathop{\\sim}\\limits_{0} -\\frac{x^2}{2}$&#60;br /&#62;&#60;br /&#62;**6.** $\\tan(x) \\mathop{\\sim}\\limits_{0} x$&#60;br /&#62;&#60;br /&#62;**7.** $\\sinh(x) \\mathop{\\sim}\\limits_{0} x$&#60;br /&#62;&#60;br /&#62;**8.** $\\cosh(x) -1 \\mathop{\\sim}\\limits_{0} \\frac{x^2}{2}$&#60;br /&#62;&#60;br /&#62;**9.** $\\tanh(x) \\mathop{\\sim}\\limits_{0} x$&#60;br /&#62;&#60;br /&#62;**10.** $\\arcsin(x) \\mathop{\\sim}\\limits_{0} x$&#60;br /&#62;&#60;br /&#62;**11.** $\\arctan(x) \\mathop{\\sim}\\limits_{0} x$', 1, 4),
(127, 'Formule de Stirling', '$n! \\mathop{\\sim}\\limits_{+\\infty} \\sqrt{2\\pi n} \\cdot \\left (\\frac{n}{e} \\right )^n$', 1, 5),
(128, 'Avertissement : Somme d\'équivalents', '**Ne pas sommer des &#233;quivalents**.&#60;br /&#62;&#60;br /&#62;Si les parties principales se compensent, on s\'expose &#224; des erreurs.', 1, 1),
(129, 'Méthode : Pour contourner les problème des sommes d\'équivalents', '- &#201;tudier les n&#233;gligeabilit&#233;s entre les termes de la somme, pour ne garder que les termes d\'ordre pr&#233;pond&#233;rant&#60;br /&#62;&#60;br /&#62;- &#201;crire les &#233;quivalences avec un $o$ et effectuer la somme sous cette forme&#60;br /&#62;&#60;br /&#62;- Si les parties principales ne se compensent pas, on peut revenir &#224; un &#233;quivalent&#60;br /&#62;&#60;br /&#62;- Sinon, on ne peut pas conclure directement. Il faut &#233;tudier l\'ordre de grandeur de ce qu\'il reste apr&#232;s simplification des parties principales, et pour cela, il faut avoir une meilleure approximation de chaque terme (la connaissance de l\'&#233;quivalence ne suffit pas). On peut par exemple utiliser un d&#233;veloppement limit&#233;.', 1, 7),
(130, 'Avertissement : Composition d\'équivalents', '**Ne composez pas un &#233;quivalent par une fonction.**&#60;br /&#62;&#60;br /&#62;En g&#233;n&#233;ral $u_n \\sim v_n$ n\'implique pas $f(u_n) \\sim f(v_n)$. M&#234;me avec des fonctions \"gentilles\" comme le logarithme ou l\'exponentielle, cela peut &#234;tre faux.', 1, 1),
(131, 'Trouver un équivalent simple de $\\ln(u_n)$', '**1.** Si $u_n \\to 1$, utiliser l\'&#233;quivalent classique&#60;br /&#62;&#60;br /&#62;**2.** Sinon &#233;crire $u_n = v_n(1+o(1))$, o&#249; $v_n$ est un &#233;quivalent simple de $u_n$, puis $\\ln(u_n) = \\ln(v_n) + \\ln(1 + o(1))$. Comparer ensuite les deux termes. Autrement dit, il s\'agit de mettre le terme pr&#233;pond&#233;rant en facteur dans le logarithme pour le sortir du logarithme.&#60;br /&#62;&#60;br /&#62;**3.** &#201;videmment, cela s\'adapte aux fonctions.', 1, 7),
(132, 'Trouver un équivalent de $e^{u_n}$', 'D&#233;velopper $u_n$ &#224; $o(1)$ pr&#232;s : $u_n = v_n + o(1)$. S\'adapte aux fonctions.', 1, 7),
(133, 'Caractérisation d\'une valeur d\'adhérence finie', 'Soit $(u_n)$ une suite e $a \\in \\R$. Les propri&#233;t&#233;s suivantes sont &#233;quivalentes :&#60;br /&#62;&#60;br /&#62; - $(i)$ $a$ est valeur d\'adh&#233;rence de $(u_n)$&#60;br /&#62; - $(ii)$ pour tout $\\ve \\gt 0$, $]a-\\ve, a+\\ve[$ contient une infinit&#233; de termes de la suite $(u_n)$.&#60;br /&#62; - $(iii)$ $\\fa \\ve \\gt 0$, $\\fa N \\in \\N$, $\\exists n \\geqslant N$, $u_n \\in ]a - \\ve, a + \\ve[$', 1, 9),
(134, 'Caractérisation d\'une valeur d\'adhérence infinie', 'Soit $(u_n)$ une suite. Alors $+\\infty$ est valeur d\'adh&#233;rence de $(u_n)$ si et seulement si $(u_n)$ n\'est pas major&#233;e.', 1, 9),
(135, 'Existence d\'une valeur d\'adhérence', 'Toute suite r&#233;elle $(u_n)$ admet une valeur d\'adh&#233;rence au moins dans $\\ol{\\R}$.', 1, 4),
(136, 'Caractérisation de la convergence par les valeurs d\'adhérences', 'Une suite $(u_n)$ converge dans $\\ol{\\R}$ si et seulement si elle admet une unique valeur d\'adh&#233;rence dans $\\ol{\\R}$.', 1, 5);
INSERT INTO `element` (`id`, `titre`, `texte`, `id_compte`, `_type`) VALUES
(137, 'Théorème de Bolzano-Weierstrass', 'De toute suite r&#233;elle born&#233;e on peut extraire une suite convergente.', 1, 5),
(138, 'Bolzano-Weierstrass dans $\\C$ ou dans $\\R$', 'Soit $(u_n)$ une suite born&#233;e dans $\\C$ ou dans $\\R^n$. Alors $(u_n)$ admet une valeur d\'adh&#233;rence.', 1, 5),
(139, 'Sous-ensemble compact', 'Soit $E$ un espace m&#233;trique et $K \\subset E$. On dit que $K$ est **compact** si de toute suite $(u_n)_{n \\in \\N}$ d\'&#233;l&#233;ments de $K$, on peut extraire une suite convergeant vers un &#233;l&#233;ment de $K$.', 1, 2),
(140, 'Propriétés équivalentes à la propriété fondamentale', 'Les r&#233;sultats suivants sont &#233;quivalents : &#60;br /&#62;&#60;br /&#62; - $(i)$ La propri&#233;t&#233; de la borne sup&#233;rieure&#60;br /&#62; - $(ii)$ La description des intervalles de $\\R$&#60;br /&#62; - $(iii)$ Le th&#233;or&#232;me de convergence monotone&#60;br /&#62; - $(iv)$ Le th&#233;or&#232;me des suites adjacentes', 1, 5),
(141, 'Caractérisation séquentielle de la densité', 'Soit $X$ un sous-ensemble de $\\R$. L\'ensemble $X$ est (partout) dense dans $\\R$ si et seulement si pour tout $x \\in \\R$, il existe $(u_n)_{n\\in\\N}$ une suite d\'&#233;l&#233;ments de $X$ tels que $(u_n)_{n\\in\\N}$ converge vers $x$.', 1, 5),
(142, 'Sous-ensemble dense et suites croissantes', 'Soit $X$ un sous-ensemble dense de $\\R$. Alors pour tout $x\\in\\R$, il existe une suite croissante $(u_n)_{n\\in\\N}$ d\'&#233;l&#233;ments de $X$ tels que $\\lim u_n = x$. On peut trouver de m&#234;me une suite d&#233;croissante.', 1, 4),
(143, 'Caractérisation séquentielle de la borne supérieure', 'Soit $X$ un sous-ensemble non vide de $\\R$. Alors $M \\in \\ol{\\R}$ est la borne sup&#233;rieure de $X$ si et seulement si :&#60;br /&#62;&#60;br /&#62;**1.** $M$ est un majorant de $X$&#60;br /&#62;&#60;br /&#62;**2.** il existe une suite d\'&#233;l&#233;ments de $X$ convergeant vers $M$.', 1, 5),
(144, 'Caractérisation des fermés', 'Un sous-ensemble $F$ (de $\\R$ ou d\'un espace m&#233;trique) est ferm&#233; si et seulement si toute suite convergente d\'&#233;l&#233;ments de $F$ converge vers une limite elle-m&#234;me &#233;l&#233;ment de $F$.', 1, 5),
(145, 'Suite arithmétique', 'Une **suite arithm&#233;tique** $(u_n)_{n\\in\\N}$ est une suite v&#233;rifiant une relation de r&#233;currence du type $u_{n+1} = u_n + b$.', 1, 2),
(146, 'Explicitation des suites arithmétiques', 'Soit $(u_n)_{n\\in\\N}$ une suite arithm&#233;tique, v&#233;rifiant la relation $u_{n+1} = u_n + b$.&#60;br /&#62;Alors :&#60;br /&#62;&#60;br /&#62;- pour tout $n\\in\\N$, $u_n = u_0+nb$&#60;br /&#62;- plus g&#233;n&#233;ralement, pour tout $(n,m) \\in \\N^2$, $u_n = u_m + (n-m)b$&#60;br /&#62;- ou encore, pour tout $(m,k) \\in \\N^2, u_{m+k} = u_m + kb$', 1, 4),
(147, 'Suites géométriques', 'Une suite $(u_n)_{n \\in \\N}$ est une **suite g&#233;om&#233;trique** si et seulement si elle v&#233;rifie pour tout $n\\in\\N$, une relation du type $u_{n+1} = au_n$.', 1, 2),
(148, 'Explicitation des suites géométriques', 'Soit $(u_n)_{n\\in\\N}$ une suite g&#233;om&#233;trique, v&#233;rifiant la relation $u_{n+1} = au_n$.&#60;br /&#62;Alors : &#60;br /&#62;- $\\fa n \\in \\N$, $u_n = u_0 \\cdot a^n$&#60;br /&#62;- plus g&#233;n&#233;ralement, pour tout $m \\lt n, u_n = u_m a^{n-m}$&#60;br /&#62;- ou encore, pour tout $(m,k) \\in \\N^2$, $u_{m+k} = u_ma^k$', 1, 4),
(149, 'Suites arithmético-géométriques', 'Une suite $(a_n)_{n\\in\\N}$ est dite **arithm&#233;tico-g&#233;om&#233;trique** si elle v&#233;rifie une relation du type $u_{n+1} = au_n+b$, avec $a\\neq1$.', 1, 2),
(150, 'Théorème de structure', 'L\'ensemble des suites v&#233;rifiant la relation de r&#233;currence $u_{n+1} = a_nu_n + b_n$, o&#249; $(b_n)$ est une suite fix&#233;e, est un sous-espace affine de l\'ensemble des suites, obtenu comme somme d\'une solution particuli&#232;re et de l\'ensemble des suites g&#233;om&#233;triques de raison $a$ (i.e. solutions de l\'&#233;quation homog&#232;ne $u_{n+1} = au_n$).', 1, 5),
(151, 'Développement de Taylor de $f$', 'Soit $f$ une fonction admettant en $x_0$ une d&#233;riv&#233;e d\'ordre $n$. Alors un **d&#233;veloppement de Taylor** de $f$ en $x_0$ &#224; l\'ordre $n$ est un polyn&#244;me $P$ de degr&#233; au plus $n$ v&#233;rifiant les conditions : $$P(x_0) = f(x_0), P\'(x_0) = f\'(x_0), \\dots, P^{(n)}(x_0) = f^{(n)}(x_0).$$&#60;br /&#62;&#60;br /&#62;Donc un polyn&#244;me dont la courbe est tangente &#224; l\'ordre $n$ &#224; celle de $f$ en $x_0$.', 1, 2),
(152, 'Existence, unicité et expression du développement de Taylor de $f$', 'Soit $f$ une fonction $n$ fois d&#233;rivable en $x_0$. Alors le d&#233;veloppement de Taylor en $x_0$ &#224; l\'ordre $n$ existe, est unique, et est donn&#233; explicitement par : $$\\fa x \\in \\R, P(x) = \\sum_{k=0}^{n} \\frac{(x-x_0)^k}{k!} \\cdot f^{(k)}(x_0).$$', 1, 5),
(153, 'Reste de Taylor à l\'ordre $n$', 'Si $f$ admet en $x_0$ une d&#233;riv&#233;e d\'ordre $n$, on note $R_n$ la diff&#233;rence entre $f$ et son d&#233;veloppement de Taylor :$$\\fa x \\in I, R_n(x) = f(x) - \\sum_{k=0}^{n}\\frac{(x-x_0)^k}{k!}\\cdot f^{(k)}(x_0)$$&#60;br /&#62;&#60;br /&#62;$R_n$ est appel&#233; **reste de Taylor &#224; l\'ordre $n$ de $f$ au point $x_0$**&#60;br /&#62;&#60;br /&#62;On note parfois $R_n(x,x_0)$ pour indiquer la d&#233;pendance vis-&#224;-vis du point $x_0$. ', 1, 2),
(154, 'Formule de Taylor-Young à l\'ordre $n$ au point $x_0$', 'Soit $I$ un intervalle ouvert de $\\R$, $x_0 \\in I$, et $f : I \\to \\R$ une fonction de classe $C^n$ au voisinage de $x_0$.&#60;br /&#62;&#60;br /&#62;Alors au voisinage de $x_0$ : &#60;br /&#62;$$f(x) \\mathop{=}\\limits_{x \\to x_0} \\sum_{k=0}^{n} \\frac{f^{(k)}(x_0)}{k!} (x-x_0)^k + o((x-x_0)^n)$$', 1, 5),
(155, 'DL des fonctions usuelles', 'Lorsque $x$ est au voisinage de $0$, on a :&#60;br /&#62;&#60;br /&#62;$$1. \\quad e^x \\mathop{=}\\limits_{x\\to 0} \\sum_{k=0}^{n}\\frac{x^k}{k!} + o(x^n)$$&#60;br /&#62;&#60;br /&#62;$$2. \\quad \\ln(1+x) \\mathop{=}\\limits_{x\\to 0} \\sum_{k=1}^{n} \\frac{(-1)^{k-1}x^k}{k} + o(x^n)$$&#60;br /&#62;&#60;br /&#62;$$3. \\quad \\sin(x) \\mathop{=}\\limits_{x\\to 0} \\sum_{k=0}^{n} \\frac{(-1)^kx^{2k+1}}{(2k+1)!} + o(x^{2n+1})$$&#60;br /&#62;&#60;br /&#62;$$4. \\quad \\cos(x) \\mathop{=}\\limits_{x\\to 0} \\sum_{k=0}^{n} \\frac{(-1)^kx^{2k}}{(2k)!} + o(x^{2n+1})$$&#60;br /&#62;&#60;br /&#62;$$5. \\quad \\sinh(x) \\mathop{=}\\limits_{x\\to 0} \\sum_{k=0}^{n} \\frac{x^{2k+1}}{(2k+1)!} + o(x^{2n+2})$$&#60;br /&#62;&#60;br /&#62;$$6. \\quad \\cosh(x) \\mathop{=}\\limits_{x\\to 0} \\sum_{k=0}^{n}\\frac{x^{2k}}{(2k)!} + o(x^{2n+1})$$&#60;br /&#62;&#60;br /&#62;$$7. \\quad (1+x)^{\\alpha} \\mathop{=}\\limits_{x\\to 0} 1 + \\sum_{k=1}^{n}\\frac{\\alpha(\\alpha-1)\\dots(\\alpha-k+1)}{k!}x^k + o(x^n)$$', 1, 5),
(156, 'Développement limité (DL) au voisinage d\'un point', 'Soit $f$ une fonction d&#233;finie sur un voisinage de $x_0$. On dit que le polyn&#244;me $P_n \\in \\R_n[X]$ est un d&#233;veloppement limit&#233; &#224; l\'ordre $n$ de $f$ en $x_0$ :&#60;br /&#62;$$f(x) \\mathop{=}\\limits_{x\\to x_0} P_n(x) + o((x-x_0)^n)$$', 1, 2),
(157, 'Existence du DL des fonctions de classes $C^n$', 'Si $f$ est de classe $C^n$ au voisinage de $x_0$, alors $f$ admet un d&#233;veloppement limit&#233; &#224; l\'ordre $n$ au voisinage de $x_0$, &#233;gal au d&#233;veloppement de Taylor-Young de $f$ &#224; l\'ordre $n$.', 1, 5),
(158, 'Unicité du DL', 'Si $f$ admet un d&#233;veloppement limit&#233; &#224; l\'ordre $n$ au voisinage de $x_0$, alors ce d&#233;veloppement est unique.', 1, 5),
(159, 'DL des fonctions paires ou impaires', 'Soit $f$ une fonction admettant un DL &#224; l\'ordre $n$ au voisinage de $0$.&#60;br /&#62;&#60;br /&#62;**1.** Si $f$ est paire, son DL n\'est constitu&#233; que de mon&#244;mes de degr&#233; pair.&#60;br /&#62;&#60;br /&#62;**2.** Si $f$ est impaire, son DL n\'est constitu&#233; que de mon&#244;mes de degr&#233; impair.', 1, 4),
(160, 'DL au sens fort', 'Soit $f$ une fonction d&#233;finie sur un voisinage de $x_0$. On dit que le polyn&#244;me $P_n \\in \\R_n [X]$ est un d&#233;veloppement limit&#233; au sens fort &#224; l\'ordre $n$ de $f$ en $x_0$ si, au voisinage de $x_0$ : &#60;br /&#62;$$f(x) \\mathop{=}\\limits_{x\\to x_0} = P_n(x) + O((x-x_0)^{n+1})$$', 1, 2),
(161, 'Troncature', 'Soit $P = a_0 + a_1 (X-x_0) + \\dots + a_n(X-x_0)^n$ un polyn&#244;me de $\\R_n[X]$, $x_0 \\in \\R$ et $m \\leqslant n$.&#60;br /&#62;La troncature de $P$ &#224; l\'ordre $m$ au voisinage de $x_0$ est le polyn&#244;me $T_{m,x_0}(P)$ d&#233;fini par : &#60;br /&#62;&#60;br /&#62;$$T_{m, x_0}(P) = a_0 + a_1 (X-x_0) + \\dots + a_m (X-x_n)^m$$', 1, 2),
(162, 'Restriction', 'Si $f$ admet un DL &#224; l\'ordre $n$ au point $x_0$, alors $f$ admet des DL &#224; tous les ordres $m \\leqslant n$, obtenus en tronquant le DL &#224; l\'ordre $n$ &#224; la puissance $m$-i&#232;me en $(x-x_0)^m$ : autrement dit, si $m \\leqslant n$ ,&#60;br /&#62;&#60;br /&#62;$$f(x) \\mathop{=}\\limits_{x\\to x_0} = P(x) + o((x-x_0)^n) \\implies f(x) \\mathop{=}\\limits_{x\\to x_0} T_{m,x_0} (P) (x) + o((x-x_0)^m)$$', 1, 2),
(163, 'Forme normalisée d\'un DL au voisinage de $0$', 'Soit $f$ une fonction d&#233;finie au voisinage de $x_0$, admettant &#224; l\'ordre $n$ un DL non nul. Alors il existe un unique entier $m \\leqslant n$ tel que, pour $h$ au voisinage de $0$, on ait : &#60;br /&#62;$$f(x_0 + h) \\mathop{=}\\limits_{h \\to 0} h^m(a_0 + a_1h + \\dots a_{n-m}h^{n-m}+o(h^{n-m})$$', 1, 2),
(164, 'Equivalent déduit d\'un DL', 'Soit $f$ une fonction d&#233;finie au voisinage de $x_0$, telle que &#60;br /&#62;&#60;br /&#62;$$f(x_0 + h) \\mathop{=}\\limits_{h\\to 0} h^m(a_0 + a_1h + \\dots + a_{n-m}h^{n-m} + o(h^{n-m})), \\quad a_0 \\neq 0$$&#60;br /&#62;&#60;br /&#62;Alors $f(x_0 + h) \\mathop{\\sim}\\limits_{h\\to 0} a_0h^m$, c\'est-&#224;-dire $f(x)\\mathop{\\sim}\\limits_{x\\to x_0} a_0(x-x_0)^m$', 1, 4),
(165, 'Partie principale', 'Soit $f$ une fonction admettant, &#224; un certain ordre $n$ au voisinage de $x_0$, un d&#233;veloppement limit&#233; non trivial, s\'&#233;crivant sous forme normalis&#233;e :&#60;br /&#62;$$f(x_0+ h) \\mathop{=}\\limits_{h\\to 0} h^m(a_0 + a_1h + \\dots + a_{n-m}h^{n-m} + o(h^{n-m})), \\quad a_0 \\neq 0$$&#60;br /&#62;&#60;br /&#62;La partie principale de $f$ (sur l\'&#233;chelle polynomiale) est la fonction $x \\mapsto a_0(x-x_0)^m$. On dira dans cette situation que $f$ admet une partie principale d\'ordre $m$.', 1, 2),
(166, 'Somme de DL', 'Soit $f$ et $g$ deux fonctions d&#233;finies au voisinage de $0$, et $P$ et $Q$ deux polyn&#244;mes de degr&#233; au plus $n$. Si au voisinage de $0$, &#60;br /&#62;&#60;br /&#62;$f(x) \\mathop{=}\\limits_{x\\to 0} P(x) + o(x^n) \\quad $ et $\\quad g(x) \\mathop{=}\\limits_{x\\to 0} Q(x) + o(x^n)$,&#60;br /&#62;&#60;br /&#62;alors $(f+g)(x) \\mathop{=}\\limits_{x\\to 0} P(x) + Q(x) + o(x^n)$.&#60;br /&#62;&#60;br /&#62;Autrement dit, si $f$ et $g$ admettent des DL &#224; l\'ordre $n$ en $0$, leur somme aussi, et ce DL est obtenu en sommant les DL de $f$ et $g$.', 1, 4),
(167, 'Produit de DL', 'Soit $f$ et $g$ deux fonctions d&#233;finies au voisinage de $0$, et $P$ et $Q$ deux polyn&#244;mes de degr&#233; au plus $n$. Si au voisinage de $0$,&#60;br /&#62;&#60;br /&#62;$f(x) \\mathop{=}\\limits_{x\\to 0} P(x) + o(x^n) \\quad $ et $\\quad g(x) \\mathop{=}\\limits_{x\\to 0} Q(x) + o(x^n)$&#60;br /&#62;&#60;br /&#62;alors $(fg)(x) \\mathop{=}\\limits_{x\\to 0} T_n(PQ)(x) + o(x^n)$.&#60;br /&#62;&#60;br /&#62;Autrement dit, si $f$ et $g$ admettent des DL &#224; l\'ordre $n$ en $0$, leur produit aussi, et ce DL est obtenu en faisant le produit des DL de $f$ et $g$, et en ne gardant que les mon&#244;mes de degr&#233; inf&#233;rieur ou &#233;gal &#224; $n$.', 1, 1),
(168, 'Composition de DL', 'Soit $f$ et $g$ des fonctions au voisinage de $0$ telles que $f(0) = 0$, et soit $n \\geqslant 1$. Si $P$ et $Q$ sont des d&#233;veloppements limit&#233;s de $f$ et $g$ en $0$ &#224; l\'ordre $n$, alors $T_n(Q \\circ P)$ est un DL en $0$ &#224; l\'ordre $n$ de $g \\circ f$ : &#60;br /&#62;&#60;br /&#62;$(f(x) \\mathop{=}\\limits_{x\\to 0} P(x) + o(x^n)$ et $g(x) \\mathop{=}\\limits_{x\\to 0} Q(x) + o(x^n))$ $\\implies$ $g \\circ f(x) \\mathop{=}\\limits_{x\\to 0} T_n(Q \\circ P)(x) + o(x^n)$', 1, 4),
(169, 'DL d\'une réciproque', 'Soit $f$ une fonction bijective (au moins injective au voisinage de $0$) de classe $C^n$, telle que $f(0) = 0$ et $f\'(0) \\neq 0$. Alors $f^{-1}$ admet un DL &#224; l\'ordre $n$ en $0$. On peut le d&#233;terminer en identifiant les DL : &#60;br /&#62;&#60;br /&#62;$$x = f^{-1} \\circ f(x) + o(x^n)$$&#60;br /&#62;&#60;br /&#62;fournissant $n+1$ &#233;quations dont les inconnues sont les coefficients du DL de $f^{-1}$. L\'identification est possible du fait de l\'unicit&#233; du DL.', 1, 7),
(170, 'DL d\'un inverse', 'Soit $g$ une fonction d&#233;finie sur un voisinage de $0$, et ne s\'annulant pas en $0$. Si $g$ admet un DL donn&#233; par le polyn&#244;mes $P$ en $0$ &#224; l\'ordre $n$, alors $\\frac1g$ et $\\frac1P$ aussi, et les DL &#224; l\'ordre $n$ en $0$ de $\\frac1g$ et $\\frac1P$ sont les m&#234;mes. &#60;br /&#62;&#60;br /&#62;Autrement dit, si $P$ et $Q$ sont deux polyn&#244;mes de $\\R_n[X]$, alors : &#60;br /&#62;&#60;br /&#62;$(g(0)$ et $ g(x) \\mathop{=}\\limits_{x\\to 0} P(x) + o(x^n))$ $\\implies$ $(\\frac{1}{g(x)} \\mathop{=}\\limits_{x\\to 0} Q(x) + o(x^n) \\iff \\frac{1}{P(x)} \\mathop{=}\\limits_{x\\to 0} Q(x) + o(x^n))$&#60;br /&#62;', 1, 4),
(171, 'Calcul pratique du DL d\'un quotient', 'Soit $g$ une fonction admettant un DL &#224; l\'ordre $n$ au voisinage de $0$, et telle que $g(0) \\neq 0$. Soit $P$ un polyn&#244;me de degr&#233; au plus $n$ tel que au voisinage de $0$, $g(x) = P(x) + o(x^n)$. Comme $g(0) \\neq 0$, on a &#233;galement $P(0) \\neq 0$. Par cons&#233;quent, en mettant le terme constant non nul $a$ de $P$ en facteur, il existe un polyn&#244;me $R$ de degr&#233; au plus $n$ et s\'annulant en $0$, tel que :&#60;br /&#62;&#60;br /&#62;$$\\fa x \\in \\R, P(x) = a(1+R(x))$$&#60;br /&#62;&#60;br /&#62;On a alors, au voisinage de $0$ : &#60;br /&#62;&#60;br /&#62;$\\frac{1}{P(x)} = \\frac1a \\cdot \\frac{1}{1+R(x)}$ $\\mathop{=}\\limits_{x\\to 0}$ $T_n(1-R+R^2 + \\dots + (-1)^n R^n)(x) + o(x^n)$&#60;br /&#62;&#60;br /&#62;d\'apr&#232;s la formule de composition appliqu&#233;e &#224; $h \\circ R$, o&#249; $h$ est la fonction $y \\mapsto \\frac{1}{1+y}$. On obtient donc, au voisinage de $0$, d\'apr&#232;s la proposition pr&#233;c&#233;dente : &#60;br /&#62;&#60;br /&#62;$\\frac{1}{g(x)}$ $=$ $T_n(1-R + R^2 + \\dots + (-1)^nR^n)(x) + o(x^n)$.&#60;br /&#62;&#60;br /&#62;Il peut &#234;tre parfois plus judicieux d\'&#233;crire $P = a(1-R)$, car la formule de DL de $y \\mapsto \\frac{1}{1-y}$ est encore plus simple.', 1, 7),
(172, 'Primitivation d\'un DL', 'Soit $f$ une fonction d&#233;rivable au voisinage de $0$, dont la d&#233;riv&#233;e admet un DL &#224; l\'ordre $n-1$ au voisinage de $0$, donn&#233; par : &#60;br /&#62;&#60;br /&#62;$f\'(x) = a_0 + a_1x + \\dots + a_{n-1}x^{n-1} + o(x^{n-1})$.&#60;br /&#62;&#60;br /&#62;Alors $f$ admet au voisinage $0$ un DL &#224; l\'ordre $n$, donn&#233; par :&#60;br /&#62;&#60;br /&#62;$f(x) = f(0) + a_0x + \\frac{a_1}{2} x^2 + \\dots + \\frac{a_{n-1}}{n} x^n + o(x^n)$', 1, 4),
(173, 'Avertissement: Primitivation de DL', 'Pour primitiver un terme de DL, ne pas oublier ;&#60;br /&#62; &#60;br /&#62;- de primitiver &#233;galement le $o(x^{n-1})$&#60;br /&#62;- de pr&#233;ciser le terme constant (constant d\'int&#233;gration), &#233;gal &#224; $f(0)$', 1, 7),
(174, 'Dérivation de DL', 'Soit $f$ une fonction de classe $C^n$ au voisinage de $0$, admettant donc un DL &#224; l\'ordre $n$ au voisinage de $0$ : &#60;br /&#62;&#60;br /&#62;$$f(x) \\mathop{=}\\limits_{x\\to 0} a_0 + a_1x + \\dots + a_nx^n + o(x^n)$$&#60;br /&#62;&#60;br /&#62;Alors $f^{-1}$ admet un DL &#224; l\'ordre $n-1$ en $0$, &#233;gal &#224; &#60;br /&#62;&#60;br /&#62;$$f\'(x) \\mathop{=}\\limits_{x\\to 0} a_1 + 2a_2 x + 3a_3x^2 + \\dots + na_nx^{n-1} + o(x^{n-1})$$', 1, 4),
(175, 'Echelle de comparaison', 'Une &#233;chelle de comparaison au voisinage de $_t0$ est une famille $\\Large \\ve$ de fonctions, d&#233;finies et non identiquement nulles au voisinage de $t_0$, et telles que pour tout $f$ et tout $g$ de $\\Large \\ve$ tels que $f\\neq g$, on ait soit $f=o(g)$, soit $g=o(f)$.', 1, 2),
(176, 'Développement asymptotique', 'Un d&#233;veloppement asymptotique d\'une fonction $f$ sur une &#233;chelle de comparaison $\\Large \\ve$ au voisinage de $x_0$ &#224; la pr&#233;cision $\\varphi \\in \\Large \\ve$ est la donn&#233; d\'une approsimation de $f$ de la forme : &#60;br /&#62;&#60;br /&#62;$$f(x) \\mathop{=}\\limits_{x\\to x_0} \\sum_{\\psi \\in \\ve, (\\varphi = o(\\psi) \\text{ ou } \\psi = \\varphi)} a_{\\psi}\\psi(x) + o(\\varphi(x))$$&#60;br /&#62;&#60;br /&#62;o&#249; la somme est finie.', 1, 2),
(177, 'Partie principale relativement à une échelle de comparaison', 'Soit $f$ une fonction admettant sur une &#233;chelle de comparaison $\\Large \\ve$ un d&#233;veloppement asymptotique : &#60;br /&#62;&#60;br /&#62;$$f(x) \\mathop{=}\\limits_{x\\to x_0} \\sum_{\\psi \\in \\ve, (\\varphi = o(\\psi) \\text{ ou } \\psi = \\varphi)} a_{\\psi}\\psi(x) + o(\\varphi(x))$$&#60;br /&#62;&#60;br /&#62;Soit $\\psi_0$ tel que $a_0 \\neq 0$, et tel que $a_{\\psi} = 0$ pour tout $\\psi$ de $\\Large \\ve$ v&#233;rifiant $\\psi_0 = o(\\psi)$.&#60;br /&#62;&#60;br /&#62;Alors la partie principale de $f$ relativement &#224; l\'&#233;chelle de comparaison $\\Large \\ve$ est la fonction $a_{\\psi_0}\\psi_0$.', 1, 2),
(178, 'Recherche de courbes polynomiales asymptotes', 'Pour trouver les courbes polynomiales asymptotes &#224; la courbe de $f$ en $+\\infty$, il suffit de faire un DA &#224; l\'ordre $0$ de $f$ en $+\\infty$. En effet, les termes de degr&#233;s n&#233;gatifs de ce DA forment une partie polynomiale. On obtient donc (en cas d\'existence d\'un tel DA), pour un certain $m \\in \\N$ : &#60;br /&#62;&#60;br /&#62;$f(x)$ $\\mathop{=}\\limits_{x \\to +\\infty}$ $a_m(\\frac1x)^{-m} + \\dots + a_0 + o(1)$ $\\mathop{=}\\limits_{x \\to +\\infty}$ $a_mx^m + \\dots + a_0 + o(1)$.&#60;br /&#62;&#60;br /&#62;Cela signifie que $\\lim_{x \\to +\\infty} f(x) - (a_mx^m + \\dots + a_0) = 0$. Par d&#233;finition, cela revient &#224; dire que la courbe polynomiale d\'&#233;quation $y = a_mx^m + \\dots + a_0$ est asymptote &#224; la courbe de $f$ en $+\\infty$.', 1, 7),
(179, 'Position de la courbe par rapport à une courbe asymptote', 'Pour trouver la position de la courbe de $f$ par rapport &#224; une courbe polynomiale asymptote, il suffit d\'&#233;tudier le signe du terme de plus petit exposant strictement positif dans le DA.&#60;br /&#62;&#60;br /&#62;Par exemple, si ce terme est de degr&#233; $1$, on va obtenir, au voisinage de $+\\infty$ :&#60;br /&#62;&#60;br /&#62;$f(x) = a_mx^m + \\dots + a_0 + \\frac bx + o(\\frac1x) \\quad$ donc : $f(x) - (a_mx^m+ \\dots + a_0) \\mathop{\\sim}\\limits_{+\\infty} \\frac bx$.&#60;br /&#62;&#60;br /&#62;Ainsi, $f(x) - (a_m x^m + \\dots + a_0)$ est du signe de $\\frac bx$ au voisinage de $+\\infty$, donc du signe de $b$; cela fournit la position, au voisinage de $+\\infty$ de la courbe de $f$ par rapport &#224; la courbe polynomiale asymptote $x \\mapsto a_mx^m + \\dots + a_0$.', 1, 7),
(180, 'Etude d\'un point critique', 'Soit $f$ admettant en $x_0$ un point critique. Alors : &#60;br /&#62; &#60;br /&#62; - $f$ admet un extremum en $x_0$ si et seulement si la partie principale de $x\\mapsto f(x) - f(x_0)$ au voisinage de $x_0$ est d\'ordre pair.&#60;br /&#62;&#60;br /&#62; - dans ce cas, si $ax^{\\alpha}$ d&#233;signe cette partie principale, $f$ admet un minimum local en $x_0$ si $a\\gt0$ et un maximul local si $a \\lt 0$.', 1, 4),
(181, 'DL d\'une fonction de deux variables', 'Un d&#233;veloppement limit&#233; &#224; l\'ordre $n$ d\'une fonction $f$ d&#233;finie au voisinage de $X_0$ est une approximation polynomiale $$f(X_0 + H) = P(h,k) + o(||H||^n),$$&#60;br /&#62;&#60;br /&#62;o&#249; $H = (j, k)$, et $P$ est un polyn&#244;me de deux variables $h$ et $k$, de degr&#233; total inf&#233;rieur ou &#233;gal &#224; $n$ (le degr&#233; total d\'un mon&#244;me $h^ik^j$ &#233;tant $i+j$).', 1, 2),
(182, 'Calculer le DL d\'une fonction à deux variables', 'On obtient les DL de fonctions de deux variables $x$ et $y$ en se ramenant &#224; des DL de fonctions d\'une seule variable, $x$, ou $y$, ou une nouvelle variable d&#233;finie en fonction de $x$ et $y$. Il faut ensuite bien g&#233;rer le $o$, en remarquant qu\'avec les notations pr&#233;c&#233;dentes, &#60;br /&#62;&#60;br /&#62;$|h| \\leqslant ||H|| \\quad$  et  $\\quad |k| \\leqslant ||H||$.&#60;br /&#62;&#60;br /&#62;En particulier, un $o(h)$ est aussi un $o(||H||)$. De m&#234;me pour un $o(k)$, mais aussi pour un $o(h+k)$.', 1, 7),
(183, 'Remarque, plan tangent', 'Le DL &#224; l\'ordre 1 d\'une fonction &#224; deux variables d&#233;finit l\'&#233;quation d\'un plan, qui correspond &#224; la meilleure approximation affine local.&#60;br /&#62;Ainsi, cela d&#233;finit le plan tangent &#224; la courbe au point $X_0$.', 1, 1),
(184, 'Unicité du DL à l\'ordre $1$', 'Soit $f$ une fonction de deux variables d&#233;finies au voisinage de $X_0$. Si $f$ admet un DL &#224; l\'ordre $1$ en $X_0$ : &#60;br /&#62;&#60;br /&#62;**1.** Ce DL est unique&#60;br /&#62;&#60;br /&#62;**2.** $f$ admet alors des d&#233;riv&#233;es partielles par rapport &#224; $x$ et $y$ en $X_0 = (x_0, y_0)$&#60;br /&#62;&#60;br /&#62;**3.** Le DL est alors donn&#233; par : $$f(x,y) = f(X_0) + (x-x_0)\\frac{\\part f}{\\part x}(X_0) + (y-y_0)\\frac{\\part f}{\\part y}(X_0) + o(||X-X_0||)$$', 1, 5),
(185, 'Existence du DL à l\'ordre $1$, Taylor-Young', 'Soit $f$ de classe $C^1$ au voisinage de $X_0$, alors $f$ admet un DL &#224; l\'ordre $1$ au voisinage de $X_0$, d&#233;crit comme dans le th&#233;or&#232;me pr&#233;c&#233;dent, ce qui se r&#233;&#233;crit &#233;galement : $$f(X) = f(X_0) + \\langle X - X_0, \\nabla f(X_0)\\rangle + o(||X-X_0||)$$', 1, 5),
(186, 'Règle de la chaîne', 'Soit $X(t) = (x(t), y(t))$.&#60;br /&#62;&#60;br /&#62;&#60;br /&#62;Soit $f$ une fonction de classe $C^1$ sur un ouvert $U$ et $x, y : I \\to U$ deux applications de classe $C^1$ sur un intervalle ouvert $I$ de $\\R$. Alors la fonction $t \\mapsto f(X(t))$ est de classe $C^1$ sur $I$, et &#60;br /&#62;&#60;br /&#62;$$\\frac{d}{dt}(f(X(t)) = x\'(t) \\cdot \\frac{\\part f}{\\part x}(X(t)) + y\'(t) \\cdot \\frac{\\part f}{\\part y}(X(t))$$', 1, 5),
(187, 'Extremum local, global', 'Soit $f : D \\to \\R$ une application d&#233;finie sur un sous-ensemble $D$ de $\\R^2$, et $X_0 \\in D$. On dit que $f$ admet en $X_0$ un maximum :&#60;br /&#62;- global si pour tout $X \\in D, f(X) \\leqslant f(X_0)$&#60;br /&#62;- local s\'il existe $V \\in \\cal{V}(X_0)$ un voisinage de $X_0$ tel que pour tout $X \\in V \\cap U$, $f(X) \\leqslant f(X_0)$&#60;br /&#62;&#60;br /&#62;Cette d&#233;finition s\'adapte aussi pour le cas d\'un minimum global ou local. On dit que $f$ admet un extremum (local ou global) en $X_0$ si $f$ admet un maximum ou un minimum (local ou global) en $X_0$.', 1, 2),
(188, 'CN pour un extremum local (fonction à plusieurs variables)', 'Soit $f$ une fonction de classe $C^1$ sur un ouvert $U$ de $\\R^2$. Alors si $f$ admet un extremum local en $X_0 \\in U$, $\\nabla f(X_0) = 0$.', 1, 5),
(189, 'Point critique (fonctions à plusieurs variables)', 'On dit que $X_0$ est point critique de $f$ si $\\nabla f(X_0) = 0$.', 1, 2),
(190, 'Etude d\'un extremum (fonctions à plusieurs variables)', '- Pour &#233;tudier l\'existence d\'un extremum local en un point critique $X_0$, &#233;tudier le signe de $f(X_0 + H) - f(X_0)$.&#60;br /&#62;&#60;br /&#62;- Pour montrer que le signe n\'est pas toujours le m&#234;me localement, on pourra faire un DL &#224; l\'ordre $2$ en ce point critique, puis &#233;tudier un changement de signe issu de la partie de degr&#233; $2$. On pourra, pour le r&#233;diger rigoureusement, se ramener &#224; une fonction d\'une variable (en param&#233;trant une direction).&#60;br /&#62;&#60;br /&#62;- On pourra &#233;ventuellement se servir d\'une mise sous forme canonique par rapport &#224; l\'une des deux variables, pour essayer de mettre l\'expression sous forme d\'une diff&#233;rence de $2$ carr&#233;s.', 1, 7),
(191, 'DL de $e^x$', '$e^x$ $\\mathop{=}\\limits_{x \\to 0}$ $1 + x + \\frac{x^2}{2!} + \\dots + \\frac{x^n}{n!} + o(x^n)$ $\\mathop{=}\\limits_{x \\to 0}$ $\\sum_{k=0}^n\\frac{x^k}{k!} + o(x^n)$', 1, 5),
(192, 'DL de $\\ln(1+x)$', '$\\ln(1+x)$ $\\mathop{=}\\limits_{x \\to 0}$ $x - \\frac{x^2}{2} + \\dots + \\frac{(-1)^{n-1}x^n}{n!} + o(x^n)$ $\\mathop{=}\\limits_{x \\to 0}$ $\\sum_{k=0}^n\\frac{(-1)^{k-1}x^k}{k} + o(x^n)$', 1, 5),
(193, 'DL de $\\cos(x)$', '$\\cos^x$ $\\mathop{=}\\limits_{x \\to 0}$ $1 - \\frac{x^2}{2!} + \\dots + \\frac{(-1)^nx^{2n}}{(2n)!} + o(x^n)$ $\\mathop{=}\\limits_{x \\to 0}$ $\\sum_{k=0}^n\\frac{(-1)^kx^{2k}}{(2k)!} + o(x^{2n+1})$', 1, 5),
(194, 'DL de $\\sin(x)$', '$\\sin(x)$ $\\mathop{=}\\limits_{x \\to 0}$ $x - \\frac{x^3}{3!} + \\dots + \\frac{(-1)^nx^{2n+1}}{(2n+1)!} + o(x^n)$ $\\mathop{=}\\limits_{x \\to 0}$ $\\sum_{k=0}^n\\frac{(-1)^kx^{2k+1}}{(2k+1)!} + o(x^{2n+2})$', 1, 5),
(195, 'DL de $\\tan(x)$', '$\\tan(x)$  $\\mathop{=}\\limits_{x \\to 0}$  $x + \\frac{x^3}3 + \\frac{2}{15} x^5 + o(x^5)$', 1, 5),
(196, 'Homomorphisme', 'Soit $E$ et $F$ deux ensembles munis d\'une structure de truc, $E$ &#233;tant muni des lois de composition interne $(\\bs_1, \\dots, \\bs_n)$ et $F$ des lois $(\\diamond_1, \\dots, \\diamond_n)$, et des lois de compositions externes $(\\top_1, \\dots, \\top_m)$ et $(\\bot_1, \\dots, \\bot_m)$ sur &#60;br /&#62;$K_1, \\dots K_n$ respectivement. On dit qu\'une application $f: E\\to F$ est un homomorphisme de truc (ou plus simplement un morphisme de truc) ssi :&#60;br /&#62;&#60;br /&#62; - L\'application $f$ est compatible avec (ou \"respecte\") les lois internes: &#60;br /&#62;     &#60;br /&#62;      $ \\fa k \\in \\[1, n\\], \\fa (x,y) \\in E^2, f(x \\! \\bs_{{\\!\\!}k} \\ y) = f(x) \\diamond_k f(y)$&#60;br /&#62;&#60;br /&#62; - L\'application $f$ est compatible (ou \"respecte\") les lois externes : &#60;br /&#62;&#60;br /&#62;      $ \\fa l \\in \\[1,m\\],\\fa \\lambda \\in K_l, \\fa x \\in E, f(\\lambda \\top_l \\  x) = \\lambda \\bot_l \\ f(x)$ &#60;br /&#62;&#60;br /&#62; - Si l\'existence du neutre $e_i$ oour la lois $\\bs_i$ est impos&#233;e dans les axiomes (et donc le neutre $e_i\'$ pour la loi $\\diamond_i$ existe aussi), $f$ doit &#234;tre compatible avec le neutre : $f(e_i) = e_i\'$.&#60;br /&#62;&#60;br /&#62;On peut avoir &#224; tendance &#224; rajouter certaines propri&#233;t&#233;s li&#233;es &#224; la structure &#233;tudi&#233;e. On peut aussi ajouter l\'existence d\'un homomorphisme nul (ne v&#233;rifiant pas la compatibilit&#233; avec les neutres non additifs), afin d\'obtenir une structure int&#233;ressante sur l\'ensemble des morphismes.&#60;br /&#62;', 1, 2),
(197, 'Composition d\'homomorphisme', 'Soit $f: E \\to F$ et $g: F \\to G$ deux morphismes de truc. Alors $g \\circ f$ est un morphisme de truc.', 1, 4),
(198, 'Terminologie - isomorphisme', 'Un isomorphisme de truc est un homomorphisme de truc bijectif.', 1, 1),
(199, 'Terminologie - endomorphisme', 'Un endomorphisme de truc est un homomorphisme de truc de $E$ dans lui m&#234;me (muni des m&#234;mes lois)', 1, 1),
(200, 'Terminologie - automorphisme', 'Un automorphisme de truc est un endomorphisme qui est &#233;galement un automorphisme.', 1, 1),
(201, 'Isomorphisme et fonctions réciproques', 'Si $f : E \\to F$ est un isomorphisme de truc, alors $f^{-1}$ est un isomorphisme de truc.', 1, 4),
(202, 'Groupe', 'Soit $G$ un ensemble. On dit que $G$ est muni d\'une structure de groupe si $G$ est muni d\'une loi de composition $\\bs$ telle que : &#60;br /&#62; - $\\bs$ est associative&#60;br /&#62; - il existe un &#233;l&#233;ment neutre $e$ pour la loi $\\bs$&#60;br /&#62; - tout &#233;l&#233;ment $x$ admet un sym&#233;trique $x^s$', 1, 2),
(203, 'Unicité du neutre et des symétriques', 'Soit $(G, \\bs)$ un groupe. Alors : &#60;br /&#62;&#60;br /&#62; - $G$ admet un unique &#233;l&#233;ment neutre pour $\\bs$&#60;br /&#62;&#60;br /&#62; - Pour tout $x \\in G$, il existe un unique sym&#233;trique $x^s$ de $x$.', 1, 4),
(204, 'Régularité des éléments d\'un groupe', 'Tous les &#233;l&#233;ments d\'un groupe sont r&#233;gulier pour la loi du groupe.', 1, 9),
(205, 'Groupe abélien ou commutatif', 'On dit qu\'un groupe $(G, \\bs)$ est ab&#233;lien (ou commutatif) si la loi de $G$ est commutative.', 1, 2),
(206, 'Homomorphisme de groupe', 'Soit $(G, \\bs)$ et $(H, \\diamond)$ deux groupes.&#60;br /&#62;&#60;br /&#62; - On dit qu\'une application $f : G \\to H$ est un homomorphisme de groupe si pour tout $(x,y) \\in G$, $f(x \\bs y) = f(x) \\diamond f(y)$&#60;br /&#62;  &#60;br /&#62;  On note Hom($G, H$), l\'ensemble des homomorphismes de $G$ dans $H$.&#60;br /&#62;&#60;br /&#62; - Si $(G, \\bs) = (H, \\diamond)$, on dit que $f$ est un endomorphisme de $(G, \\bs)$.&#60;br /&#62;&#60;br /&#62; - Un homomorphisme bijectif est appel&#233; isomorphisme; en vertu de ce qui pr&#233;c&#232;de, la r&#233;ciproque d\'un isomorphisme est un isomorphisme&#60;br /&#62;&#60;br /&#62; - Un endomorphisme bijectif est appel&#233; automorphisme; en vertu de ce qui pr&#233;c&#232;de, la r&#233;ciproque d\'un automorphisme est un automorphisme.&#60;br /&#62;&#60;br /&#62;  On note Aut($G$) l\'ensemble des automorphismes de $G$.', 1, 2),
(207, 'Image du neutre par un morphisme', 'Soit $f: G \\to H$ un morphisme de groupe, alors $f(e_G) = e_H$.', 1, 4),
(208, 'Image par un morphisme d\'un inverse', 'Soit $G, H$ deux groupes (not&#233; multiplicativement), et $f$ un morphisme de $G$ dans $H$. Alors $f(x^{-1}) = f(x)^{-1}$. ', 1, 4),
(209, 'Structure de $(\\text{Aut}(G), \\circ)$', 'Soit $G$ un groupe. Alors $(\\text{Aut}(G), \\circ)$ est un groupe.', 1, 4),
(210, 'Sous-groupe', 'Soit $(G, \\bs)$ un groupe. Un sous ensemble $H$ de $G$ est appel&#233; sous-groupe de $G$ si $H$ est stable pour la loi de $G$ et si la loi induite d&#233;finit sur $H$ une structure de groupe.', 1, 2),
(211, 'Appartenance de l\'élément neutre à $H$', 'Soit $H$ un sous-groupe de $G$. Alors l\'&#233;l&#233;ment neutre $e$ de $G$ est dans $H$ et est l\'&#233;l&#233;ment neutre du groupe $H$.', 1, 4),
(212, 'Caractérisation des sous-groupes', 'Un sous-ensemble $H$ d\'un groupe $(G, \\bs)$ (de neutre $e_G$) est un sous-groupe de $G$ si et seulement si : &#60;br /&#62;&#60;br /&#62; - $(i)$ $H$ est non vide  / ou  $e_G \\in H$&#60;br /&#62;&#60;br /&#62; - $(ii)$ $H$ est stable pour $\\bs$ : $\\fa (x,y) \\in H, x\\bs y \\in H$&#60;br /&#62;&#60;br /&#62; - $(iii)$ $H$ est stable par prise de sym&#233;trique: $\\fa x \\in H, x^s \\in H$', 1, 5);

-- --------------------------------------------------------

--
-- Structure de la table `elements_a_verifier`
--

DROP TABLE IF EXISTS `elements_a_verifier`;
CREATE TABLE IF NOT EXISTS `elements_a_verifier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_element` int NOT NULL,
  `nb_ok` int NOT NULL DEFAULT '0',
  `nb_refus` int NOT NULL DEFAULT '0',
  `limite` int NOT NULL DEFAULT '5',
  PRIMARY KEY (`id`),
  KEY `elements_a_verifier_fk0` (`id_element`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `elements_a_verifier`
--

TRUNCATE TABLE `elements_a_verifier`;
-- --------------------------------------------------------

--
-- Structure de la table `elements_connus`
--

DROP TABLE IF EXISTS `elements_connus`;
CREATE TABLE IF NOT EXISTS `elements_connus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_compte` int NOT NULL,
  `id_element` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `elements_connus_fk0` (`id_compte`),
  KEY `elements_connus_fk1` (`id_element`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `elements_connus`
--

TRUNCATE TABLE `elements_connus`;
-- --------------------------------------------------------

--
-- Structure de la table `elements_demonstrations`
--

DROP TABLE IF EXISTS `elements_demonstrations`;
CREATE TABLE IF NOT EXISTS `elements_demonstrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_element` int NOT NULL,
  `id_demonstration` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `elements_demonstrations_fk0` (`id_element`),
  KEY `elements_demonstrations_fk1` (`id_demonstration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `elements_demonstrations`
--

TRUNCATE TABLE `elements_demonstrations`;
-- --------------------------------------------------------

--
-- Structure de la table `elements_desactives_comptes`
--

DROP TABLE IF EXISTS `elements_desactives_comptes`;
CREATE TABLE IF NOT EXISTS `elements_desactives_comptes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_element` int NOT NULL,
  `id_compte` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `elements_desactives_comptes`
--

TRUNCATE TABLE `elements_desactives_comptes`;
-- --------------------------------------------------------

--
-- Structure de la table `exercices`
--

DROP TABLE IF EXISTS `exercices`;
CREATE TABLE IF NOT EXISTS `exercices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_compte` int NOT NULL,
  `titre` varchar(255) NOT NULL,
  `est_public` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exercices_fk0` (`id_compte`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `exercices`
--

TRUNCATE TABLE `exercices`;
--
-- Déchargement des données de la table `exercices`
--

INSERT INTO `exercices` (`id`, `id_compte`, `titre`, `est_public`) VALUES
(2, 1, 'Exercice 1', 1),
(3, 1, 'Exercice 2', 0);

-- --------------------------------------------------------

--
-- Structure de la table `fiches`
--

DROP TABLE IF EXISTS `fiches`;
CREATE TABLE IF NOT EXISTS `fiches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `est_public` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `fiches`
--

TRUNCATE TABLE `fiches`;
-- --------------------------------------------------------

--
-- Structure de la table `fiches_chapitres`
--

DROP TABLE IF EXISTS `fiches_chapitres`;
CREATE TABLE IF NOT EXISTS `fiches_chapitres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_fiche` int NOT NULL,
  `id_chapitre` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fiches_chapitres_fk0` (`id_fiche`),
  KEY `fiches_chapitres_fk1` (`id_chapitre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `fiches_chapitres`
--

TRUNCATE TABLE `fiches_chapitres`;
-- --------------------------------------------------------

--
-- Structure de la table `fiches_elements`
--

DROP TABLE IF EXISTS `fiches_elements`;
CREATE TABLE IF NOT EXISTS `fiches_elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_fiche` int NOT NULL,
  `id_element` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fiches_elements_fk0` (`id_fiche`),
  KEY `fiches_elements_fk1` (`id_element`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `fiches_elements`
--

TRUNCATE TABLE `fiches_elements`;
-- --------------------------------------------------------

--
-- Structure de la table `groupes`
--

DROP TABLE IF EXISTS `groupes`;
CREATE TABLE IF NOT EXISTS `groupes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_creator` int NOT NULL,
  `nom` varchar(255) NOT NULL,
  `est_public` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groupes_fk0` (`id_creator`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `groupes`
--

TRUNCATE TABLE `groupes`;
--
-- Déchargement des données de la table `groupes`
--

INSERT INTO `groupes` (`id`, `id_creator`, `nom`, `est_public`) VALUES
(3, 1, 'LLG - MP2I', 0),
(4, 1, 'Groupe : 6804387493', 1);

-- --------------------------------------------------------

--
-- Structure de la table `groupes_comptes`
--

DROP TABLE IF EXISTS `groupes_comptes`;
CREATE TABLE IF NOT EXISTS `groupes_comptes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_compte` int NOT NULL,
  `id_groupe` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groupes_comptes_fk0` (`id_compte`),
  KEY `groupes_comptes_fk1` (`id_groupe`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `groupes_comptes`
--

TRUNCATE TABLE `groupes_comptes`;
--
-- Déchargement des données de la table `groupes_comptes`
--

INSERT INTO `groupes_comptes` (`id`, `id_compte`, `id_groupe`) VALUES
(1, 1, 3),
(2, 1, 4);

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_compte` int NOT NULL,
  `message` text NOT NULL,
  `date` date NOT NULL,
  `edited` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `messages_fk0` (`id_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `messages`
--

TRUNCATE TABLE `messages`;
-- --------------------------------------------------------

--
-- Structure de la table `permissions_comptes_groupes`
--

DROP TABLE IF EXISTS `permissions_comptes_groupes`;
CREATE TABLE IF NOT EXISTS `permissions_comptes_groupes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_groupe` int NOT NULL,
  `id_compte` int NOT NULL,
  `permission_ecriture` tinyint(1) NOT NULL,
  `est_admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_comptes_groupes_fk0` (`id_groupe`),
  KEY `permissions_comptes_groupes_fk1` (`id_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `permissions_comptes_groupes`
--

TRUNCATE TABLE `permissions_comptes_groupes`;
-- --------------------------------------------------------

--
-- Structure de la table `position_chapitres`
--

DROP TABLE IF EXISTS `position_chapitres`;
CREATE TABLE IF NOT EXISTS `position_chapitres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cour` int NOT NULL,
  `id_chapitre` int NOT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `position_chapitres`
--

TRUNCATE TABLE `position_chapitres`;
--
-- Déchargement des données de la table `position_chapitres`
--

INSERT INTO `position_chapitres` (`id`, `id_cour`, `id_chapitre`, `position`) VALUES
(1, 1, 1, 13),
(2, 1, 2, 2),
(3, 1, 3, 3),
(4, 1, 4, 4),
(5, 1, 5, 5),
(6, 1, 6, 6),
(7, 1, 7, 7),
(8, 1, 8, 8),
(9, 1, 9, 3),
(10, 1, 10, 10),
(11, 1, 11, 11),
(12, 1, 12, 12),
(13, 1, 13, 9),
(14, 1, 14, 14),
(15, 1, 15, 15),
(16, 1, 16, 16),
(17, 1, 17, 17),
(18, 1, 18, 18),
(19, 1, 19, 19),
(20, 1, 20, 20),
(21, 1, 21, 21),
(22, 1, 22, 22),
(23, 1, 23, 24);

-- --------------------------------------------------------

--
-- Structure de la table `position_elements`
--

DROP TABLE IF EXISTS `position_elements`;
CREATE TABLE IF NOT EXISTS `position_elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_chapitre` int NOT NULL,
  `id_element` int NOT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `position_elements`
--

TRUNCATE TABLE `position_elements`;
--
-- Déchargement des données de la table `position_elements`
--

INSERT INTO `position_elements` (`id`, `id_chapitre`, `id_element`, `position`) VALUES
(19, 1, 19, 10),
(18, 1, 18, 9),
(20, 1, 20, 11),
(15, 1, 15, 6),
(17, 1, 17, 8),
(16, 1, 16, 7),
(14, 1, 14, 5),
(13, 1, 13, 4),
(12, 1, 12, 3),
(11, 1, 11, 2),
(21, 1, 21, 12),
(22, 1, 22, 13),
(23, 1, 23, 14),
(24, 1, 24, 15),
(25, 1, 25, 16),
(26, 1, 26, 17),
(27, 1, 27, 18),
(28, 1, 28, 19),
(29, 1, 29, 20),
(30, 1, 30, 21),
(31, 1, 31, 22),
(32, 1, 32, 23),
(33, 1, 33, 24),
(34, 1, 34, 25),
(35, 1, 35, 26),
(36, 1, 36, 27),
(37, 1, 37, 28),
(38, 1, 38, 29),
(39, 1, 39, 30),
(40, 1, 40, 31),
(41, 1, 41, 32),
(42, 1, 42, 33),
(43, 1, 43, 34),
(44, 1, 44, 35),
(45, 1, 45, 36),
(46, 1, 46, 37),
(47, 1, 47, 38),
(48, 1, 48, 39),
(49, 1, 49, 40),
(50, 1, 50, 41),
(51, 19, 51, 2),
(52, 19, 52, 3),
(53, 19, 53, 4),
(54, 19, 54, 5),
(55, 19, 55, 6),
(56, 19, 56, 7),
(57, 19, 57, 8),
(58, 19, 58, 9),
(60, 19, 60, 10),
(61, 19, 61, 11),
(62, 19, 62, 12),
(63, 19, 63, 13),
(64, 19, 64, 14),
(65, 19, 65, 15),
(66, 19, 66, 16),
(67, 19, 67, 17),
(68, 19, 68, 18),
(69, 19, 69, 19),
(70, 19, 70, 20),
(71, 19, 71, 21),
(72, 19, 72, 22),
(74, 14, 74, 2),
(75, 14, 75, 3),
(76, 14, 76, 4),
(77, 14, 77, 5),
(78, 14, 78, 6),
(79, 14, 79, 7),
(80, 14, 80, 8),
(81, 14, 81, 9),
(82, 14, 82, 10),
(83, 14, 83, 11),
(84, 14, 84, 12),
(85, 14, 85, 13),
(86, 14, 86, 14),
(87, 14, 87, 15),
(88, 14, 88, 16),
(89, 14, 89, 17),
(90, 14, 90, 18),
(91, 14, 91, 19),
(92, 14, 92, 20),
(93, 14, 93, 21),
(94, 14, 94, 22),
(95, 14, 95, 23),
(96, 14, 96, 24),
(97, 14, 97, 25),
(98, 14, 98, 26),
(99, 15, 99, 2),
(100, 15, 100, 3),
(101, 15, 101, 4),
(102, 15, 102, 5),
(103, 15, 103, 6),
(104, 15, 104, 7),
(105, 15, 105, 8),
(106, 15, 106, 9),
(107, 15, 107, 10),
(108, 15, 108, 11),
(109, 15, 109, 12),
(110, 15, 110, 13),
(111, 15, 111, 14),
(112, 15, 112, 15),
(113, 15, 113, 16),
(114, 15, 114, 17),
(115, 15, 115, 18),
(116, 15, 116, 19),
(117, 15, 117, 20),
(118, 15, 118, 21),
(119, 15, 119, 22),
(120, 15, 120, 23),
(121, 15, 121, 24),
(122, 15, 122, 25),
(123, 15, 123, 26),
(124, 15, 124, 27),
(125, 15, 125, 28),
(126, 15, 126, 29),
(127, 15, 127, 30),
(128, 15, 128, 31),
(129, 15, 129, 32),
(130, 15, 130, 33),
(131, 15, 131, 34),
(132, 15, 132, 35),
(133, 1, 133, 42),
(134, 1, 134, 43),
(135, 1, 135, 44),
(136, 1, 136, 45),
(137, 1, 137, 46),
(138, 1, 138, 47),
(139, 1, 139, 48),
(140, 1, 140, 49),
(141, 1, 141, 50),
(142, 1, 142, 51),
(143, 1, 143, 52),
(144, 1, 144, 53),
(145, 1, 145, 54),
(146, 1, 146, 55),
(147, 1, 147, 56),
(148, 1, 148, 57),
(149, 1, 149, 58),
(150, 1, 150, 59),
(151, 16, 151, 2),
(152, 16, 152, 3),
(153, 16, 153, 4),
(154, 16, 154, 5),
(155, 16, 155, 6),
(156, 16, 156, 7),
(157, 16, 157, 8),
(158, 16, 158, 9),
(159, 16, 159, 10),
(160, 16, 160, 11),
(161, 16, 161, 12),
(162, 16, 162, 13),
(163, 16, 163, 14),
(164, 16, 164, 15),
(165, 16, 165, 16),
(166, 16, 166, 17),
(167, 16, 167, 18),
(168, 16, 168, 19),
(169, 16, 169, 20),
(170, 16, 170, 21),
(171, 16, 171, 22),
(172, 16, 172, 23),
(173, 16, 173, 24),
(174, 16, 174, 25),
(175, 16, 175, 26),
(176, 16, 176, 27),
(177, 16, 177, 28),
(178, 16, 178, 29),
(179, 16, 179, 30),
(180, 16, 180, 31),
(181, 16, 181, 32),
(182, 16, 182, 33),
(183, 16, 183, 34),
(184, 16, 184, 35),
(185, 16, 185, 36),
(186, 16, 186, 37),
(187, 16, 187, 38),
(188, 16, 188, 39),
(189, 16, 189, 40),
(190, 16, 190, 41),
(191, 16, 191, 42),
(192, 16, 192, 43),
(193, 16, 193, 44),
(194, 16, 194, 45),
(195, 16, 195, 46),
(196, 19, 196, 23),
(197, 19, 197, 24),
(198, 19, 198, 25),
(199, 19, 199, 26),
(200, 19, 200, 27),
(201, 19, 201, 28),
(202, 19, 202, 29),
(203, 19, 203, 30),
(204, 19, 204, 31),
(205, 19, 205, 32),
(206, 19, 206, 33),
(207, 19, 207, 34),
(208, 19, 208, 35),
(209, 19, 209, 36),
(210, 19, 210, 37),
(211, 19, 211, 38),
(212, 19, 212, 39);

-- --------------------------------------------------------

--
-- Structure de la table `questions_exercices`
--

DROP TABLE IF EXISTS `questions_exercices`;
CREATE TABLE IF NOT EXISTS `questions_exercices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_exercice` int NOT NULL,
  `_type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `texte` text,
  PRIMARY KEY (`id`),
  KEY `questions_exercice_fk0` (`id_exercice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `questions_exercices`
--

TRUNCATE TABLE `questions_exercices`;
-- --------------------------------------------------------

--
-- Structure de la table `reponses_questions_exercices`
--

DROP TABLE IF EXISTS `reponses_questions_exercices`;
CREATE TABLE IF NOT EXISTS `reponses_questions_exercices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_exercice` int NOT NULL,
  `id_question` int NOT NULL,
  `texte` text,
  `id_brouillon_exercice` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `reponses_questions_exercices`
--

TRUNCATE TABLE `reponses_questions_exercices`;
-- --------------------------------------------------------

--
-- Structure de la table `solutions_exercices`
--

DROP TABLE IF EXISTS `solutions_exercices`;
CREATE TABLE IF NOT EXISTS `solutions_exercices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_exercice` int NOT NULL,
  `id_compte` int NOT NULL,
  `texte` text NOT NULL,
  `nb_accepte` int NOT NULL,
  `nb_refus` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reponse_exercice_fk0` (`id_exercice`),
  KEY `reponse_exercice_fk1` (`id_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `solutions_exercices`
--

TRUNCATE TABLE `solutions_exercices`;
-- --------------------------------------------------------

--
-- Structure de la table `types elements`
--

DROP TABLE IF EXISTS `types elements`;
CREATE TABLE IF NOT EXISTS `types elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  `couleur` text NOT NULL,
  `forme` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tronquer la table avant d'insérer `types elements`
--

TRUNCATE TABLE `types elements`;
--
-- Déchargement des données de la table `types elements`
--

INSERT INTO `types elements` (`id`, `nom`, `couleur`, `forme`) VALUES
(1, 'texte', 'black', '1px solid'),
(2, 'definition', 'green', '2px solid'),
(3, 'propriete', '', '2px solid'),
(4, 'proposition', '', '2px solid'),
(5, 'theoreme', 'red', '5px double'),
(6, 'axiome', 'red', '5px double'),
(7, 'methode', 'blue', '5px double'),
(8, 'lemme', 'rgb(0, 0, 120)', '5px double'),
(9, 'corollaire', 'rgb(120,0,0)', '5px double');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `brouillons`
--
ALTER TABLE `brouillons`
  ADD CONSTRAINT `brouillons_fk0` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id`);

--
-- Contraintes pour la table `brouillons_comptes`
--
ALTER TABLE `brouillons_comptes`
  ADD CONSTRAINT `brouillons_comptes_fk0` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id`),
  ADD CONSTRAINT `brouillons_comptes_fk1` FOREIGN KEY (`id_brouillon`) REFERENCES `brouillons` (`id`);

--
-- Contraintes pour la table `brouillon_exercice`
--
ALTER TABLE `brouillon_exercice`
  ADD CONSTRAINT `brouillon_exercice_fk0` FOREIGN KEY (`id_exercice`) REFERENCES `exercices` (`id`),
  ADD CONSTRAINT `brouillon_exercice_fk1` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id`);

--
-- Contraintes pour la table `chapitres_elements`
--
ALTER TABLE `chapitres_elements`
  ADD CONSTRAINT `chapitres_elements_fk0` FOREIGN KEY (`id_chapitre`) REFERENCES `chapitres` (`id`),
  ADD CONSTRAINT `chapitres_elements_fk1` FOREIGN KEY (`id_element`) REFERENCES `element` (`id`);

--
-- Contraintes pour la table `chapitres_exercices`
--
ALTER TABLE `chapitres_exercices`
  ADD CONSTRAINT `chapitres_exercices_fk0` FOREIGN KEY (`id_chapitre`) REFERENCES `chapitres` (`id`),
  ADD CONSTRAINT `chapitres_exercices_fk1` FOREIGN KEY (`id_exercice`) REFERENCES `exercices` (`id`);

--
-- Contraintes pour la table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `cours_fk0` FOREIGN KEY (`id_createur`) REFERENCES `comptes` (`id`);

--
-- Contraintes pour la table `cours_chapitres`
--
ALTER TABLE `cours_chapitres`
  ADD CONSTRAINT `cours_chapitres_fk0` FOREIGN KEY (`id_cour`) REFERENCES `cours` (`id`);

--
-- Contraintes pour la table `cours_groupes`
--
ALTER TABLE `cours_groupes`
  ADD CONSTRAINT `cours_groupes_fk0` FOREIGN KEY (`id_cour`) REFERENCES `cours` (`id`),
  ADD CONSTRAINT `cours_groupes_fk1` FOREIGN KEY (`id_groupe`) REFERENCES `groupes` (`id`);

--
-- Contraintes pour la table `demonstrations`
--
ALTER TABLE `demonstrations`
  ADD CONSTRAINT `demonstrations_fk0` FOREIGN KEY (`id_element`) REFERENCES `element` (`id`),
  ADD CONSTRAINT `demonstrations_fk1` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id`);

--
-- Contraintes pour la table `dernier_action`
--
ALTER TABLE `dernier_action`
  ADD CONSTRAINT `dernier_action_fk0` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id`),
  ADD CONSTRAINT `dernier_action_fk1` FOREIGN KEY (`id_brouillon`) REFERENCES `brouillons` (`id`),
  ADD CONSTRAINT `dernier_action_fk2` FOREIGN KEY (`id_brouillon_exo`) REFERENCES `brouillon_exercice` (`id`),
  ADD CONSTRAINT `dernier_action_fk3` FOREIGN KEY (`id_fiche`) REFERENCES `fiches` (`id`),
  ADD CONSTRAINT `dernier_action_fk4` FOREIGN KEY (`id_chapitre`) REFERENCES `chapitres` (`id`);

--
-- Contraintes pour la table `discussions`
--
ALTER TABLE `discussions`
  ADD CONSTRAINT `discussions_fk0` FOREIGN KEY (`id_groupe`) REFERENCES `groupes` (`id`),
  ADD CONSTRAINT `discussions_fk1` FOREIGN KEY (`id_compte1`) REFERENCES `comptes` (`id`),
  ADD CONSTRAINT `discussions_fk2` FOREIGN KEY (`id_compte2`) REFERENCES `comptes` (`id`);

--
-- Contraintes pour la table `discussions_messages`
--
ALTER TABLE `discussions_messages`
  ADD CONSTRAINT `discussions_messages_fk0` FOREIGN KEY (`id_discussion`) REFERENCES `discussions` (`id`),
  ADD CONSTRAINT `discussions_messages_fk1` FOREIGN KEY (`id_message`) REFERENCES `messages` (`id`);

--
-- Contraintes pour la table `elements_a_verifier`
--
ALTER TABLE `elements_a_verifier`
  ADD CONSTRAINT `elements_a_verifier_fk0` FOREIGN KEY (`id_element`) REFERENCES `element` (`id`);

--
-- Contraintes pour la table `elements_connus`
--
ALTER TABLE `elements_connus`
  ADD CONSTRAINT `elements_connus_fk0` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id`),
  ADD CONSTRAINT `elements_connus_fk1` FOREIGN KEY (`id_element`) REFERENCES `element` (`id`);

--
-- Contraintes pour la table `elements_demonstrations`
--
ALTER TABLE `elements_demonstrations`
  ADD CONSTRAINT `elements_demonstrations_fk0` FOREIGN KEY (`id_element`) REFERENCES `element` (`id`),
  ADD CONSTRAINT `elements_demonstrations_fk1` FOREIGN KEY (`id_demonstration`) REFERENCES `demonstrations` (`id`);

--
-- Contraintes pour la table `exercices`
--
ALTER TABLE `exercices`
  ADD CONSTRAINT `exercices_fk0` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id`);

--
-- Contraintes pour la table `fiches_chapitres`
--
ALTER TABLE `fiches_chapitres`
  ADD CONSTRAINT `fiches_chapitres_fk0` FOREIGN KEY (`id_fiche`) REFERENCES `fiches` (`id`),
  ADD CONSTRAINT `fiches_chapitres_fk1` FOREIGN KEY (`id_chapitre`) REFERENCES `chapitres` (`id`);

--
-- Contraintes pour la table `fiches_elements`
--
ALTER TABLE `fiches_elements`
  ADD CONSTRAINT `fiches_elements_fk0` FOREIGN KEY (`id_fiche`) REFERENCES `fiches` (`id`),
  ADD CONSTRAINT `fiches_elements_fk1` FOREIGN KEY (`id_element`) REFERENCES `element` (`id`);

--
-- Contraintes pour la table `groupes`
--
ALTER TABLE `groupes`
  ADD CONSTRAINT `groupes_fk0` FOREIGN KEY (`id_creator`) REFERENCES `comptes` (`id`);

--
-- Contraintes pour la table `groupes_comptes`
--
ALTER TABLE `groupes_comptes`
  ADD CONSTRAINT `groupes_comptes_fk0` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id`),
  ADD CONSTRAINT `groupes_comptes_fk1` FOREIGN KEY (`id_groupe`) REFERENCES `groupes` (`id`);

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_fk0` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id`);

--
-- Contraintes pour la table `permissions_comptes_groupes`
--
ALTER TABLE `permissions_comptes_groupes`
  ADD CONSTRAINT `permissions_comptes_groupes_fk0` FOREIGN KEY (`id_groupe`) REFERENCES `groupes` (`id`),
  ADD CONSTRAINT `permissions_comptes_groupes_fk1` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id`);

--
-- Contraintes pour la table `questions_exercices`
--
ALTER TABLE `questions_exercices`
  ADD CONSTRAINT `questions_exercice_fk0` FOREIGN KEY (`id_exercice`) REFERENCES `exercices` (`id`);

--
-- Contraintes pour la table `solutions_exercices`
--
ALTER TABLE `solutions_exercices`
  ADD CONSTRAINT `reponse_exercice_fk0` FOREIGN KEY (`id_exercice`) REFERENCES `exercices` (`id`),
  ADD CONSTRAINT `reponse_exercice_fk1` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
