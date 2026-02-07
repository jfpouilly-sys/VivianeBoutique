<?php
/**
 * Configuration pour le marché français - Viviane Boutique
 *
 * Ce script configure PrestaShop pour le marché français.
 * À exécuter après l'installation de PrestaShop.
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
// Les taux seront configurés dans le back-office :
// - 20% : Taux normal (vêtements, lingerie, mercerie, laine)
// - 10% : Taux intermédiaire
// - 5.5% : Taux réduit (livres, patrons)
// - 2.1% : Taux super réduit

// Unités de mesure
Configuration::updateValue('PS_WEIGHT_UNIT', 'kg');
Configuration::updateValue('PS_DIMENSION_UNIT', 'cm');
Configuration::updateValue('PS_VOLUME_UNIT', 'L');

// RGPD - Conformité européenne
Configuration::updateValue('PS_CUSTOMER_OPTIN', 1); // Opt-in obligatoire
Configuration::updateValue('PS_CUSTOMER_BIRTHDATE', 0); // Date de naissance optionnelle

// SEO - URLs amicales
Configuration::updateValue('PS_REWRITING_SETTINGS', 1); // Activer URLs amicales
Configuration::updateValue('PS_ROUTE_product_rule', '{category:/}{rewrite}.html');
Configuration::updateValue('PS_ROUTE_category_rule', '{rewrite}');

// Nom de la boutique
Configuration::updateValue('PS_SHOP_NAME', 'Viviane Boutique');
Configuration::updateValue('PS_SHOP_EMAIL', 'contact@viviane-boutique.com');
