<div class="product-tabs">
  <ul class="nav nav-tabs" role="tablist">
    {if $product.description}
      <li class="nav-item">
        <a class="nav-link active"
           data-toggle="tab"
           href="#description"
           role="tab"
           aria-controls="description"
           aria-selected="true">
          Description
        </a>
      </li>
    {/if}

    {if $product.features}
      <li class="nav-item">
        <a class="nav-link"
           data-toggle="tab"
           href="#product-details"
           role="tab"
           aria-controls="product-details"
           aria-selected="false">
          Caractéristiques
        </a>
      </li>
    {/if}

    <li class="nav-item">
      <a class="nav-link"
         data-toggle="tab"
         href="#delivery"
         role="tab"
         aria-controls="delivery"
         aria-selected="false">
        Livraison
      </a>
    </li>
  </ul>

  <div class="tab-content">
    {if $product.description}
      <div class="tab-pane fade show active" id="description" role="tabpanel">
        <div class="product-description">
          {$product.description nofilter}
        </div>
      </div>
    {/if}

    {if $product.features}
      <div class="tab-pane fade" id="product-details" role="tabpanel">
        <table class="table table-striped">
          {foreach from=$product.features item=feature}
            <tr>
              <td class="feature-name"><strong>{$feature.name}</strong></td>
              <td class="feature-value">{$feature.value}</td>
            </tr>
          {/foreach}
        </table>
      </div>
    {/if}

    <div class="tab-pane fade" id="delivery" role="tabpanel">
      <div class="delivery-info">
        <h4>Informations de livraison</h4>
        <ul>
          <li><strong>France Métropolitaine :</strong> Livraison en 3-5 jours ouvrés</li>
          <li><strong>Livraison gratuite</strong> dès 50€ d'achat</li>
          <li><strong>Colissimo suivi</strong> avec numéro de suivi</li>
          <li><strong>Retours gratuits</strong> sous 14 jours</li>
        </ul>

        <h4>Entretien</h4>
        {if $product.category_name == 'Lingerie'}
          <ul>
            <li>Lavage à la main recommandé ou programme délicat 30°C</li>
            <li>Ne pas utiliser de sèche-linge</li>
            <li>Séchage à plat</li>
          </ul>
        {/if}
      </div>
    </div>
  </div>
</div>
