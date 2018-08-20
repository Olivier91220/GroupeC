-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  Dim 12 août 2018 à 18:45
-- Version du serveur :  10.1.33-MariaDB
-- Version de PHP :  7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `loconto3`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `id_sousFamille` int(11) NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(50) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `id_sousFamille`, `nom`, `description`) VALUES
(1, 1, 'toshiba', '13.3 pouces core i7 128go ssd');

-- --------------------------------------------------------

--
-- Structure de la table `associer`
--

CREATE TABLE `associer` (
  `client_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `associer`
--

INSERT INTO `associer` (`client_id`, `site_id`) VALUES
(1, 1),
(1, 2),
(2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `authentifier`
--

CREATE TABLE `authentifier` (
  `id` int(11) NOT NULL,
  `intervenant_id` int(11) NOT NULL,
  `login` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `authentifier`
--

INSERT INTO `authentifier` (`id`, `intervenant_id`, `login`, `password`) VALUES
(1, 1, 'vaillant75', 'toto'),
(3, 2, 'bobr56', 'lulu'),
(4, 3, 'lastier67', '@@hubert');

-- --------------------------------------------------------

--
-- Structure de la table `batiment`
--

CREATE TABLE `batiment` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `num_bat` int(11) NOT NULL,
  `nom_bat` varchar(50) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `batiment`
--

INSERT INTO `batiment` (`id`, `site_id`, `num_bat`, `nom_bat`) VALUES
(1, 2, 12, 'méridien');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `prenom` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `adresse` varchar(150) COLLATE utf8mb4_bin NOT NULL,
  `code_postal` int(5) NOT NULL,
  `ville` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `tel` int(14) NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `prenom`, `adresse`, `code_postal`, `ville`, `tel`, `email`) VALUES
(1, 'Judor', 'alain', '15 rue de la concorde', 75000, 'Paris', 673829756, 'aj@gmail.com'),
(2, 'Tillet', 'Henri', '2 rue de la liberté', 35000, 'Rennes', 673467625, 'ht@yahoo.fr');

-- --------------------------------------------------------

--
-- Structure de la table `dependre`
--

CREATE TABLE `dependre` (
  `groupe_id` int(11) NOT NULL,
  `intervenant_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `dependre`
--

INSERT INTO `dependre` (`groupe_id`, `intervenant_id`) VALUES
(1, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `etage`
--

CREATE TABLE `etage` (
  `id` int(11) NOT NULL,
  `batiment_id` int(11) NOT NULL,
  `num_etage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `etage`
--

INSERT INTO `etage` (`id`, `batiment_id`, `num_etage`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `famille`
--

CREATE TABLE `famille` (
  `id` int(11) NOT NULL,
  `nom` varchar(40) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `famille`
--

INSERT INTO `famille` (`id`, `nom`) VALUES
(1, 'ordinateur'),
(2, 'écran');

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE `groupe` (
  `id` int(11) NOT NULL,
  `nom_groupe` varchar(30) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`id`, `nom_groupe`) VALUES
(1, 'region ile de france'),
(2, 'region Haut de France'),
(3, 'region bretagne');

-- --------------------------------------------------------

--
-- Structure de la table `intervenant`
--

CREATE TABLE `intervenant` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `poste` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `tel` varchar(14) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(70) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `intervenant`
--

INSERT INTO `intervenant` (`id`, `nom`, `prenom`, `poste`, `tel`, `email`) VALUES
(1, 'vaillant', 'michel', 'administrateur du site', '0652415487', 'mv@gmail.com'),
(2, 'Roppert', 'Bob', 'agent de maintenance', '0674389625', 'br@gmail.com'),
(3, 'Astier', 'laurent', 'agent de maintenance', '0675349867', 'la@orange.fr');

-- --------------------------------------------------------

--
-- Structure de la table `intervention`
--

CREATE TABLE `intervention` (
  `id` int(11) NOT NULL,
  `materiel_id` int(11) NOT NULL,
  `intervenant_id` int(11) NOT NULL,
  `date_planification` date NOT NULL,
  `type_intervention` varchar(10) COLLATE utf8mb4_bin NOT NULL DEFAULT 'curative',
  `date_realisation` date DEFAULT NULL,
  `statut` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT 'affecté',
  `commentaire_client` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `observation_agent` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `intervention`
--

INSERT INTO `intervention` (`id`, `materiel_id`, `intervenant_id`, `date_planification`, `type_intervention`, `date_realisation`, `statut`, `commentaire_client`, `observation_agent`) VALUES
(2, 1, 2, '2018-08-15', 'curative', NULL, 'affecté', '', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `materiel`
--

CREATE TABLE `materiel` (
  `id` int(11) NOT NULL,
  `salle_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `num_serie` varchar(30) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `materiel`
--

INSERT INTO `materiel` (`id`, `salle_id`, `article_id`, `client_id`, `num_serie`) VALUES
(1, 1, 1, 2, '5c065120dh'),
(3, 1, 1, 2, '5c065121dh');

-- --------------------------------------------------------

--
-- Structure de la table `rapport`
--

CREATE TABLE `rapport` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `materiel_id` int(11) NOT NULL,
  `observation` varchar(100) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE `salle` (
  `id` int(11) NOT NULL,
  `etage_id` int(11) NOT NULL,
  `num_salle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`id`, `etage_id`, `num_salle`) VALUES
(1, 1, 11),
(2, 2, 23);

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

CREATE TABLE `site` (
  `id` int(11) NOT NULL,
  `nom_site` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `adresse` varchar(150) COLLATE utf8mb4_bin NOT NULL,
  `code_postal` int(5) NOT NULL,
  `ville` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `nom_responsable` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `tel_responsable` int(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `site`
--

INSERT INTO `site` (`id`, `nom_site`, `adresse`, `code_postal`, `ville`, `nom_responsable`, `tel_responsable`) VALUES
(1, 'ZAC Aubrais', '2 rue pierre lacty', 37000, 'Tours', 'Pierrard', 675670978),
(2, 'ZAC croix blanche', '2 rue de Fleury', 91540, 'Fleury', 'Poiry', 786798645);

-- --------------------------------------------------------

--
-- Structure de la table `sous_famille_article`
--

CREATE TABLE `sous_famille_article` (
  `id` int(11) NOT NULL,
  `famille_id` int(11) NOT NULL,
  `nom` varchar(40) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `sous_famille_article`
--

INSERT INTO `sous_famille_article` (`id`, `famille_id`, `nom`) VALUES
(1, 1, 'laptop'),
(2, 2, 'tv 32 pouces');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_sousFamilleArticle` (`id_sousFamille`);

--
-- Index pour la table `associer`
--
ALTER TABLE `associer`
  ADD PRIMARY KEY (`client_id`,`site_id`),
  ADD KEY `associer_site` (`site_id`);

--
-- Index pour la table `authentifier`
--
ALTER TABLE `authentifier`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `intervenant_id` (`intervenant_id`);

--
-- Index pour la table `batiment`
--
ALTER TABLE `batiment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `batiment_site` (`site_id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `dependre`
--
ALTER TABLE `dependre`
  ADD PRIMARY KEY (`groupe_id`,`intervenant_id`),
  ADD KEY `dependre_intervenant` (`intervenant_id`);

--
-- Index pour la table `etage`
--
ALTER TABLE `etage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `etage_batiment` (`batiment_id`);

--
-- Index pour la table `famille`
--
ALTER TABLE `famille`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `intervenant`
--
ALTER TABLE `intervenant`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `intervention`
--
ALTER TABLE `intervention`
  ADD PRIMARY KEY (`id`),
  ADD KEY `intervention_intervenant` (`intervenant_id`),
  ADD KEY `intervention_materiel` (`materiel_id`);

--
-- Index pour la table `materiel`
--
ALTER TABLE `materiel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `num_serie` (`num_serie`),
  ADD KEY `fk_materiel_salle` (`salle_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Index pour la table `rapport`
--
ALTER TABLE `rapport`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rapport_materiel` (`materiel_id`);

--
-- Index pour la table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salle_etage` (`etage_id`);

--
-- Index pour la table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sous_famille_article`
--
ALTER TABLE `sous_famille_article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sousFamilleArticle_famille` (`famille_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `authentifier`
--
ALTER TABLE `authentifier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `batiment`
--
ALTER TABLE `batiment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `etage`
--
ALTER TABLE `etage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `famille`
--
ALTER TABLE `famille`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `groupe`
--
ALTER TABLE `groupe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `intervenant`
--
ALTER TABLE `intervenant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `intervention`
--
ALTER TABLE `intervention`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `materiel`
--
ALTER TABLE `materiel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `rapport`
--
ALTER TABLE `rapport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `salle`
--
ALTER TABLE `salle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `sous_famille_article`
--
ALTER TABLE `sous_famille_article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_sousFamilleArticle` FOREIGN KEY (`id_sousFamille`) REFERENCES `sous_famille_article` (`id`);

--
-- Contraintes pour la table `associer`
--
ALTER TABLE `associer`
  ADD CONSTRAINT `associer_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `associer_site` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Contraintes pour la table `authentifier`
--
ALTER TABLE `authentifier`
  ADD CONSTRAINT `authentifier_intervenant` FOREIGN KEY (`intervenant_id`) REFERENCES `intervenant` (`id`);

--
-- Contraintes pour la table `batiment`
--
ALTER TABLE `batiment`
  ADD CONSTRAINT `batiment_site` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Contraintes pour la table `dependre`
--
ALTER TABLE `dependre`
  ADD CONSTRAINT `dependre_groupe` FOREIGN KEY (`groupe_id`) REFERENCES `groupe` (`id`),
  ADD CONSTRAINT `dependre_intervenant` FOREIGN KEY (`intervenant_id`) REFERENCES `intervenant` (`id`);

--
-- Contraintes pour la table `etage`
--
ALTER TABLE `etage`
  ADD CONSTRAINT `etage_batiment` FOREIGN KEY (`batiment_id`) REFERENCES `batiment` (`id`);

--
-- Contraintes pour la table `intervention`
--
ALTER TABLE `intervention`
  ADD CONSTRAINT `intervention_intervenant` FOREIGN KEY (`intervenant_id`) REFERENCES `intervenant` (`id`),
  ADD CONSTRAINT `intervention_materiel` FOREIGN KEY (`materiel_id`) REFERENCES `materiel` (`id`);

--
-- Contraintes pour la table `materiel`
--
ALTER TABLE `materiel`
  ADD CONSTRAINT `fk_materiel_salle` FOREIGN KEY (`salle_id`) REFERENCES `salle` (`id`),
  ADD CONSTRAINT `materiel_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `materiel_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`);

--
-- Contraintes pour la table `rapport`
--
ALTER TABLE `rapport`
  ADD CONSTRAINT `rapport_materiel` FOREIGN KEY (`materiel_id`) REFERENCES `materiel` (`id`);

--
-- Contraintes pour la table `salle`
--
ALTER TABLE `salle`
  ADD CONSTRAINT `salle_etage` FOREIGN KEY (`etage_id`) REFERENCES `etage` (`id`);

--
-- Contraintes pour la table `sous_famille_article`
--
ALTER TABLE `sous_famille_article`
  ADD CONSTRAINT `sousFamilleArticle_famille` FOREIGN KEY (`famille_id`) REFERENCES `famille` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
