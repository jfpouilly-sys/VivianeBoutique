-- ==========================================================================
-- VIVIANE BOUTIQUE - Structure des catégories
-- Script d'installation pour PrestaShop 8.1.x
-- ==========================================================================
--
-- PREREQUIS : Ce script peut être utilisé de deux manières :
--   1. Sur une installation PrestaShop existante (les tables existent déjà)
--   2. En standalone (les tables seront créées automatiquement)
--
-- IMPORTANT : Adapter les valeurs suivantes selon votre installation :
--   - id_lang = 1 correspond généralement au français
--   - id_shop = 1 correspond à la boutique par défaut
--   - id_parent = 2 correspond à la catégorie "Accueil" par défaut
--   - Préfixe des tables : ps_ (modifiez si votre préfixe est différent)
--

-- =========================================
-- CREATION DES TABLES (si elles n'existent pas)
-- Schema compatible PrestaShop 8.1.x
-- =========================================

CREATE TABLE IF NOT EXISTS `ps_category` (
  `id_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(10) unsigned NOT NULL,
  `id_shop_default` int(10) unsigned NOT NULL DEFAULT '1',
  `level_depth` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nleft` int(10) unsigned NOT NULL DEFAULT '0',
  `nright` int(10) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `is_root_category` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_category`),
  KEY `category_parent` (`id_parent`),
  KEY `nleftrightactive` (`nleft`,`nright`,`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ps_category_lang` (
  `id_category` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text,
  `link_rewrite` varchar(128) NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id_category`,`id_shop`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ps_category_shop` (
  `id_category` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_category`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =========================================
-- Insertion de la catégorie racine et Accueil
-- (ignorées si elles existent déjà)
-- =========================================

INSERT IGNORE INTO ps_category (id_category, id_parent, id_shop_default, level_depth, nleft, nright, active, date_add, date_upd, position, is_root_category)
VALUES (1, 0, 1, 0, 0, 0, 1, NOW(), NOW(), 0, 1);

INSERT IGNORE INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (1, 1, 1, 'Racine', 'racine', 'Racine');

INSERT IGNORE INTO ps_category_shop (id_category, id_shop, position)
VALUES (1, 1, 0);

INSERT IGNORE INTO ps_category (id_category, id_parent, id_shop_default, level_depth, nleft, nright, active, date_add, date_upd, position, is_root_category)
VALUES (2, 1, 1, 1, 0, 0, 1, NOW(), NOW(), 0, 0);

INSERT IGNORE INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (2, 1, 1, 'Accueil', 'accueil', 'Accueil');

INSERT IGNORE INTO ps_category_shop (id_category, id_shop, position)
VALUES (2, 1, 0);

-- =========================================
-- CATEGORIE PRINCIPALE : LINGERIE
-- =========================================
INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position)
VALUES (2, 1, 2, 1, NOW(), NOW(), 0);
SET @lingerie_id = LAST_INSERT_ID();

INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title, meta_description)
VALUES (@lingerie_id, 1, 1, 'Lingerie', 'lingerie', 'Lingerie - Viviane Boutique',
        'Découvrez notre collection de lingerie : soutiens-gorge, culottes, ensembles et plus');

INSERT INTO ps_category_shop (id_category, id_shop, position)
VALUES (@lingerie_id, 1, 0);

-- Sous-catégories Lingerie : Soutiens-gorge
INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position)
VALUES (@lingerie_id, 1, 3, 1, NOW(), NOW(), 0);
SET @soutiens_gorge_id = LAST_INSERT_ID();

INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title, meta_description)
VALUES (@soutiens_gorge_id, 1, 1, 'Soutiens-gorge', 'soutiens-gorge', 'Soutiens-gorge - Viviane Boutique',
        'Soutiens-gorge avec armatures, sans armatures, push-up, bandeau et sport');

INSERT INTO ps_category_shop (id_category, id_shop, position)
VALUES (@soutiens_gorge_id, 1, 0);

-- Sous-sous-catégories Soutiens-gorge
INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@soutiens_gorge_id, 1, 4, 1, NOW(), NOW(), 0);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Avec armatures', 'avec-armatures', 'Soutiens-gorge avec armatures');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 0);

INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@soutiens_gorge_id, 1, 4, 1, NOW(), NOW(), 1);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Sans armatures', 'sans-armatures', 'Soutiens-gorge sans armatures');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 1);

INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@soutiens_gorge_id, 1, 4, 1, NOW(), NOW(), 2);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Push-up', 'push-up', 'Soutiens-gorge push-up');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 2);

INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@soutiens_gorge_id, 1, 4, 1, NOW(), NOW(), 3);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Bandeau', 'bandeau', 'Soutiens-gorge bandeau');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 3);

INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@soutiens_gorge_id, 1, 4, 1, NOW(), NOW(), 4);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Sport', 'soutiens-gorge-sport', 'Soutiens-gorge de sport');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 4);

-- Culottes
INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position)
VALUES (@lingerie_id, 1, 3, 1, NOW(), NOW(), 1);
SET @culottes_id = LAST_INSERT_ID();

INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title, meta_description)
VALUES (@culottes_id, 1, 1, 'Culottes', 'culottes', 'Culottes - Viviane Boutique',
        'Culottes taille haute, taille basse, tangas et strings');

INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@culottes_id, 1, 1);

-- Sous-catégories Culottes
INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@culottes_id, 1, 4, 1, NOW(), NOW(), 0);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Taille haute', 'culottes-taille-haute', 'Culottes taille haute');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 0);

INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@culottes_id, 1, 4, 1, NOW(), NOW(), 1);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Taille basse', 'culottes-taille-basse', 'Culottes taille basse');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 1);

INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@culottes_id, 1, 4, 1, NOW(), NOW(), 2);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Tangas', 'tangas', 'Tangas');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 2);

INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@culottes_id, 1, 4, 1, NOW(), NOW(), 3);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Strings', 'strings', 'Strings');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 3);

-- Ensembles
INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position)
VALUES (@lingerie_id, 1, 3, 1, NOW(), NOW(), 2);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Ensembles', 'ensembles-lingerie', 'Ensembles lingerie');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 2);

-- Nuisettes & Déshabillés
INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position)
VALUES (@lingerie_id, 1, 3, 1, NOW(), NOW(), 3);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Nuisettes & Déshabillés', 'nuisettes-deshabilles', 'Nuisettes et déshabillés');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 3);

-- Pyjamas
INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position)
VALUES (@lingerie_id, 1, 3, 1, NOW(), NOW(), 4);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Pyjamas', 'pyjamas', 'Pyjamas');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 4);

-- Sous-vêtements masculins
INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position)
VALUES (@lingerie_id, 1, 3, 1, NOW(), NOW(), 5);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Sous-vêtements masculins', 'sous-vetements-masculins', 'Sous-vêtements pour homme');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 5);

-- =========================================
-- CATEGORIE PRINCIPALE : PRET-A-PORTER
-- =========================================
INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position)
VALUES (2, 1, 2, 1, NOW(), NOW(), 1);
SET @pap_id = LAST_INSERT_ID();

INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title, meta_description)
VALUES (@pap_id, 1, 1, 'Prêt-à-porter', 'pret-a-porter', 'Prêt-à-porter - Viviane Boutique',
        'Collection prêt-à-porter femme et homme : robes, hauts, pantalons et plus');

INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@pap_id, 1, 1);

-- Femme
INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position)
VALUES (@pap_id, 1, 3, 1, NOW(), NOW(), 0);
SET @femme_id = LAST_INSERT_ID();

INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@femme_id, 1, 1, 'Femme', 'pret-a-porter-femme', 'Prêt-à-porter Femme');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@femme_id, 1, 0);

-- Sous-catégories Femme
INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@femme_id, 1, 4, 1, NOW(), NOW(), 0);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Robes', 'robes', 'Robes');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 0);

INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@femme_id, 1, 4, 1, NOW(), NOW(), 1);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Hauts & Chemisiers', 'hauts-chemisiers', 'Hauts et chemisiers');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 1);

INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@femme_id, 1, 4, 1, NOW(), NOW(), 2);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Pantalons', 'pantalons-femme', 'Pantalons femme');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 2);

INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@femme_id, 1, 4, 1, NOW(), NOW(), 3);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Jupes', 'jupes', 'Jupes');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 3);

INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@femme_id, 1, 4, 1, NOW(), NOW(), 4);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Vestes & Manteaux', 'vestes-manteaux', 'Vestes et manteaux');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 4);

-- Homme
INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position)
VALUES (@pap_id, 1, 3, 1, NOW(), NOW(), 1);
SET @homme_id = LAST_INSERT_ID();

INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@homme_id, 1, 1, 'Homme', 'pret-a-porter-homme', 'Prêt-à-porter Homme');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@homme_id, 1, 1);

-- Sous-catégories Homme
INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@homme_id, 1, 4, 1, NOW(), NOW(), 0);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Chemises', 'chemises-homme', 'Chemises homme');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 0);

INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@homme_id, 1, 4, 1, NOW(), NOW(), 1);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Pantalons', 'pantalons-homme', 'Pantalons homme');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 1);

INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@homme_id, 1, 4, 1, NOW(), NOW(), 2);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Pulls', 'pulls-homme', 'Pulls homme');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 2);

