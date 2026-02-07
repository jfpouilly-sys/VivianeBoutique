<?php
/**
 * Configuration PayPal pour Viviane Boutique
 *
 * IMPORTANT : Ne jamais commiter les identifiants de production.
 * Utiliser des variables d'environnement en production.
 */

// En mode TEST (Sandbox)
define('PAYPAL_MODE', 'sandbox'); // Changer en 'live' pour production
define('PAYPAL_CLIENT_ID_SANDBOX', 'VOTRE_CLIENT_ID_SANDBOX');
define('PAYPAL_SECRET_SANDBOX', 'VOTRE_SECRET_SANDBOX');

// En mode PRODUCTION (à configurer avant mise en ligne)
define('PAYPAL_CLIENT_ID_LIVE', '');
define('PAYPAL_SECRET_LIVE', '');

// Options
define('PAYPAL_CURRENCY', 'EUR');
define('PAYPAL_LOCALE', 'fr_FR');
