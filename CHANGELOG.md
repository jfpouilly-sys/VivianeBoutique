# Journal des modifications - Viviane Boutique

Toutes les modifications notables de ce projet seront documentées dans ce fichier.

Le format est basé sur [Keep a Changelog](https://keepachangelog.com/fr/1.0.0/).

---

## [Version 0] - 2026-02-07

### Description
Version initiale du projet Viviane Boutique. Mise en place de la structure complète
du thème PrestaShop personnalisé, du module custom et de tous les fichiers de configuration.

### Ajouté

#### Thème "viviane-theme"
- **config/theme.yml** : Configuration du thème avec hooks, paramètres d'affichage et compatibilité PrestaShop 8.x
- **assets/css/variables.scss** : Variables SCSS (palette de couleurs, typographie, espacements, breakpoints)
- **assets/css/custom.css** : Feuille de styles complète avec :
  - Palette de couleurs : Rose (#D4366B), Bleu marine (#2C3E50), Beige (#E8B298), Violet (#8E44AD)
  - Typographie : Montserrat (corps) et Playfair Display (titres)
  - Styles catégories spécifiques (Lingerie, Prêt-à-porter, Laine, Mercerie)
  - Cartes produits avec animations au survol
  - Design responsive (mobile, tablette, desktop)
  - Composants : header, navigation, footer, boutons, badges, prix, filtres, panier
  - Animations CSS (fadeIn, slideInLeft)
- **assets/js/custom.js** : JavaScript personnalisé avec :
  - Navigation mobile (menu hamburger)
  - Galerie d'images produit interactive
  - Contrôle de quantité (+/-)
  - Animations au défilement (IntersectionObserver)
  - Bouton "retour en haut de page"

#### Templates Smarty
- **templates/layout/layout.tpl** : Layout principal avec colonnes gauche/droite
- **templates/page.tpl** : Template de page générique
- **templates/_partials/head.tpl** : En-tête HTML avec Google Fonts et Material Icons
- **templates/_partials/header.tpl** : Header avec bannière, navigation et menu principal (4 catégories)
- **templates/_partials/footer.tpl** : Footer avec 4 colonnes (À propos, Rayons, Informations, Newsletter)
- **templates/_partials/breadcrumb.tpl** : Fil d'Ariane avec données structurées Schema.org
- **templates/_partials/notifications.tpl** : Système de notifications (erreur, avertissement, succès, info)
- **templates/_partials/javascript.tpl** : Inclusion des scripts JavaScript
- **templates/_partials/stylesheets.tpl** : Inclusion des feuilles de styles
- **templates/catalog/product.tpl** : Page produit complète avec images, prix, variantes, panier, onglets
- **templates/catalog/_partials/product-images.tpl** : Galerie d'images produit avec miniatures
- **templates/catalog/_partials/product-prices.tpl** : Affichage des prix (remises, HT, prix unitaire)
- **templates/catalog/_partials/product-variants.tpl** : Sélecteur de variantes (taille, couleur, radio)
- **templates/catalog/_partials/product-add-to-cart.tpl** : Formulaire d'ajout au panier avec quantité
- **templates/catalog/_partials/product-additional-info.tpl** : Informations complémentaires (livraison, retours, paiement)
- **templates/catalog/_partials/product-tabs.tpl** : Onglets (Description, Caractéristiques, Livraison)
- **templates/catalog/_partials/product-activation.tpl** : Avertissement produit désactivé
- **templates/catalog/_partials/miniatures/product.tpl** : Miniature produit pour les listes

#### Module "vivianecustom" (v1.0.0)
- **vivianecustom.php** : Module principal avec :
  - Hooks : displayHeader, displayProductAdditionalInfo, displayFooter
  - Guide des tailles pour produits lingerie
  - Page de configuration back-office (activer/désactiver le guide des tailles)
  - Détection automatique des produits lingerie
- **views/templates/hook/size-guide.tpl** : Template du guide des tailles avec :
  - Tableau complet des tailles FR (80A à 100C)
  - Instructions de mesure (tour de poitrine, tour de dos, bonnet)
  - Correspondance des bonnets (A à E)
- **views/templates/hook/paypal-button.tpl** : Template du bouton PayPal personnalisé

#### Configuration
- **config/paypal-config.php** : Configuration PayPal (sandbox/live, devise EUR, locale fr_FR)
- **config/localization-fr.php** : Localisation française (langue, devise, pays, fuseau horaire, RGPD, SEO)

#### Scripts d'installation
- **install/categories-structure.sql** : Script SQL complet pour créer l'arborescence des catégories :
  - Lingerie (6 sous-catégories, sous-sous-catégories pour soutiens-gorge et culottes)
  - Prêt-à-porter (Femme avec 5 sous-catégories, Homme avec 3, Accessoires)
  - Laine & Tricot (Laine avec 4 types, Aiguilles, Crochets, Patrons, Accessoires)
  - Mercerie (7 sous-catégories)
- **install/create-attributes.php** : Script PHP pour créer les groupes d'attributs :
  - Taille Lingerie (15 valeurs : 80A-100C)
  - Taille Vêtement (6 valeurs : XS-XXL)
  - Taille FR (7 valeurs : 34-46)
  - Couleur (17 valeurs avec codes hexadécimaux)
  - Poids pelote (4 valeurs)
  - Composition laine (7 valeurs)
  - Épaisseur fil (7 valeurs : Lace à Super Bulky)
  - Type de bonnet (4 valeurs)

#### Traductions
- **translations/fr/custom-translations.php** : Traductions françaises personnalisées (35+ entrées)

#### Documentation
- **claude-code-instructions-viviane-boutique.md** : Cahier des charges technique complet
- **windows11-prestashop-setup-guide.md** : Guide d'installation Windows 11 / XAMPP
- **CHANGELOG.md** : Ce fichier de suivi des modifications

### Corrigé

#### Script SQL catégories (`install/categories-structure.sql`)
- Ajout des instructions `CREATE TABLE IF NOT EXISTS` pour les 3 tables (ps_category, ps_category_lang, ps_category_shop)
- Ajout des colonnes manquantes dans les INSERT : `id_shop_default`, `date_add`, `date_upd`
- Ajout de `INSERT IGNORE` pour les catégories de base (Root id=1, Accueil id=2)
- Script rendu **idempotent** : nettoyage automatique avant insertion pour éviter les doublons
- Ajout de requêtes de vérification en fin de script (`SELECT COUNT(*)` et liste des catégories)

### Notes techniques
- Compatible PrestaShop 8.0.0+
- Design responsive (mobile-first)
- Conforme RGPD (opt-in obligatoire)
- Optimisé SEO (URLs amicales, données structurées Schema.org)
- Intégration PayPal prête (mode sandbox)
- Tout le contenu est en français
