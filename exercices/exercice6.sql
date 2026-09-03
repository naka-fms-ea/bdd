-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 02 sep. 2026 à 13:37
-- Version du serveur : 8.4.7
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_depot`
--

-- --------------------------------------------------------

--
-- Structure de la table `gd_article`
--

DROP TABLE IF EXISTS `gd_article`;
CREATE TABLE IF NOT EXISTS `gd_article` (
  `ar_id_article` int NOT NULL AUTO_INCREMENT,
  `ar_reference` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ar_gencod` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ar_libelle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ar_prix_unitaire` decimal(10,2) NOT NULL,
  `ar_seuil_alerte` smallint DEFAULT NULL,
  PRIMARY KEY (`ar_id_article`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `gd_article`
--

INSERT INTO `gd_article` (`ar_id_article`, `ar_reference`, `ar_gencod`, `ar_libelle`, `ar_prix_unitaire`, `ar_seuil_alerte`) VALUES
(1, 'LS934', '3760111110011', 'Filtre à huile', 8.40, 5),
(2, 'LFT', '3760111110028', 'Filtre à carburant', 22.30, 4),
(3, 'A1999', '3760111110035', 'Filtre à air', 20.40, 10),
(4, '214176', '3760111110042', 'TotalEnergies - QUARTZ INEO EcoB 5W-20 5L', 60.54, 3);

-- --------------------------------------------------------

--
-- Structure de la table `gd_article_fournisseur`
--

DROP TABLE IF EXISTS `gd_article_fournisseur`;
CREATE TABLE IF NOT EXISTS `gd_article_fournisseur` (
  `af_id_article` int NOT NULL,
  `af_id_fournisseur` int NOT NULL,
  `af_prix_achat` decimal(10,2) NOT NULL,
  PRIMARY KEY (`af_id_article`,`af_id_fournisseur`),
  KEY `af_id_fournisseur` (`af_id_fournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `gd_article_fournisseur`
--

INSERT INTO `gd_article_fournisseur` (`af_id_article`, `af_id_fournisseur`, `af_prix_achat`) VALUES
(1, 1, 5.62),
(1, 3, 4.76),
(2, 2, 15.23),
(3, 4, 15.00),
(4, 3, 52.36);

-- --------------------------------------------------------

--
-- Structure de la table `gd_client`
--

