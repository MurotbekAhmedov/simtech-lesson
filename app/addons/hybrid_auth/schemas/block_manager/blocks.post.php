<?php
/***************************************************************************
*                                                                          *
*   (c) 2004 Vladimir V. Kalynyak, Alexey V. Vinokurov, Ilya M. Shalnev    *
*                                                                          *
* This  is  commercial  software,  only  users  who have purchased a valid *
* license  and  accept  to the terms of the  License Agreement can install *
* and use this program.                                                    *
*                                                                          *
****************************************************************************
* PLEASE READ THE FULL TEXT  OF THE SOFTWARE  LICENSE   AGREEMENT  IN  THE *
* "copyright.txt" FILE PROVIDED WITH THIS DISTRIBUTION PACKAGE.            *
****************************************************************************/

$schema['my_account']['content']['providers_list'] = [
    'type'     => 'function',
    'function' => ['fn_hybrid_auth_get_providers_list_content'],
];
$schema['main']['cache_overrides_by_dispatch']['products.view']['update_handlers'][] = 'hybrid_auth_providers';

return $schema;
