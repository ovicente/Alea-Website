/**
 * Author:  neiko
 * Created: Oct 26, 2016
 */

DROP DATABASE IF EXISTS Alea;
CREATE DATABASE Alea;
use Alea;

DROP TABLE IF EXISTS Utilisateur;
DROP TABLE IF EXISTS Jeu;
DROP TABLE IF EXISTS Soiree;
DROP TABLE IF EXISTS Programme;

/*Creation des tables*/

/*type : 0 -> non enregistre | 1 -> enregistre | 2 -> adherant | 3 -> admin*/
CREATE TABLE Utilisateur( ID INT AUTO_INCREMENT,
				Identifiant VARCHAR(20),
				MotDePasse VARCHAR(40),
				Email VARCHAR(80),
				Prenom VARCHAR(20) NOT NULL, 
				Nom VARCHAR(30) NOT NULL,
				Contribution DECIMAL,
				TypeUtilisateur INT,
				PRIMARY KEY (ID));

CREATE TABLE Jeu( ID INT AUTO_INCREMENT,
			Nom VARCHAR(80),
			NbJoueurMin INT,
			NbJoueurMax INT,
			Description VARCHAR(150),
			Proprietaire INT,
			PRIMARY KEY (ID),
			FOREIGN KEY (Proprietaire) REFERENCES Utilisateur(ID) ON DELETE CASCADE);

CREATE TABLE Soiree( ID INT AUTO_INCREMENT,
			Jour DATE,
			Nom VARCHAR(50),
			NbJoueur INT,
			NbAdherant INT,
			Description VARCHAR(400),
			PRIMARY KEY (ID));

CREATE TABLE Programme(	SoireeID INT,
			JeuID INT,
			FOREIGN KEY (SoireeID) REFERENCES Soiree(ID) ON DELETE CASCADE,
			FOREIGN KEY (JeuID) REFERENCES Jeu(ID) ON DELETE CASCADE,
			PRIMARY KEY (SoireeID, JeuID)
			);

/*Contraintes d'intégrités
La contribution d'un joueur ne peut pas etre négative*/
ALTER TABLE Utilisateur ADD CONSTRAINT ContributionPositive CHECK (Contribution >= 0.0);

/*Insertion dans les tables
Table Utilisateur*/
INSERT INTO Utilisateur VALUES(1,'Alea','Jacta_est','AleaJacta_est@gmail.com','Alea','Asso',0.0,3);
INSERT INTO Utilisateur VALUES(2,'Mamamillaaa','xxx','Mamamilla@gmail.com','Maxime','Moreno',25.0,3);
INSERT INTO Utilisateur VALUES(3,'Neiko','Nyaa','sylvain.maillot1@gmail.com','Sylvain','Maillot',3.5,2);
INSERT INTO Utilisateur VALUES(4,'NotoPD','AZERTY','hahacaca@gmail.com','Romain','Noto',0.0,1);
INSERT INTO Utilisateur VALUES(5,'Flob','lapin','flobeur@gmail.com','Flo','Bru',0.0,1);
INSERT INTO Utilisateur VALUES(6,'Skyary','xcom','AOE@gmail.com','Grec','Caillou',0.0,1);
INSERT INTO Utilisateur VALUES(7,'Jesus','resurection','audelas@gmail.com','Jesus','Satan',0.0,1);
INSERT INTO Utilisateur VALUES(8,'Ana','vousnemehackerezpas','ow@gmail.com','Bella','Ana',0.0,1);
INSERT INTO Utilisateur VALUES(9,'Hanzo','ryugawagatekiwokurau','dragonstrike@gmail.com','Hanzo','Genji',0.0,1);
INSERT INTO Utilisateur VALUES(10,'Mei','jesuisuncancertrololo','glaçon@gmail.com','Salope','Deglace',0.0,1);

/*Table Jeu*/
INSERT INTO Jeu VALUES('1','Les contrées de l horreur','1','6','Blabla','3');
INSERT INTO Jeu VALUES('2','Loup Garou','1','20','Trop bien','2');
INSERT INTO Jeu VALUES('3','J aime bien ta mere','1','2','cest trop drole','4');
INSERT INTO Jeu VALUES('4','Scrabble','1','6','C est plus drole que ce quon pourrait croire','2');
INSERT INTO Jeu VALUES('5','Minecraft','1','6','J ai vraiment rien compris','5');
INSERT INTO Jeu VALUES('6','Nazi the game','1','6','Mon jeu preferé','10');
INSERT INTO Jeu VALUES('7','Dragonborn','5','8','KOLOZUUU','9');
INSERT INTO Jeu VALUES('8','Nains dans la mine','2','8','Nains vs the world','2');
INSERT INTO Jeu VALUES('9','Dark tale','2','4','Meilleur jeu du monde','2');
INSERT INTO Jeu VALUES('10','Time stories','1','4','Bon jeu en coop','2');

/*Table Soiree*/
INSERT INTO Soiree VALUES('1','2016-10-31','Alea horror party','0','0','');
INSERT INTO Soiree VALUES('2','2016-11-25','Fin du monde','0','0','');

/*Table Programme*/
INSERT INTO Programme VALUES('1','1');
INSERT INTO Programme VALUES('2','1');
INSERT INTO Programme VALUES('1','2');
INSERT INTO Programme VALUES('1','3');
INSERT INTO Programme VALUES('2','3');
INSERT INTO Programme VALUES('2','4');
INSERT INTO Programme VALUES('1','10');
INSERT INTO Programme VALUES('2','9');
INSERT INTO Programme VALUES('1','7');
INSERT INTO Programme VALUES('2','8');

