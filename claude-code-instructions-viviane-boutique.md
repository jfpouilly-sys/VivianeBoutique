# Instructions Claude Code : Développement Viviane Boutique PrestaShop
## Cahier des Charges Technique Complet

---

## 📋 Vue d'Ensemble du Projet

**Nom du projet** : Viviane Boutique - Site E-commerce
**Plateforme** : PrestaShop 8.1.x
**Langue principale** : Français (France)
**Devise** : EUR (€)
**Environnement de développement** : Windows 11 avec XAMPP

### Activité Commerciale
Viviane Boutique est une boutique spécialisée dans :
- **Lingerie** (soutiens-gorge, culottes, nuisettes, pyjamas, sous-vêtements)
- **Prêt-à-porter** (vêtements féminins et potentiellement masculins)
- **Laine** (pelotes, fils à tricoter, accessoires tricot)
- **Mercerie** (boutons, fils à coudre, rubans, fermetures éclair, accessoires couture)

---

## 🎯 Objectifs du Projet

1. Créer un site e-commerce professionnel et responsive
2. Organiser les produits en catégories claires et intuitives
3. Intégrer PayPal comme premier moyen de paiement
4. Préparer l'intégration future des paiements par carte bancaire
5. Optimiser pour le marché français
6. Garantir une navigation fluide et une expérience utilisateur optimale

---

## 🏗️ Architecture Technique

### Structure des Dossiers PrestaShop
```
viviane-boutique/
├── admin-vb2024/           # Back-office (renommé pour sécurité)
├── cache/
├── classes/
├── config/
├── controllers/
├── download/
├── img/                    # Images produits, catégories
├── localization/
├── mails/
├── modules/               # Modules personnalisés
│   └── vivianecustom/    # Notre module custom
├── override/             # Surcharges PrestaShop
│   ├── classes/
│   └── controllers/
├── themes/
│   └── viviane-theme/   # Notre thème personnalisé
│       ├── assets/
│       ├── css/
│       ├── js/
│       ├── templates/
│       └── config/
├── translations/
├── upload/
└── var/
```

---

## 🎨 Développement du Thème Custom

### Nom du Thème : "viviane-theme"

### Création du Thème

**Étape 1 : Créer la structure de base**

```bash
# Dans le dossier themes/
mkdir viviane-theme
cd viviane-theme
```

**Étape 2 : Fichier de configuration du thème**

Créer `config/theme.yml` :

```yaml
name: Viviane Boutique Theme
display_name: Viviane Boutique
version: 1.0.0
author:
  name: "Claude Code"
  email: "contact@viviane-boutique.com"
  url: ""

meta:
  compatibility:
    from: 8.0.0
    to: ~
  available: true

assets:
  use_parent_assets: false

global_settings:
  configuration:
    PS_IMAGE_QUALITY: png
    PS_JPEG_QUALITY: 90
    PS_PNG_QUALITY: 7
  hooks:
    modules_to_hook:
      displayNav:
        - ps_customersignin
        - ps_shoppingcart
      displayTop:
        - ps_mainmenu
        - ps_searchbar
      displayHome:
        - ps_banner
        - ps_featuredproducts
      displayFooter:
        - ps_emailsubscription
        - ps_socialfollow

theme_settings:
  default_layout: layout-both-columns
  layouts:
    category: layout-left-column
    product: layout-both-columns
    cms: layout-both-columns
```

### Palette de Couleurs Recommandée

```scss
// variables.scss
$primary-color: #D4366B;        // Rose élégant pour lingerie
$secondary-color: #2C3E50;      // Bleu marine pour prêt-à-porter
$accent-color: #E8B298;         // Beige/pêche pour mercerie
$yarn-color: #8E44AD;           // Violet pour section laine
$text-color: #333333;
$light-gray: #F5F5F5;
$white: #FFFFFF;
$success: #27AE60;
$warning: #F39C12;
$error: #E74C3C;
```

### Templates Principaux

#### 1. Layout Principal : `templates/layout/layout.tpl`

