DROP TABLE IF EXISTS `comptes`;
DROP TABLE IF EXISTS `groupes_comptes`;
DROP TABLE IF EXISTS `groupes`;
DROP TABLE IF EXISTS `permissions_comptes_groupes`;
DROP TABLE IF EXISTS `brouillons`;
DROP TABLE IF EXISTS `brouillons_comptes`;
DROP TABLE IF EXISTS `messages`;
DROP TABLE IF EXISTS `discussions`;
DROP TABLE IF EXISTS `discussions_messages`;
DROP TABLE IF EXISTS `cours`;
DROP TABLE IF EXISTS `cours_groupes`;
DROP TABLE IF EXISTS `chapitres`;
DROP TABLE IF EXISTS `cours_chapitres`;
DROP TABLE IF EXISTS `elements`;
DROP TABLE IF EXISTS `chapitres_elements`;
DROP TABLE IF EXISTS `fiches`;
DROP TABLE IF EXISTS `fiches_elements`;
DROP TABLE IF EXISTS `fiches_chapitres`;
DROP TABLE IF EXISTS `elements_a_verifier`;
DROP TABLE IF EXISTS `demonstrations`;
DROP TABLE IF EXISTS `elements_demonstrations`;
DROP TABLE IF EXISTS `exercices`;
DROP TABLE IF EXISTS `chapitres_exercices`;
DROP TABLE IF EXISTS `brouillon_exercice`;
DROP TABLE IF EXISTS `dernier_action`;
DROP TABLE IF EXISTS `elements_connus`;
DROP TABLE IF EXISTS `reponse_exercice`;


CREATE TABLE `comptes` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`pseudo` VARCHAR(255) NOT NULL,
	`password` VARCHAR(255) NOT NULL,
	`email` VARCHAR(255) NOT NULL,
	`est_verifie` BOOLEAN NOT NULL DEFAULT false,
	`token` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `groupes_comptes` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_compte` INT NOT NULL,
	`id_groupe` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `groupes` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_creator` INT NOT NULL,
	`nom` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `permissions_comptes_groupes` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_groupe` INT NOT NULL,
	`id_compte` INT NOT NULL,
	`permission_ecriture` BOOLEAN NOT NULL,
	`est_admin` BOOLEAN NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `brouillons` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_compte` INT NOT NULL,
	`titre` VARCHAR(255) NOT NULL,
	`texte` TEXT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `brouillons_comptes` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_compte` INT NOT NULL,
	`id_brouillon` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `messages` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_compte` INT NOT NULL,
	`message` TEXT NOT NULL,
	`date` DATE NOT NULL,
	`edited` BOOLEAN NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `discussions` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`type` VARCHAR(255) NOT NULL,
	`id_groupe` INT DEFAULT 'groupe',
	`id_compte1` INT DEFAULT 'groupe',
	`id_compte2` INT DEFAULT 'groupe',
	PRIMARY KEY (`id`)
);

CREATE TABLE `discussions_messages` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_discussion` INT NOT NULL,
	`id_message` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `cours` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_createur` INT NOT NULL,
	`nom` VARCHAR(255) NOT NULL,
	`est_prive` BOOLEAN NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `cours_groupes` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_cour` INT NOT NULL,
	`id_groupe` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `chapitres` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`titre` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `cours_chapitres` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_cour` INT NOT NULL,
	`id_chapitre` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `elements` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`titre` VARCHAR(255) NOT NULL,
	`valeur` TEXT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `chapitres_elements` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_chapitre` INT NOT NULL,
	`id_element` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `fiches` (
	`id` BINARY NOT NULL AUTO_INCREMENT,
	`nom` VARCHAR(255) NOT NULL,
	`description` TEXT NOT NULL,
	`est_prive` BOOLEAN NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `fiches_elements` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_fiche` INT NOT NULL,
	`id_element` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `fiches_chapitres` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_fiche` INT NOT NULL,
	`id_chapitre` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `elements_a_verifier` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_element` INT NOT NULL,
	`nb_ok` INT NOT NULL DEFAULT '0',
	`nb_refus` INT NOT NULL DEFAULT '0',
	`limite` INT NOT NULL DEFAULT '5',
	PRIMARY KEY (`id`)
);

