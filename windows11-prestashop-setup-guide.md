# Guide d'Installation PrestaShop sur Windows 11
## Guide Complet pour Environnement de Test Local

---

## 📋 Prérequis

Avant de commencer, vous aurez besoin de :
- Windows 11
- Droits administrateur sur votre machine
- Connexion Internet
- Environ 2 GB d'espace disque libre

---

## 🔧 Étape 1 : Installation de XAMPP

XAMPP est un bundle qui inclut Apache (serveur web), MySQL (base de données) et PHP - tout ce dont PrestaShop a besoin.

### Téléchargement
1. Allez sur https://www.apachefriends.org/
2. Téléchargez XAMPP pour Windows (version 8.1 ou 8.2 recommandée)
3. Taille du fichier : environ 150 MB

### Installation
1. Exécutez le fichier `.exe` téléchargé
2. Si Windows Defender ou UAC affiche un avertissement, cliquez sur "Oui"
3. Sélectionnez les composants à installer :
   - ✅ Apache
   - ✅ MySQL
   - ✅ PHP
   - ✅ phpMyAdmin
   - ⬜ Perl (non nécessaire)
   - ⬜ Tomcat (non nécessaire)

4. Choisissez le dossier d'installation : `C:\xampp` (par défaut, recommandé)
5. Décochez "Learn more about Bitnami"
6. Cliquez sur "Next" puis "Finish"

### Configuration du Pare-feu
Lors du premier lancement d'Apache et MySQL, Windows Firewall demandera l'autorisation :
- ✅ Autorisez l'accès pour les réseaux privés
- ⬜ Réseaux publics (non nécessaire pour test local)

---

## 🚀 Étape 2 : Démarrage de XAMPP

1. Lancez le "XAMPP Control Panel" (depuis le menu Démarrer)
2. Cliquez sur "Start" pour :
   - **Apache** (serveur web)
   - **MySQL** (base de données)

3. Les modules devraient afficher un fond vert avec "Running"

### Vérification
- Ouvrez votre navigateur
- Allez sur : `http://localhost`
- Vous devriez voir la page d'accueil XAMPP

---

## 🗄️ Étape 3 : Création de la Base de Données

1. Dans votre navigateur, allez sur : `http://localhost/phpmyadmin`
2. Cliquez sur "Nouvelle base de données" (ou "New" en anglais)
3. Nom de la base : **viviane_boutique**
4. Interclassement : **utf8mb4_general_ci**
5. Cliquez sur "Créer"

### Création d'un Utilisateur (Recommandé)
1. Dans phpMyAdmin, cliquez sur l'onglet "Comptes utilisateurs"
2. Cliquez sur "Ajouter un compte d'utilisateur"
3. Remplissez :
   - Nom d'utilisateur : **prestashop_user**
   - Nom d'hôte : **localhost**
   - Mot de passe : **VotreMotDePasseSecurise123!**
   - Cochez "Créer une base portant son nom et donner à cet utilisateur tous les privilèges sur cette base"
4. Faites défiler et cochez "Tout cocher" dans la section "Privilèges globaux"
5. Cliquez sur "Exécuter"

**Notez ces informations, vous en aurez besoin !**

---

## 📥 Étape 4 : Téléchargement de PrestaShop

### Option A : Téléchargement Direct (Recommandé)
1. Allez sur : https://www.prestashop.com/fr/telecharger
2. Téléchargez la dernière version stable (8.1.x actuellement)
3. Format : fichier ZIP

### Option B : Via GitHub
```bash
git clone https://github.com/PrestaShop/PrestaShop.git
```

---

## 📂 Étape 5 : Installation des Fichiers PrestaShop

1. **Décompressez** le fichier ZIP téléchargé
2. **Renommez** le dossier décompressé en **viviane-boutique**
3. **Déplacez** ce dossier dans : `C:\xampp\htdocs\`

Le chemin final doit être : `C:\xampp\htdocs\viviane-boutique\`

### Permissions (Important pour Windows 11)
1. Faites un clic droit sur le dossier `viviane-boutique`
2. Propriétés → Sécurité → Modifier
3. Assurez-vous que "Utilisateurs" a les permissions :
   - ✅ Lecture et exécution
   - ✅ Affichage du contenu du dossier
   - ✅ Lecture
   - ✅ Écriture

---

## 🎨 Étape 6 : Configuration PHP pour PrestaShop

1. Ouvrez le fichier : `C:\xampp\php\php.ini` avec un éditeur de texte
2. Recherchez et modifiez les lignes suivantes (Ctrl+F pour chercher) :

```ini
; Enlevez le point-virgule devant ces lignes pour les activer
extension=gd
extension=curl
extension=mbstring
extension=zip
extension=intl
extension=pdo_mysql

; Augmentez ces limites
memory_limit = 256M
upload_max_filesize = 20M
post_max_size = 20M
max_execution_time = 300
```

3. **Sauvegardez** le fichier
4. **Redémarrez Apache** dans le XAMPP Control Panel (Stop puis Start)

---

## 🌐 Étape 7 : Lancement de l'Installation PrestaShop

1. Ouvrez votre navigateur
2. Allez sur : `http://localhost/viviane-boutique/`
3. L'assistant d'installation PrestaShop devrait démarrer automatiquement

