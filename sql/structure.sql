DROP TABLE IF EXISTS comptes;
DROP TABLE IF EXISTS cours;
DROP TABLE IF EXISTS chapitres;
DROP TABLE IF EXISTS cours_chapitres;
DROP TABLE IF EXISTS groupes;
DROP TABLE IF EXISTS groupes_comptes;
DROP TABLE IF EXISTS cours_groupes;
DROP TABLE IF EXISTS fiches;
DROP TABLE IF EXISTS element;
DROP TABLE IF EXISTS chapitres_elements;
DROP TABLE IF EXISTS fiches_elements;
DROP TABLE IF EXISTS discussions;
DROP TABLE IF EXISTS messages;
DROP TABLE IF EXISTS discussions_messages;
DROP TABLE IF EXISTS demonstrations;
DROP TABLE IF EXISTS elements_demonstrations;
DROP TABLE IF EXISTS exercice;
DROP TABLE IF EXISTS chapitres_exercices;
DROP TABLE IF EXISTS proposition_exercice;
DROP TABLE IF EXISTS elements_a_verifier;
DROP TABLE IF EXISTS permissions_comptes;
DROP TABLE IF EXISTS groupes_permissions;
DROP TABLE IF EXISTS Brouillons;
DROP TABLE IF EXISTS Brouillons_comptes;


CREATE TABLE comptes (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nom TEXT NOT NULL,
password TEXT NOT NULL,
email TEXT NOT NULL);

CREATE TABLE cours (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nom TEXT NOT NULL,
prive BOOL NOT NULL);

CREATE TABLE chapitres (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
titre TEXT NOT NULL,
id_cours INT NOT NULL);

CREATE TABLE cours_chapitres (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
id_cour INT NOT NULL,
id_chapitre INT NOT NULL);

CREATE TABLE groupes (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nom TEXT NOT NULL);

CREATE TABLE groupes_comptes (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
id_groupe INT NOT NULL,
id_compte INT NOT NULL);

CREATE TABLE cours_groupes (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
id_cour INT NOT NULL,
id_groupe INT NOT NULL);

CREATE TABLE fiches (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
Nom TEXT NOT NULL,
description TEXT NOT NULL,
prive BOOL NOT NULL);

CREATE TABLE element (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
id_chapitre INT NOT NULL,
titre TEXT NOT NULL,
hypotheses TEXT NOT NULL,
resultat TEXT NOT NULL);

CREATE TABLE chapitres_elements (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
id_chapitre INT NOT NULL,
id_element INT NOT NULL);

CREATE TABLE fiches_elements (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
id_fiche INT NOT NULL,
id_element INT NOT NULL);

CREATE TABLE discussions (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
titre TEXT NOT NULL,
id_groupe INT NOT NULL);

CREATE TABLE messages (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
id_compte INT NOT NULL,
texte TEXT NOT NULL,
id_discussion INT NOT NULL);

CREATE TABLE discussions_messages (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
id_discussion INT NOT NULL,
id_message INT NOT NULL);

CREATE TABLE demonstrations (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
id_element INT NOT NULL,
texte TEXT NOT NULL);

CREATE TABLE elements_demonstrations (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
id_element INT NOT NULL,
id_demonstration INT NOT NULL);

CREATE TABLE exercice (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
titre TEXT NOT NULL,
énoncé TEXT NOT NULL);

CREATE TABLE chapitres_exercices (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
id_chapitre INT NOT NULL,
id_exercice INT NOT NULL);

CREATE TABLE proposition_exercice (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
id_compte INT NOT NULL,
id_exercice INT NOT NULL,
texte TEXT NOT NULL,
prive BOOL NOT NULL,
nb_ok INT NOT NULL,
nb_warnings INT NOT NULL);

CREATE TABLE elements_a_verifier (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
id_element INT NOT NULL,
nb_ok INT NOT NULL,
nb_warnings INT NOT NULL);

CREATE TABLE permissions_comptes (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
id_compte INT NOT NULL,
permission_ecriture BOOL NOT NULL);

CREATE TABLE groupes_permissions (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
id_groupe INT NOT NULL,
id_permission INT NOT NULL);

CREATE TABLE Brouillons (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
id_compte INT NOT NULL,
nom TEXT NOT NULL,
content TEXT NOT NULL);

CREATE TABLE Brouillons_comptes (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
id_brouillon INT NOT NULL,
id_compte INT NOT NULL);

