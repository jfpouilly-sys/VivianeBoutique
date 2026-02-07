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

        {* Bloc special pour conseils lingerie/mercerie *}
        {if $product.category_name == 'Lingerie'}
          <div class="product-care-tips">
            <h3>Guide des tailles</h3>
            {* Le guide des tailles est gere par le module vivianecustom *}
          </div>
        {/if}
      </div>
    </div>

    {* Onglets description, caracteristiques, etc. *}
    <div class="row">
      <div class="col-md-12">
        {block name='product_tabs'}
          {include file='catalog/_partials/product-tabs.tpl'}
        {/block}
      </div>
    </div>

    {* Produits associes *}
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