```smarty
<!DOCTYPE html>
<html lang="{$language.iso_code}">
<head>
  {block name='head'}
    {include file='_partials/head.tpl'}
  {/block}
</head>

<body id="{$page.page_name}" class="{$page.body_classes|classnames}">
  {hook h='displayAfterBodyOpeningTag'}

  <main>
    {block name='product_activation'}
      {include file='catalog/_partials/product-activation.tpl'}
    {/block}

    <header id="header">
      {block name='header'}
        {include file='_partials/header.tpl'}
      {/block}
    </header>

    {block name='notifications'}
      {include file='_partials/notifications.tpl'}
    {/block}

    <section id="wrapper">
      <div class="container">
        {block name='breadcrumb'}
          {include file='_partials/breadcrumb.tpl'}
        {/block}

        <div class="row">
          {block name="left_column"}
            <div id="left-column" class="col-xs-12 col-sm-4 col-md-3">
              {if $page.page_name == 'product'}
                {hook h='displayLeftColumnProduct'}
              {else}
                {hook h='displayLeftColumn'}
              {/if}
            </div>
          {/block}

          {block name="content_wrapper"}
            <div id="content-wrapper" class="left-column right-column col-sm-4 col-md-6">
              {block name="content"}
                <p>Contenu par défaut</p>
              {/block}
            </div>
          {/block}

          {block name="right_column"}
            <div id="right-column" class="col-xs-12 col-sm-4 col-md-3">
              {if $page.page_name == 'product'}
                {hook h='displayRightColumnProduct'}
              {else}
                {hook h='displayRightColumn'}
              {/if}
            </div>
          {/block}
        </div>
      </div>
    </section>

    <footer id="footer">
      {block name="footer"}
        {include file="_partials/footer.tpl"}
      {/block}
    </footer>

  </main>

  {hook h='displayBeforeBodyClosingTag'}

  {block name='javascript_bottom'}
    {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
  {/block}
</body>
</html>
```

#### 2. Header : `templates/_partials/header.tpl`

```smarty
{block name='header_banner'}
  <div class="header-banner">
    {hook h='displayBanner'}
  </div>
{/block}

{block name='header_nav'}
  <nav class="header-nav">
    <div class="container">
      <div class="row">
        <div class="col-md-6 header-nav-left">
          {hook h='displayNav1'}
        </div>
        <div class="col-md-6 header-nav-right">
          {hook h='displayNav2'}
        </div>
      </div>
    </div>
  </nav>
{/block}

{block name='header_top'}
  <div class="header-top">
    <div class="container">
      <div class="row">
        <div class="col-md-3 logo">
          <a href="{$urls.base_url}">
            <img class="logo img-fluid" 
                 src="{$shop.logo}" 
                 alt="{$shop.name}"
                 loading="lazy">
          </a>
        </div>
        <div class="col-md-6 position-static">
          {hook h='displayTop'}
        </div>
        <div class="col-md-3 text-sm-right">
          {hook h='displayNav'}
        </div>
      </div>
    </div>
  </div>
{/block}
```

#### 3. Page Produit : `templates/catalog/product.tpl`

```smarty
{extends file='page.tpl'}

{block name='page_content'}
  <div class="product-container">
    <div class="row">
      {* Images produit *}
      <div class="col-md-6">
        {block name='page_content_images'}
          {include file='catalog/_partials/product-images.tpl'}
        {/block}
      </div>

      {* Informations produit *}
      <div class="col-md-6">
        {block name='page_header'}
          <h1 class="product-title">{$product.name}</h1>
        {/block}

        {block name='product_prices'}
          {include file='catalog/_partials/product-prices.tpl'}
        {/block}

        {block name='product_description_short'}
          <div class="product-description-short">
            {$product.description_short nofilter}
          </div>
        {/block}

        {block name='product_variants'}
          {include file='catalog/_partials/product-variants.tpl'}
        {/block}

        {block name='product_add_to_cart'}
          {include file='catalog/_partials/product-add-to-cart.tpl'}
        {/block}

        {block name='product_additional_info'}
          {include file='catalog/_partials/product-additional-info.tpl'}
        {/block}

        {* Bloc spécial pour conseils lingerie/mercerie *}
        {if $product.category_name == 'Lingerie'}
          <div class="product-care-tips">
            <h3>Guide des tailles</h3>
            {* Tableau des tailles *}
          </div>
        {/if}
      </div>
    </div>

    {* Onglets description, caractéristiques, etc. *}
    <div class="row">
      <div class="col-md-12">
        {block name='product_tabs'}
          {include file='catalog/_partials/product-tabs.tpl'}
        {/block}
      </div>
    </div>

    {* Produits associés *}
    {block name='product_accessories'}
      {if $accessories}
        <section class="product-accessories">
          <h2>Produits complémentaires</h2>
          <div class="products row">
            {foreach from=$accessories item="product_accessory"}
              {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory}
            {/foreach}
          </div>
        </section>
      {/if}
    {/block}
  </div>
{/block}
```

### CSS Principal : `assets/css/custom.css`

