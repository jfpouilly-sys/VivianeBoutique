<?php
/**
 * Script de création des attributs pour Viviane Boutique
 * PrestaShop 8.1.x
 *
 * UTILISATION :
 * 1. Copiez ce fichier dans le dossier racine de votre installation PrestaShop
 *    Exemple : C:\xampp\htdocs\viviane-boutique\create-attributes.php
 *
 * 2. Exécutez depuis la ligne de commande :
 *    cd C:\xampp\htdocs\viviane-boutique
 *    D:\ProgramFiles\xampp\php\php.exe create-attributes.php
 *
 * Le script doit se trouver à côté du dossier /config/ de PrestaShop.
 */

// Chemin vers le fichier de configuration PrestaShop
$configPath = dirname(__FILE__) . '/config/config.inc.php';

if (!file_exists($configPath)) {
    echo "ERREUR : Fichier de configuration PrestaShop introuvable !\n";
    echo "Chemin cherche : " . realpath(dirname(__FILE__)) . DIRECTORY_SEPARATOR . "config" . DIRECTORY_SEPARATOR . "config.inc.php\n\n";
    echo "SOLUTION :\n";
    echo "1. Copiez ce fichier dans le dossier RACINE de votre installation PrestaShop\n";
    echo "   (le meme dossier qui contient le sous-dossier 'config')\n";
    echo "2. Puis executez : php create-attributes.php\n";
    exit(1);
}

require_once $configPath;

echo "=== Création des attributs Viviane Boutique ===\n\n";

// =========================================
// GROUPE : Taille Lingerie
// =========================================
$sizeGroupLingerie = new AttributeGroup();
$sizeGroupLingerie->name = array(1 => 'Taille Lingerie');
$sizeGroupLingerie->public_name = array(1 => 'Taille');
$sizeGroupLingerie->group_type = 'select';
$sizeGroupLingerie->add();

$sizesLingerie = ['80A', '80B', '80C', '85A', '85B', '85C',
                  '90A', '90B', '90C', '95A', '95B', '95C',
                  '100A', '100B', '100C'];

foreach ($sizesLingerie as $position => $size) {
    $attribute = new Attribute();
    $attribute->id_attribute_group = $sizeGroupLingerie->id;
    $attribute->name = array(1 => $size);
    $attribute->position = $position;
    $attribute->add();
}

echo "Tailles lingerie créées : " . count($sizesLingerie) . " valeurs\n";

// =========================================
// GROUPE : Taille Vêtements (internationales)
// =========================================
$sizeGroupClothing = new AttributeGroup();
$sizeGroupClothing->name = array(1 => 'Taille Vêtement');
$sizeGroupClothing->public_name = array(1 => 'Taille');
$sizeGroupClothing->group_type = 'select';
$sizeGroupClothing->add();

$sizesClothing = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];

foreach ($sizesClothing as $position => $size) {
    $attribute = new Attribute();
    $attribute->id_attribute_group = $sizeGroupClothing->id;
    $attribute->name = array(1 => $size);
    $attribute->position = $position;
    $attribute->add();
}

echo "Tailles vêtements créées : " . count($sizesClothing) . " valeurs\n";

// =========================================
// GROUPE : Taille française
// =========================================
$sizeGroupFR = new AttributeGroup();
$sizeGroupFR->name = array(1 => 'Taille FR');
$sizeGroupFR->public_name = array(1 => 'Taille (FR)');
$sizeGroupFR->group_type = 'select';
$sizeGroupFR->add();

$sizesFR = ['34', '36', '38', '40', '42', '44', '46'];

foreach ($sizesFR as $position => $size) {
    $attribute = new Attribute();
    $attribute->id_attribute_group = $sizeGroupFR->id;
    $attribute->name = array(1 => $size);
    $attribute->position = $position;
    $attribute->add();
}

echo "Tailles françaises créées : " . count($sizesFR) . " valeurs\n";

// =========================================
// GROUPE : Couleur
// =========================================
$colorGroup = new AttributeGroup();
$colorGroup->name = array(1 => 'Couleur');
$colorGroup->public_name = array(1 => 'Couleur');
$colorGroup->group_type = 'color';
$colorGroup->add();