CREATE TABLE `demonstrations` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_element` INT NOT NULL,
	`id_compte` INT NOT NULL,
	`titre` VARCHAR(255) NOT NULL,
	`texte` TEXT NOT NULL,
	`nb_accepte` INT NOT NULL DEFAULT '0',
	`nb_refus` INT NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
);

CREATE TABLE `elements_demonstrations` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_element` INT NOT NULL,
	`id_demonstration` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `exercices` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_compte` INT NOT NULL,
	`nom` VARCHAR(255) NOT NULL,
	`enonce` TEXT NOT NULL,
	`est_prive` BOOLEAN NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `chapitres_exercices` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_chapitre` INT NOT NULL,
	`id_exercice` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `brouillon_exercice` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_exercice` INT NOT NULL,
	`id_compte` INT NOT NULL,
	`texte` TEXT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `dernier_action` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_compte` INT NOT NULL,
	`type` VARCHAR(255) NOT NULL,
	`id_brouillon` INT,
	`id_brouillon_exo` INT,
	`id_fiche` INT,
	`id_chapitre` INT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `elements_connus` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_compte` INT NOT NULL,
	`id_element` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `reponse_exercice` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_exercice` INT NOT NULL,
	`id_compte` INT NOT NULL,
	`texte` TEXT NOT NULL,
	`nb_accepte` INT NOT NULL,
	`nb_refus` INT NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `groupes_comptes` ADD CONSTRAINT `groupes_comptes_fk0` FOREIGN KEY (`id_compte`) REFERENCES `comptes`(`id`);

ALTER TABLE `groupes_comptes` ADD CONSTRAINT `groupes_comptes_fk1` FOREIGN KEY (`id_groupe`) REFERENCES `groupes`(`id`);

ALTER TABLE `groupes` ADD CONSTRAINT `groupes_fk0` FOREIGN KEY (`id_creator`) REFERENCES `comptes`(`id`);

ALTER TABLE `permissions_comptes_groupes` ADD CONSTRAINT `permissions_comptes_groupes_fk0` FOREIGN KEY (`id_groupe`) REFERENCES `groupes`(`id`);

ALTER TABLE `permissions_comptes_groupes` ADD CONSTRAINT `permissions_comptes_groupes_fk1` FOREIGN KEY (`id_compte`) REFERENCES `comptes`(`id`);

ALTER TABLE `brouillons` ADD CONSTRAINT `brouillons_fk0` FOREIGN KEY (`id_compte`) REFERENCES `comptes`(`id`);

ALTER TABLE `brouillons_comptes` ADD CONSTRAINT `brouillons_comptes_fk0` FOREIGN KEY (`id_compte`) REFERENCES `comptes`(`id`);

ALTER TABLE `brouillons_comptes` ADD CONSTRAINT `brouillons_comptes_fk1` FOREIGN KEY (`id_brouillon`) REFERENCES `brouillons`(`id`);

ALTER TABLE `messages` ADD CONSTRAINT `messages_fk0` FOREIGN KEY (`id_compte`) REFERENCES `comptes`(`id`);

ALTER TABLE `discussions` ADD CONSTRAINT `discussions_fk0` FOREIGN KEY (`id_groupe`) REFERENCES `groupes`(`id`);

ALTER TABLE `discussions` ADD CONSTRAINT `discussions_fk1` FOREIGN KEY (`id_compte1`) REFERENCES `comptes`(`id`);

ALTER TABLE `discussions` ADD CONSTRAINT `discussions_fk2` FOREIGN KEY (`id_compte2`) REFERENCES `comptes`(`id`);

ALTER TABLE `discussions_messages` ADD CONSTRAINT `discussions_messages_fk0` FOREIGN KEY (`id_discussion`) REFERENCES `discussions`(`id`);

ALTER TABLE `discussions_messages` ADD CONSTRAINT `discussions_messages_fk1` FOREIGN KEY (`id_message`) REFERENCES `messages`(`id`);

ALTER TABLE `cours` ADD CONSTRAINT `cours_fk0` FOREIGN KEY (`id_createur`) REFERENCES `comptes`(`id`);

ALTER TABLE `cours_groupes` ADD CONSTRAINT `cours_groupes_fk0` FOREIGN KEY (`id_cour`) REFERENCES `cours`(`id`);

ALTER TABLE `cours_groupes` ADD CONSTRAINT `cours_groupes_fk1` FOREIGN KEY (`id_groupe`) REFERENCES `groupes`(`id`);

ALTER TABLE `cours_chapitres` ADD CONSTRAINT `cours_chapitres_fk0` FOREIGN KEY (`id_cour`) REFERENCES `cours`(`id`);

ALTER TABLE `cours_chapitres` ADD CONSTRAINT `cours_chapitres_fk1` FOREIGN KEY (`id_chapitre`) REFERENCES `chapitres`(`id`);

ALTER TABLE `chapitres_elements` ADD CONSTRAINT `chapitres_elements_fk0` FOREIGN KEY (`id_chapitre`) REFERENCES `chapitres`(`id`);