-- Accessoires
INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position)
VALUES (@pap_id, 1, 3, 1, NOW(), NOW(), 2);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Accessoires', 'accessoires-mode', 'Accessoires mode');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 2);

-- =========================================
-- CATEGORIE PRINCIPALE : LAINE & TRICOT
-- =========================================
INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position)
VALUES (2, 1, 2, 1, NOW(), NOW(), 2);
SET @laine_id = LAST_INSERT_ID();

INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title, meta_description)
VALUES (@laine_id, 1, 1, 'Laine & Tricot', 'laine-tricot', 'Laine & Tricot - Viviane Boutique',
        'Laine, aiguilles à tricoter, crochets, patrons et accessoires de tricot');

INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@laine_id, 1, 2);

-- Laine
INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position)
VALUES (@laine_id, 1, 3, 1, NOW(), NOW(), 0);
SET @laine_type_id = LAST_INSERT_ID();

INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@laine_type_id, 1, 1, 'Laine', 'laine', 'Pelotes de laine');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@laine_type_id, 1, 0);

-- Sous-catégories Laine
INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@laine_type_id, 1, 4, 1, NOW(), NOW(), 0);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Laine mérinos', 'laine-merinos', 'Laine mérinos');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 0);

INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@laine_type_id, 1, 4, 1, NOW(), NOW(), 1);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Laine alpaga', 'laine-alpaga', 'Laine alpaga');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 1);

INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@laine_type_id, 1, 4, 1, NOW(), NOW(), 2);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Coton', 'coton', 'Fil de coton');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 2);

INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@laine_type_id, 1, 4, 1, NOW(), NOW(), 3);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Acrylique', 'acrylique', 'Laine acrylique');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 3);

-- Aiguilles à tricoter
INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position)
VALUES (@laine_id, 1, 3, 1, NOW(), NOW(), 1);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Aiguilles à tricoter', 'aiguilles-tricoter', 'Aiguilles à tricoter');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 1);

-- Crochets
INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position)
VALUES (@laine_id, 1, 3, 1, NOW(), NOW(), 2);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Crochets', 'crochets', 'Crochets');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 2);

-- Patrons & Livres
INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position)
VALUES (@laine_id, 1, 3, 1, NOW(), NOW(), 3);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Patrons & Livres', 'patrons-livres', 'Patrons de tricot et livres');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 3);

-- Accessoires tricot
INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position)
VALUES (@laine_id, 1, 3, 1, NOW(), NOW(), 4);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Accessoires tricot', 'accessoires-tricot', 'Accessoires de tricot');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 4);

-- =========================================
-- CATEGORIE PRINCIPALE : MERCERIE
-- =========================================
INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position)
VALUES (2, 1, 2, 1, NOW(), NOW(), 3);
SET @mercerie_id = LAST_INSERT_ID();

INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title, meta_description)
VALUES (@mercerie_id, 1, 1, 'Mercerie', 'mercerie', 'Mercerie - Viviane Boutique',
        'Tout pour la couture : fils, boutons, fermetures éclair, rubans et accessoires');

INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@mercerie_id, 1, 3);

-- Sous-catégories Mercerie
INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@mercerie_id, 1, 3, 1, NOW(), NOW(), 0);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Fils à coudre', 'fils-a-coudre', 'Fils à coudre');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 0);

INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@mercerie_id, 1, 3, 1, NOW(), NOW(), 1);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Boutons', 'boutons', 'Boutons');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 1);

INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@mercerie_id, 1, 3, 1, NOW(), NOW(), 2);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Fermetures éclair', 'fermetures-eclair', 'Fermetures éclair');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 2);

INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@mercerie_id, 1, 3, 1, NOW(), NOW(), 3);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Rubans & Dentelles', 'rubans-dentelles', 'Rubans et dentelles');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 3);

INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@mercerie_id, 1, 3, 1, NOW(), NOW(), 4);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Élastiques', 'elastiques', 'Élastiques');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 4);

INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@mercerie_id, 1, 3, 1, NOW(), NOW(), 5);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Aiguilles & Épingles', 'aiguilles-epingles', 'Aiguilles et épingles de couture');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 5);

INSERT INTO ps_category (id_parent, id_shop_default, level_depth, active, date_add, date_upd, position) VALUES (@mercerie_id, 1, 3, 1, NOW(), NOW(), 6);
SET @cat_id = LAST_INSERT_ID();
INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@cat_id, 1, 1, 'Accessoires couture', 'accessoires-couture', 'Accessoires de couture');
INSERT INTO ps_category_shop (id_category, id_shop, position) VALUES (@cat_id, 1, 6);
