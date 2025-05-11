Drop table Besoin_;
Drop table Produit;
Drop table Client;
Drop table TypeClient;




CREATE TABLE TypeClient(
   ID_TClient INT, 
   CategorieClient VARCHAR(50) NOT NULL , 
   PRIMARY KEY(ID_TClient)
);

CREATE TABLE Client(
   ID_Client INT,
   Nom_Client VARCHAR(50) NOT NULL,
  Prenom_Client VARCHAR(50),
   AdresseClient VARCHAR(50),
   TelClient VARCHAR(13) CONSTRAINT ck_cl_tl CHECK(TelClient
                         GLOB ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') OR TelClient GLOB ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),

   Referent VARCHAR(50),
   ID_TClient INT NOT NULL,
   PRIMARY KEY(ID_Client),
   FOREIGN KEY(ID_TClient) REFERENCES TypeClient(ID_TClient)
);

CREATE TABLE Produit(
   ID_Produit INT,
   NomProduit VARCHAR(50) NOT NULL,
   DescProduit VARCHAR(50),
   ID_Client INT NOT NULL,
   PRIMARY KEY(ID_Produit),
   FOREIGN KEY(ID_Client) REFERENCES Client(ID_Client)
);

CREATE TABLE Besoin_(
   ID_Besoin INT ,
   Descriptif VARCHAR(50),
   NiveauSupport INT,
   DureeUtilisation_ INT CHECK (DureeUtilisation_ > 0),
   QteRessource INT CHECK (QteRessource > 0) ,
   Prix DECIMAL(9,2) CHECK (Prix >= 0) ,		
   ID_Produit INT  NOT NULL,
   ID_Client INT  NOT NULL,
   PRIMARY KEY(ID_Besoin),
   FOREIGN KEY(ID_Produit) REFERENCES Produit(ID_Produit),
   FOREIGN KEY(ID_Client) REFERENCES Client(ID_Client)
);
