-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 06 nov. 2019 à 07:29
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `express_food`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresses`
--

DROP TABLE IF EXISTS `adresses`;
CREATE TABLE IF NOT EXISTS `adresses` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Numero_rue` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Nom_rue` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Code_postal` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Ville` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `User_ID` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `User_ID` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `adresses`
--

INSERT INTO `adresses` (`Id`, `Numero_rue`, `Nom_rue`, `Code_postal`, `Ville`, `User_ID`) VALUES
(4, '84', 'rue de Groussay', '26100', 'ROMANS-SUR-ISÈRE', 7),
(6, '66', 'rue Bonneterie', '25200', 'MONTBÉLIARD', 1),
(8, '5', 'cours Jean Jaures', '92100', 'BOULOGNE-BILLANCOURT', 6),
(21, '67', 'route de Lyon', '13800', 'ISTRES', 2),
(25, '17', 'rue des Lacs', '78800', 'HOUILLES', 5),
(71, '59', 'rue Lenotre', '35200', 'RENNES', 4),
(120, '25', 'rue Jean Vilar', '60000', 'BEAUVAIS', 3);

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
CREATE TABLE IF NOT EXISTS `commandes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Date_achat` date NOT NULL,
  `Prix_commande` float NOT NULL,
  `Livreur_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Statut_commande_ID` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Statut_commande_ID` (`Statut_commande_ID`),
  KEY `Livreur_ID` (`Livreur_ID`),
  KEY `User_ID` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`Id`, `Date_achat`, `Prix_commande`, `Livreur_ID`, `User_ID`, `Statut_commande_ID`) VALUES
(1, '2019-10-21', 12.5, 1, 2, 2),
(2, '2019-10-01', 12.5, 2, 1, 4),
(3, '2019-11-04', 12.5, 2, 8, 4),
(4, '2019-11-03', 12.5, 1, 2, 6),
(5, '2019-11-01', 12.5, 1, 5, 4),
(6, '2019-11-05', 12.5, 1, 3, 3),
(7, '2019-11-05', 12.5, 1, 1, 2),
(8, '2019-11-05', 12.5, 2, 8, 4);

-- --------------------------------------------------------

--
-- Structure de la table `livreurs`
--

