<div class="product-add-to-cart">
  {if $product.add_to_cart_url}
    <form action="{$urls.pages.cart}" method="post" class="add-to-cart-form">
      <input type="hidden" name="token" value="{$static_token}">
      <input type="hidden" name="id_product" value="{$product.id}">
      <input type="hidden" name="id_customization" value="{$product.id_customization}">

      {block name='product_quantity'}
        <div class="product-quantity">
          <label for="quantity_wanted">Quantité</label>
          <div class="qty-input">
            <button type="button" class="btn btn-touchspin js-touchspin-down">
              <i class="material-icons">remove</i>
            </button>
            <input type="number"
                   name="qty"
                   id="quantity_wanted"
                   value="{$product.quantity_wanted}"
                   class="input-group"
                   min="{$product.minimal_quantity}"
                   aria-label="Quantité">
            <button type="button" class="btn btn-touchspin js-touchspin-up">
              <i class="material-icons">add</i>
            </button>
          </div>
        </div>
      {/block}

      <button class="btn btn-primary add-to-cart"
              data-button-action="add-to-cart"
              type="submit"
              {if !$product.add_to_cart_url} disabled{/if}>
        <i class="material-icons">shopping_cart</i>
        Ajouter au panier
      </button>
    </form>
  {/if}

  {hook h='displayProductActions' product=$product}

  {* Disponibilite *}
  <div class="product-availability">
    {if $product.availability_message}
      <span class="availability {if $product.availability == 'available'}text-success{else}text-warning{/if}">
        <i class="material-icons">
          {if $product.availability == 'available'}check_circle{else}warning{/if}
        </i>
        {$product.availability_message}
      </span>
    {/if}
  </div>
</div>
