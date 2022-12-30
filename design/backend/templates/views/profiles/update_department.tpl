{if $department_data}
    {assign var="id" value=$department_data.department_id}
{else}
    {assign var="id" value=0}
{/if}


{capture name="mainbox"}

<form action="{""|fn_url}" method="post" class="form-horizontal form-edit" name="banners_form" enctype="multipart/form-data">
<input type="hidden" class="cm-no-hide-input" name="fake" value="1" />
<input type="hidden" class="cm-no-hide-input" name="department_id" value="{$id}" />


    <div id="content_general">

        <div class="control-group">
            <label for="elm_banner_name" class="control-label cm-required">{__("name")}</label>
            <div class="controls">
            <input type="text" name="department_data[department_name]" id="elm_banner_name" value="{$department_data.department_name}" size="25" class="input-large" /></div>
        </div>




                            {component name="configurable_page.field" entity="products" tab="detailed" section="information" field="images"}
                                <div class="control-group">
                                    <label class="control-label">{__("images")}:</label>
                                    <div class="controls">
                                        {include
                                            file="common/form_file_uploader.tpl"
                                            existing_pairs=(($department_data.main_pair) ? [$department_data.main_pair] : []) + $department_data.image_pairs|default:[]
                                            file_name="file"
                                            image_pair_types=['N' => 'product_add_additional_image', 'M' => 'product_main_image', 'A' => 'product_additional_image']
                                            allow_update_files=!$is_shared_product && $allow_update_files|default:true
                                        }
                                    </div>
                                </div>
                            {/component}


        <div class="control-group" id="banner_text">
            <label class="control-label" for="elm_banner_description">{__("description")}:</label>
            <div class="controls">
                <textarea id="elm_banner_description" name="department_data[description]" cols="35" rows="8" class="cm-wysiwyg input-large">{$department_data.description}</textarea>
            </div>
        </div>


        {include file="common/select_status.tpl" input_name="department_data[status]" id="elm_banner_status" obj_id=$id obj=$banner hidden=false}



    <div class="control-group">
            <label class="control-label">Руководитель</label>
            <div class="controls">
                {include file="views/profiles/picker-new.tpl"
                 but_text=__("add_recipients_from_users")
                  data_id="return_users" but_meta="btn"
                  input_name="department_data[admin_id]"
                   item_ids=$department_data.admin_id
                   placement="right"
                   display = "radio"
                   view_mode="single_button"
                   user_info=$u_info
                   }
                <p class="muted description">{__("tt_addons_newsletters_views_newsletters_update_users")}</p>
            </div>
        </div>
         <div class="control-group">
            <label class="control-label">{__("users")}</label>
            <div class="controls">
                {include file="pickers/users/picker.tpl"
                 but_text=__("add_recipients_from_users")
                  data_id="return_users" but_meta="btn"
                  input_name="department_data[user_id]"
                   item_ids=$department_data.user_id
                   placement="right"
                   user_info=$u_info_c
                   }
                <p class="muted description">{__("tt_addons_newsletters_views_newsletters_update_users")}</p>
            </div>
        </div>
    <!--content_general--></div>
     {if $id}

        {/if}

    {capture name="buttons"}
        {if !$id}

            {include file="buttons/save_cancel.tpl" but_role="submit-link" but_target_form="banners_form" but_name="dispatch[profiles.update_department]"}
        {else}

            {include file="buttons/save_cancel.tpl" but_name="dispatch[profiles.update_department]" but_role="submit-link" but_target_form="banners_form" hide_first_button=$hide_first_button hide_second_button=$hide_second_button save=$id}
            {capture name="tools_list"}
            <li>{btn type="list" text=__("delete") class="cm-confirm" href="profiles.delete_department?department_id=`$id`" method="POST"}</li>
            {/capture}
            {dropdown content=$smarty.capture.tools_list}
        {/if}
    {/capture}

</form>

{/capture}

{if !$id}
    {$title = "Добавить новый отдел"}
{else}
  {$title_start = "Изменить"}
  {$title = "{$department_data.department_name}"}
{/if}

{include file="common/mainbox.tpl"
    title_start=$title_start
    title_end=$title_end
    title=$title
    content=$smarty.capture.mainbox
    buttons=$smarty.capture.buttons
    select_languages=true}

{** banner section **}