```css
/* ==========================================================================
   VIVIANE BOUTIQUE - STYLES PERSONNALISÉS
   ========================================================================== */

/* Variables */
:root {
  --primary-color: #D4366B;
  --secondary-color: #2C3E50;
  --accent-color: #E8B298;
  --yarn-color: #8E44AD;
  --text-color: #333333;
  --light-gray: #F5F5F5;
}

/* Typography */
body {
  font-family: 'Montserrat', 'Arial', sans-serif;
  color: var(--text-color);
  font-size: 16px;
  line-height: 1.6;
}

h1, h2, h3, h4, h5, h6 {
  font-family: 'Playfair Display', 'Georgia', serif;
  font-weight: 600;
}

/* Header */
.header-top {
  padding: 20px 0;
  border-bottom: 1px solid var(--light-gray);
}

.logo img {
  max-height: 80px;
}

/* Navigation */
.main-menu {
  background: var(--primary-color);
  padding: 0;
}

.main-menu a {
  color: white;
  padding: 15px 20px;
  display: inline-block;
  transition: background 0.3s;
}

.main-menu a:hover {
  background: rgba(255,255,255,0.1);
}

/* Catégories spéciales */
.category-lingerie {
  border-left: 4px solid var(--primary-color);
}

.category-pret-a-porter {
  border-left: 4px solid var(--secondary-color);
}

.category-laine {
  border-left: 4px solid var(--yarn-color);
}

.category-mercerie {
  border-left: 4px solid var(--accent-color);
}

/* Cartes produits */
.product-miniature {
  border: 1px solid var(--light-gray);
  border-radius: 8px;
  overflow: hidden;
  transition: transform 0.3s, box-shadow 0.3s;
  margin-bottom: 30px;
}

.product-miniature:hover {
  transform: translateY(-5px);
  box-shadow: 0 10px 25px rgba(0,0,0,0.1);
}

.product-thumbnail {
  position: relative;
  overflow: hidden;
}

.product-thumbnail img {
  width: 100%;
  height: auto;
  transition: transform 0.3s;
}

.product-miniature:hover .product-thumbnail img {
  transform: scale(1.05);
}

/* Badges */
.product-flags {
  position: absolute;
  top: 10px;
  right: 10px;
  z-index: 10;
}

.product-flag {
  display: inline-block;
  padding: 5px 10px;
  margin-bottom: 5px;
  font-size: 12px;
  font-weight: bold;
  border-radius: 3px;
}

.product-flag.discount {
  background: var(--error);
  color: white;
}

.product-flag.new {
  background: var(--success);
  color: white;
}

.product-flag.online-only {
  background: var(--primary-color);
  color: white;
}

/* Prix */
.product-price-and-shipping {
  font-size: 24px;
  font-weight: bold;
  color: var(--primary-color);
}

.regular-price {
  text-decoration: line-through;
  color: #999;
  font-size: 18px;
  margin-right: 10px;
}

/* Boutons */
.btn-primary {
  background: var(--primary-color);
  border: none;
  padding: 12px 30px;
  border-radius: 25px;
  font-weight: 600;
  transition: all 0.3s;
}

.btn-primary:hover {
  background: darken(var(--primary-color), 10%);
  transform: translateY(-2px);
  box-shadow: 0 5px 15px rgba(0,0,0,0.2);
}

.add-to-cart {
  width: 100%;
  margin-top: 20px;
}

/* Guide des tailles (spécial lingerie) */
.size-guide {
  background: var(--light-gray);
  padding: 20px;
  border-radius: 8px;
  margin: 20px 0;
}

.size-guide table {
  width: 100%;
  border-collapse: collapse;
}

.size-guide th,
.size-guide td {
  padding: 10px;
  text-align: center;
  border: 1px solid #ddd;
}

.size-guide th {
  background: var(--primary-color);
  color: white;
}

/* Filtres (sidebar) */
.facet-title {
  font-size: 16px;
  font-weight: 600;
  margin-bottom: 15px;
  color: var(--secondary-color);
  border-bottom: 2px solid var(--primary-color);
  padding-bottom: 10px;
}

/* Footer */
footer {
  background: var(--secondary-color);
  color: white;
  padding: 40px 0 20px;
  margin-top: 60px;
}

footer a {
  color: white;
  opacity: 0.8;
  transition: opacity 0.3s;
}

footer a:hover {
  opacity: 1;
}

/* Responsive */
@media (max-width: 768px) {
  .logo img {
    max-height: 60px;
  }
  
  .product-price-and-shipping {
    font-size: 20px;
  }
  
  .main-menu a {
    padding: 10px 15px;
    font-size: 14px;
  }
}

/* Animations */
@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.animated-entrance {
  animation: fadeIn 0.6s ease-out;
}
```

---

## 📦 Structure des Catégories

### Arborescence Recommandée

```
VIVIANE BOUTIQUE (Accueil)
│
├── 👙 LINGERIE
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
├── 👗 PRÊT-À-PORTER
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
├── 🧶 LAINE & TRICOT
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
└── ✂️ MERCERIE
    ├── Fils à coudre
    ├── Boutons
    ├── Fermetures éclair
    ├── Rubans & Dentelles
    ├── Élastiques
    ├── Aiguilles & Épingles
    └── Accessoires couture
```

### SQL pour Création des Catégories

Créer un fichier : `install/categories-structure.sql`

