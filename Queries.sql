SELECT * FROM TypeClient;  /*Liste des catégories de clients :*/
SELECT Nom_Client, Prenom_Client, AdresseClient, TelClient FROM Client; /*Lister tous les clients avec leurs coordonnées :*/
SELECT NomProduit, DescProduit FROM Produit; /*Liste tous les produits ainsi que leur description*/
SELECT Nom_Client, Prenom_Client FROM Client 
JOIN TypeClient ON Client.ID_TClient = TypeClient.ID_TClient
WHERE CategorieClient = 'Entreprise Sante'; /*Trouver les clients d'une catégorie spécifique. Ici, Entreprise Sante :*/ 
SELECT NomProduit FROM Produit WHERE ID_Client = 3;  /*Lister les produits créés par un client spécifique*/
SELECT * FROM Besoin_ WHERE DureeUtilisation_ > 10; /*Afficher les besoins d'un client d'une durée d'utilisation supérieure à 10 mois*/
SELECT COUNT(*) AS NombreProduits FROM Produit; /*Nombre total de produits dans la base :*/ 
SELECT SUM(QteRessource) AS TotalRessources FROM Besoin_; /*Calculer la quantité totale de ressources nécessaires pour tous les besoins :*/
SELECT Besoin_.Descriptif, Produit.NomProduit 
FROM Besoin_
JOIN Produit ON Besoin_.ID_Produit = Produit.ID_Produit; /*Trouver les besoins et les produits correspondants :*/
SELECT Produit.NomProduit, AVG(Besoin_.QteRessource) AS MoyenneRessources
FROM Besoin_
JOIN Produit ON Besoin_.ID_Produit = Produit.ID_Produit
GROUP BY Produit.NomProduit; /*Quantité moyenne de ressources par type de produit :*/
SELECT Produit.NomProduit
FROM Produit
JOIN Client ON Produit.ID_Client = Client.ID_Client
JOIN TypeClient ON Client.ID_TClient = TypeClient.ID_TClient
WHERE TypeClient.CategorieClient = 'Entreprise Sante'; /*Trouver les produits créés par des clients d'une certaine catégorie*/ 
SELECT C.Nom_Client,P.NomProduit,P.DescProduit
FROM Produit P
INNER JOIN Client C on C.ID_Client=P.ID_Client
WHERE C.Prenom_Client IS NULL
ORDER BY C.Nom_Client;/*Afficher les Produits d'entreprise*/
SELECT C.Nom_Client,P.NomProduit,P.DescProduit
FROM Produit P
INNER JOIN Client C on C.ID_Client=P.ID_Client
WHERE C.Prenom_Client IS NOT NULL
ORDER BY C.Nom_Client;/*Afficher les Produits d'individu*/
SELECT COUNT(Prenom_Client) As "quantité totale d'individu"
FROM Client;/*Calculer la quantité totale d'individu*/
SELECT COUNT(*)-COUNT(Prenom_Client) As "quantité totale d'entreprise"
FROM Client;/*Calculer la quantité totale d'entreprise*/
SELECT T.CategorieClient, COUNT(*)
FROM Client C
INNER JOIN TypeClient T ON T.ID_TClient=C.ID_TClient 
GROUP BY T.ID_TClient,T.CategorieClient;/*Calculer la quantité de chaque type de client*/
SELECT NiveauSupport,count(*)
FROM Besoin_
GROUP BY NiveauSupport;/*Lister les produits et leur prix moyen par NiveauSupport.*/
SELECT T.CategorieClient, COUNT(*) AS ProductCount
FROM Client C
INNER JOIN Produit P ON P.ID_Client=C.ID_Client
INNER JOIN TypeClient T ON T.ID_TClient=C.ID_TClient
GROUP BY T.CategorieClient, T.ID_TClient
ORDER BY ProductCount DESC
LIMIT 1;/*Lister les catégories les plus populaires en termes de produits vendus.*/
SELECT T.CategorieClient, COUNT(*) AS ClientCount
FROM Client C
INNER JOIN TypeClient T ON T.ID_TClient=C.ID_TClient
GROUP BY T.CategorieClient, T.ID_TClient
ORDER BY ClientCount DESC
LIMIT 1;/*Lister les catégories ayant la plus grande quantité de client*/
SELECT T.CategorieClient, COUNT(*) AS ClientCount
FROM Client C
INNER JOIN TypeClient T ON T.ID_TClient=C.ID_TClient
GROUP BY T.CategorieClient, T.ID_TClient
ORDER BY ClientCount DESC
LIMIT 1;/*Lister les catégories ayant la plus grande quantité de Besoin_*/
SELECT AVG(B.PRIX)
FROM Client C
INNER JOIN TypeClient T ON T.ID_TClient=C.ID_TClient
INNER JOIN Besoin_ B ON C.ID_Client = B.ID_Client
WHERE T.CategorieClient='Entreprise Sante'
LIMIT 1;/*Lister la moyenne de prix des produit créés par des clients d'une certaine catégorie*/
SELECT Besoin_.NiveauSupport,AVG(Besoin_.PRIX)
FROM Besoin_
GROUP BY Besoin_.NiveauSupport
LIMIT 1;/*Lister la moyenne de prix des produit des diffirent NiveauSupport*/

