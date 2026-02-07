{if $breadcrumb.links}
  <nav aria-label="Fil d'Ariane" class="breadcrumb-nav">
    <ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList">
      {foreach from=$breadcrumb.links item=path name=breadcrumb}
        <li class="breadcrumb-item{if $smarty.foreach.breadcrumb.last} active{/if}"
            itemprop="itemListElement"
            itemscope
            itemtype="http://schema.org/ListItem">
          {if !$smarty.foreach.breadcrumb.last}
            <a itemprop="item" href="{$path.url}">
              <span itemprop="name">{$path.title}</span>
            </a>
          {else}
            <span itemprop="name">{$path.title}</span>
          {/if}
          <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
        </li>
      {/foreach}
    </ol>
  </nav>
{/if}
