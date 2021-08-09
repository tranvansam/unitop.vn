<?php
//Noi lam viec voi database
function user_exists($username, $email)
{
    $check_user = db_num_rows("SELECT * FROM `tbl_users` WHERE `username` = '{$username}' OR `email` = '{$email}'");

    if ($check_user > 0)
        return true;
    return false;
}
function add_user($data)
{

    return db_insert("tbl_users", $data);
}

function get_list_users()
{
    $result = db_fetch_array("SELECT * FROM `tbl_users`");
    return $result;
}
function get_users_by_id($id)
{
    $item = db_fetch_row("SELECT * FROM `tbl_users` WHERE `user_id` = {$id}");
    return $item;
}

function check_token($active_token)
{
    $check_token = db_num_rows("SELECT * FROM `tbl_users` WHERE `active_token` ='{$active_token}' && `is_active` = '0'");

    if ($check_token > 0)
        return true;
    return false;
}
function active_account($active_token)
{
    db_update('tbl_users', array('is_active' => 1), "`active_token` = '{$active_token}'");
}
function alter_active_value()
{
    date_default_timezone_set('Asia/Ho_Chi_Minh');
    $time_check = time() - 60;
    db_delete('tbl_users', "`is_active` = '0' AND `reg_date` < '{$time_check}'");
}
//login

function check_login($username, $password)
{
    $record = db_num_rows("SELECT * FROM `tbl_users` WHERE `username` = '{$username}' AND `password` = '{$password}'");
    if ($record > 0) {
        return true;
        return false;
    }
}
//reset
function check_email($email)
{
    $record = db_num_rows("SELECT * FROM `tbl_users` WHERE `email` = '{$email}' ");
    if ($record > 0) {
        return true;
        return false;
    }
}
function update_reset_token($email, $data)
{
    db_update('tbl_users', $data, "`email` = '{$email}'");
}
function check_reset_token($reset_token)
{
    $record = db_num_rows("SELECT * FROM `tbl_users` WHERE `reset_token` = '{$reset_token}'");
    if ($record > 0) {
        return true;
        return false;
    }
}
function update_password($data, $reset_token)
{
    db_update('tbl_users', $data, "`reset_token` = '{$reset_token}'");
    redirect("?mod=users&action=resetSuccess");
}
// admin
function get_info_user($username)
{
    $item = db_fetch_row("SELECT * FROM `tbl_users` WHERE `username` = '{$username}'");
    if (!empty($item)) {
        return $item;
    }
}
function update_info_user($username_info, $data)
{
    db_update('tbl_users', $data, "`username` = '{$username_info}'");
}
//change pass
function change_pass($username, $data)
{
    db_update('tbl_users', $data, "`username` = '{$username}'");
}
function check_password($pass_old)
{
    $record = db_num_rows("SELECT * FROM `tbl_users` WHERE `password` = '{$pass_old}'");
    if ($record > 0) {
        return true;
        return false;
    }
}
//pagination 
function pagging_users($sql, $where = "", $num_per_page = 2) 
{
    $num_rows = db_num_rows("{$sql}"); 
    // so luong ban ghi tren trang
    $num_per_page = $num_per_page;
    $total_rows = $num_rows;
    $num_page = ceil($total_rows / $num_per_page);

    //Tinh duoc diem xuat phat
    $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
    $start = ($page - 1) * $num_per_page;
    $list_pages = get_pages_users($start, $num_per_page, "{$where}");
    $result = array(
        'num_page' => $num_page,
        'page' => $page,
        'list_pages' => $list_pages
    );
    return $result;
}
function get_pages_users($start = 1, $num_per_page = 10, $where = "")
{
    if (!empty($where)) {
        $where = "WHERE {$where} ";
    }
    $list_users = db_fetch_array("SELECT * FROM `tbl_users` {$where} LIMIT {$start}, $num_per_page");
    return  $list_users;
}
function delete_users($id)
{
    db_delete('tbl_users', "`user_id` = '{$id}'");
    redirect("?mod=users&controller=team");
}
// add user
function active_user($active_token)
{
    return db_update('tbl_users', array('is_active' => 1), "`active_token` = '{$active_token}'");
}
function check_active_token($active_token)
{
    // chi duoc kich hoat mot lan nen phai kiem tra xem da dc kich hoat hay chua
    $check_token = db_num_rows("SELECT * FROM `tbl_users` WHERE `active_token` = '{$active_token}' && `is_active` = '0'");
    // o phan is_active dang de enum nen gia tri se la chuoi
    if ($check_token > 0)
        return true;
    return false;
}
