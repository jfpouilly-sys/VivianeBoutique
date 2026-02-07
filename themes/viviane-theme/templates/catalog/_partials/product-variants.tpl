{if $groups}
  <div class="product-variants">
    {foreach from=$groups key=id_attribute_group item=group}
      <div class="product-variant-group">
        <label class="variant-label">{$group.name}</label>

        {if $group.group_type == 'select'}
          <select id="group_{$id_attribute_group}"
                  class="form-control form-control-select"
                  name="group[{$id_attribute_group}]">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <option value="{$id_attribute}"
                      title="{$group_attribute.name}"
                      {if $group_attribute.selected} selected="selected"{/if}>
                {$group_attribute.name}
              </option>
            {/foreach}
          </select>
        {elseif $group.group_type == 'color'}
          <ul class="color-picker">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <li class="color-item{if $group_attribute.selected} active{/if}">
                <input type="radio"
                       name="group[{$id_attribute_group}]"
                       value="{$id_attribute}"
                       {if $group_attribute.selected} checked="checked"{/if}>
                <span class="color-swatch"
                      style="background-color: {$group_attribute.html_color_code}"
                      title="{$group_attribute.name}"></span>
              </li>
            {/foreach}
          </ul>
        {elseif $group.group_type == 'radio'}
          <ul class="radio-picker">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <li class="radio-item{if $group_attribute.selected} active{/if}">
                <label>
                  <input type="radio"
                         name="group[{$id_attribute_group}]"
                         value="{$id_attribute}"
                         {if $group_attribute.selected} checked="checked"{/if}>
                  <span>{$group_attribute.name}</span>
                </label>
              </li>
            {/foreach}
          </ul>
        {/if}
      </div>
    {/foreach}
  </div>
{/if}