ALTER TABLE `chapitres_elements` ADD CONSTRAINT `chapitres_elements_fk1` FOREIGN KEY (`id_element`) REFERENCES `elements`(`id`);

ALTER TABLE `fiches_elements` ADD CONSTRAINT `fiches_elements_fk0` FOREIGN KEY (`id_fiche`) REFERENCES `fiches`(`id`);

ALTER TABLE `fiches_elements` ADD CONSTRAINT `fiches_elements_fk1` FOREIGN KEY (`id_element`) REFERENCES `elements`(`id`);

ALTER TABLE `fiches_chapitres` ADD CONSTRAINT `fiches_chapitres_fk0` FOREIGN KEY (`id_fiche`) REFERENCES `fiches`(`id`);

ALTER TABLE `fiches_chapitres` ADD CONSTRAINT `fiches_chapitres_fk1` FOREIGN KEY (`id_chapitre`) REFERENCES `chapitres`(`id`);

ALTER TABLE `elements_a_verifier` ADD CONSTRAINT `elements_a_verifier_fk0` FOREIGN KEY (`id_element`) REFERENCES `elements`(`id`);

ALTER TABLE `demonstrations` ADD CONSTRAINT `demonstrations_fk0` FOREIGN KEY (`id_element`) REFERENCES `elements`(`id`);

ALTER TABLE `demonstrations` ADD CONSTRAINT `demonstrations_fk1` FOREIGN KEY (`id_compte`) REFERENCES `comptes`(`id`);

ALTER TABLE `elements_demonstrations` ADD CONSTRAINT `elements_demonstrations_fk0` FOREIGN KEY (`id_element`) REFERENCES `elements`(`id`);

ALTER TABLE `elements_demonstrations` ADD CONSTRAINT `elements_demonstrations_fk1` FOREIGN KEY (`id_demonstration`) REFERENCES `demonstrations`(`id`);

ALTER TABLE `exercices` ADD CONSTRAINT `exercices_fk0` FOREIGN KEY (`id_compte`) REFERENCES `comptes`(`id`);

ALTER TABLE `chapitres_exercices` ADD CONSTRAINT `chapitres_exercices_fk0` FOREIGN KEY (`id_chapitre`) REFERENCES `chapitres`(`id`);

ALTER TABLE `chapitres_exercices` ADD CONSTRAINT `chapitres_exercices_fk1` FOREIGN KEY (`id_exercice`) REFERENCES `exercices`(`id`);

ALTER TABLE `brouillon_exercice` ADD CONSTRAINT `brouillon_exercice_fk0` FOREIGN KEY (`id_exercice`) REFERENCES `exercices`(`id`);

ALTER TABLE `brouillon_exercice` ADD CONSTRAINT `brouillon_exercice_fk1` FOREIGN KEY (`id_compte`) REFERENCES `comptes`(`id`);

ALTER TABLE `dernier_action` ADD CONSTRAINT `dernier_action_fk0` FOREIGN KEY (`id_compte`) REFERENCES `comptes`(`id`);

ALTER TABLE `dernier_action` ADD CONSTRAINT `dernier_action_fk1` FOREIGN KEY (`id_brouillon`) REFERENCES `brouillons`(`id`);

ALTER TABLE `dernier_action` ADD CONSTRAINT `dernier_action_fk2` FOREIGN KEY (`id_brouillon_exo`) REFERENCES `brouillon_exercice`(`id`);

ALTER TABLE `dernier_action` ADD CONSTRAINT `dernier_action_fk3` FOREIGN KEY (`id_fiche`) REFERENCES `fiches`(`id`);

ALTER TABLE `dernier_action` ADD CONSTRAINT `dernier_action_fk4` FOREIGN KEY (`id_chapitre`) REFERENCES `chapitres`(`id`);

ALTER TABLE `elements_connus` ADD CONSTRAINT `elements_connus_fk0` FOREIGN KEY (`id_compte`) REFERENCES `comptes`(`id`);

ALTER TABLE `elements_connus` ADD CONSTRAINT `elements_connus_fk1` FOREIGN KEY (`id_element`) REFERENCES `elements`(`id`);

ALTER TABLE `reponse_exercice` ADD CONSTRAINT `reponse_exercice_fk0` FOREIGN KEY (`id_exercice`) REFERENCES `exercices`(`id`);

ALTER TABLE `reponse_exercice` ADD CONSTRAINT `reponse_exercice_fk1` FOREIGN KEY (`id_compte`) REFERENCES `comptes`(`id`);




