$colors = [
    ['name' => 'Noir', 'color' => '#000000'],
    ['name' => 'Blanc', 'color' => '#FFFFFF'],
    ['name' => 'Nude', 'color' => '#E8B298'],
    ['name' => 'Rouge', 'color' => '#D4366B'],
    ['name' => 'Bleu marine', 'color' => '#2C3E50'],
    ['name' => 'Rose', 'color' => '#FFB6C1'],
    ['name' => 'Rose poudré', 'color' => '#E8C4C4'],
    ['name' => 'Gris', 'color' => '#808080'],
    ['name' => 'Gris chiné', 'color' => '#A9A9A9'],
    ['name' => 'Beige', 'color' => '#F5F5DC'],
    ['name' => 'Bleu', 'color' => '#3498DB'],
    ['name' => 'Vert', 'color' => '#27AE60'],
    ['name' => 'Blanc écru', 'color' => '#FAEBD7'],
    ['name' => 'Rouge cardinal', 'color' => '#C41E3A'],
    ['name' => 'Bleu océan', 'color' => '#006994'],
    ['name' => 'Vert forêt', 'color' => '#228B22'],
    ['name' => 'Jaune moutarde', 'color' => '#FFDB58'],
];

foreach ($colors as $position => $colorData) {
    $attribute = new Attribute();
    $attribute->id_attribute_group = $colorGroup->id;
    $attribute->name = array(1 => $colorData['name']);
    $attribute->color = $colorData['color'];
    $attribute->position = $position;
    $attribute->add();
}

echo "Couleurs créées : " . count($colors) . " valeurs\n";

// =========================================
// GROUPE : Poids pelote (Laine)
// =========================================
$yarnWeightGroup = new AttributeGroup();
$yarnWeightGroup->name = array(1 => 'Poids pelote');
$yarnWeightGroup->public_name = array(1 => 'Poids');
$yarnWeightGroup->group_type = 'select';
$yarnWeightGroup->add();

$yarnWeights = ['25g', '50g', '100g', '200g'];

foreach ($yarnWeights as $position => $weight) {
    $attribute = new Attribute();
    $attribute->id_attribute_group = $yarnWeightGroup->id;
    $attribute->name = array(1 => $weight);
    $attribute->position = $position;
    $attribute->add();
}

echo "Poids pelote créés : " . count($yarnWeights) . " valeurs\n";

// =========================================
// GROUPE : Composition laine
// =========================================
$yarnCompoGroup = new AttributeGroup();
$yarnCompoGroup->name = array(1 => 'Composition laine');
$yarnCompoGroup->public_name = array(1 => 'Composition');
$yarnCompoGroup->group_type = 'select';
$yarnCompoGroup->add();

$yarnCompositions = [
    '100% Laine',
    '100% Coton',
    '70% Laine 30% Acrylique',
    '50% Alpaga 50% Laine',
    '100% Mérinos',
    '100% Acrylique',
    '80% Coton 20% Polyester',
];

foreach ($yarnCompositions as $position => $composition) {
    $attribute = new Attribute();
    $attribute->id_attribute_group = $yarnCompoGroup->id;
    $attribute->name = array(1 => $composition);
    $attribute->position = $position;
    $attribute->add();
}

echo "Compositions laine créées : " . count($yarnCompositions) . " valeurs\n";

// =========================================
// GROUPE : Épaisseur fil (Laine)
// =========================================
$yarnThicknessGroup = new AttributeGroup();
$yarnThicknessGroup->name = array(1 => 'Épaisseur fil');
$yarnThicknessGroup->public_name = array(1 => 'Épaisseur');
$yarnThicknessGroup->group_type = 'select';
$yarnThicknessGroup->add();

$yarnThickness = ['Lace', 'Fingering', 'Sport', 'DK', 'Worsted', 'Bulky', 'Super Bulky'];

foreach ($yarnThickness as $position => $thickness) {
    $attribute = new Attribute();
    $attribute->id_attribute_group = $yarnThicknessGroup->id;
    $attribute->name = array(1 => $thickness);
    $attribute->position = $position;
    $attribute->add();
}

echo "Épaisseurs fil créées : " . count($yarnThickness) . " valeurs\n";

// =========================================
// GROUPE : Type de bonnet (Lingerie)
// =========================================
$cupTypeGroup = new AttributeGroup();
$cupTypeGroup->name = array(1 => 'Type de bonnet');
$cupTypeGroup->public_name = array(1 => 'Type');
$cupTypeGroup->group_type = 'select';
$cupTypeGroup->add();

$cupTypes = ['Avec armatures', 'Sans armatures', 'Push-up', 'Minimiseur'];

foreach ($cupTypes as $position => $type) {
    $attribute = new Attribute();
    $attribute->id_attribute_group = $cupTypeGroup->id;
    $attribute->name = array(1 => $type);
    $attribute->position = $position;
    $attribute->add();
}

echo "Types de bonnet créés : " . count($cupTypes) . " valeurs\n";

echo "\n=== Tous les attributs ont été créés avec succès ! ===\n";
