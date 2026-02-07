# Manuel d'Installation - Viviane Boutique
## Guide complet d'installation et de configuration

**Version** : 0
**Date** : 07 février 2026
**Plateforme** : PrestaShop 8.1.x
**Langue** : Français (France)

---

## Table des matières

1. [Présentation du projet](#1-présentation-du-projet)
2. [Prérequis techniques](#2-prérequis-techniques)
3. [Installation de l'environnement serveur (XAMPP)](#3-installation-de-lenvironnement-serveur-xampp)
4. [Création de la base de données](#4-création-de-la-base-de-données)
5. [Installation de PrestaShop](#5-installation-de-prestashop)
6. [Sécurisation post-installation](#6-sécurisation-post-installation)
7. [Installation du thème Viviane](#7-installation-du-thème-viviane)
8. [Installation du module vivianecustom](#8-installation-du-module-vivianecustom)
9. [Configuration de la localisation française](#9-configuration-de-la-localisation-française)
10. [Création des catégories](#10-création-des-catégories)
11. [Création des attributs produits](#11-création-des-attributs-produits)
12. [Configuration de PayPal](#12-configuration-de-paypal)
13. [Installation des traductions](#13-installation-des-traductions)
14. [Configuration SEO](#14-configuration-seo)
15. [Vérification de l'installation](#15-vérification-de-linstallation)
16. [Dépannage](#16-dépannage)
17. [Maintenance et sauvegardes](#17-maintenance-et-sauvegardes)
18. [Structure des fichiers du projet](#18-structure-des-fichiers-du-projet)

---

## 1. Présentation du projet

**Viviane Boutique** est un site e-commerce spécialisé dans 4 domaines :

| Rayon | Description | Couleur associée |
|-------|-------------|-----------------|
| Lingerie | Soutiens-gorge, culottes, ensembles, nuisettes, pyjamas | Rose #D4366B |
| Prêt-à-porter | Vêtements femme et homme, accessoires | Bleu marine #2C3E50 |
| Laine & Tricot | Pelotes, aiguilles, crochets, patrons | Violet #8E44AD |
| Mercerie | Fils, boutons, fermetures, rubans, accessoires couture | Beige #E8B298 |

**Caractéristiques techniques** :
- Plateforme : PrestaShop 8.1.x
- Thème personnalisé : `viviane-theme`
- Module personnalisé : `vivianecustom` (guide des tailles lingerie)
- Paiement : PayPal (sandbox puis production)
- Devise : EUR
- Marché cible : France métropolitaine

---

## 2. Prérequis techniques

### Configuration minimale requise

| Composant | Version requise |
|-----------|----------------|
| Système d'exploitation | Windows 10/11, macOS ou Linux |
| PHP | 8.1 ou 8.2 |
| MySQL | 5.6+ ou MariaDB 10.x |
| Serveur web | Apache 2.4+ avec mod_rewrite |
| Espace disque | 2 Go minimum |
| RAM | 2 Go minimum (4 Go recommandé) |

### Extensions PHP requises

Les extensions suivantes doivent être activées dans `php.ini` :

```
extension=gd
extension=curl
extension=mbstring
extension=zip
extension=intl
extension=pdo_mysql
extension=openssl
extension=fileinfo
extension=xml
```

### Logiciels nécessaires

- **XAMPP** (recommandé pour Windows) : https://www.apachefriends.org/
- **Git** : pour récupérer le projet depuis le dépôt
- **Un éditeur de texte** : Notepad++, VS Code, ou similaire
- **Un navigateur web moderne** : Chrome, Firefox, Edge

---

## 3. Installation de l'environnement serveur (XAMPP)

### 3.1 Téléchargement

1. Rendez-vous sur https://www.apachefriends.org/
2. Téléchargez XAMPP pour votre système (version PHP 8.1 ou 8.2)
3. Taille approximative : 150 Mo

### 3.2 Installation

1. Exécutez le fichier d'installation téléchargé
2. Si l'antivirus ou le pare-feu affiche un avertissement, autorisez l'installation
3. **Composants à installer** :
   - [x] Apache
   - [x] MySQL
   - [x] PHP
   - [x] phpMyAdmin
   - [ ] Perl (non nécessaire)
   - [ ] Tomcat (non nécessaire)
4. Dossier d'installation recommandé : `C:\xampp`
5. Terminez l'installation

### 3.3 Configuration de PHP

Ouvrez le fichier `C:\xampp\php\php.ini` et modifiez les valeurs suivantes :

```ini
; Limites de mémoire et d'exécution
memory_limit = 256M
upload_max_filesize = 20M
post_max_size = 20M
max_execution_time = 300

; Extensions à activer (retirer le ; devant chaque ligne)
extension=gd
extension=curl
extension=mbstring
extension=zip
extension=intl
extension=pdo_mysql
```

**Sauvegardez le fichier** puis redémarrez Apache.

### 3.4 Démarrage des services

1. Ouvrez le **XAMPP Control Panel**
2. Cliquez sur **Start** pour **Apache**
3. Cliquez sur **Start** pour **MySQL**
4. Les deux services doivent afficher un fond vert avec « Running »

### 3.5 Vérification

Ouvrez votre navigateur et accédez à `http://localhost`. La page d'accueil XAMPP doit s'afficher.

---

## 4. Création de la base de données

### 4.1 Accéder à phpMyAdmin

Ouvrez votre navigateur et allez sur : `http://localhost/phpmyadmin`

### 4.2 Créer la base de données

1. Cliquez sur **« Nouvelle base de données »** (colonne de gauche)
2. Nom de la base : **`viviane_boutique`**
3. Interclassement : **`utf8mb4_general_ci`**
4. Cliquez sur **« Créer »**

### 4.3 Créer un utilisateur dédié (recommandé)

Pour des raisons de sécurité, créez un utilisateur spécifique :

1. Allez dans l'onglet **« Comptes utilisateurs »**
2. Cliquez sur **« Ajouter un compte d'utilisateur »**
3. Remplissez les informations :

| Champ | Valeur |
|-------|--------|
| Nom d'utilisateur | `prestashop_user` |
| Nom d'hôte | `localhost` |
| Mot de passe | *(choisissez un mot de passe fort)* |

4. Cochez **« Tout cocher »** dans la section « Privilèges globaux »
5. Cliquez sur **« Exécuter »**

> **IMPORTANT** : Notez précieusement ces identifiants. Vous en aurez besoin à l'étape 5.

---

## 5. Installation de PrestaShop

### 5.1 Téléchargement

**Option A : Site officiel (recommandé)**
1. Allez sur https://www.prestashop.com/fr/telecharger
2. Téléchargez PrestaShop 8.1.x (dernière version stable)

**Option B : Via Git**
```bash
git clone https://github.com/PrestaShop/PrestaShop.git
```

### 5.2 Installation des fichiers

1. Décompressez le fichier ZIP téléchargé
2. Renommez le dossier en **`viviane-boutique`**
3. Déplacez-le dans `C:\xampp\htdocs\`

Le chemin final doit être : **`C:\xampp\htdocs\viviane-boutique\`**

### 5.3 Permissions des dossiers

Sous Windows, faites un clic droit sur le dossier `viviane-boutique` :
- Propriétés > Sécurité > Modifier
- L'utilisateur « Utilisateurs » doit avoir les droits en lecture, écriture et exécution

Sous Linux/macOS :
```bash
chmod -R 755 viviane-boutique/
chmod -R 777 viviane-boutique/var/
chmod -R 777 viviane-boutique/cache/
chmod -R 777 viviane-boutique/img/
chmod -R 777 viviane-boutique/upload/
chmod -R 777 viviane-boutique/download/
chmod -R 777 viviane-boutique/config/
```

### 5.4 Lancement de l'assistant d'installation

1. Ouvrez votre navigateur
2. Allez sur : **`http://localhost/viviane-boutique/`**
3. L'assistant d'installation se lance automatiquement

### 5.5 Paramètres à renseigner

#### Langue et pays
| Paramètre | Valeur |
|-----------|--------|
| Langue d'installation | **Français** |
| Pays | **France** |

#### Informations de la boutique
| Paramètre | Valeur |
|-----------|--------|
| Nom de la boutique | **Viviane Boutique** |
| Activité principale | **Mode et accessoires** |
| Prénom | *(votre prénom)* |
| Nom | *(votre nom)* |
| Adresse email | *(votre email d'administration)* |
| Mot de passe | *(mot de passe fort, notez-le !)* |

#### Base de données
| Paramètre | Valeur |
|-----------|--------|
| Adresse du serveur | **localhost** |
| Nom de la base | **viviane_boutique** |
| Identifiant | **prestashop_user** (ou `root`) |
| Mot de passe | *(celui défini à l'étape 4.3)* |
| Préfixe des tables | **ps_** |

#### Contenu de démonstration
- Cochez **« Installer les données de démonstration »** si vous souhaitez des exemples
- Ces données pourront être supprimées ensuite

5. Cliquez sur **« Installer maintenant »**
6. Patientez 5 à 10 minutes

---

## 6. Sécurisation post-installation

### 6.1 Supprimer le dossier d'installation

**OBLIGATOIRE** : Après l'installation réussie, supprimez le dossier `install` :

```
C:\xampp\htdocs\viviane-boutique\install\  ← SUPPRIMER CE DOSSIER
```

> PrestaShop refusera de fonctionner tant que ce dossier existe.

### 6.2 Renommer le dossier d'administration

Pour des raisons de sécurité, renommez le dossier `admin` :

```
C:\xampp\htdocs\viviane-boutique\adminXXXXXX\  ← Renommer en :
C:\xampp\htdocs\viviane-boutique\admin-vb2024\
```

> **Notez ce nouveau nom**. C'est l'URL de votre back-office.

### 6.3 Vérification des accès

| Interface | URL |
|-----------|-----|
| Front-office (boutique) | `http://localhost/viviane-boutique/` |
| Back-office (administration) | `http://localhost/viviane-boutique/admin-vb2024/` |

Connectez-vous au back-office avec l'email et le mot de passe définis à l'étape 5.5.

---

## 7. Installation du thème Viviane

### 7.1 Récupérer les fichiers du projet

Clonez le dépôt du projet dans un dossier temporaire :

```bash
git clone https://github.com/jfpouilly-sys/VivianeBoutique.git /tmp/viviane-projet
```

Ou bien, si vous avez déjà le dépôt, assurez-vous d'être sur la bonne branche :

```bash
cd /chemin/vers/VivianeBoutique
git checkout claude/implement-viviane-boutique-HCPjI
```

### 7.2 Copier le thème

Copiez le dossier du thème dans votre installation PrestaShop :

```bash
cp -r themes/viviane-theme/ C:\xampp\htdocs\viviane-boutique\themes\viviane-theme\
```

Sous Windows (Explorateur de fichiers) :
1. Copiez le dossier `themes\viviane-theme\` du projet
2. Collez-le dans `C:\xampp\htdocs\viviane-boutique\themes\`

### 7.3 Structure du thème installé

Vérifiez que la structure suivante est bien en place :

```
themes/viviane-theme/
├── config/
│   └── theme.yml                    ← Configuration du thème
├── assets/
│   ├── css/
│   │   ├── custom.css               ← Styles personnalisés
│   │   └── variables.scss           ← Variables SCSS
│   └── js/
│       └── custom.js                ← JavaScript personnalisé
└── templates/
    ├── layout/
    │   └── layout.tpl               ← Layout principal
    ├── page.tpl                     ← Template de page générique
    ├── _partials/
    │   ├── head.tpl                 ← En-tête HTML (fonts, meta)
    │   ├── header.tpl               ← Header et navigation
    │   ├── footer.tpl               ← Pied de page
    │   ├── breadcrumb.tpl           ← Fil d'Ariane
    │   ├── notifications.tpl        ← Messages d'alerte
    │   ├── javascript.tpl           ← Scripts JS
    │   └── stylesheets.tpl          ← Feuilles de styles
    └── catalog/
        ├── product.tpl              ← Page produit
        └── _partials/
            ├── product-images.tpl
            ├── product-prices.tpl
            ├── product-variants.tpl
            ├── product-add-to-cart.tpl
            ├── product-additional-info.tpl
            ├── product-tabs.tpl
            ├── product-activation.tpl
            └── miniatures/
                └── product.tpl      ← Miniature produit
```

### 7.4 Activer le thème

1. Connectez-vous au **back-office** de PrestaShop
2. Allez dans **Design > Thème et logo**
3. Le thème « Viviane Boutique » doit apparaître dans la liste
4. Cliquez sur **« Utiliser ce thème »**
5. Confirmez l'activation

### 7.5 Informations sur le thème

| Caractéristique | Détail |
|----------------|--------|
| Police des titres | Playfair Display (chargée via Google Fonts) |
| Police du corps | Montserrat (chargée via Google Fonts) |
| Icônes | Material Icons (Google Fonts) |
| Design responsive | Oui (mobile, tablette, desktop) |
| Animations | fadeIn au scroll, hover sur les produits |

---

## 8. Installation du module vivianecustom

### 8.1 Copier le module

Copiez le dossier du module dans votre installation PrestaShop :

```bash
cp -r modules/vivianecustom/ C:\xampp\htdocs\viviane-boutique\modules\vivianecustom\
```

### 8.2 Structure du module

```
modules/vivianecustom/
├── vivianecustom.php                          ← Fichier principal du module
└── views/
    └── templates/
        └── hook/
            ├── size-guide.tpl                 ← Guide des tailles lingerie
            └── paypal-button.tpl              ← Bouton PayPal personnalisé
```

### 8.3 Installer le module depuis le back-office

1. Allez dans **Modules > Gestionnaire de modules**
2. Recherchez **« vivianecustom »** ou **« Viviane »**
3. Cliquez sur **« Installer »**
4. Le module s'installe et s'enregistre sur les hooks suivants :
   - `displayHeader`
   - `displayProductAdditionalInfo`
   - `displayFooter`

### 8.4 Configurer le module

1. Après installation, cliquez sur **« Configurer »**
2. L'option **« Activer le guide des tailles »** est disponible
3. Activez-la pour afficher automatiquement le guide des tailles sur les produits de la catégorie Lingerie

### 8.5 Fonctionnalités du module

| Fonctionnalité | Description |
|----------------|-------------|
| Guide des tailles | Tableau des tailles FR (80A à 100C) affiché sur les produits lingerie |
| Instructions de mesure | Tour de poitrine, tour de dos, correspondance bonnets (A à E) |
| Détection automatique | Le guide s'affiche uniquement sur les produits des catégories lingerie |
| Configuration back-office | Possibilité d'activer/désactiver le guide |

---

## 9. Configuration de la localisation française

### 9.1 Méthode automatique (script)

Le fichier `config/localization-fr.php` peut être exécuté pour configurer automatiquement les paramètres français. Cependant, il est recommandé de le faire manuellement via le back-office.

### 9.2 Méthode manuelle (recommandée)

Connectez-vous au back-office et effectuez les réglages suivants :

#### Localisation
**International > Localisation > Configuration**

| Paramètre | Valeur |
|-----------|--------|
| Langue par défaut | Français (French) |
| Pays par défaut | France |
| Devise par défaut | Euro (EUR) |
| Fuseau horaire | Europe/Paris |

#### Formats de date
| Paramètre | Valeur |
|-----------|--------|
| Format de date complet | `d/m/Y H:i:s` |
| Format de date court | `d/m/Y` |

#### Unités de mesure
| Paramètre | Valeur |
|-----------|--------|
| Unité de poids | kg |
| Unité de dimension | cm |
| Unité de volume | L |

#### Taxes (TVA française)

Allez dans **International > Taxes** et vérifiez la présence des taux suivants :

| Taux | Type | Application |
|------|------|-------------|
| 20% | Taux normal | Vêtements, lingerie, mercerie, laine |
| 10% | Taux intermédiaire | — |
| 5,5% | Taux réduit | Livres, patrons de tricot |
| 2,1% | Taux super réduit | — |

> Si les taux ne sont pas présents, importez le pack de localisation France :
> **International > Localisation > Importer un pack de localisation > France**

#### Conformité RGPD

Allez dans **Clients > Configuration** :

| Paramètre | Valeur |
|-----------|--------|
| Opt-in newsletter | Activé (consentement obligatoire) |
| Date de naissance | Optionnel |

#### Informations de la boutique

**Paramètres de la boutique > Coordonnées et magasins** :

| Paramètre | Valeur |
|-----------|--------|
| Nom de la boutique | Viviane Boutique |
| Email | contact@viviane-boutique.com |
| Pays | France |

---

## 10. Création des catégories

### 10.1 Méthode automatique (SQL)

Le fichier `install/categories-structure.sql` contient le script complet de création des catégories.

**Exécution via phpMyAdmin** :
1. Ouvrez `http://localhost/phpmyadmin`
2. Sélectionnez la base **`viviane_boutique`**
3. Cliquez sur l'onglet **« SQL »**
4. Copiez-collez le contenu du fichier `install/categories-structure.sql`
5. Cliquez sur **« Exécuter »**

> **Attention** : Vérifiez que l'identifiant de langue (`id_lang = 1`) correspond bien au français dans votre installation. Vous pouvez vérifier dans la table `ps_lang`.

### 10.2 Méthode manuelle (back-office)

Si vous préférez créer les catégories manuellement :

1. Allez dans **Catalogue > Catégories**
2. Créez les catégories principales en respectant l'arborescence suivante :

```
Accueil
├── Lingerie
│   ├── Soutiens-gorge
│   │   ├── Avec armatures
│   │   ├── Sans armatures
│   │   ├── Push-up
│   │   ├── Bandeau
│   │   └── Sport
│   ├── Culottes
│   │   ├── Taille haute
│   │   ├── Taille basse
│   │   ├── Tangas
│   │   └── Strings
│   ├── Ensembles
│   ├── Nuisettes & Déshabillés
│   ├── Pyjamas
│   └── Sous-vêtements masculins
│
├── Prêt-à-porter
│   ├── Femme
│   │   ├── Robes
│   │   ├── Hauts & Chemisiers
│   │   ├── Pantalons
│   │   ├── Jupes
│   │   └── Vestes & Manteaux
│   ├── Homme
│   │   ├── Chemises
│   │   ├── Pantalons
│   │   └── Pulls
│   └── Accessoires
│
├── Laine & Tricot
│   ├── Laine
│   │   ├── Laine mérinos
│   │   ├── Laine alpaga
│   │   ├── Coton
│   │   └── Acrylique
│   ├── Aiguilles à tricoter
│   ├── Crochets
│   ├── Patrons & Livres
│   └── Accessoires tricot
│
└── Mercerie
    ├── Fils à coudre
    ├── Boutons
    ├── Fermetures éclair
    ├── Rubans & Dentelles
    ├── Élastiques
    ├── Aiguilles & Épingles
    └── Accessoires couture
```

Pour chaque catégorie, renseignez :
- **Nom** : Le nom de la catégorie
- **URL simplifiée** : Le slug (ex : `soutiens-gorge`)
- **Meta title** : Le titre SEO (ex : `Soutiens-gorge - Viviane Boutique`)
- **Meta description** : Une courte description pour le SEO
- **Activée** : Oui

---

## 11. Création des attributs produits

### 11.1 Méthode automatique (script PHP)

> **Prérequis** : PrestaShop doit être installé et fonctionnel.

```bash
cd C:\xampp\htdocs\viviane-boutique\
php install/create-attributes.php
```

Ce script crée automatiquement **8 groupes d'attributs** :

| Groupe | Nombre de valeurs | Exemples |
|--------|-------------------|----------|
| Taille Lingerie | 15 | 80A, 85B, 90C, 95A, 100C... |
| Taille Vêtement | 6 | XS, S, M, L, XL, XXL |
| Taille FR | 7 | 34, 36, 38, 40, 42, 44, 46 |
| Couleur | 17 | Noir, Blanc, Nude, Rouge, Rose poudré... |
| Poids pelote | 4 | 25g, 50g, 100g, 200g |
| Composition laine | 7 | 100% Laine, 100% Coton, Mérinos... |
| Épaisseur fil | 7 | Lace, Fingering, Sport, DK, Worsted... |
| Type de bonnet | 4 | Avec armatures, Sans armatures, Push-up, Minimiseur |

### 11.2 Méthode manuelle

Si le script ne fonctionne pas, créez les attributs manuellement :

1. Allez dans **Catalogue > Attributs et caractéristiques**
2. Cliquez sur **« Ajouter un groupe d'attributs »**
3. Créez chaque groupe en suivant le tableau ci-dessus
4. Pour chaque groupe, ajoutez les valeurs correspondantes
5. Pour le groupe « Couleur », renseignez aussi le code hexadécimal

---

## 12. Configuration de PayPal

### 12.1 Créer un compte PayPal Sandbox

1. Allez sur https://developer.paypal.com/
2. Connectez-vous ou créez un compte
3. Allez dans **Dashboard > Sandbox > Accounts**
4. Notez les identifiants de test (email/mot de passe) des comptes sandbox

### 12.2 Obtenir les identifiants API

1. Sur le Developer Dashboard PayPal, allez dans **Apps & Credentials**
2. Assurez-vous d'être en mode **Sandbox**
3. Créez une application ou utilisez l'application par défaut
4. Notez le **Client ID** et le **Secret**

### 12.3 Installer le module PayPal dans PrestaShop

1. Allez dans **Modules > Gestionnaire de modules**
2. Recherchez **« PayPal Official »**
3. Cliquez sur **« Installer »**
4. Cliquez sur **« Configurer »**

### 12.4 Configuration du module PayPal

| Paramètre | Valeur |
|-----------|--------|
| Mode | **Sandbox** (test) |
| Client ID | *(votre Client ID sandbox)* |
| Secret | *(votre Secret sandbox)* |
| Devise | **EUR** |
| Pays | **France** |

Options recommandées :
- [x] Activer PayPal Express Checkout
- [x] Afficher le logo PayPal sur la page produit
- [x] Paiement en 1 clic
- [ ] PayPal Credit (non disponible en France)

### 12.5 Mise à jour du fichier de configuration

Éditez le fichier `config/paypal-config.php` avec vos vrais identifiants :

```php
define('PAYPAL_CLIENT_ID_SANDBOX', 'votre_vrai_client_id_sandbox');
define('PAYPAL_SECRET_SANDBOX', 'votre_vrai_secret_sandbox');
```

> **En production** : Changez `PAYPAL_MODE` en `'live'` et renseignez les identifiants de production.

### 12.6 Tester un paiement

1. Ajoutez un produit au panier sur votre boutique
2. Passez à la caisse
3. Choisissez PayPal comme moyen de paiement
4. Utilisez les identifiants du compte acheteur sandbox pour payer
5. Vérifiez que la commande apparaît dans le back-office

---

## 13. Installation des traductions

### 13.1 Copier le fichier de traductions

Copiez le fichier de traductions dans votre installation PrestaShop :

```bash
cp translations/fr/custom-translations.php C:\xampp\htdocs\viviane-boutique\translations\fr\
```

### 13.2 Vérification

Les traductions personnalisées couvrent les termes suivants :

- Guide des tailles et mesures
- Termes de livraison et paiement
- Navigation et catégories
- Newsletter et mentions légales
- Labels éco-responsable et fait main

> Les traductions sont chargées automatiquement par le module `vivianecustom`.

---

## 14. Configuration SEO

### 14.1 URLs amicales

1. Allez dans **Paramètres de la boutique > Trafic et SEO > SEO & URL**
2. Activez **« URL simplifiée »** (Friendly URL)
3. Configurez les schémas d'URLs :

| Type | Schéma recommandé |
|------|-------------------|
| Produit | `{category:/}{rewrite}.html` |
| Catégorie | `{rewrite}` |

### 14.2 Fichier .htaccess

Vérifiez que le fichier `.htaccess` est bien présent à la racine de PrestaShop et que `mod_rewrite` est activé dans Apache.

Pour activer `mod_rewrite` :
1. Ouvrez `C:\xampp\apache\conf\httpd.conf`
2. Recherchez la ligne `#LoadModule rewrite_module modules/mod_rewrite.so`
3. Retirez le `#` au début de la ligne
4. Redémarrez Apache

### 14.3 Meta descriptions des catégories

Pour chaque catégorie, rédigez une meta description unique et descriptive (150-160 caractères) :

| Catégorie | Exemple de meta description |
|-----------|-----------------------------|
| Lingerie | Découvrez notre collection de lingerie : soutiens-gorge, culottes et ensembles. Qualité et confort au meilleur prix. |
| Prêt-à-porter | Prêt-à-porter femme et homme chez Viviane Boutique. Robes, hauts, pantalons et accessoires tendance. |
| Laine & Tricot | Laine mérinos, alpaga, coton et accessoires de tricot. Pelotes, aiguilles et patrons pour tous niveaux. |
| Mercerie | Tout pour la couture : fils, boutons, fermetures éclair, rubans. Accessoires de mercerie de qualité. |

### 14.4 Sitemap XML

1. Allez dans **Paramètres de la boutique > Trafic et SEO > SEO & URL**
2. Dans la section « Génération du fichier sitemap », cliquez sur **« Générer le fichier sitemap »**
3. Le fichier sera accessible à : `http://localhost/viviane-boutique/sitemap.xml`

---

## 15. Vérification de l'installation

Utilisez cette checklist pour vérifier que tout est correctement installé :

### Infrastructure
- [ ] XAMPP installé et fonctionnel
- [ ] Apache et MySQL en cours d'exécution (verts dans XAMPP)
- [ ] PHP 8.1+ avec toutes les extensions requises
- [ ] Base de données `viviane_boutique` créée

### PrestaShop
- [ ] PrestaShop installé avec succès
- [ ] Dossier `/install` supprimé
- [ ] Dossier admin renommé en `admin-vb2024`
- [ ] Accès au front-office fonctionnel
- [ ] Accès au back-office fonctionnel

### Thème et module
- [ ] Thème `viviane-theme` installé et activé
- [ ] Module `vivianecustom` installé et activé
- [ ] Guide des tailles visible sur les produits lingerie
- [ ] Polices Montserrat et Playfair Display chargées
- [ ] Design responsive fonctionnel sur mobile

### Configuration
- [ ] Langue française configurée par défaut
- [ ] Devise EUR configurée
- [ ] Fuseau horaire Europe/Paris
- [ ] TVA française (20%) configurée
- [ ] URLs amicales activées

### Catégories et attributs
- [ ] 4 catégories principales créées (Lingerie, Prêt-à-porter, Laine, Mercerie)
- [ ] Toutes les sous-catégories en place
- [ ] Attributs de taille créés (Lingerie, Vêtement, FR)
- [ ] Couleurs créées avec codes hexadécimaux
- [ ] Attributs laine créés (poids, composition, épaisseur)

### Paiement
- [ ] Module PayPal installé et configuré
- [ ] Mode sandbox activé pour les tests
- [ ] Transaction test réussie

### SEO
- [ ] URLs amicales activées
- [ ] Meta descriptions renseignées pour les catégories
- [ ] Sitemap XML généré

---

## 16. Dépannage

### Apache ne démarre pas

**Cause** : Le port 80 est utilisé par un autre programme (Skype, IIS, etc.)

**Solution** :
1. Ouvrez `C:\xampp\apache\conf\httpd.conf`
2. Remplacez `Listen 80` par `Listen 8080`
3. Remplacez `ServerName localhost:80` par `ServerName localhost:8080`
4. Redémarrez Apache
5. Le site sera accessible sur `http://localhost:8080/viviane-boutique/`

### MySQL ne démarre pas

**Cause** : Le port 3306 est utilisé par un autre service MySQL.

**Solution** : Arrêtez le service MySQL concurrent ou changez le port dans la configuration XAMPP.

### Page blanche après installation

1. Vérifiez que `mod_rewrite` est activé dans Apache
2. Vérifiez les permissions des dossiers
3. Consultez les logs : `C:\xampp\apache\logs\error.log`
4. Vérifiez le fichier de log PrestaShop : `var/logs/`

### Erreurs de mémoire PHP

Augmentez `memory_limit` dans `php.ini` :
```ini
memory_limit = 512M
```
Puis redémarrez Apache.

### Le thème ne s'affiche pas correctement

1. Videz le cache : **Paramètres avancés > Performances > Vider le cache**
2. Vérifiez que tous les fichiers du thème sont bien copiés
3. Vérifiez la console du navigateur (F12) pour les erreurs JavaScript ou CSS

### Le module vivianecustom ne s'installe pas

1. Vérifiez que le fichier `vivianecustom.php` est bien dans `modules/vivianecustom/`
2. Vérifiez les permissions du dossier
3. Réinitialisez le module : **Modules > Gestionnaire de modules > Réinitialiser**

### Le script SQL des catégories échoue

1. Vérifiez que le préfixe des tables est bien `ps_` (modifiez le script si différent)
2. Vérifiez que `id_lang = 1` correspond au français dans la table `ps_lang`
3. Exécutez le script bloc par bloc pour identifier la ligne en erreur

### PayPal ne fonctionne pas

1. Vérifiez que vous utilisez les identifiants **sandbox** (pas production)
2. Vérifiez que votre compte PayPal Developer est actif
3. Testez avec un compte acheteur sandbox différent
4. Consultez les logs PayPal dans le back-office du module

---

## 17. Maintenance et sauvegardes

### 17.1 Sauvegarder la base de données

**Via phpMyAdmin** :
1. Allez sur `http://localhost/phpmyadmin`
2. Sélectionnez la base `viviane_boutique`
3. Cliquez sur **« Exporter »**
4. Format : SQL
5. Cliquez sur **« Exécuter »**

**Via la ligne de commande** :
```bash
mysqldump -u prestashop_user -p viviane_boutique > sauvegarde_viviane_AAAA-MM-JJ.sql
```

### 17.2 Sauvegarder les fichiers

Copiez régulièrement les dossiers suivants :
- `themes/viviane-theme/` (votre thème)
- `modules/vivianecustom/` (votre module)
- `img/` (images des produits)
- `config/` (fichiers de configuration)

### 17.3 Mises à jour PrestaShop

Avant toute mise à jour :
1. Faites une sauvegarde complète (base de données + fichiers)
2. Testez la mise à jour sur un environnement de test
3. Vérifiez la compatibilité du thème et des modules

### 17.4 Vidage du cache

Quand vous modifiez des fichiers de thème ou de configuration :
1. Allez dans **Paramètres avancés > Performances**
2. Cliquez sur **« Vider le cache »**
3. En développement, désactivez le cache pour voir les modifications instantanément

---

## 18. Structure des fichiers du projet

Voici la structure complète des fichiers fournis avec le projet :

```
VivianeBoutique/
│
├── themes/
│   └── viviane-theme/
│       ├── config/
│       │   └── theme.yml                          [Configuration thème]
│       ├── assets/
│       │   ├── css/
│       │   │   ├── custom.css                     [Styles CSS complets]
│       │   │   └── variables.scss                 [Variables SCSS]
│       │   └── js/
│       │       └── custom.js                      [JavaScript personnalisé]
│       └── templates/
│           ├── layout/
│           │   └── layout.tpl                     [Layout principal]
│           ├── page.tpl                           [Page générique]
│           ├── _partials/
│           │   ├── head.tpl                       [<head> HTML]
│           │   ├── header.tpl                     [En-tête + navigation]
│           │   ├── footer.tpl                     [Pied de page]
│           │   ├── breadcrumb.tpl                 [Fil d'Ariane]
│           │   ├── notifications.tpl              [Alertes]
│           │   ├── javascript.tpl                 [Inclusion JS]
│           │   └── stylesheets.tpl                [Inclusion CSS]
│           └── catalog/
│               ├── product.tpl                    [Page produit]
│               └── _partials/
│                   ├── product-images.tpl         [Galerie images]
│                   ├── product-prices.tpl         [Affichage prix]
│                   ├── product-variants.tpl       [Sélecteur variantes]
│                   ├── product-add-to-cart.tpl    [Bouton panier]
│                   ├── product-additional-info.tpl [Infos complémentaires]
│                   ├── product-tabs.tpl           [Onglets produit]
│                   ├── product-activation.tpl     [Avertissement]
│                   └── miniatures/
│                       └── product.tpl            [Carte produit]
│
├── modules/
│   └── vivianecustom/
│       ├── vivianecustom.php                      [Module PHP principal]
│       └── views/
│           └── templates/
│               └── hook/
│                   ├── size-guide.tpl             [Guide des tailles]
│                   └── paypal-button.tpl          [Bouton PayPal]
│
├── config/
│   ├── paypal-config.php                          [Config PayPal]
│   └── localization-fr.php                        [Localisation FR]
│
├── install/
│   ├── categories-structure.sql                   [Catégories SQL]
│   └── create-attributes.php                      [Attributs PHP]
│
├── translations/
│   └── fr/
│       └── custom-translations.php                [Traductions FR]
│
├── claude-code-instructions-viviane-boutique.md   [Cahier des charges]
├── windows11-prestashop-setup-guide.md            [Guide XAMPP]
├── GUIDE-INSTALLATION.md                          [Ce manuel]
└── CHANGELOG.md                                   [Journal des versions]
```

---

## Contacts et ressources

| Ressource | URL |
|-----------|-----|
| Documentation PrestaShop | https://doc.prestashop.com/ |
| Forum PrestaShop | https://www.prestashop.com/forums/ |
| PrestaShop GitHub | https://github.com/PrestaShop/PrestaShop |
| PayPal Developer | https://developer.paypal.com/ |
| XAMPP | https://www.apachefriends.org/ |

---

*Manuel d'installation - Viviane Boutique - Version 0 - Février 2026*
