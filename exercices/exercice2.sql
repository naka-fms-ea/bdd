SELECT cl_nom_client, cocl_id_commande FROM gd_client INNER JOIN gd_commande_client ON cl_id_client = cocl_id_client;

SELECT ar_libelle, lccl_quantite_commandee, lccl_prix_vente FROM gd_ligne_commande_client INNER JOIN gd_article ON lccl_id_article = ar_id_article WHERE lccl_id_commande = 1;

SELECT re_id_reception, fo_nom_entreprise FROM gd_fournisseur INNER JOIN gd_reception ON fo_id_fournisseur = re_id_fournisseur;

SELECT ar_reference, ar_libelle, co_id_emplacement, st_quantite FROM gd_article INNER JOIN gd_stock ON ar_id_article = st_id_article INNER JOIN gd_contenant ON st_id_contenant = co_id_contenant;