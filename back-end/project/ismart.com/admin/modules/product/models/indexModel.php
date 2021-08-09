<?php
function get_list_product()
{
    $item = db_fetch_array("SELECT * FROM `tbl_product`");
    if (!empty($item)) {
        return $item;
    }
}
// add
function get_product_info_by_name($product_name)
{
    $item = db_fetch_row("SELECT * FROM `tbl_product` WHERE `product_name` = '{$product_name}'");
    if (!empty($item)) {
        return $item;
    } else {
        return FALSE;
    }
}
function insert_product_info($data)
{
    $insert_id =  db_insert('tbl_product', $data);
    return $insert_id;
}
function insert_thumb_product_info($data)
{
    db_insert('tbl_thumb', $data);
}
function delete_product($id)
{
    db_delete('tbl_product', "`product_id` = '{$id}'");
    redirect("?mod=product&action=index");
}
function get_product_info($id)
{
    $item = db_fetch_row("SELECT * FROM `tbl_product` WHERE `product_id` = {$id}");
    if (!empty($item)) {
        return $item;
    }
}
function  update_product_info($data, $id)
{
    db_update('tbl_product', $data, "`product_id` = '{$id}'");
}
function get_product_cat()
{
    $item = db_fetch_array("SELECT * FROM `tbl_product_cat`");
    if (!empty($item)) {
        return $item;
    }
}
function get_product_cat_pages($start = 1, $num_per_page = 10, $where = "")
{
    if (!empty($where)) {
        $where = "WHERE {$where} ";
    }
    $list_users = db_fetch_array("SELECT * FROM `tbl_product_cat` {$where} LIMIT {$start}, $num_per_page");
    return  $list_users;
}
function get_cat_list()
{
    $result = db_fetch_array("SELECT * FROM `tbl_product_cat` WHERE `parent_id` = 0");
    if (!empty($result)) {
        return $result;
    }
}
// Edit 
function get_product_cat_info($product_cat_id)
{
    $item = db_fetch_row("SELECT * FROM `tbl_product_cat` WHERE `cat_id` = {$product_cat_id}");
    if (!empty($item)) {
        return $item;
    }
}
// cat 
function check_cat()
{
    $result = db_fetch_array("SELECT * FROM `tbl_product_cat`");
    if (!empty($result)) {
        return $result;
    }
}
function get_cat_info($parent_id)
{
    $item = db_fetch_row("SELECT * FROM `tbl_product_cat` WHERE `cat_id` = '{$parent_id}'");
    if (!empty($item)) {
        return $item;
    }
}
// AJAX 
function get_sub_list($sub_cat)
{
    $result = db_fetch_array("SELECT * FROM `tbl_product_cat` WHERE `parent_id` = '{$sub_cat}'");
    if (!empty($result)) {
        return $result;
    }
}
