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
function get_pagging($num_page, $page, $base_url = "")
{
    $str_pagging = "<ul class='pagging'>";
    if ($page > 1) {
        $page_prev = $page - 1;
        $str_pagging .= "<li><a href=\"{$base_url}&page={$page_prev}\" data-id = '$page_prev'>Before</a></li>";
    }
    for ($i = 1; $i <= $num_page; $i++) {
        $active = "";
        if ($i == $page) {
            $active = "class = 'active'";
        }
        $str_pagging .= "<li {$active}><a href=\"{$base_url}&page={$i}\" data-id =" . $page . ">$i</a></li>";
    }
    if ($page < $num_page) {
        $page_next = $page + 1;
        $str_pagging .= "<li><a href=\"{$base_url}&page={$page_next}\" data-id = '$page_next'>After</a></li>";
    }
    $str_pagging .= "</ul>";
    return $str_pagging;
}
function get_pages($start = 1, $num_per_page = 10, $where = "")
{
    if (!empty($where)) {
        $where = "WHERE {$where} ";
    }
    $list_users = db_fetch_array("SELECT * FROM `tbl_posts` {$where} LIMIT {$start}, $num_per_page");
    return  $list_users;
}
//delete
function  delete_post($id)
{
    db_delete('tbl_posts', "`post_id` = '{$id}'");
    redirect("?mod=post&action=index");
}
