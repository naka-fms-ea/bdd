CREATE DATABASE IF NOT EXISTS gestion_depot;

USE gestion_entrepot

CREATE TABLE IF NOT EXISTS gd_fournisseur (
fo_id_fournisseur INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
fo_nom_entreprise VARCHAR(50) NOT NULL,
fo_contact VARCHAR(50) NOT NULL,
fo_adresse VARCHAR(50) NOT NULL,
fo_code_postal VARCHAR(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS gd_article (
ar_id_article INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
ar_reference VARCHAR(50) NOT NULL,
ar_gencod VARCHAR(50) NOT NULL,
ar_libelle VARCHAR(100) NOT NULL,
ar_prix_unitaire DECIMAL(10, 2),
ar_seuil_alerte SMALLINT UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS gd_fournisseur_article (
CONSTRAINTS fk_fournisseur_article FOREIGN KEY (id_fournisseur) REFERENCES gd_fournisseur (fo_id_fournisseur) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINTS fk_article_article FOREIGN KEY (id_article) REFERENCES gd_article (ar_id_article) ON DELETE CASCADE ON UPDATE CASCADE,
fr_prix_achat DECIMAL(10, 2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

