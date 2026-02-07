{block name='header_banner'}
  <div class="header-banner">
    <div class="container">
      <p>Livraison gratuite dès 50€ d'achat | Viviane Boutique - Lingerie, Prêt-à-porter, Laine & Mercerie</p>
    </div>
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
      <div class="row align-items-center">
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

{block name='header_menu'}
  <nav class="main-menu">
    <div class="container">
      <ul class="menu-list">
        <li class="menu-item">
          <a href="{$urls.base_url}">Accueil</a>
        </li>
        <li class="menu-item dropdown">
          <a href="#" class="dropdown-toggle">Lingerie</a>
          <ul class="dropdown-menu">
            <li><a href="#">Soutiens-gorge</a></li>
            <li><a href="#">Culottes</a></li>
            <li><a href="#">Ensembles</a></li>
            <li><a href="#">Nuisettes & Déshabillés</a></li>
            <li><a href="#">Pyjamas</a></li>
          </ul>
        </li>
        <li class="menu-item dropdown">
          <a href="#" class="dropdown-toggle">Prêt-à-porter</a>
          <ul class="dropdown-menu">
            <li><a href="#">Femme</a></li>
            <li><a href="#">Homme</a></li>
            <li><a href="#">Accessoires</a></li>
          </ul>
        </li>
        <li class="menu-item dropdown">
          <a href="#" class="dropdown-toggle">Laine & Tricot</a>
          <ul class="dropdown-menu">
            <li><a href="#">Laine</a></li>
            <li><a href="#">Aiguilles à tricoter</a></li>
            <li><a href="#">Crochets</a></li>
            <li><a href="#">Patrons & Livres</a></li>
          </ul>
        </li>
        <li class="menu-item dropdown">
          <a href="#" class="dropdown-toggle">Mercerie</a>
          <ul class="dropdown-menu">
            <li><a href="#">Fils à coudre</a></li>
            <li><a href="#">Boutons</a></li>
            <li><a href="#">Fermetures éclair</a></li>
            <li><a href="#">Rubans & Dentelles</a></li>
          </ul>
        </li>
        <li class="menu-item">
          <a href="#">Promotions</a>
        </li>
      </ul>
    </div>
  </nav>
{/block}
