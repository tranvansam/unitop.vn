<?php
//Tat ca action se duoc ghi o day

use Aws\ElastiCache\Exception\ElastiCacheException;
use Psr\Cache\CacheItemInterface;

function construct()
{
    //    echo "DÙng chung, load đầu tiên";
    //khai bao nhu nay thi tat ca cac action se duoc ap dung goi sang phan model
    load_model('index');
    load('lib', 'validation');
    load('lib', 'email-function');
}
function addAction()
{
    global $error, $username, $password, $email, $fullname;
    if (isset($_POST['btn_add'])) {
        #. Phat co
        $error = array();
        if (empty($_POST['fullname'])) {
            $error['fullname'] = "Khong duoc de trong ho ten";
        } else {
            $fullname = $_POST['fullname'];
        }
        #Kiem tra username
        if (empty($_POST['username'])) {
            $error['username'] = "Khong duoc de trong ten dang nhap";
        } else {
            if (!is_username($_POST['username'])) {
                $error['username'] = "Ten dang nhap khong dung dinh dang";
            } else {
                $username = $_POST['username'];
            }
        }
        #Kiem tra password
        if (empty($_POST['password'])) {
            $error['password'] = "Khong duoc de trong mat khau";
        } else {
            if (!is_password($_POST['password'])) {
                $error['password'] = "Mat khau khong dung dinh dang";
            } else {
                $password = md5($_POST['password']);
            }
        }
        // Xac nhan mat khau
        if (empty($_POST['confirm_password'])) {
            $error['confirm_password'] = "Ban can xac nhan lai mat khau";
        } else {
            if (!is_password($_POST['confirm_password'])) {
                $error['confirm_password'] = "Mat khau khong dung dinh dang";
            } else if ($_POST['confirm_password'] != $_POST['password']) {
                $error['confirm_password'] = "Mat khau ban nhap khong trung khop";
            }
        }
        #Kiem tra email
        if (empty($_POST['email'])) {
            $error['email'] = "Khong duoc de trong email";
        } else {
            if (!is_email($_POST['email'])) {
                $error['email'] = "Email khong dung dinh dang";
            } else {
                $email = $_POST['email'];
            }
        }
        if (empty($_POST['tel'])) {
            $error['tel'] = "Khong duoc de trong so dien thoai";
        } else {
            if (!is_tel($_POST['tel'])) {
                $error['tel'] = "So dien thoai khong dung dinh dang";
            } else {
                $phone_number = $_POST['tel'];
            }
        }
        // dia chi 
        if (empty($_POST['address'])) {
            $error['address'] = "Khong duoc de trong dia chi";
        } else {
            $address = htmlentities($_POST['address']);
        }
        if (empty($error)) {
            if (!user_exists($username, $email)) {
                $active_token = md5($username . time());
                $data = array(
                    'fullname' => $fullname,
                    'username' => $username,
                    'password' => $password,
                    'email' => $email,
                    'address' => $address,
                    'phone_number' => $phone_number,
                    'active_token' => $active_token,
                    'created_date' => time()
                );
                add_user($data);
                // sau khi mà insert thành công dữ liệu người đung đặc biệt là mã active_toke thì 

                // gửi mail chứa mã đó cho người dùng để kích hoạt rồi cập nhật is_active = 1
                $link_active = base_url("?mod=users&controller=team&action=active&active_token={$active_token}");
                $content = "<p>Chao ban {$fullname}</p>
                <p>Ban vui long click vao duong link này để kích hoạt tài khoản: {$link_active}</p>
                <p>Teasupport Unitop.vn</p>";

                send_mail($email, $fullname, 'kich hoat tai khoan quan ly web', $content);

                // redirect("?mod=users&action=login");
            } else {
                $error['account'] = 'Email hoac mat khau da bi trung tren he thong';
            }
        }
    }
    load_view('add_admin');
}
function activeAction()
{
    $active_token = $_GET['active_token'];
    if (check_active_token($active_token)) {
        active_user($active_token);
        $link_login = base_url("?mod=users&action=login");
        echo "Ban da kich hoat thanh cong, vui long click vao link sau de dang nhap: <a href ='{$link_login}'>Dang nhap</a>";
    } else {
        echo "Yeu cau kich hoat khong thanh cong hoac tai khoan da duoc kich hoat truoc do";
    }
}
function indexAction()
{
    if (isset($_GET['search'])) {
        if ($_GET['search_by'] == 'all') {
            $search_value = $_GET['search_value'];
            $result = pagging_users("SELECT * FROM `tbl_users` WHERE `fullname` LIKE '%$search_value%' OR `address` LIKE '%$search_value%'", "`fullname` LIKE '%$search_value%' OR `address` LIKE '%$search_value%'", 5);
            $data = array(
                'num_page' => $result['num_page'],
                'page' => $result['page'], 
                'list_users' => $result['list_pages'],
                'search_by' => $_GET['search_by'],
                'search_value' => $search_value
            );
        }
        if ($_GET['search_by'] == 'fullname') {
            $search_value = $_GET['search_value'];
            $result = pagging_users("SELECT * FROM `tbl_users` WHERE `fullname` LIKE '%$search_value%'", "`fullname` LIKE '%$search_value%'", 5);
            // show_array($result['list_pages']);
            $data = array(
                'num_page' => $result['num_page'],
                'page' => $result['page'],
                'list_users' => $result['list_pages'],
                'search_by' => $_GET['search_by'],
                'search_value' => $search_value
            );
        }
        if ($_GET['search_by'] == 'email') {
            $search_value = $_GET['search_value'];
            $result = pagging_users("SELECT * FROM `tbl_users` WHERE `email` LIKE '%$search_value%'", "`email` LIKE '%$search_value%'", 5);
            // show_array($result['list_pages']);
            $data = array(
                'num_page' => $result['num_page'],
                'page' => $result['page'],
                'list_users' => $result['list_pages'],
                'search_by' => $_GET['search_by'],
                'search_value' => $search_value
            );
        }
        if ($_GET['search_by'] == 'address') {
            $search_value = $_GET['search_value'];
            $result = pagging_users("SELECT * FROM `tbl_users` WHERE `address` LIKE '%$search_value%'", "`address` LIKE '%$search_value%'", 5);
            // show_array($result['list_pages']);
            $data = array(
                'num_page' => $result['num_page'],
                'page' => $result['page'],
                'list_users' => $result['list_pages'],
                'search_by' => $_GET['search_by'],
                'search_value' => $search_value
            );
        }
    } else {
        $result = pagging_users("SELECT * FROM `tbl_users`", "", 5);
        $data = array(
            'num_page' => $result['num_page'],
            'page' => $result['page'],
            'list_users' => $result['list_pages']
        );
    }

    load_view('index_users', $data);
}

function deleteAction()
{
    if (isset($_GET['id'])) {
        $id = (int)$_GET['id'];
        echo $id;
        delete_users($id);
    }
}
