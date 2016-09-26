-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 23 Septembre 2016 à 15:09
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `bdd_kaemo_films`
--

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

CREATE TABLE IF NOT EXISTS `film` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_sortie` date NOT NULL,
  `nom_realisateur` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `duree` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Contenu de la table `film`
--

INSERT INTO `film` (`id`, `titre`, `date_sortie`, `nom_realisateur`, `duree`, `position`) VALUES
(1, 'Harry Potter et la Coupe de Feu', '2005-11-23', 'Mike Newell', 157, 1),
(2, 'La Fée Clochette', '2008-11-05', 'Bradley Raymond', 89, 2),
(3, 'La Reine des Neiges', '2013-12-04', 'Chris Buck', 102, 3),
(4, 'Le Seigneur des Anneaux : Le Retour du Roi', '2003-12-01', 'Peter Jackson', 201, 4),
(5, 'Le Seigneur des Anneaux : Les Deux Tours', '2002-12-05', 'Peter Jackson', 179, 5),
(6, 'Les 4 Fantastiques et le Surfer d''Argent', '2007-08-08', 'Tim Story', 92, 6),
(7, 'Matrix Reloaded', '2003-05-16', 'Les Wachowski', 132, 7),
(8, 'Star Wars épisode III : La Revanche des Sith', '2005-05-18', 'George Lucas', 140, 8);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
