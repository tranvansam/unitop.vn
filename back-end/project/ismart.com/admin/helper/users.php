<?php
// function check_login($username, $password)
// {
//     global $list_users;
//     foreach ($list_users as $value) {
//         if ($username == $value['username'] && md5($password) == $value['password']) {
//             return TRUE;
//         }
//     }
//     return FALSE;
// }
//Tra ve true neu da login
function is_login()
{
    if (isset($_SESSION['is_login'])) {
        return true;
    }
    return false;
}
function user_login()
{
    if (!empty($_SESSION['user_login'])) {
        return $_SESSION['user_login'];
    }
    return FALSE;
}
function info_user($field = 'id')
{
    global $list_users;
    if (isset($_SESSION['is_login'])) {
        foreach ($list_users as $users) {
            
            if (array_key_exists($field, $users)) {
                return $users[$field];
            }
        }
    }
    return false;
}