```sql
-- Script d'installation des catégories Viviane Boutique

-- Catégorie principale : LINGERIE
INSERT INTO ps_category (id_parent, level_depth, active, position) 
VALUES (2, 2, 1, 0);
SET @lingerie_id = LAST_INSERT_ID();

INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@lingerie_id, 1, 1, 'Lingerie', 'lingerie', 'Lingerie - Viviane Boutique');

-- Sous-catégories Lingerie : Soutiens-gorge
INSERT INTO ps_category (id_parent, level_depth, active, position) 
VALUES (@lingerie_id, 3, 1, 0);
SET @soutiens_gorge_id = LAST_INSERT_ID();

INSERT INTO ps_category_lang (id_category, id_shop, id_lang, name, link_rewrite, meta_title)
VALUES (@soutiens_gorge_id, 1, 1, 'Soutiens-gorge', 'soutiens-gorge', 'Soutiens-gorge');

-- Continuer pour toutes les catégories...
-- (À compléter selon l'arborescence ci-dessus)
```

---

## 🔌 Module Custom : vivianecustom

### Création du Module

**Dossier** : `modules/vivianecustom/`

#### Fichier principal : `vivianecustom.php`

```php
<?php
if (!defined('_PS_VERSION_')) {
    exit;
}

class VivianeCustom extends Module
{
    public function __construct()
    {
        $this->name = 'vivianecustom';
        $this->tab = 'front_office_features';
        $this->version = '1.0.0';
        $this->author = 'Claude Code';
        $this->need_instance = 0;

        $this->bootstrap = true;
        parent::__construct();

        $this->displayName = $this->l('Viviane Boutique Custom Features');
        $this->description = $this->l('Fonctionnalités personnalisées pour Viviane Boutique');
        $this->ps_versions_compliancy = array('min' => '8.0', 'max' => _PS_VERSION_);
    }

    public function install()
    {
        return parent::install() &&
            $this->registerHook('displayHeader') &&
            $this->registerHook('displayProductAdditionalInfo') &&
            $this->registerHook('displayFooter') &&
            Configuration::updateValue('VIVIANE_SIZE_GUIDE_ENABLED', true);
    }

    public function uninstall()
    {
        return parent::uninstall() &&
            Configuration::deleteByName('VIVIANE_SIZE_GUIDE_ENABLED');
    }

    /**
     * Hook pour afficher le guide des tailles sur les produits lingerie
     */
    public function hookDisplayProductAdditionalInfo($params)
    {
        $product = $params['product'];
        
        // Vérifier si c'est un produit lingerie
        if ($this->isLingerieProduct($product)) {
            $this->context->smarty->assign(array(
                'size_guide_enabled' => Configuration::get('VIVIANE_SIZE_GUIDE_ENABLED'),
                'product_category' => $product['category']
            ));
            
            return $this->display(__FILE__, 'views/templates/hook/size-guide.tpl');
        }
        
        return '';
    }

    /**
     * Vérifie si le produit appartient à la catégorie lingerie
     */
    private function isLingerieProduct($product)
    {
        // Logique pour déterminer si c'est un produit lingerie
        $lingerieCategories = ['Lingerie', 'Soutiens-gorge', 'Culottes'];
        
        foreach ($product['categories'] as $category) {
            if (in_array($category['name'], $lingerieCategories)) {
                return true;
            }
        }
        
        return false;
    }

    /**
     * Configuration du module
     */
    public function getContent()
    {
        $output = '';

        if (Tools::isSubmit('submitVivianeSettings')) {
            Configuration::updateValue(
                'VIVIANE_SIZE_GUIDE_ENABLED',
                Tools::getValue('VIVIANE_SIZE_GUIDE_ENABLED')
            );
            $output .= $this->displayConfirmation($this->l('Paramètres sauvegardés'));
        }

        return $output . $this->displayForm();
    }

    /**
     * Formulaire de configuration
     */
    public function displayForm()
    {
        $fields_form = array(
            'form' => array(
                'legend' => array(
                    'title' => $this->l('Paramètres'),
                    'icon' => 'icon-cogs'
                ),
                'input' => array(
                    array(
                        'type' => 'switch',
                        'label' => $this->l('Activer le guide des tailles'),
                        'name' => 'VIVIANE_SIZE_GUIDE_ENABLED',
                        'is_bool' => true,
                        'values' => array(
                            array(
                                'id' => 'active_on',
                                'value' => 1,
                                'label' => $this->l('Oui')
                            ),
                            array(
                                'id' => 'active_off',
                                'value' => 0,
                                'label' => $this->l('Non')
                            )
                        ),
                    ),
                ),
                'submit' => array(
                    'title' => $this->l('Sauvegarder'),
                    'class' => 'btn btn-default pull-right'
                )
            ),
        );

        $helper = new HelperForm();
        $helper->module = $this;
        $helper->name_controller = $this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');
        $helper->currentIndex = AdminController::$currentIndex . '&configure=' . $this->name;
        $helper->submit_action = 'submitVivianeSettings';

        $helper->fields_value['VIVIANE_SIZE_GUIDE_ENABLED'] = 
            Configuration::get('VIVIANE_SIZE_GUIDE_ENABLED');

        return $helper->generateForm(array($fields_form));
    }
}
```