### Informations à Renseigner

#### 🇫🇷 Langue et Pays
- Langue : **Français**
- Pays : **France** (ou votre pays)

#### 📋 Informations de la Boutique
- Nom de la boutique : **Viviane Boutique**
- Activité : **Mode et accessoires**
- Prénom : Votre prénom
- Nom : Votre nom
- Email : votre.email@exemple.com
- Mot de passe : (mot de passe fort pour le back-office)

#### 🗄️ Configuration de la Base de Données
- Serveur de base de données : **localhost** ou **127.0.0.1**
- Nom de la base : **viviane_boutique**
- Identifiant : **prestashop_user** (ou root si vous n'avez pas créé d'utilisateur)
- Mot de passe : **VotreMotDePasseSecurise123!** (ou laissez vide si root)
- Préfixe des tables : **ps_** (par défaut)

#### 📦 Installation du Contenu
- Cochez "Installer les données de démonstration" pour avoir des exemples de produits
- Vous pourrez les supprimer plus tard

4. Cliquez sur **"Installer maintenant"**

L'installation prendra 5-10 minutes.

---

## 🔒 Étape 8 : Sécurisation Post-Installation

### IMPORTANT : Après l'installation réussie

1. **Supprimez le dossier d'installation** :
   - Allez dans : `C:\xampp\htdocs\viviane-boutique\`
   - Supprimez le dossier **install**

2. **Renommez le dossier admin** (pour la sécurité) :
   - Le dossier s'appelle quelque chose comme `adminXXXXXXXXX`
   - Renommez-le en quelque chose d'unique, par exemple : `admin-vb2024`
   - **Notez ce nouveau nom !**

---

## 🎯 Étape 9 : Accès à Votre Site

### Front-Office (Ce que vos clients verront)
```
http://localhost/viviane-boutique/
```

### Back-Office (Administration)
```
http://localhost/viviane-boutique/admin-vb2024/
```
(Remplacez `admin-vb2024` par le nom que vous avez choisi)

Connectez-vous avec l'email et le mot de passe que vous avez créés lors de l'installation.

---

## 🛠️ Dépannage

### Apache ne démarre pas
**Problème** : Le port 80 est déjà utilisé (souvent par Skype ou IIS)

**Solution** :
1. XAMPP Control Panel → Cliquez sur "Config" à côté d'Apache
2. Sélectionnez "httpd.conf"
3. Recherchez `Listen 80` et remplacez par `Listen 8080`
4. Recherchez `ServerName localhost:80` et remplacez par `ServerName localhost:8080`
5. Sauvegardez et redémarrez Apache
6. Votre site sera accessible sur : `http://localhost:8080/viviane-boutique/`

### MySQL ne démarre pas
**Problème** : Le port 3306 est déjà utilisé

**Solution** :
1. Vérifiez si un autre service MySQL est déjà installé
2. Ou changez le port MySQL dans XAMPP Config

### Page blanche après installation
1. Vérifiez que mod_rewrite est activé dans Apache
2. Vérifiez les permissions du dossier
3. Consultez les logs : `C:\xampp\apache\logs\error.log`

### Erreurs de mémoire PHP
Augmentez `memory_limit` dans `php.ini` à 512M

---

## 📚 Commandes Utiles

### Vérifier la version PHP
Créez un fichier `info.php` dans `C:\xampp\htdocs\` avec :
```php
<?php
phpinfo();
?>
```
Puis allez sur : `http://localhost/info.php`

### Sauvegarder la base de données
1. Allez sur phpMyAdmin : `http://localhost/phpmyadmin`
2. Sélectionnez `viviane_boutique`
3. Cliquez sur "Exporter"
4. Laissez les options par défaut
5. Cliquez sur "Exécuter"

---

## ✅ Checklist Finale

- [ ] XAMPP installé et fonctionnel
- [ ] Apache et MySQL démarrés (verts dans XAMPP)
- [ ] Base de données créée
- [ ] Fichiers PrestaShop dans htdocs
- [ ] PHP.ini configuré
- [ ] PrestaShop installé avec succès
- [ ] Dossier /install supprimé
- [ ] Dossier /admin renommé
- [ ] Accès au front-office et back-office fonctionnels

---

## 🎓 Prochaines Étapes

Maintenant que PrestaShop est installé, vous pouvez :
1. Utiliser Claude Code pour personnaliser votre thème
2. Configurer les moyens de paiement (PayPal, etc.)
3. Ajouter vos produits
4. Personnaliser le design

**Votre environnement de test est prêt !**

---

## 📞 Support

Si vous rencontrez des problèmes :
- Documentation PrestaShop : https://doc.prestashop.com/
- Forum XAMPP : https://community.apachefriends.org/
- Forum PrestaShop : https://www.prestashop.com/forums/

Bonne chance avec Viviane Boutique ! 🎉
