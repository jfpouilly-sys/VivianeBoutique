<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>{block name='head_seo_title'}{$page.meta.title}{/block}</title>
<meta name="description" content="{block name='head_seo_description'}{$page.meta.description}{/block}">
<meta name="keywords" content="{block name='head_seo_keywords'}{$page.meta.keywords}{/block}">

{if $page.canonical}
  <link rel="canonical" href="{$page.canonical}">
{/if}

{block name='head_hreflang'}
{/block}

{block name='head_microdata'}
{/block}

{block name='head_microdata_special'}
{/block}

{* Google Fonts : Montserrat et Playfair Display *}
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Playfair+Display:wght@400;600;700&display=swap" rel="stylesheet">

{* Material Icons pour les icones *}
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

{block name='stylesheets'}
  {include file="_partials/stylesheets.tpl" stylesheets=$stylesheets}
{/block}

{block name='javascript_head'}
  {include file="_partials/javascript.tpl" javascript=$javascript.head}
{/block}

{* Favicon *}
<link rel="icon" type="image/x-icon" href="{$shop.favicon}">

{hook h='displayHeader'}
