--
-- Structure de la table `gd_article`
--

DROP TABLE IF EXISTS `gd_contenant`;
CREATE TABLE IF NOT EXISTS `gd_contenant` (
  `co_id_contenant` int NOT NULL AUTO_INCREMENT,
  `co_type_contenant` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `co_id_article` int NOT NULL,
  PRIMARY KEY (`co_id_contenant`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


ALTER TABLE `gd_contenant`
  ADD CONSTRAINT `gd_commande_client_ibfk_client` FOREIGN KEY (`co_id_article`) REFERENCES `gd_article` (`ar_id_article`);