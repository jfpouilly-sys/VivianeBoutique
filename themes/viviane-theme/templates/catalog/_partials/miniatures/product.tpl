<article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}">
  <div class="product-thumbnail">
    <a href="{$product.url}" class="thumbnail product-thumbnail">
      {if $product.cover}
        <img src="{$product.cover.medium.url}"
             alt="{$product.cover.legend}"
             loading="lazy">
      {/if}
    </a>

    {block name='product_flags'}
      <div class="product-flags">
        {foreach from=$product.flags item=flag}
          <span class="product-flag {$flag.type}">{$flag.label}</span>
        {/foreach}
      </div>
    {/block}
  </div>

  <div class="product-description-box">
    {block name='product_name'}
      <h3 class="product-title">
        <a href="{$product.url}">{$product.name}</a>
      </h3>
    {/block}

    {block name='product_price_and_shipping'}
      <div class="product-price-and-shipping">
        {if $product.has_discount}
          <span class="regular-price">{$product.regular_price}</span>
        {/if}
        <span class="price">{$product.price}</span>
      </div>
    {/block}

    {block name='product_reviews'}
      {hook h='displayProductListReviews' product=$product}
    {/block}
  </div>
</article>
