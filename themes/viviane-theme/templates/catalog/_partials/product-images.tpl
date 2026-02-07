<div class="product-images">
  {block name='product_cover'}
    <div class="product-cover">
      {if $product.cover}
        <img src="{$product.cover.large.url}"
             alt="{$product.cover.legend}"
             title="{$product.cover.legend}"
             loading="lazy"
             class="js-qv-product-cover">
      {/if}
    </div>
  {/block}

  {block name='product_images'}
    <div class="product-thumbs js-qv-product-images">
      {if $product.images|count > 1}
        {foreach from=$product.images item=image}
          <img src="{$image.medium.url}"
               alt="{$image.legend}"
               title="{$image.legend}"
               class="thumb js-thumb{if $image.id_image == $product.cover.id_image} active{/if}"
               data-image-large-src="{$image.large.url}"
               loading="lazy">
        {/foreach}
      {/if}
    </div>
  {/block}
</div>
