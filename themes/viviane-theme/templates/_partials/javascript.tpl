{if isset($javascript) && $javascript}
  {foreach from=$javascript item=js}
    {if isset($js.server) && $js.server == 'remote'}
      <script src="{$js.uri}" {if isset($js.attribute)}{$js.attribute}{/if}></script>
    {else}
      <script src="{$js.uri}" {if isset($js.attribute)}{$js.attribute}{/if}></script>
    {/if}
  {/foreach}
{/if}
