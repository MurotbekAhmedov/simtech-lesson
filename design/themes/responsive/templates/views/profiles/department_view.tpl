
<div class="ty-feature">
<div class="ty-feature__name ty-wysiwyg-content">

       {__("Department")}: {$department_data.department_name nofilter}
    </div>
    <div class="ty-feature__image">
       {include
                                            file="common/image.tpl"
                                             no_ids=true
                                             images=$department_data.main_pair
                                             image_id=$department_data.main_pair.image_id
                                             image_width=$settings.Thumbnails.product_lists_thumbnail_width
                                             image_height=$settings.Thumbnails.product_lists_thumbnail_height
                                            }
    </div>

    <br>
    <div class="ty-feature__description ty-wysiwyg-content">

       {__("description")}: {$department_data.description nofilter}
    </div>
     <br>
        <div class="ty-feature__description ty-wysiwyg-content">

            <a href="{"profiles.department?department_id={$department_data.department_id}"|fn_url}" class="product-title" title="{$department_data.department}">{__("addons.rus_payments.supervisor")}:
                                                {foreach $admins as $key => $value}
                                                {if $value.user_id == $department_data.admin_id}
                                                {$value.firstname} {$value.lastname}
                                                {/if}
                                                {/foreach}
                                                </a>
        </div>

        <br>
         <div class="ty-feature__description ty-wysiwyg-content">

            <a href="{"profiles.department?department_id={$department_data.department_id}"|fn_url}" class="product-title" title="{$department_data.department}">{__("customers")}:
                                                {foreach $pieces as $key => $value}
                                                 <div class="ty-feature__description ty-wysiwyg-content">
                                                {foreach $admins as $klyuch => $znachenie}
                                                {if $value == $znachenie.user_id}

                                                    {$znachenie.firstname} {$znachenie.lastname}


                                                {/if}
                                                {/foreach}
                                                 </div>
                                                {/foreach}

                                                </a>
        </div>

</div>


