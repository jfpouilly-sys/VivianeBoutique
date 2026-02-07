{* Activation produit - message pour les produits desactives en mode preview *}
{if isset($product.active) && !$product.active}
  <div class="alert alert-warning" role="alert">
    <i class="material-icons">visibility_off</i>
    Ce produit n'est pas visible par vos clients.
  </div>
{/if}
