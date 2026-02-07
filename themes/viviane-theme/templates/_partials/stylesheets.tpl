{if isset($stylesheets) && $stylesheets}
  {foreach from=$stylesheets.external item=stylesheet}
    <link rel="stylesheet" href="{$stylesheet.uri}" type="text/css" media="{$stylesheet.media}">
  {/foreach}
  {foreach from=$stylesheets.inline item=stylesheet}
    <style>{$stylesheet.content}</style>
  {/foreach}
{/if}
