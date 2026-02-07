<div class="container">
  <div class="row">
    {* Colonne 1 : A propos *}
    <div class="col-md-3 col-sm-6">
      <h4>Viviane Boutique</h4>
      <p>Votre boutique en ligne de lingerie, prêt-à-porter, laine et mercerie. Qualité et élégance depuis notre création.</p>
      <div class="social-links">
        {hook h='displaySocialFollow'}
      </div>
    </div>

    {* Colonne 2 : Categories *}
    <div class="col-md-3 col-sm-6">
      <h4>Nos rayons</h4>
      <ul>
        <li><a href="#">Lingerie</a></li>
        <li><a href="#">Prêt-à-porter</a></li>
        <li><a href="#">Laine & Tricot</a></li>
        <li><a href="#">Mercerie</a></li>
        <li><a href="#">Promotions</a></li>
      </ul>
    </div>

    {* Colonne 3 : Informations *}
    <div class="col-md-3 col-sm-6">
      <h4>Informations</h4>
      <ul>
        <li><a href="#">Livraison</a></li>
        <li><a href="#">Retours & Échanges</a></li>
        <li><a href="#">Conditions Générales de Vente</a></li>
        <li><a href="#">Politique de Confidentialité</a></li>
        <li><a href="#">Mentions Légales</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </div>

    {* Colonne 4 : Newsletter *}
    <div class="col-md-3 col-sm-6">
      <h4>Newsletter</h4>
      <p>Recevez nos offres et nouveautés en avant-première !</p>
      {hook h='displayFooterBefore'}
      <div class="newsletter-form">
        <input type="email" placeholder="Votre adresse email" aria-label="Adresse email pour la newsletter">
        <button type="submit">OK</button>
      </div>
      {hook h='displayEmailSubscription'}
    </div>
  </div>

  {* Barre de paiement *}
  <div class="row">
    <div class="col-md-12 text-center" style="margin-top: 30px;">
      <p style="opacity: 0.7; font-size: 14px;">
        Paiement sécurisé par PayPal | Livraison en France Métropolitaine
      </p>
    </div>
  </div>

  {* Copyright *}
  <div class="footer-bottom">
    <p>&copy; {$smarty.now|date_format:'%Y'} Viviane Boutique - Tous droits réservés</p>
  </div>
</div>

{hook h='displayFooter'}