DROP TABLE IF EXISTS `gd_client`;
CREATE TABLE IF NOT EXISTS `gd_client` (
  `cl_id_client` int NOT NULL AUTO_INCREMENT,
  `cl_nom_client` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cl_adresse` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cl_id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `gd_client`
--

INSERT INTO `gd_client` (`cl_id_client`, `cl_nom_client`, `cl_adresse`) VALUES
(1, 'Alice Dupont', '10 rue de la République, 75001 Paris'),
(2, 'Lucas Martin', '25 avenue Victor Hugo, 69002 Lyon'),
(3, 'Emma Bernard', '4 boulevard des Alpes, 38000 Grenoble'),
(4, 'Thomas Petit', '8 allée des Fleurs, 33000 Bordeaux');

-- --------------------------------------------------------

--
-- Structure de la table `gd_commande_client`
--

DROP TABLE IF EXISTS `gd_commande_client`;
CREATE TABLE IF NOT EXISTS `gd_commande_client` (
  `cocl_id_commande` int NOT NULL AUTO_INCREMENT,
  `cocl_date_commande` datetime NOT NULL,
  `cocl_id_statut` int NOT NULL,
  `cocl_id_client` int NOT NULL,
  PRIMARY KEY (`cocl_id_commande`),
  KEY `co_id_client` (`cocl_id_client`),
  KEY `cocl_id_statut` (`cocl_id_statut`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `gd_commande_client`
--

INSERT INTO `gd_commande_client` (`cocl_id_commande`, `cocl_date_commande`, `cocl_id_statut`, `cocl_id_client`) VALUES
(1, '2026-10-22 13:47:36', 4, 1),
(2, '2026-08-29 13:47:36', 4, 2),
(3, '2026-09-01 13:47:36', 3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `gd_contenant`
--

DROP TABLE IF EXISTS `gd_contenant`;
CREATE TABLE IF NOT EXISTS `gd_contenant` (
  `co_id_contenant` int NOT NULL AUTO_INCREMENT,
  `co_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `co_code_barres` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `co_id_contenant_parent` int DEFAULT NULL,
  `co_poids_max` decimal(10,2) DEFAULT NULL,
  `co_id_emplacement` int DEFAULT NULL,
  PRIMARY KEY (`co_id_contenant`),
  KEY `co_id_emplacement` (`co_id_emplacement`),
  KEY `co_id_contenant_parent` (`co_id_contenant_parent`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `gd_contenant`
--

INSERT INTO `gd_contenant` (`co_id_contenant`, `co_type`, `co_code_barres`, `co_id_contenant_parent`, `co_poids_max`, `co_id_emplacement`) VALUES
(1, 'Palette', 'PAL-FR-001', NULL, 500.00, 1),
(2, 'Bac', 'BAC-PL-005', 1, 50.00, 1),
(3, 'Colis', 'COLIS-998', 2, 10.00, 1);

-- --------------------------------------------------------

--
-- Structure de la table `gd_emplacement`
--

DROP TABLE IF EXISTS `gd_emplacement`;
CREATE TABLE IF NOT EXISTS `gd_emplacement` (
  `em_id_emplacement` int NOT NULL AUTO_INCREMENT,
  `em_zone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `em_allee` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `em_travee` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `em_niveau` int NOT NULL,
  `em_capacite` smallint DEFAULT NULL,
  PRIMARY KEY (`em_id_emplacement`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `gd_emplacement`
--

INSERT INTO `gd_emplacement` (`em_id_emplacement`, `em_zone`, `em_allee`, `em_travee`, `em_niveau`, `em_capacite`) VALUES
(1, 'A', '0', '0', 0, 50);

-- --------------------------------------------------------

--
-- Structure de la table `gd_fournisseur`
--

DROP TABLE IF EXISTS `gd_fournisseur`;
CREATE TABLE IF NOT EXISTS `gd_fournisseur` (
  `fo_id_fournisseur` int NOT NULL AUTO_INCREMENT,
  `fo_nom_entreprise` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fo_contact` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fo_adresse` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fo_code_postal` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fo_ville` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`fo_id_fournisseur`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `gd_fournisseur`
--

INSERT INTO `gd_fournisseur` (`fo_id_fournisseur`, `fo_nom_entreprise`, `fo_contact`, `fo_adresse`, `fo_code_postal`, `fo_ville`) VALUES
(1, 'TechDistrib SA', 'marcleroy@testdistrib.fr', '12 rue de la Logistique', '69007', 'Lyon'),
(2, 'Global Import', 'sophiemartin@global.com', '45 avenue des Nations', '17380', 'Landes'),
(3, 'ElectroWorld', 'thomasbernard@transport.com', '8 boulevard Industriel', '13014', 'Marseille'),
(4, 'Landais - Transport & Logistique', 'landais@landaisjl.com', 'Route de Chateaubriant - Zone industrielle du Château Rouge', '44522', 'Mesanger'),
(5, 'Mitaland Transports', 'contact@mitaland.fr', '675 Rue Bernard Palissy', '40990', 'Saint-Paul-lès-Dax'),
(6, 'Landes Transports', 'transland@transport.fr', '285 Rue de Gascogne', '40260', 'Castets');

-- --------------------------------------------------------

--
-- Structure de la table `gd_ligne_commande_client`
--

DROP TABLE IF EXISTS `gd_ligne_commande_client`;
CREATE TABLE IF NOT EXISTS `gd_ligne_commande_client` (
  `lccl_id_ligne` int NOT NULL AUTO_INCREMENT,
  `lccl_quantite_commandee` smallint NOT NULL,
  `lccl_prix_vente` decimal(10,2) NOT NULL,
  `lccl_id_commande` int NOT NULL,
  `lccl_id_article` int NOT NULL,
  PRIMARY KEY (`lccl_id_ligne`),
  KEY `lc_id_commande` (`lccl_id_commande`),
  KEY `lc_id_article` (`lccl_id_article`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `gd_ligne_commande_client`
--

INSERT INTO `gd_ligne_commande_client` (`lccl_id_ligne`, `lccl_quantite_commandee`, `lccl_prix_vente`, `lccl_id_commande`, `lccl_id_article`) VALUES
(1, 2, 8.70, 1, 1),
(2, 1, 22.30, 2, 2),
(3, 3, 8.50, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `gd_ligne_reception`
--

DROP TABLE IF EXISTS `gd_ligne_reception`;
CREATE TABLE IF NOT EXISTS `gd_ligne_reception` (
  `lr_id_ligne` int NOT NULL AUTO_INCREMENT,
  `lr_quantite_recue` smallint NOT NULL,
  `lr_id_reception` int NOT NULL,
  `lr_id_article` int NOT NULL,
  PRIMARY KEY (`lr_id_ligne`),
  KEY `lr_id_reception` (`lr_id_reception`),
  KEY `lr_id_article` (`lr_id_article`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `gd_ligne_reception`
--

INSERT INTO `gd_ligne_reception` (`lr_id_ligne`, `lr_quantite_recue`, `lr_id_reception`, `lr_id_article`) VALUES
(1, 10, 1, 1),
(2, 22, 2, 2),
(3, 10, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `gd_reception`
--

DROP TABLE IF EXISTS `gd_reception`;
CREATE TABLE IF NOT EXISTS `gd_reception` (
  `re_id_reception` int NOT NULL AUTO_INCREMENT,
  `re_date_reception` datetime NOT NULL,
  `re_id_statut` int NOT NULL,
  `re_id_fournisseur` int NOT NULL,
  PRIMARY KEY (`re_id_reception`),
  KEY `re_id_fournisseur` (`re_id_fournisseur`),
  KEY `re_id_statut` (`re_id_statut`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `gd_reception`
--

INSERT INTO `gd_reception` (`re_id_reception`, `re_date_reception`, `re_id_statut`, `re_id_fournisseur`) VALUES
(1, '2026-08-10 08:00:00', 2, 1),
(2, '2026-08-12 11:30:00', 2, 2),
(3, '2026-08-27 13:20:29', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `gd_statut`
--

DROP TABLE IF EXISTS `gd_statut`;
CREATE TABLE IF NOT EXISTS `gd_statut` (
  `sta_id_statut` int NOT NULL AUTO_INCREMENT,
  `sta_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sta_libelle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`sta_id_statut`),
  UNIQUE KEY `sta_code` (`sta_code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `gd_statut`
--

INSERT INTO `gd_statut` (`sta_id_statut`, `sta_code`, `sta_libelle`) VALUES
(1, 'EN_COURS', 'En cours'),
(2, 'CLOTUREE', 'Clôturée'),
(3, 'VALIDEE', 'Validée'),
(4, 'EXPEDIE', 'Expédiée');

-- --------------------------------------------------------

--
-- Structure de la table `gd_stock`
--

DROP TABLE IF EXISTS `gd_stock`;
CREATE TABLE IF NOT EXISTS `gd_stock` (
  `st_id_article` int NOT NULL,
  `st_id_contenant` int NOT NULL,
  `st_quantite` smallint NOT NULL,
  PRIMARY KEY (`st_id_article`,`st_id_contenant`),
  KEY `st_id_contenant` (`st_id_contenant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `gd_stock`
--

INSERT INTO `gd_stock` (`st_id_article`, `st_id_contenant`, `st_quantite`) VALUES
(1, 3, 27),
(2, 2, 8),
(4, 1, 12);


--
-- Modification de la table 'gd_ligne_reception`
--
ALTER TABLE `gd_ligne_reception` 
ADD COLUMN `lr_prix_achat` decimal(10,2) NOT NULL AFTER `lr_quantite_recue`;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `gd_article_fournisseur`
--
ALTER TABLE `gd_article_fournisseur`
  ADD CONSTRAINT `gd_article_fournisseur_ibfk_1` FOREIGN KEY (`af_id_article`) REFERENCES `gd_article` (`ar_id_article`),
  ADD CONSTRAINT `gd_article_fournisseur_ibfk_2` FOREIGN KEY (`af_id_fournisseur`) REFERENCES `gd_fournisseur` (`fo_id_fournisseur`);

--
-- Contraintes pour la table `gd_commande_client`
--
ALTER TABLE `gd_commande_client`
  ADD CONSTRAINT `gd_commande_client_ibfk_client` FOREIGN KEY (`cocl_id_client`) REFERENCES `gd_client` (`cl_id_client`),
  ADD CONSTRAINT `gd_commande_client_ibfk_statut` FOREIGN KEY (`cocl_id_statut`) REFERENCES `gd_statut` (`sta_id_statut`);

--
-- Contraintes pour la table `gd_contenant`
--
ALTER TABLE `gd_contenant`
  ADD CONSTRAINT `gd_fk_contenant_emplacement` FOREIGN KEY (`co_id_emplacement`) REFERENCES `gd_emplacement` (`em_id_emplacement`),
  ADD CONSTRAINT `gd_fk_contenant_parent` FOREIGN KEY (`co_id_contenant_parent`) REFERENCES `gd_contenant` (`co_id_contenant`);

--
-- Contraintes pour la table `gd_ligne_commande_client`
--
ALTER TABLE `gd_ligne_commande_client`
  ADD CONSTRAINT `gd_ligne_commande_client_ibfk_1` FOREIGN KEY (`lccl_id_commande`) REFERENCES `gd_commande_client` (`cocl_id_commande`),
  ADD CONSTRAINT `gd_ligne_commande_client_ibfk_2` FOREIGN KEY (`lccl_id_article`) REFERENCES `gd_article` (`ar_id_article`);

--
-- Contraintes pour la table `gd_ligne_reception`
--
ALTER TABLE `gd_ligne_reception`
  ADD CONSTRAINT `gd_ligne_reception_ibfk_1` FOREIGN KEY (`lr_id_reception`) REFERENCES `gd_reception` (`re_id_reception`),
  ADD CONSTRAINT `gd_ligne_reception_ibfk_2` FOREIGN KEY (`lr_id_article`) REFERENCES `gd_article` (`ar_id_article`);

--
-- Contraintes pour la table `gd_reception`
--
ALTER TABLE `gd_reception`
  ADD CONSTRAINT `gd_reception_ibfk_1` FOREIGN KEY (`re_id_fournisseur`) REFERENCES `gd_fournisseur` (`fo_id_fournisseur`),
  ADD CONSTRAINT `gd_reception_ibfk_statut` FOREIGN KEY (`re_id_statut`) REFERENCES `gd_statut` (`sta_id_statut`);

--
-- Contraintes pour la table `gd_stock`
--
ALTER TABLE `gd_stock`
  ADD CONSTRAINT `gd_stock_ibfk_article` FOREIGN KEY (`st_id_article`) REFERENCES `gd_article` (`ar_id_article`),
  ADD CONSTRAINT `gd_stock_ibfk_contenant` FOREIGN KEY (`st_id_contenant`) REFERENCES `gd_contenant` (`co_id_contenant`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
