{if $department_data}
    {assign var="id" value=$department_data.$department_id}
{else}
    {assign var="id" value=0}
{/if}

{capture name="mainbox"}

<form action="{""|fn_url}" method="post" class="form-horizontal form-edit" name="banners_form" enctype="multipart/form-data">
<input type="hidden" class="cm-no-hide-input" name="fake" value="1" />
<input type="hidden" class="cm-no-hide-input" name="banner_id" value="{$id}" />


    <div id="content_general">

        <div class="control-group">
            <label for="elm_banner_name" class="control-label cm-required">{__("name")}</label>
            <div class="controls">
            <input type="text" name="department_data[department_name]" id="elm_banner_name" value="{$department_data.department_name}" size="25" class="input-large" /></div>
        </div>




        <div class="control-group" id="banner_graphic">
            <label class="control-label">{__("image")}</label>
            <div class="controls">
                {include file="common/attach_images.tpl"
                    image_name="department_name"
                    image_object_type="department_name"
                    image_pair=$department_data.main_pair
                    image_object_id=$id
                    no_detailed=true
                    hide_titles=true
                }
            </div>
        </div>

        <div class="control-group {if $b_type == "G"}hidden{/if}" id="banner_text">
            <label class="control-label" for="elm_banner_description">{__("description")}:</label>
            <div class="controls">
                <textarea id="elm_banner_description" name="department_data[description]" cols="35" rows="8" class="cm-wysiwyg input-large">{$banner.description}</textarea>
            </div>
        </div>


        {include file="common/select_status.tpl" input_name="department_data[status]" id="elm_banner_status" obj_id=$id obj=$banner hidden=false}

    <!--content_general--></div>

    <div id="content_addons" class="hidden clearfix">
        {hook name="banners:detailed_content"}
        {/hook}
    <!--content_addons--></div>



{capture name="buttons"}
    {if !$id}
        {include file="buttons/save_cancel.tpl" but_role="submit-link" but_target_form="banners_form" but_name="dispatch[banners.update]"}
    {else}

        {include file="buttons/save_cancel.tpl" but_name="dispatch[banners.update]" but_role="submit-link" but_target_form="banners_form" hide_first_button=$hide_first_button hide_second_button=$hide_second_button save=$id}
    {/if}
{/capture}

</form>

{/capture}

{if !$id}
    {$title = "Добавить новый отдел"}
{else}
  {$title_start = "Изменить"}
  {$title = "department_data.department_name"}
{/if}

{include file="common/mainbox.tpl"
    title_start=$title_start
    title_end=$title_end
    title=$title
    content=$smarty.capture.mainbox
    buttons=$smarty.capture.buttons
    select_languages=true}

{** banner section **}