#### Template Guide des Tailles : `modules/vivianecustom/views/templates/hook/size-guide.tpl`

```smarty
{if $size_guide_enabled}
<div class="viviane-size-guide">
    <h3 class="size-guide-title">
        <i class="material-icons">straighten</i>
        Guide des tailles
    </h3>
    
    <div class="size-guide-content">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Taille FR</th>
                    <th>Tour de poitrine (cm)</th>
                    <th>Tour de dos (cm)</th>
                    <th>Bonnet</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>85A</td>
                    <td>82-84</td>
                    <td>68-72</td>
                    <td>A</td>
                </tr>
                <tr>
                    <td>85B</td>
                    <td>84-86</td>
                    <td>68-72</td>
                    <td>B</td>
                </tr>
                <tr>
                    <td>85C</td>
                    <td>86-88</td>
                    <td>68-72</td>
                    <td>C</td>
                </tr>
                <tr>
                    <td>90A</td>
                    <td>87-89</td>
                    <td>73-77</td>
                    <td>A</td>
                </tr>
                <tr>
                    <td>90B</td>
                    <td>89-91</td>
                    <td>73-77</td>
                    <td>B</td>
                </tr>
                <tr>
                    <td>90C</td>
                    <td>91-93</td>
                    <td>73-77</td>
                    <td>C</td>
                </tr>
                <!-- Ajouter plus de tailles -->
            </tbody>
        </table>

        <div class="size-tips">
            <h4>Comment mesurer ?</h4>
            <ul>
                <li><strong>Tour de poitrine :</strong> Mesurez horizontalement au point le plus fort de la poitrine</li>
                <li><strong>Tour de dos :</strong> Mesurez juste sous la poitrine</li>
                <li><strong>Bonnet :</strong> La différence entre tour de poitrine et tour de dos détermine le bonnet</li>
            </ul>
        </div>
    </div>
</div>

<style>
.viviane-size-guide {
    background: #f8f9fa;
    padding: 20px;
    border-radius: 8px;
    margin: 20px 0;
}

.size-guide-title {
    color: #D4366B;
    font-size: 18px;
    margin-bottom: 15px;
    display: flex;
    align-items: center;
    gap: 10px;
}

.size-guide-content table {
    font-size: 14px;
}

.size-tips {
    margin-top: 20px;
    padding: 15px;
    background: white;
    border-left: 4px solid #D4366B;
}

.size-tips h4 {
    color: #2C3E50;
    margin-bottom: 10px;
}

.size-tips ul {
    padding-left: 20px;
}

.size-tips li {
    margin-bottom: 8px;
}
</style>
{/if}
```

---

## 💳 Intégration PayPal

### Étape 1 : Installation du Module PayPal

PrestaShop a un module officiel PayPal. Pour l'installer :

```bash
# Via le back-office PrestaShop :
# Modules > Module Manager > Rechercher "PayPal"
# Installer "PayPal Official"
```

### Étape 2 : Configuration PayPal

**Fichier de configuration** : créer `config/paypal-config.php`

```php
<?php
/**
 * Configuration PayPal pour Viviane Boutique
 */

// En mode TEST (Sandbox)
define('PAYPAL_MODE', 'sandbox'); // Changer en 'live' pour production
define('PAYPAL_CLIENT_ID_SANDBOX', 'VOTRE_CLIENT_ID_SANDBOX');
define('PAYPAL_SECRET_SANDBOX', 'VOTRE_SECRET_SANDBOX');

// En mode PRODUCTION (à configurer plus tard)
define('PAYPAL_CLIENT_ID_LIVE', '');
define('PAYPAL_SECRET_LIVE', '');

// Options
define('PAYPAL_CURRENCY', 'EUR');
define('PAYPAL_LOCALE', 'fr_FR');
```

### Configuration dans PrestaShop

1. **Back-office** → **Modules** → **PayPal Official** → **Configurer**

2. **Paramètres à renseigner** :
   - Mode : Sandbox (pour tests)
   - Client ID : Obtenu sur https://developer.paypal.com
   - Secret : Obtenu sur developer.paypal.com
   - Devise : EUR
   - Pays : France

3. **Options recommandées** :
   - ✅ Activer PayPal Express Checkout
   - ✅ Afficher logo PayPal sur page produit
   - ✅ Paiement en 1 clic
   - ⬜ PayPal Credit (pas disponible en France)

### Template Personnalisé PayPal Button

