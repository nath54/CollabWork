-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 13 jan. 2022 à 11:56
-- Version du serveur : 8.0.27
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `brouillon_exercice`
--

DROP TABLE IF EXISTS `brouillon_exercice`;
CREATE TABLE IF NOT EXISTS `brouillon_exercice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_exercice` int NOT NULL,
  `id_compte` int NOT NULL,
  `texte` text NOT NULL,
  `last_modif` text,
  PRIMARY KEY (`id`),
  KEY `brouillon_exercice_fk0` (`id_exercice`),
  KEY `brouillon_exercice_fk1` (`id_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `chapitres`
--

DROP TABLE IF EXISTS `chapitres`;
CREATE TABLE IF NOT EXISTS `chapitres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

DROP TABLE IF EXISTS `cours`;
CREATE TABLE IF NOT EXISTS `cours` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_createur` int NOT NULL,
  `nom` varchar(255) NOT NULL,
  `est_public` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cours_fk0` (`id_createur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `elements`
--

DROP TABLE IF EXISTS `elements`;
CREATE TABLE IF NOT EXISTS `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `valeur` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `questions_exercices`
--

DROP TABLE IF EXISTS `questions_exercices`;
CREATE TABLE IF NOT EXISTS `questions_exercices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_exercice` int NOT NULL,
  `type` text,
  `texte` text,
  PRIMARY KEY (`id`),
  KEY `questions_exercice_fk0` (`id_exercice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  PRIMARY KEY (`id`),
  KEY `reponses_questions_exercice_fk0` (`id_exercice`),
  KEY `reponses_questions_exercice_fk1` (`id_question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  ADD CONSTRAINT `chapitres_elements_fk1` FOREIGN KEY (`id_element`) REFERENCES `elements` (`id`);

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
  ADD CONSTRAINT `cours_chapitres_fk0` FOREIGN KEY (`id_cour`) REFERENCES `cours` (`id`),
  ADD CONSTRAINT `cours_chapitres_fk1` FOREIGN KEY (`id_chapitre`) REFERENCES `chapitres` (`id`);

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
  ADD CONSTRAINT `demonstrations_fk0` FOREIGN KEY (`id_element`) REFERENCES `elements` (`id`),
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
  ADD CONSTRAINT `elements_a_verifier_fk0` FOREIGN KEY (`id_element`) REFERENCES `elements` (`id`);

--
-- Contraintes pour la table `elements_connus`
--
ALTER TABLE `elements_connus`
  ADD CONSTRAINT `elements_connus_fk0` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id`),
  ADD CONSTRAINT `elements_connus_fk1` FOREIGN KEY (`id_element`) REFERENCES `elements` (`id`);

--
-- Contraintes pour la table `elements_demonstrations`
--
ALTER TABLE `elements_demonstrations`
  ADD CONSTRAINT `elements_demonstrations_fk0` FOREIGN KEY (`id_element`) REFERENCES `elements` (`id`),
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
  ADD CONSTRAINT `fiches_elements_fk1` FOREIGN KEY (`id_element`) REFERENCES `elements` (`id`);

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
-- Contraintes pour la table `reponses_questions_exercices`
--
ALTER TABLE `reponses_questions_exercices`
  ADD CONSTRAINT `reponses_questions_exercice_fk0` FOREIGN KEY (`id_exercice`) REFERENCES `exercices` (`id`),
  ADD CONSTRAINT `reponses_questions_exercice_fk1` FOREIGN KEY (`id_question`) REFERENCES `questions_exercices` (`id`);

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
