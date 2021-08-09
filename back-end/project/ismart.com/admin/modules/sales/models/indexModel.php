<?php
function pagging_order($sql, $where = "", $num_per_page = 2, $table)
{
    $num_rows = db_num_rows("{$sql}");
    // so luong ban ghi tren trang
    $num_per_page = $num_per_page;
    $total_rows = $num_rows;
    $num_page = ceil($total_rows / $num_per_page);

    //Tinh duoc diem xuat phat
    $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
    $start = ($page - 1) * $num_per_page;
    $list_pages = get_pages_order($start, $num_per_page, "{$where}", $table);
    $result = array(
        'num_page' => $num_page,
        'page' => $page,
        'list_pages' => $list_pages
    );
    return $result;
}
function get_pages_order($start = 1, $num_per_page = 10, $where = "", $table)
{
    if (!empty($where)) {
        $where = "WHERE {$where} ";
    }
    $list_users = db_fetch_array("SELECT * FROM `{$table}` {$where} LIMIT {$start}, $num_per_page");
    return  $list_users;
}
function pagging_ajax_order($sql, $where = "", $num_per_page = 2, $page, $table)
{
    $num_rows = db_num_rows("{$sql}");
    // so luong ban ghi tren trang
    $num_per_page = $num_per_page;
    $total_rows = $num_rows;
    $num_page = ceil($total_rows / $num_per_page);

    //Tinh duoc diem xuat phat
    $page = $page;
    $start = ($page - 1) * $num_per_page;
    $list_pages = get_pages_order($start, $num_per_page, "{$where}", $table);
    $result = array(
        'num_page' => $num_page,
        'list_pages' => $list_pages,
        'page' => $page
    );
    return $result;
}
function get_order_info($id)
{
    $result = db_fetch_array("SELECT * FROM `tbl_order_detail` WHERE `order_id` = '{$id}'");
    if (!empty($result)) {
        return $result;
    }
}
function get_customer_info($id)
{
    $result = db_fetch_row("SELECT * FROM `tbl_order` WHERE `order_id` = '{$id}'");
    if (!empty($result)) {
        $data = array(
            'address' => $result['address'],
            'phone' => $result['phone'],
            'total' => $result['total']
        );
        return $data;
    }
}
function delete_order($id)
{
    db_delete('tbl_order_detail', "`id` = '{$id}'");
    redirect("?mod=sales");
}
function delete_customer($id){
    db_delete('tbl_order', "`order_id` = '{$id}'");
    redirect("?mod=sales&action=customer_list");
}