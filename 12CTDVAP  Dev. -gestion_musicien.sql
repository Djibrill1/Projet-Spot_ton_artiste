-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 19 mai 2022 à 09:36
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_musicien`
--

-- --------------------------------------------------------

--
-- Structure de la table `album`
--

DROP TABLE IF EXISTS `album`;
CREATE TABLE IF NOT EXISTS `album` (
  `id_album` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(250) DEFAULT NULL,
  `genre` varchar(250) DEFAULT NULL,
  `date_sortie` date DEFAULT NULL,
  `id_label` int(11) NOT NULL,
  PRIMARY KEY (`id_album`),
  KEY `id_label` (`id_label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `album_musique`
--

DROP TABLE IF EXISTS `album_musique`;
CREATE TABLE IF NOT EXISTS `album_musique` (
  `id_album` int(11) NOT NULL,
  `id_musique` int(11) NOT NULL,
  KEY `id_album` (`id_album`),
  KEY `id_musique` (`id_musique`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `artiste`
--

DROP TABLE IF EXISTS `artiste`;
CREATE TABLE IF NOT EXISTS `artiste` (
  `id_artiste` int(11) NOT NULL AUTO_INCREMENT,
  `nom_artiste` varchar(250) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `id_label` int(11) NOT NULL,
  PRIMARY KEY (`id_artiste`),
  KEY `id_label` (`id_label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `artiste_album`
--

DROP TABLE IF EXISTS `artiste_album`;
CREATE TABLE IF NOT EXISTS `artiste_album` (
  `id_artiste` int(11) NOT NULL,
  `id_album` int(11) NOT NULL,
  KEY `id_artiste` (`id_artiste`),
  KEY `id_album` (`id_album`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `concert`
--

DROP TABLE IF EXISTS `concert`;
CREATE TABLE IF NOT EXISTS `concert` (
  `id_concert` int(11) NOT NULL AUTO_INCREMENT,
  `lieu` varchar(250) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `prix` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_concert`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `concert_artiste`
--

DROP TABLE IF EXISTS `concert_artiste`;
CREATE TABLE IF NOT EXISTS `concert_artiste` (
  `id_concert` int(11) NOT NULL,
  `id_artiste` int(11) NOT NULL,
  KEY `id_concert` (`id_concert`),
  KEY `id_artiste` (`id_artiste`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `label`
--

DROP TABLE IF EXISTS `label`;
CREATE TABLE IF NOT EXISTS `label` (
  `id_label` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(250) DEFAULT NULL,
  `ville` varchar(250) DEFAULT NULL,
  `adresse` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `musique`
--

DROP TABLE IF EXISTS `musique`;
CREATE TABLE IF NOT EXISTS `musique` (
  `id_musique` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(250) DEFAULT NULL,
  `genre` varchar(250) DEFAULT NULL,
  `duree` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_musique`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`id_label`) REFERENCES `label` (`id_label`);

--
-- Contraintes pour la table `album_musique`
--
ALTER TABLE `album_musique`
  ADD CONSTRAINT `album_musique_ibfk_1` FOREIGN KEY (`id_album`) REFERENCES `album` (`id_album`),
  ADD CONSTRAINT `album_musique_ibfk_2` FOREIGN KEY (`id_musique`) REFERENCES `musique` (`id_musique`);

--
-- Contraintes pour la table `artiste`
--
ALTER TABLE `artiste`
  ADD CONSTRAINT `artiste_ibfk_1` FOREIGN KEY (`id_label`) REFERENCES `label` (`id_label`);

--
-- Contraintes pour la table `artiste_album`
--
ALTER TABLE `artiste_album`
  ADD CONSTRAINT `artiste_album_ibfk_1` FOREIGN KEY (`id_artiste`) REFERENCES `artiste` (`id_artiste`),
  ADD CONSTRAINT `artiste_album_ibfk_2` FOREIGN KEY (`id_album`) REFERENCES `album` (`id_album`);

--
-- Contraintes pour la table `concert_artiste`
--
ALTER TABLE `concert_artiste`
  ADD CONSTRAINT `concert_artiste_ibfk_1` FOREIGN KEY (`id_concert`) REFERENCES `concert` (`id_concert`),
  ADD CONSTRAINT `concert_artiste_ibfk_2` FOREIGN KEY (`id_artiste`) REFERENCES `artiste` (`id_artiste`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
