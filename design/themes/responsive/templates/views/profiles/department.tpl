{if $department}

    {script src="js/tygh/exceptions.js"}



        {include file="common/pagination.tpl"}


    {if !$show_empty}
        {split data=$department size=$columns|default:"2" assign="splitted_department"}
    {else}
        {split data=$department size=$columns|default:"2" assign="splitted_department" skip_complete=true}
    {/if}

    {math equation="100 / x" x=$columns|default:"2" assign="cell_width"}

    {* FIXME: Don't move this file *}
    {script src="js/tygh/product_image_gallery.js"}


    <div class="grid-list">
        {strip}
            {foreach from=$splitted_department item="sdepartment" }
                {foreach from=$sdepartment item="departmen"}
                    <div class="ty-column{$columns}">
                        {if $departmen}
                            {assign var="obj_id" value=$departmen.department_id}
                            {assign var="obj_id_prefix" value="`$obj_prefix``$departmen.department_id`"}


                            <div class="ty-grid-list__item ty-quick-view-button__wrapper>
                                        <div class="ty-grid-list__image">
                                          <a href="{"profiles.department_view?department_id={$departmen.department_id}"|fn_url}">
                                            {include
                                            file="common/image.tpl"
                                             no_ids=true
                                             images=$departmen.main_pair
                                             image_id=$departmen.main_pair.image_id
                                             image_width=$settings.Thumbnails.product_lists_thumbnail_width
                                             image_height=$settings.Thumbnails.product_lists_thumbnail_height
                                            }

                                          </a>
                                        </div>
                                        <div class="ty-grid-list__item-name">
                                            <bdi>
                                                <a href="{"profiles.department_view?department_id={$departmen.department_id}"|fn_url}" class="product-title" title="{$departmen.department}">{__("Department")}:{$departmen.department_name}</a>
                                            </bdi>
                            </div>
                             <div class="ty-grid-list__item-name">
                                            <bdi>
                                                <a href="{"profiles.department_view?department_id={$departmen.department_id}"|fn_url}" class="product-title" title="{$departmen.department}">{__("addons.rus_payments.supervisor")}:
                                                {foreach $admins as $key => $value}
                                                {if $value.user_id == $departmen.admin_id}
                                                {$value.firstname} {$value.lastname}
                                                {/if}
                                                {/foreach}
                                                </a>
                                            </bdi>
                            </div>



                        {/if}
                    </div>
                {/foreach}

            {/foreach}
        {/strip}
    </div>

    {if !$no_pagination}
        {include file="common/pagination.tpl"}
    {/if}

{/if}

{capture name="mainbox_title"}{$title}{/capture}