`modules/vivianecustom/views/templates/hook/paypal-button.tpl`

```smarty
<div class="paypal-button-container">
    <div id="paypal-button"></div>
</div>

<script src="https://www.paypal.com/sdk/js?client-id={$paypal_client_id}&currency=EUR&locale=fr_FR"></script>

<script>
paypal.Buttons({
    style: {
        layout: 'vertical',
        color: 'gold',
        shape: 'rect',
        label: 'paypal'
    },
    createOrder: function(data, actions) {
        return actions.order.create({
            purchase_units: [{
                amount: {
                    value: '{$cart_total}'
                },
                description: 'Achat sur Viviane Boutique'
            }]
        });
    },
    onApprove: function(data, actions) {
        return actions.order.capture().then(function(details) {
            // Rediriger vers page de confirmation
            window.location.href = '{$confirmation_url}?order_id=' + details.id;
        });
    },
    onError: function(err) {
        console.error('Erreur PayPal:', err);
        alert('Une erreur est survenue. Veuillez réessayer.');
    }
}).render('#paypal-button');
</script>

<style>
.paypal-button-container {
    margin: 20px 0;
    padding: 15px;
    background: #f8f9fa;
    border-radius: 8px;
    text-align: center;
}
</style>
```

---

## 📝 Attributs et Caractéristiques Produits

### Attributs Recommandés

#### Pour Lingerie :
```php
// Taille
$sizes_lingerie = ['80A', '80B', '80C', '85A', '85B', '85C', '90A', '90B', '90C', 
                   '95A', '95B', '95C', '100A', '100B', '100C'];

// Couleur
$colors_lingerie = ['Noir', 'Blanc', 'Nude', 'Rouge', 'Bleu marine', 'Rose'];

// Type de bonnet
$cup_types = ['Avec armatures', 'Sans armatures', 'Push-up', 'Minimiseur'];
```

#### Pour Prêt-à-Porter :
```php
// Taille
$sizes_clothing = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];
// Correspondance française
$sizes_fr = ['34', '36', '38', '40', '42', '44', '46'];

// Couleur
$colors_clothing = ['Noir', 'Blanc', 'Gris', 'Bleu', 'Rouge', 'Vert', 'Beige'];
```

#### Pour Laine :
```php
// Poids pelote
$yarn_weights = ['25g', '50g', '100g', '200g'];

// Composition
$yarn_compositions = ['100% Laine', '100% Coton', '70% Laine 30% Acrylique', 
                      '50% Alpaga 50% Laine', '100% Mérinos'];

// Épaisseur
$yarn_thickness = ['Lace', 'Fingering', 'Sport', 'DK', 'Worsted', 'Bulky', 'Super Bulky'];

// Couleur (nuancier)
$yarn_colors = ['Blanc écru', 'Noir', 'Gris chiné', 'Rouge cardinal', 
                'Bleu océan', 'Vert forêt', 'Rose poudré', 'Jaune moutarde'];
```

### Script de Création des Attributs

`install/create-attributes.php`

```php
<?php
require_once dirname(__FILE__) . '/../config/config.inc.php';

/**
 * Script de création des attributs pour Viviane Boutique
 */

// Groupe d'attributs : Taille Lingerie
$sizeGroupLingerie = new AttributeGroup();
$sizeGroupLingerie->name = array(
    1 => 'Taille', // id_lang 1 = Français
);
$sizeGroupLingerie->public_name = array(
    1 => 'Taille',
);
$sizeGroupLingerie->group_type = 'select';
$sizeGroupLingerie->add();

// Valeurs de tailles lingerie
$sizes = ['80A', '80B', '80C', '85A', '85B', '85C', '90A', '90B', '90C'];
foreach ($sizes as $position => $size) {
    $attribute = new Attribute();
    $attribute->id_attribute_group = $sizeGroupLingerie->id;
    $attribute->name = array(1 => $size);
    $attribute->position = $position;
    $attribute->add();
}

// Groupe d'attributs : Couleur
$colorGroup = new AttributeGroup();
$colorGroup->name = array(1 => 'Couleur');
$colorGroup->public_name = array(1 => 'Couleur');
$colorGroup->group_type = 'color';
$colorGroup->add();

// Valeurs de couleurs avec codes hexadécimaux
$colors = [
    ['name' => 'Noir', 'color' => '#000000'],
    ['name' => 'Blanc', 'color' => '#FFFFFF'],
    ['name' => 'Nude', 'color' => '#E8B298'],
    ['name' => 'Rouge', 'color' => '#D4366B'],
    ['name' => 'Bleu marine', 'color' => '#2C3E50'],
];

foreach ($colors as $position => $colorData) {
    $attribute = new Attribute();
    $attribute->id_attribute_group = $colorGroup->id;
    $attribute->name = array(1 => $colorData['name']);
    $attribute->color = $colorData['color'];
    $attribute->position = $position;
    $attribute->add();
}

echo "Attributs créés avec succès !";
```

