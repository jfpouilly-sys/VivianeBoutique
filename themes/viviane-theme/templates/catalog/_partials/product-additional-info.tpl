<div class="product-additional-info">
  {* Livraison gratuite *}
  <div class="product-info-item">
    <i class="material-icons">local_shipping</i>
    <span>Livraison gratuite dès 50€</span>
  </div>

  {* Retours *}
  <div class="product-info-item">
    <i class="material-icons">replay</i>
    <span>Retours sous 14 jours</span>
  </div>

  {* Paiement securise *}
  <div class="product-info-item">
    <i class="material-icons">lock</i>
    <span>Paiement sécurisé PayPal</span>
  </div>

  {hook h='displayProductAdditionalInfo' product=$product}

  {* Partage social *}
  <div class="product-share">
    <span>Partager :</span>
    {hook h='displaySocialSharing' product=$product}
  </div>
</div>
