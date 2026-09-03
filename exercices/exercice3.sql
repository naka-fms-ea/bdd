SELECT lccl_id_commande, lccl_id_ligne, ar_libelle, ar_reference, lccl_quantite_commandee, lccl_prix_vente, lccl_quantite_commandee * lccl_prix_vente AS montant_total 
FROM gd_ligne_commande_client 
INNER JOIN gd_article 
ON lccl_id_article = ar_id_article
GROUP BY lccl_id_commande
HAVING lccl_id_commande = 1;


SELECT cl_nom_client, COUNT(DISTINCT cocl_id_commande) AS nb_total_commande
FROM gd_client
INNER JOIN gd_commande_client
ON cl_id_client = cocl_id_client
GROUP BY cl_nom_client


SELECT ar_reference, ar_libelle, COUNT(lr_id_reception) AS quantite_totale_recue
FROM gd_article
INNER JOIN gd_ligne_reception
ON ar_id_article = lr_id_article
GROUP BY ar_libelle;