DROP TABLE IF EXISTS `livreurs`;
CREATE TABLE IF NOT EXISTS `livreurs` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Latitude` double NOT NULL,
  `Longitude` double NOT NULL,
  `Stock_livreur` tinyint(1) NOT NULL,
  `Note` float NOT NULL,
  `Photo_livreur` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Statut_livreur_ID` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `User_ID` (`User_ID`),
  KEY `Statut_livreur_ID` (`Statut_livreur_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `livreurs`
--

INSERT INTO `livreurs` (`Id`, `Latitude`, `Longitude`, `Stock_livreur`, `Note`, `Photo_livreur`, `User_ID`, `Statut_livreur_ID`) VALUES
(1, 48.785182, 2.067418, 1, 4.8, 'Lien', 4, 1),
(2, 48.754868, 2.248965, 0, 4.3, 'Lien', 5, 1);

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

DROP TABLE IF EXISTS `panier`;
CREATE TABLE IF NOT EXISTS `panier` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Quantite` int(11) NOT NULL,
  `Plat_ID` int(11) NOT NULL,
  `Commande_ID` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Plat_ID` (`Plat_ID`),
  KEY `Commande_ID` (`Commande_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `panier`
--

INSERT INTO `panier` (`Id`, `Quantite`, `Plat_ID`, `Commande_ID`) VALUES
(1, 1, 1, 1),
(2, 2, 4, 1),
(3, 1, 2, 3),
(4, 1, 5, 3),
(5, 1, 1, 4),
(6, 1, 4, 4),
(7, 1, 3, 5),
(8, 1, 4, 5),
(9, 1, 1, 6),
(10, 1, 4, 6),
(11, 1, 1, 7),
(12, 1, 5, 7),
(13, 2, 2, 8);

-- --------------------------------------------------------

--
-- Structure de la table `plats`
--

DROP TABLE IF EXISTS `plats`;
CREATE TABLE IF NOT EXISTS `plats` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_plat` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Photo_plat` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci NOT NULL,
  `Prix` float(10,2) NOT NULL,
  `Quantite_stock` int(11) NOT NULL,
  `Type_plat_ID` int(11) NOT NULL,
  `Statut_plat_ID` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Statut_plat` (`Statut_plat_ID`) USING BTREE,
  KEY `Type_plat` (`Type_plat_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `plats`
--

INSERT INTO `plats` (`Id`, `Nom_plat`, `Photo_plat`, `Description`, `Prix`, `Quantite_stock`, `Type_plat_ID`, `Statut_plat_ID`) VALUES
(1, 'Pizza 4 fromages', 'Lien', 'Tomate, mozzarella, parmesan, brie, gorgonzola.', 8.50, 40, 1, 1),
(2, 'Pizza Marguerita', 'Lien', 'Tomate, mozzarella, origan.', 8.50, 10, 1, 3),
(3, 'Pizza Reine', 'Lien', 'Tomate, mozzarella, champignons, jambon.', 8.50, 0, 1, 2),
(4, 'Glace 500ml', 'Lien', 'Pot de 500ml.', 4.00, 32, 2, 1),
(5, 'Brownie', 'Lien', 'Chocolat.', 4.00, 2, 2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `statut_commandes`
--

DROP TABLE IF EXISTS `statut_commandes`;
CREATE TABLE IF NOT EXISTS `statut_commandes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Statut_commande` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `statut_commandes`
--

INSERT INTO `statut_commandes` (`Id`, `Statut_commande`) VALUES
(1, 'En cours'),
(2, 'En livraison'),
(3, 'Annuler'),
(4, 'Terminer'),
(5, 'Non livrer'),
(6, 'Rembourser');

-- --------------------------------------------------------

--
-- Structure de la table `statut_livreurs`
--

DROP TABLE IF EXISTS `statut_livreurs`;
CREATE TABLE IF NOT EXISTS `statut_livreurs` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Statut_livreur` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `statut_livreurs`
--

INSERT INTO `statut_livreurs` (`Id`, `Statut_livreur`) VALUES
(1, 'En ligne'),
(2, 'Hors ligne');

-- --------------------------------------------------------

--
-- Structure de la table `statut_plats`
--

DROP TABLE IF EXISTS `statut_plats`;
CREATE TABLE IF NOT EXISTS `statut_plats` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Statut_plat` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `statut_plats`
--

INSERT INTO `statut_plats` (`Id`, `Statut_plat`) VALUES
(1, 'Plat du jour'),
(2, 'Rupture de stock'),
(3, 'False');

-- --------------------------------------------------------

--
-- Structure de la table `type_plats`
--

DROP TABLE IF EXISTS `type_plats`;
CREATE TABLE IF NOT EXISTS `type_plats` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Type_plat` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `type_plats`
--

INSERT INTO `type_plats` (`Id`, `Type_plat`) VALUES
(1, 'Plat'),
(2, 'Dessert');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `Prenom` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `Tel` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `Mot_de_passe` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `Chef` tinyint(1) NOT NULL,
  `Admin` tinyint(1) NOT NULL,
  `Adresse_ID` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Email` (`Email`),
  KEY `Adresse_ID` (`Adresse_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`Id`, `Nom`, `Prenom`, `Tel`, `Email`, `Mot_de_passe`, `Chef`, `Admin`, `Adresse_ID`) VALUES
(1, 'Dupont', 'Bernard', '0623456789', 'dupont.bernard@gmail.com', '6184d64245dc11406aa631ba225ec47dd6962faa', 0, 0, 6),
(2, 'Davignon', 'Ambra', '0158456237', 'AmbraDavignon@rhyta.com', '256e01ac8f86ad55428251e81696fe2a4d9ede82', 0, 0, 21),
(3, 'Brault', 'Lundy', '0714587432', 'LundyBrault@hotmail.com', '64cbaf0e4ada2aabcca7c2b40526f4300371cfc6', 0, 0, 120),
(4, 'Boisvert', 'Gano', '0123456789', 'GanoBoisvert@jourrapide.com', 'ee854ad6e637c2392132d3adcd78c4750a1da189', 0, 0, 71),
(5, 'Laforest', 'Clarice', '0145982574', 'ClariceLaforest@teleworm.com', 'b70d7366531d6bcee286a9812db9d19600eaf4dd', 0, 0, 25),
(6, 'Gregoire', 'Christian', '0712961973', 'ChristianGregoire@dayrep.com', '4be0848dae4d7ab433613983a63f466add47513c', 1, 0, 8),
(7, 'Lebrun', 'Damiane', '0748371892', 'DamianeLebrun@rhyta.com', 'ba496b2e7f0cd4ee4f7318e821e9ffb0b68fe111', 0, 1, 4),
(8, 'Casgrain', 'Émilie', '0429905684', 'EmilieCasgrain@dayrep.com', '61b12d5340a2b847a409ec34105ea15a', 0, 0, 8);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `view_panier_details`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `view_panier_details`;
CREATE TABLE IF NOT EXISTS `view_panier_details` (
`Nom_plat` varchar(50)
,`Nom` varchar(40)
,`Prenom` varchar(40)
,`Quantite` int(11)
,`Prix` float(10,2)
,`Tel` varchar(10)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `view_plats_details`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `view_plats_details`;
CREATE TABLE IF NOT EXISTS `view_plats_details` (
`Nom_plat` varchar(50)
,`Prix` float(10,2)
,`Type_plat` varchar(50)
,`Statut_plat` varchar(50)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `view_users_details`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `view_users_details`;
CREATE TABLE IF NOT EXISTS `view_users_details` (
`Nom` varchar(40)
,`Prenom` varchar(40)
,`Tel` varchar(10)
,`Email` varchar(40)
,`Numero_rue` varchar(10)
,`Nom_rue` varchar(50)
,`Code_postal` varchar(10)
,`Ville` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure de la vue `view_panier_details`
--
DROP TABLE IF EXISTS `view_panier_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_panier_details`  AS  select `plats`.`Nom_plat` AS `Nom_plat`,`users`.`Nom` AS `Nom`,`users`.`Prenom` AS `Prenom`,`panier`.`Quantite` AS `Quantite`,`plats`.`Prix` AS `Prix`,`users`.`Tel` AS `Tel` from (((`panier` join `plats` on((`panier`.`Plat_ID` = `plats`.`Id`))) join `commandes` on((`panier`.`Commande_ID` = `commandes`.`Id`))) join `users` on((`commandes`.`User_ID` = `users`.`Id`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `view_plats_details`
--
DROP TABLE IF EXISTS `view_plats_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_plats_details`  AS  select `plats`.`Nom_plat` AS `Nom_plat`,`plats`.`Prix` AS `Prix`,`type_plats`.`Type_plat` AS `Type_plat`,`statut_plats`.`Statut_plat` AS `Statut_plat` from ((`plats` join `type_plats` on((`plats`.`Type_plat_ID` = `type_plats`.`Id`))) join `statut_plats` on((`plats`.`Statut_plat_ID` = `statut_plats`.`Id`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `view_users_details`
--
DROP TABLE IF EXISTS `view_users_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_users_details`  AS  select `users`.`Nom` AS `Nom`,`users`.`Prenom` AS `Prenom`,`users`.`Tel` AS `Tel`,`users`.`Email` AS `Email`,`adresses`.`Numero_rue` AS `Numero_rue`,`adresses`.`Nom_rue` AS `Nom_rue`,`adresses`.`Code_postal` AS `Code_postal`,`adresses`.`Ville` AS `Ville` from (`users` join `adresses` on((`users`.`Adresse_ID` = `adresses`.`Id`))) ;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresses`
--
ALTER TABLE `adresses`
  ADD CONSTRAINT `User_adresse` FOREIGN KEY (`User_ID`) REFERENCES `users` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `Livreur` FOREIGN KEY (`Livreur_ID`) REFERENCES `livreurs` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Statut_commande` FOREIGN KEY (`Statut_commande_ID`) REFERENCES `statut_commandes` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `User` FOREIGN KEY (`User_ID`) REFERENCES `users` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Contraintes pour la table `livreurs`
--
ALTER TABLE `livreurs`
  ADD CONSTRAINT `Statut_livreur` FOREIGN KEY (`Statut_livreur_ID`) REFERENCES `statut_livreurs` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `User_livreur` FOREIGN KEY (`User_ID`) REFERENCES `users` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Contraintes pour la table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `commande` FOREIGN KEY (`Commande_ID`) REFERENCES `commandes` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `plat` FOREIGN KEY (`Plat_ID`) REFERENCES `plats` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Contraintes pour la table `plats`
--
ALTER TABLE `plats`
  ADD CONSTRAINT `Statut_plat` FOREIGN KEY (`Statut_plat_ID`) REFERENCES `statut_plats` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Type_plat` FOREIGN KEY (`Type_plat_ID`) REFERENCES `type_plats` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `Adresse` FOREIGN KEY (`Adresse_ID`) REFERENCES `adresses` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