---

## 🌍 Configuration Française

### Localisation

**Fichier** : `config/localization-fr.php`

```php
<?php
/**
 * Configuration pour le marché français
 */

// Langue par défaut
Configuration::updateValue('PS_LANG_DEFAULT', 1); // 1 = Français

// Devise par défaut
Configuration::updateValue('PS_CURRENCY_DEFAULT', 1); // EUR

// Pays par défaut
Configuration::updateValue('PS_COUNTRY_DEFAULT', 8); // France

// Fuseau horaire
Configuration::updateValue('PS_TIMEZONE', 'Europe/Paris');

// Format de date français
Configuration::updateValue('PS_DATE_FORMAT_FULL', 'd/m/Y H:i:s');
Configuration::updateValue('PS_DATE_FORMAT_LITE', 'd/m/Y');

// TVA française (20% standard)
// Les taux seront configurés dans le back-office

// Unités de mesure
Configuration::updateValue('PS_WEIGHT_UNIT', 'kg');
Configuration::updateValue('PS_DIMENSION_UNIT', 'cm');
Configuration::updateValue('PS_VOLUME_UNIT', 'L');

// RGPD - Conformité européenne
Configuration::updateValue('PS_CUSTOMER_OPTIN', 1); // Opt-in obligatoire
Configuration::updateValue('PS_CUSTOMER_BIRTHDATE', 0); // Date de naissance optionnelle
```

### Traductions Personnalisées

**Fichier** : `translations/fr/custom-translations.php`

```php
<?php
global $_MODULE;

// Traductions spécifiques Viviane Boutique
$_MODULE['<{vivianecustom}prestashop>vivianecustom'] = array(
    'Size Guide' => 'Guide des tailles',
    'How to measure' => 'Comment mesurer',
    'Bust circumference' => 'Tour de poitrine',
    'Under bust' => 'Tour de dos',
    'Cup size' => 'Bonnet',
    'Care instructions' => 'Instructions d\'entretien',
    'Composition' => 'Composition',
    'Made in France' => 'Fabriqué en France',
    'Handmade' => 'Fait main',
    'Eco-friendly' => 'Éco-responsable',
    'Add to wishlist' => 'Ajouter à ma liste de souhaits',
    'Notify me when available' => 'Me prévenir quand disponible',
    'Size chart' => 'Tableau des tailles',
    'Shipping info' => 'Informations de livraison',
    'Free shipping from 50€' => 'Livraison gratuite dès 50€',
);
```

---

## 🚀 Checklist de Développement

### Phase 1 : Installation et Configuration de Base
- [ ] Installer PrestaShop sur Windows 11 (voir guide séparé)
- [ ] Configurer la langue française
- [ ] Configurer la devise EUR
- [ ] Configurer le fuseau horaire Europe/Paris
- [ ] Supprimer les données de démonstration par défaut
- [ ] Créer la structure de catégories
- [ ] Configurer les taxes françaises (20% standard)

### Phase 2 : Thème et Design
- [ ] Créer le dossier `themes/viviane-theme/`
- [ ] Créer le fichier `config/theme.yml`
- [ ] Développer `templates/layout/layout.tpl`
- [ ] Développer `templates/_partials/header.tpl`
- [ ] Développer `templates/_partials/footer.tpl`
- [ ] Développer `templates/catalog/product.tpl`
- [ ] Créer `assets/css/custom.css`
- [ ] Créer `assets/css/variables.scss`
- [ ] Ajouter les fonts (Montserrat, Playfair Display)
- [ ] Optimiser pour mobile (responsive design)
- [ ] Tester sur différents navigateurs

### Phase 3 : Module Custom
- [ ] Créer le module `vivianecustom`
- [ ] Développer la fonctionnalité de guide des tailles
- [ ] Créer les hooks nécessaires
- [ ] Tester le module
- [ ] Créer la configuration back-office

### Phase 4 : Produits et Catégories
- [ ] Créer toutes les catégories principales
- [ ] Créer les sous-catégories
- [ ] Configurer les attributs (tailles, couleurs)
- [ ] Créer les caractéristiques produits
- [ ] Ajouter des produits de test (5-10 par catégorie)
- [ ] Optimiser les images produits
- [ ] Configurer les stocks

### Phase 5 : Paiement
- [ ] Installer le module PayPal Official
- [ ] Créer un compte PayPal Sandbox
- [ ] Configurer les identifiants de test
- [ ] Tester des transactions
- [ ] Personnaliser les boutons PayPal
- [ ] Préparer l'intégration future carte bancaire (Stripe)

