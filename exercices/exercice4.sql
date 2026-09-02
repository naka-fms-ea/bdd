--
-- Structure de la table `gd_article`
--

DROP TABLE IF EXISTS `gd_reception`;
CREATE TABLE IF NOT EXISTS `gd_reception` (
  `re_id_reception` int NOT NULL AUTO_INCREMENT,
  `re_date_reception` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP NOT NULL,
  PRIMARY KEY (`re_id_reception`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


--
-- Contraintes pour la table `gd_reception`
--
ALTER TABLE `gd_reception`
  ADD CONSTRAINT `gd_reception_ibfk_1` FOREIGN KEY (`re_statut`) REFERENCES `gd_statut` (`sta_id_statut`),
  ADD CONSTRAINT `gd_reception_ibfk_2` FOREIGN KEY (`re_id_fournisseur`) REFERENCES `gd_fournisseur` (`fo_id_fournisseur`);


--
-- Structure de la table `gd_ligne_reception`
--

DROP TABLE IF EXISTS `gd_ligne_reception`;
CREATE TABLE IF NOT EXISTS `gd_ligne_reception` (
  `lr_id_ligne` int NOT NULL AUTO_INCREMENT,
  `lr_quantite_recue` int NOT NULL,
  PRIMARY KEY (`lr_id_ligne`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


--
-- Contraintes pour la table `gd_ligne_reception`
--
ALTER TABLE `gd_ligne_reception`
  ADD CONSTRAINT `gd_ligne_reception_ibfk_1` FOREIGN KEY (`lr_id_reception`) REFERENCES `gd_reception` (`re_id_reception`),
  ADD CONSTRAINT `gd_ligne_reception_ibfk_2` FOREIGN KEY (`lr_id_article`) REFERENCES `gd_article` (`ar_id_article`);