ALTER TABLE chapitres ADD CONSTRAINT chapitres_id_cours_cours_id FOREIGN KEY (id_cours) REFERENCES cours(id);
ALTER TABLE cours_chapitres ADD CONSTRAINT cours_chapitres_id_cour_cours_id FOREIGN KEY (id_cour) REFERENCES cours(id);
ALTER TABLE cours_chapitres ADD CONSTRAINT cours_chapitres_id_chapitre_chapitres_id FOREIGN KEY (id_chapitre) REFERENCES chapitres(id);
ALTER TABLE groupes_comptes ADD CONSTRAINT groupes_comptes_id_groupe_groupes_id FOREIGN KEY (id_groupe) REFERENCES groupes(id);
ALTER TABLE groupes_comptes ADD CONSTRAINT groupes_comptes_id_compte_comptes_id FOREIGN KEY (id_compte) REFERENCES comptes(id);
ALTER TABLE cours_groupes ADD CONSTRAINT cours_groupes_id_cour_cours_id FOREIGN KEY (id_cour) REFERENCES cours(id);
ALTER TABLE cours_groupes ADD CONSTRAINT cours_groupes_id_groupe_groupes_id FOREIGN KEY (id_groupe) REFERENCES groupes(id);
ALTER TABLE element ADD CONSTRAINT element_id_chapitre_chapitres_id FOREIGN KEY (id_chapitre) REFERENCES chapitres(id);
ALTER TABLE chapitres_elements ADD CONSTRAINT chapitres_elements_id_chapitre_chapitres_id FOREIGN KEY (id_chapitre) REFERENCES chapitres(id);
ALTER TABLE chapitres_elements ADD CONSTRAINT chapitres_elements_id_element_element_id FOREIGN KEY (id_element) REFERENCES element(id);
ALTER TABLE fiches_elements ADD CONSTRAINT fiches_elements_id_fiche_fiches_id FOREIGN KEY (id_fiche) REFERENCES fiches(id);
ALTER TABLE fiches_elements ADD CONSTRAINT fiches_elements_id_element_element_id FOREIGN KEY (id_element) REFERENCES element(id);
ALTER TABLE discussions ADD CONSTRAINT discussions_id_groupe_groupes_id FOREIGN KEY (id_groupe) REFERENCES groupes(id);
ALTER TABLE messages ADD CONSTRAINT messages_id_compte_comptes_id FOREIGN KEY (id_compte) REFERENCES comptes(id);
ALTER TABLE messages ADD CONSTRAINT messages_id_discussion_discussions_id FOREIGN KEY (id_discussion) REFERENCES discussions(id);
ALTER TABLE discussions_messages ADD CONSTRAINT discussions_messages_id_discussion_discussions_id FOREIGN KEY (id_discussion) REFERENCES discussions(id);
ALTER TABLE discussions_messages ADD CONSTRAINT discussions_messages_id_message_messages_id FOREIGN KEY (id_message) REFERENCES messages(id);
ALTER TABLE demonstrations ADD CONSTRAINT demonstrations_id_element_element_id FOREIGN KEY (id_element) REFERENCES element(id);
ALTER TABLE elements_demonstrations ADD CONSTRAINT elements_demonstrations_id_element_element_id FOREIGN KEY (id_element) REFERENCES element(id);
ALTER TABLE elements_demonstrations ADD CONSTRAINT elements_demonstrations_id_demonstration_demonstrations_id FOREIGN KEY (id_demonstration) REFERENCES demonstrations(id);
ALTER TABLE chapitres_exercices ADD CONSTRAINT chapitres_exercices_id_chapitre_chapitres_id FOREIGN KEY (id_chapitre) REFERENCES chapitres(id);
ALTER TABLE chapitres_exercices ADD CONSTRAINT chapitres_exercices_id_exercice_exercice_id FOREIGN KEY (id_exercice) REFERENCES exercice(id);
ALTER TABLE proposition_exercice ADD CONSTRAINT proposition_exercice_id_compte_comptes_id FOREIGN KEY (id_compte) REFERENCES comptes(id);
ALTER TABLE proposition_exercice ADD CONSTRAINT proposition_exercice_id_exercice_exercice_id FOREIGN KEY (id_exercice) REFERENCES exercice(id);
ALTER TABLE elements_a_verifier ADD CONSTRAINT elements_a_verifier_id_element_element_id FOREIGN KEY (id_element) REFERENCES element(id);
ALTER TABLE permissions_comptes ADD CONSTRAINT permissions_id_compte_comptes_id FOREIGN KEY (id_compte) REFERENCES comptes(id);
ALTER TABLE groupes_permissions ADD CONSTRAINT groupes_permissions_id_groupe_groupes_id FOREIGN KEY (id_groupe) REFERENCES groupes(id);
ALTER TABLE groupes_permissions ADD CONSTRAINT groupes_permissions_id_permission_permissions_id FOREIGN KEY (id_permission) REFERENCES permissions_comptes(id);
ALTER TABLE Brouillons ADD CONSTRAINT Brouillons_id_compte_comptes_id FOREIGN KEY (id_compte) REFERENCES comptes(id);
ALTER TABLE Brouillons_comptes ADD CONSTRAINT Brouillons_comptes_id_brouillon_Brouillons_id FOREIGN KEY (id_brouillon) REFERENCES Brouillons(id);
ALTER TABLE Brouillons_comptes ADD CONSTRAINT Brouillons_comptes_id_compte_comptes_id FOREIGN KEY (id_compte) REFERENCES comptes(id);