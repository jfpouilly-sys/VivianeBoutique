<div class="product-price-and-shipping">
  {block name='product_price'}
    <div class="product-prices">
      {if $product.has_discount}
        <span class="regular-price">{$product.regular_price}</span>
        <span class="discount-percentage">{$product.discount_percentage_absolute}</span>
      {/if}
      <span class="current-price">
        <span itemprop="price" content="{$product.price_amount}">{$product.price}</span>
      </span>
    </div>
  {/block}

  {block name='product_tax'}
    {if $product.price_tax_exc != $product.price_amount}
      <p class="product-price-tax">
        {$product.price_tax_exc} HT
      </p>
    {/if}
  {/block}

  {block name='product_unit_price'}
    {if $product.unit_price_full}
      <p class="product-unit-price">
        ({$product.unit_price_full})
      </p>
    {/if}
  {/block}
</div>
