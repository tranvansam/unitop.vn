<?php
// add
function insert_post_info($data)
{
    db_insert('tbl_posts', $data);
}
// index
function get_post_list()
{
    $result = db_fetch_array("SELECT * FROM `tbl_posts`");
    if (!empty($result)) {
        return $result;
    }
}
function pagging_slider($sql, $where = "", $num_per_page = 2)
{
    $num_rows = db_num_rows("{$sql}");
    // so luong ban ghi tren trang
    $num_per_page = $num_per_page;
    $total_rows = $num_rows;
    $num_page = ceil($total_rows / $num_per_page);

    //Tinh duoc diem xuat phat
    $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
    $start = ($page - 1) * $num_per_page;
    $list_pages = get_pages_slider($start, $num_per_page, "{$where}");
    $result = array(
        'num_page' => $num_page,
        'page' => $page,
        'list_pages' => $list_pages
    );
    return $result;
}
function get_pages_slider($start = 1, $num_per_page = 10, $where = "")
{
    if (!empty($where)) {
        $where = "WHERE {$where} ";
    }
    $list_users = db_fetch_array("SELECT * FROM `tbl_slider` {$where} LIMIT {$start}, $num_per_page");
    return  $list_users;
}
//delete
function  delete_post($id)
{
    db_delete('tbl_posts', "`post_id` = '{$id}'");
    redirect("?mod=post&action=index");
}
function insert_slider_info($data)
{
    db_insert('tbl_slider', $data);
}

function delete_slider($id)
{
    db_delete('tbl_slider', "`id` = '{$id}'");
    redirect("?mod=slider");
}
function get_slider_info($id)
{
    $result = db_fetch_row("SELECT * FROM `tbl_slider` WHERE `id` = '{$id}'");
    if (!empty($result)) {
        return $result;
    } else {
        return FALSE;
    }
}
function update_slider_info($data, $id){
    db_update('tbl_slider', $data, "`id` = '{$id}'");
}
