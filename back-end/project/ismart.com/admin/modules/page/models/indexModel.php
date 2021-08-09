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
function pagging_page($sql, $where = "", $num_per_page = 2)
{
    $num_rows = db_num_rows("{$sql}");
    // so luong ban ghi tren trang
    $num_per_page = $num_per_page;
    $total_rows = $num_rows;
    $num_page = ceil($total_rows / $num_per_page);

    //Tinh duoc diem xuat phat
    $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
    $start = ($page - 1) * $num_per_page;
    $list_pages = get_pages_page($start, $num_per_page, "{$where}");
    $result = array(
        'num_page' => $num_page,
        'page' => $page,
        'list_pages' => $list_pages
    );
    return $result;
}
function get_pages_page($start = 1, $num_per_page = 10, $where = "")
{
    if (!empty($where)) {
        $where = "WHERE {$where} ";
    }
    $list_users = db_fetch_array("SELECT * FROM `tbl_page` {$where} LIMIT {$start}, $num_per_page");
    return  $list_users;
}
//delete
function  delete_post($id)
{
    db_delete('tbl_posts', "`post_id` = '{$id}'");
    redirect("?mod=post&action=index");
}
function insert_page($data)
{
    db_insert('tbl_page', $data);
}
function get_page_info($id)
{
    $result = db_fetch_row("SELECT * FROM `tbl_page` WHERE `id` = '{$id}'");
    if (!empty($result)) {
        return $result;
    }
}
function update_page($data, $id){
    db_update('tbl_page', $data, "`id` = '{$id}'");
}
function delete_page($id)
{
    db_delete('tbl_page', "`id` = '{$id}'");
    redirect("?mod=page");
}