### Phase 6 : SEO et Performance
- [ ] Configurer les URLs amicales
- [ ] Rédiger les meta-descriptions des catégories
- [ ] Optimiser les images (compression)
- [ ] Activer le cache PrestaShop
- [ ] Configurer le sitemap XML
- [ ] Tester la vitesse de chargement

### Phase 7 : Tests
- [ ] Tester le processus de commande complet
- [ ] Tester PayPal en mode sandbox
- [ ] Tester sur mobile
- [ ] Tester la navigation
- [ ] Tester les filtres produits
- [ ] Vérifier les emails automatiques
- [ ] Tester le back-office

### Phase 8 : Déploiement (Préparation)
- [ ] Documenter la configuration
- [ ] Exporter la base de données
- [ ] Préparer les fichiers pour transfert
- [ ] Configurer SSL pour production
- [ ] Basculer PayPal en mode live
- [ ] Former l'administrateur

---

## 📊 Données de Test

### Produits Exemple - Lingerie

```php
// Produit 1 : Soutien-gorge push-up
[
    'name' => 'Soutien-gorge Push-Up Dentelle Noire',
    'description' => 'Soutien-gorge push-up en dentelle délicate avec armatures pour un maintien optimal.',
    'price' => 29.90,
    'category' => 'Soutiens-gorge > Push-up',
    'attributes' => [
        'Taille' => ['85B', '85C', '90B', '90C'],
        'Couleur' => ['Noir', 'Nude', 'Rouge']
    ],
    'features' => [
        'Composition' => '85% Polyamide, 15% Elasthanne',
        'Bonnet' => 'Rembourré',
        'Armatures' => 'Oui',
        'Entretien' => 'Lavage à la main recommandé'
    ]
]

// Produit 2 : Culotte taille haute
[
    'name' => 'Culotte Taille Haute Coton Bio',
    'description' => 'Culotte confortable en coton biologique, taille haute pour un effet gainant naturel.',
    'price' => 15.90,
    'category' => 'Culottes > Taille haute',
    'attributes' => [
        'Taille' => ['S', 'M', 'L', 'XL'],
        'Couleur' => ['Noir', 'Blanc', 'Nude', 'Rose poudré']
    ],
    'features' => [
        'Composition' => '95% Coton Bio, 5% Elasthanne',
        'Eco-responsable' => 'Oui',
        'Fabriqué en' => 'Portugal'
    ]
]
```

### Produits Exemple - Laine

```php
// Produit 1 : Pelote laine mérinos
[
    'name' => 'Laine Mérinos Superwash 100g',
    'description' => 'Pelote de laine mérinos superwash, douce et facile d\'entretien. Idéale pour vêtements et accessoires.',
    'price' => 8.50,
    'category' => 'Laine > Laine mérinos',
    'attributes' => [
        'Poids' => '100g',
        'Couleur' => ['Blanc écru', 'Gris chiné', 'Bleu océan', 'Rouge cardinal'],
        'Épaisseur' => 'DK'
    ],
    'features' => [
        'Composition' => '100% Laine Mérinos',
        'Métrage' => '210m / 100g',
        'Aiguilles recommandées' => '4-4.5mm',
        'Lavable en machine' => 'Oui (30°C)'
    ]
]
```

---

## 🎯 Objectifs de Performance

### Temps de Chargement
- Page d'accueil : < 2 secondes
- Page catégorie : < 2.5 secondes
- Page produit : < 3 secondes

### SEO
- Score Google PageSpeed : > 80
- URLs optimisées (slug courts et descriptifs)
- Sitemap XML généré automatiquement
- Balises meta complètes

### UX
- Navigation intuitive en maximum 3 clics
- Responsive design parfait sur mobile
- Filtres produits fonctionnels
- Recherche efficace

---

## 📞 Support et Documentation

### Ressources PrestaShop
- Documentation officielle : https://doc.prestashop.com/
- Forum communauté : https://www.prestashop.com/forums/
- GitHub : https://github.com/PrestaShop/PrestaShop

### Commandes Git Utiles

```bash
# Initialiser le projet
git init
git add .
git commit -m "Initial commit - Viviane Boutique"

# Créer une branche de développement
git checkout -b develop

# Sauvegarder régulièrement
git add .
git commit -m "Description des modifications"
```

---

## ✅ Résumé des Livrables

À la fin du développement, vous aurez :

1. **Site PrestaShop fonctionnel** avec thème personnalisé "viviane-theme"
2. **Structure de catégories** complète pour les 4 activités
3. **Module custom** avec guide des tailles pour lingerie
4. **Intégration PayPal** fonctionnelle en mode test
5. **Design responsive** optimisé mobile
6. **Back-office** configuré en français
7. **Documentation complète** d'installation et maintenance

---

**Prêt pour le développement avec Claude Code ! 🚀**

*Ce document doit être fourni à Claude Code pour développer le site Viviane Boutique selon les spécifications détaillées ci-dessus.*
