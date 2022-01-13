-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 11, 2022 at 09:04 PM
-- Server version: 10.3.27-MariaDB-0+deb10u1
-- PHP Version: 7.3.31-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `collabwork`
--

-- --------------------------------------------------------

--
-- Table structure for table `brouillons`
--

CREATE TABLE `brouillons` (
  `id` int(11) NOT NULL,
  `id_compte` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `texte` text NOT NULL,
  `last_modif` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `brouillons_comptes`
--

CREATE TABLE `brouillons_comptes` (
  `id` int(11) NOT NULL,
  `id_compte` int(11) NOT NULL,
  `id_brouillon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `brouillon_exercice`
--

CREATE TABLE `brouillon_exercice` (
  `id` int(11) NOT NULL,
  `id_exercice` int(11) NOT NULL,
  `id_compte` int(11) NOT NULL,
  `texte` text NOT NULL,
  `last_modif` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `chapitres`
--

CREATE TABLE `chapitres` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `chapitres_elements`
--

CREATE TABLE `chapitres_elements` (
  `id` int(11) NOT NULL,
  `id_chapitre` int(11) NOT NULL,
  `id_element` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `chapitres_exercices`
--

CREATE TABLE `chapitres_exercices` (
  `id` int(11) NOT NULL,
  `id_chapitre` int(11) NOT NULL,
  `id_exercice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `comptes`
--

CREATE TABLE `comptes` (
  `id` int(11) NOT NULL,
  `pseudo` varchar(255) NOT NULL,
  `_password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `est_verifie` tinyint(1) NOT NULL DEFAULT 0,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cours`
--

CREATE TABLE `cours` (
  `id` int(11) NOT NULL,
  `id_createur` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `est_prive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cours_chapitres`
--

CREATE TABLE `cours_chapitres` (
  `id` int(11) NOT NULL,
  `id_cour` int(11) NOT NULL,
  `id_chapitre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cours_groupes`
--

CREATE TABLE `cours_groupes` (
  `id` int(11) NOT NULL,
  `id_cour` int(11) NOT NULL,
  `id_groupe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `demonstrations`
--

CREATE TABLE `demonstrations` (
  `id` int(11) NOT NULL,
  `id_element` int(11) NOT NULL,
  `id_compte` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `texte` text NOT NULL,
  `nb_accepte` int(11) NOT NULL DEFAULT 0,
  `nb_refus` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dernier_action`
--

CREATE TABLE `dernier_action` (
  `id` int(11) NOT NULL,
  `id_compte` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `id_brouillon` int(11) DEFAULT NULL,
  `id_brouillon_exo` int(11) DEFAULT NULL,
  `id_fiche` int(11) DEFAULT NULL,
  `id_chapitre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `discussions`
--

CREATE TABLE `discussions` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `id_groupe` int(11) DEFAULT NULL,
  `id_compte1` int(11) DEFAULT NULL,
  `id_compte2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `discussions_messages`
--

CREATE TABLE `discussions_messages` (
  `id` int(11) NOT NULL,
  `id_discussion` int(11) NOT NULL,
  `id_message` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

CREATE TABLE `elements` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `valeur` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `elements_a_verifier`
--

CREATE TABLE `elements_a_verifier` (
  `id` int(11) NOT NULL,
  `id_element` int(11) NOT NULL,
  `nb_ok` int(11) NOT NULL DEFAULT 0,
  `nb_refus` int(11) NOT NULL DEFAULT 0,
  `limite` int(11) NOT NULL DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `elements_connus`
--

CREATE TABLE `elements_connus` (
  `id` int(11) NOT NULL,
  `id_compte` int(11) NOT NULL,
  `id_element` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `elements_demonstrations`
--

CREATE TABLE `elements_demonstrations` (
  `id` int(11) NOT NULL,
  `id_element` int(11) NOT NULL,
  `id_demonstration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `exercices`
--

CREATE TABLE `exercices` (
  `id` int(11) NOT NULL,
  `id_compte` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `est_prive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fiches`
--

CREATE TABLE `fiches` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `est_prive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fiches_chapitres`
--

CREATE TABLE `fiches_chapitres` (
  `id` int(11) NOT NULL,
  `id_fiche` int(11) NOT NULL,
  `id_chapitre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fiches_elements`
--

CREATE TABLE `fiches_elements` (
  `id` int(11) NOT NULL,
  `id_fiche` int(11) NOT NULL,
  `id_element` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `groupes`
--

CREATE TABLE `groupes` (
  `id` int(11) NOT NULL,
  `id_creator` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `groupes_comptes`
--

CREATE TABLE `groupes_comptes` (
  `id` int(11) NOT NULL,
  `id_compte` int(11) NOT NULL,
  `id_groupe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `id_compte` int(11) NOT NULL,
  `message` text NOT NULL,
  `date` date NOT NULL,
  `edited` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `permissions_comptes_groupes`
--

CREATE TABLE `permissions_comptes_groupes` (
  `id` int(11) NOT NULL,
  `id_groupe` int(11) NOT NULL,
  `id_compte` int(11) NOT NULL,
  `permission_ecriture` tinyint(1) NOT NULL,
  `est_admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `questions_exercices`
--

CREATE TABLE `questions_exercices` (
  `id` int(11) NOT NULL,
  `id_exercice` int(11) NOT NULL,
  `type` text DEFAULT NULL,
  `texte` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reponses_questions_exercices`
--

CREATE TABLE `reponses_questions_exercices` (
  `id` int(11) NOT NULL,
  `id_exercice` int(11) NOT NULL,
  `id_question` int(11) NOT NULL,
  `texte` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `solutions_exercices`
--

CREATE TABLE `solutions_exercices` (
  `id` int(11) NOT NULL,
  `id_exercice` int(11) NOT NULL,
  `id_compte` int(11) NOT NULL,
  `texte` text NOT NULL,
  `nb_accepte` int(11) NOT NULL,
  `nb_refus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brouillons`
--
ALTER TABLE `brouillons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brouillons_fk0` (`id_compte`);

--
-- Indexes for table `brouillons_comptes`
--
ALTER TABLE `brouillons_comptes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brouillons_comptes_fk0` (`id_compte`),
  ADD KEY `brouillons_comptes_fk1` (`id_brouillon`);

--
-- Indexes for table `brouillon_exercice`
--
ALTER TABLE `brouillon_exercice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brouillon_exercice_fk0` (`id_exercice`),
  ADD KEY `brouillon_exercice_fk1` (`id_compte`);

--
-- Indexes for table `chapitres`
--
ALTER TABLE `chapitres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chapitres_elements`
--
ALTER TABLE `chapitres_elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chapitres_elements_fk0` (`id_chapitre`),
  ADD KEY `chapitres_elements_fk1` (`id_element`);

--
-- Indexes for table `chapitres_exercices`
--
ALTER TABLE `chapitres_exercices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chapitres_exercices_fk0` (`id_chapitre`),
  ADD KEY `chapitres_exercices_fk1` (`id_exercice`);

--
-- Indexes for table `comptes`
--
ALTER TABLE `comptes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cours_fk0` (`id_createur`);

--
-- Indexes for table `cours_chapitres`
--
ALTER TABLE `cours_chapitres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cours_chapitres_fk0` (`id_cour`),
  ADD KEY `cours_chapitres_fk1` (`id_chapitre`);

--
-- Indexes for table `cours_groupes`
--
ALTER TABLE `cours_groupes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cours_groupes_fk0` (`id_cour`),
  ADD KEY `cours_groupes_fk1` (`id_groupe`);

--
-- Indexes for table `demonstrations`
--
ALTER TABLE `demonstrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `demonstrations_fk0` (`id_element`),
  ADD KEY `demonstrations_fk1` (`id_compte`);

--
-- Indexes for table `dernier_action`
--
ALTER TABLE `dernier_action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dernier_action_fk0` (`id_compte`),
  ADD KEY `dernier_action_fk1` (`id_brouillon`),
  ADD KEY `dernier_action_fk2` (`id_brouillon_exo`),
  ADD KEY `dernier_action_fk3` (`id_fiche`),
  ADD KEY `dernier_action_fk4` (`id_chapitre`);

--
-- Indexes for table `discussions`
--
ALTER TABLE `discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discussions_fk0` (`id_groupe`),
  ADD KEY `discussions_fk1` (`id_compte1`),
  ADD KEY `discussions_fk2` (`id_compte2`);

--
-- Indexes for table `discussions_messages`
--
ALTER TABLE `discussions_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discussions_messages_fk0` (`id_discussion`),
  ADD KEY `discussions_messages_fk1` (`id_message`);

--
-- Indexes for table `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `elements_a_verifier`
--
ALTER TABLE `elements_a_verifier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `elements_a_verifier_fk0` (`id_element`);

--
-- Indexes for table `elements_connus`
--
ALTER TABLE `elements_connus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `elements_connus_fk0` (`id_compte`),
  ADD KEY `elements_connus_fk1` (`id_element`);

--
-- Indexes for table `elements_demonstrations`
--
ALTER TABLE `elements_demonstrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `elements_demonstrations_fk0` (`id_element`),
  ADD KEY `elements_demonstrations_fk1` (`id_demonstration`);

--
-- Indexes for table `exercices`
--
ALTER TABLE `exercices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exercices_fk0` (`id_compte`);

--
-- Indexes for table `fiches`
--
ALTER TABLE `fiches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fiches_chapitres`
--
ALTER TABLE `fiches_chapitres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fiches_chapitres_fk0` (`id_fiche`),
  ADD KEY `fiches_chapitres_fk1` (`id_chapitre`);

--
-- Indexes for table `fiches_elements`
--
ALTER TABLE `fiches_elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fiches_elements_fk0` (`id_fiche`),
  ADD KEY `fiches_elements_fk1` (`id_element`);

--
-- Indexes for table `groupes`
--
ALTER TABLE `groupes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groupes_fk0` (`id_creator`);

--
-- Indexes for table `groupes_comptes`
--
ALTER TABLE `groupes_comptes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groupes_comptes_fk0` (`id_compte`),
  ADD KEY `groupes_comptes_fk1` (`id_groupe`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_fk0` (`id_compte`);

--
-- Indexes for table `permissions_comptes_groupes`
--
ALTER TABLE `permissions_comptes_groupes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_comptes_groupes_fk0` (`id_groupe`),
  ADD KEY `permissions_comptes_groupes_fk1` (`id_compte`);

--
-- Indexes for table `questions_exercices`
--
ALTER TABLE `questions_exercices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questions_exercice_fk0` (`id_exercice`);

--
-- Indexes for table `reponses_questions_exercices`
--
ALTER TABLE `reponses_questions_exercices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reponses_questions_exercice_fk0` (`id_exercice`),
  ADD KEY `reponses_questions_exercice_fk1` (`id_question`);

--
-- Indexes for table `solutions_exercices`
--
ALTER TABLE `solutions_exercices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reponse_exercice_fk0` (`id_exercice`),
  ADD KEY `reponse_exercice_fk1` (`id_compte`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brouillons`
--
ALTER TABLE `brouillons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brouillons_comptes`
--
ALTER TABLE `brouillons_comptes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brouillon_exercice`
--
ALTER TABLE `brouillon_exercice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chapitres`
--
ALTER TABLE `chapitres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chapitres_elements`
--
ALTER TABLE `chapitres_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chapitres_exercices`
--
ALTER TABLE `chapitres_exercices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comptes`
--
ALTER TABLE `comptes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cours`
--
ALTER TABLE `cours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cours_chapitres`
--
ALTER TABLE `cours_chapitres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cours_groupes`
--
ALTER TABLE `cours_groupes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `demonstrations`
--
ALTER TABLE `demonstrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dernier_action`
--
ALTER TABLE `dernier_action`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discussions`
--
ALTER TABLE `discussions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discussions_messages`
--
ALTER TABLE `discussions_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elements_a_verifier`
--
ALTER TABLE `elements_a_verifier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elements_connus`
--
ALTER TABLE `elements_connus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elements_demonstrations`
--
ALTER TABLE `elements_demonstrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exercices`
--
ALTER TABLE `exercices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fiches`
--
ALTER TABLE `fiches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fiches_chapitres`
--
ALTER TABLE `fiches_chapitres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fiches_elements`
--
ALTER TABLE `fiches_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groupes`
--
ALTER TABLE `groupes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groupes_comptes`
--
ALTER TABLE `groupes_comptes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions_comptes_groupes`
--
ALTER TABLE `permissions_comptes_groupes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions_exercices`
--
ALTER TABLE `questions_exercices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reponses_questions_exercices`
--
ALTER TABLE `reponses_questions_exercices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `solutions_exercices`
--
ALTER TABLE `solutions_exercices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `brouillons`
--
ALTER TABLE `brouillons`
  ADD CONSTRAINT `brouillons_fk0` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id`);

--
-- Constraints for table `brouillons_comptes`
--
ALTER TABLE `brouillons_comptes`
  ADD CONSTRAINT `brouillons_comptes_fk0` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id`),
  ADD CONSTRAINT `brouillons_comptes_fk1` FOREIGN KEY (`id_brouillon`) REFERENCES `brouillons` (`id`);

--
-- Constraints for table `brouillon_exercice`
--
ALTER TABLE `brouillon_exercice`
  ADD CONSTRAINT `brouillon_exercice_fk0` FOREIGN KEY (`id_exercice`) REFERENCES `exercices` (`id`),
  ADD CONSTRAINT `brouillon_exercice_fk1` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id`);

--
-- Constraints for table `chapitres_elements`
--
ALTER TABLE `chapitres_elements`
  ADD CONSTRAINT `chapitres_elements_fk0` FOREIGN KEY (`id_chapitre`) REFERENCES `chapitres` (`id`),
  ADD CONSTRAINT `chapitres_elements_fk1` FOREIGN KEY (`id_element`) REFERENCES `elements` (`id`);

--
-- Constraints for table `chapitres_exercices`
--
ALTER TABLE `chapitres_exercices`
  ADD CONSTRAINT `chapitres_exercices_fk0` FOREIGN KEY (`id_chapitre`) REFERENCES `chapitres` (`id`),
  ADD CONSTRAINT `chapitres_exercices_fk1` FOREIGN KEY (`id_exercice`) REFERENCES `exercices` (`id`);

--
-- Constraints for table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `cours_fk0` FOREIGN KEY (`id_createur`) REFERENCES `comptes` (`id`);

--
-- Constraints for table `cours_chapitres`
--
ALTER TABLE `cours_chapitres`
  ADD CONSTRAINT `cours_chapitres_fk0` FOREIGN KEY (`id_cour`) REFERENCES `cours` (`id`),
  ADD CONSTRAINT `cours_chapitres_fk1` FOREIGN KEY (`id_chapitre`) REFERENCES `chapitres` (`id`);

--
-- Constraints for table `cours_groupes`
--
ALTER TABLE `cours_groupes`
  ADD CONSTRAINT `cours_groupes_fk0` FOREIGN KEY (`id_cour`) REFERENCES `cours` (`id`),
  ADD CONSTRAINT `cours_groupes_fk1` FOREIGN KEY (`id_groupe`) REFERENCES `groupes` (`id`);

--
-- Constraints for table `demonstrations`
--
ALTER TABLE `demonstrations`
  ADD CONSTRAINT `demonstrations_fk0` FOREIGN KEY (`id_element`) REFERENCES `elements` (`id`),
  ADD CONSTRAINT `demonstrations_fk1` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id`);

--
-- Constraints for table `dernier_action`
--
ALTER TABLE `dernier_action`
  ADD CONSTRAINT `dernier_action_fk0` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id`),
  ADD CONSTRAINT `dernier_action_fk1` FOREIGN KEY (`id_brouillon`) REFERENCES `brouillons` (`id`),
  ADD CONSTRAINT `dernier_action_fk2` FOREIGN KEY (`id_brouillon_exo`) REFERENCES `brouillon_exercice` (`id`),
  ADD CONSTRAINT `dernier_action_fk3` FOREIGN KEY (`id_fiche`) REFERENCES `fiches` (`id`),
  ADD CONSTRAINT `dernier_action_fk4` FOREIGN KEY (`id_chapitre`) REFERENCES `chapitres` (`id`);

--
-- Constraints for table `discussions`
--
ALTER TABLE `discussions`
  ADD CONSTRAINT `discussions_fk0` FOREIGN KEY (`id_groupe`) REFERENCES `groupes` (`id`),
  ADD CONSTRAINT `discussions_fk1` FOREIGN KEY (`id_compte1`) REFERENCES `comptes` (`id`),
  ADD CONSTRAINT `discussions_fk2` FOREIGN KEY (`id_compte2`) REFERENCES `comptes` (`id`);

--
-- Constraints for table `discussions_messages`
--
ALTER TABLE `discussions_messages`
  ADD CONSTRAINT `discussions_messages_fk0` FOREIGN KEY (`id_discussion`) REFERENCES `discussions` (`id`),
  ADD CONSTRAINT `discussions_messages_fk1` FOREIGN KEY (`id_message`) REFERENCES `messages` (`id`);

--
-- Constraints for table `elements_a_verifier`
--
ALTER TABLE `elements_a_verifier`
  ADD CONSTRAINT `elements_a_verifier_fk0` FOREIGN KEY (`id_element`) REFERENCES `elements` (`id`);

--
-- Constraints for table `elements_connus`
--
ALTER TABLE `elements_connus`
  ADD CONSTRAINT `elements_connus_fk0` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id`),
  ADD CONSTRAINT `elements_connus_fk1` FOREIGN KEY (`id_element`) REFERENCES `elements` (`id`);

--
-- Constraints for table `elements_demonstrations`
--
ALTER TABLE `elements_demonstrations`
  ADD CONSTRAINT `elements_demonstrations_fk0` FOREIGN KEY (`id_element`) REFERENCES `elements` (`id`),
  ADD CONSTRAINT `elements_demonstrations_fk1` FOREIGN KEY (`id_demonstration`) REFERENCES `demonstrations` (`id`);

--
-- Constraints for table `exercices`
--
ALTER TABLE `exercices`
  ADD CONSTRAINT `exercices_fk0` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id`);

--
-- Constraints for table `fiches_chapitres`
--
ALTER TABLE `fiches_chapitres`
  ADD CONSTRAINT `fiches_chapitres_fk0` FOREIGN KEY (`id_fiche`) REFERENCES `fiches` (`id`),
  ADD CONSTRAINT `fiches_chapitres_fk1` FOREIGN KEY (`id_chapitre`) REFERENCES `chapitres` (`id`);

--
-- Constraints for table `fiches_elements`
--
ALTER TABLE `fiches_elements`
  ADD CONSTRAINT `fiches_elements_fk0` FOREIGN KEY (`id_fiche`) REFERENCES `fiches` (`id`),
  ADD CONSTRAINT `fiches_elements_fk1` FOREIGN KEY (`id_element`) REFERENCES `elements` (`id`);

--
-- Constraints for table `groupes`
--
ALTER TABLE `groupes`
  ADD CONSTRAINT `groupes_fk0` FOREIGN KEY (`id_creator`) REFERENCES `comptes` (`id`);

--
-- Constraints for table `groupes_comptes`
--
ALTER TABLE `groupes_comptes`
  ADD CONSTRAINT `groupes_comptes_fk0` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id`),
  ADD CONSTRAINT `groupes_comptes_fk1` FOREIGN KEY (`id_groupe`) REFERENCES `groupes` (`id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_fk0` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id`);

--
-- Constraints for table `permissions_comptes_groupes`
--
ALTER TABLE `permissions_comptes_groupes`
  ADD CONSTRAINT `permissions_comptes_groupes_fk0` FOREIGN KEY (`id_groupe`) REFERENCES `groupes` (`id`),
  ADD CONSTRAINT `permissions_comptes_groupes_fk1` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id`);

--
-- Constraints for table `questions_exercices`
--
ALTER TABLE `questions_exercices`
  ADD CONSTRAINT `questions_exercice_fk0` FOREIGN KEY (`id_exercice`) REFERENCES `exercices` (`id`);

--
-- Constraints for table `reponses_questions_exercices`
--
ALTER TABLE `reponses_questions_exercices`
  ADD CONSTRAINT `reponses_questions_exercice_fk0` FOREIGN KEY (`id_exercice`) REFERENCES `exercices` (`id`),
  ADD CONSTRAINT `reponses_questions_exercice_fk1` FOREIGN KEY (`id_question`) REFERENCES `questions_exercices` (`id`);

--
-- Constraints for table `solutions_exercices`
--
ALTER TABLE `solutions_exercices`
  ADD CONSTRAINT `reponse_exercice_fk0` FOREIGN KEY (`id_exercice`) REFERENCES `exercices` (`id`),
  ADD CONSTRAINT `reponse_exercice_fk1` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
