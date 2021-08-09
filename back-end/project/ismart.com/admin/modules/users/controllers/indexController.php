
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
function regAction()
{
    global $error, $username, $password, $email, $fullname;
    if (isset($_POST['btn_reg'])) {
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
        if (empty($error)) {
            if (!user_exists($username, $email)) {
                $active_token = md5($username . time());
                $data = array(
                    'fullname' => $fullname,
                    'username' => $username,
                    'password' => $password,
                    'email' => $email,
                    'active_token' => $active_token,
                    'reg_date' => time()
                );

                add_user($data);
                alter_active_value();
                #2. Gui mail cho nguoi dung trong do co duong link chua ma token
                $link_active = base_url("?mod=users&action=active&active_token={$active_token}");
                $content = "<p>Chào bạn {$fullname}</p>
                <p>Chúc mừng bạn đã đăng ký tài khoản học trực tuyến thành công, để active tài khoản bạn vui lòng nhấn vào link sau: $link_active</p>
                <p>Nếu bạn không active thì tài khoản sẽ tự động được xóa sau 24h kể từ khi đăng kí thành công</p>
                <p>Nếu đây không phải email của bạn vui lòng bỏ qua thông tin này</p>";
                send_mail('nguyenmanhhung201102@gmail.com', 'Do thi ngoc anh', 'kich hoat tai khoan he thong UNITOP', $content);

                redirect("?mod=users&action=login");
            } else {
                $error['account'] = 'Email hoac mat khau da bi trung tren he thong';
            }
        }
    }
    load_view('reg');
}
function activeAction()
{
    $active_token = $_GET['active_token'];
    if (check_token($active_token)) {
        active_account($active_token);
        $link_login = base_url("?mod=users&action=login");
        echo "Ban da kich hoat thanh cong, vui long click vao link sau de dang nhap: <a href ='{$link_login}'>Dang nhap</a>";
    } else {
        echo "Tai khoan cua ban sai hoac la da duoc kich hoat";
    }
}
function loginAction()
{

    // echo time(); 
    // echo date("d/m/Y H:i:s");

    global $error, $username, $password, $email, $fullname;
    if (isset($_POST['btn_login'])) {
        #Kiem tra username
        $error = array();
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
        #ket luan
        if (empty($error)) {
            if (check_login($username, $password)) {
                $_SESSION['is_login'] = true;
                $_SESSION['user_login'] = $username;
                if (isset($_POST['check_box'])) {
                    setcookie('is_login', true, time() + 5000, '/');
                    setcookie('user_login', $username, time() + 5000, '/');
                }
                //chuyen huong vao trong he thong 
                redirect("?");
            } else {
                $error['account'] = 'Tai khoan hoac mat khau khong chinh xac';
            }
        }
    }
    load_view('login');
}
function logoutAction()
{
    if (!empty($_COOKIE['is_login'] && $_COOKIE['user_login'])) {
        setcookie('is_login', true, time() - 5000, '/');
        setcookie('user_login', $_SESSION['user_login'], time() - 5000, '/');
    }
    unset($_SESSION['is_login']);
    unset($_SESSION['user_login']);
    redirect("?mod=users&action=login");
}
// Reset password
function resetAction()
{
    global $error, $username, $password, $email, $fullname;
    if (!empty($_GET['reset_token'])) {
        $reset_token = $_GET['reset_token'];

        // validation form 
        if (check_reset_token($reset_token)) {
            if (isset($_POST['btn_submit'])) {
                $error = array();
                if (empty($_POST['password'])) {
                    $error['password'] = "Khong duoc de trong mat khau";
                } else {
                    if (!is_password($_POST['password'])) {
                        $error['password'] = "Mat khau khong dung dinh dang";
                    } else {
                        $password = md5($_POST['password']);
                    }
                }
                if (empty($error)) {
                    $data = array(
                        'password' => $password
                    );
                    update_password($data, $reset_token);
                }
            }
            load_view('newPass');
        }
    } else {
        if (isset($_POST['btn_reset'])) {
            $error = array();
            if (empty($_POST['email'])) {
                $error['email'] = "Khong duoc de trong email";
            } else {
                if (!is_email($_POST['email'])) {
                    $error['email'] = "Email khong dung dinh dang";
                } else {
                    $email = $_POST['email'];
                }
            }
            #ket luan
            if (empty($error)) {
                if (check_email($email)) {
                    // tao ma reset token
                    $reset_token = md5($email . time());
                    $data = array(
                        'reset_token' => $reset_token

                    );
                    //Muon update thi phai dua vao email chu nguuuuu
                    update_reset_token($email, $data);
                    // echo "<script> alert('Ban vui long vao gmail de tien hanh xac thuc thay doi mat khau') </script>";
                    // Gui email cho nguoi dung co chua ma reset token
                    $link = base_url("?mod=users&action=reset&reset_token=$reset_token");
                    $content = "<p>Ban vui long click vao link sau: $link de tien hanh doi mat khau</p>
                    <p>Neu ban khong phai chu so huu email nay vui long bo qua</p>
                    <p>Team support cua cong ty Hung Tong</p>";
                    send_mail($email, '', 'Kich hoat khoa hoc Laravel', $content);
                } else {
                    $error['account'] = 'Email khong ton tai tren he thong';
                }
            }
        }
        load_view('reset');
    }
}
function resetSuccessAction()
{
    load_view('resetSuccess');
}
function updateAction()
{
    // lay thong tin user

    global $error, $phone_number, $fullname;

    if (isset($_POST['btn_submit'])) {
        #. Phat co
        $error = array();
        if (empty($_POST['fullname'])) {
            $error['fullname'] = "Khong duoc de trong ten";
        } else {
            $fullname = $_POST['fullname'];
        }
        #Kiem tra username

        // kiem tra so dien thoai
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

            $address = $_POST['address'];
        }
        // ket luan
        if (empty($error)) {
            $username_info = user_login();
            $data = array(
                'fullname' => $fullname,
                'phone_number' => $phone_number,
                'address' => $address
            );
            update_info_user($username_info, $data);
            redirect("?mod=users&action=info_account");
        }
    }

    // load_view('info_account');
}
function info_accountAction()
{
    global $error, $username, $email, $phone_number, $fullname;

    if (isset($_POST['btn_submit'])) {
        #. Phat co
        $error = array();
        if (empty($_POST['fullname'])) {
            $error['fullname'] = "Khong duoc de trong ten";
        } else {
            $fullname = $_POST['fullname'];
        }
        #Kiem tra username

        // kiem tra so dien thoai
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

            $address = $_POST['address'];
        }
        // ket luan
        if (empty($error)) {
            $username_info = user_login();
            $data = array(
                'fullname' => $fullname,
                'phone_number' => $phone_number,
                'address' => $address
            );
            update_info_user($username_info, $data);
        }
    }
    $username = user_login();

    $user_info = get_info_user($username);
    $data['user_info'] = $user_info;
    load_view('info_account', $data);
}
//change_pass
function change_passAction()
{
    global $error, $username, $password;

    if (isset($_POST['btn_submit'])) {
        $error = array();
        if (empty($_POST['pass-old'])) {
            $error['pass-old'] = "Ban can nhap mat khau cu";
        } else {

            if (!is_password($_POST['pass-old'])) {
                $error['pass-old'] = "Mat khau cu khong dung dinh dang";
            } else {
                $pass_old = md5($_POST['pass-old']);
                if (!check_password($pass_old)) {
                    $error['pass-old'] = "Mat khau cua ban khong ton tai tren he thong";
                }
            }
        }
        if (empty($_POST['pass-new'])) {
            $error['pass-new'] = "Khong duoc de trong mat khau";
        } else {
            if ($_POST['pass-new'] == $_POST['pass-old']) {
                $error['pass-new'] = "Mat khau moi khong duoc giong mat khau cu";
            } else {
                if (!is_password($_POST['pass-new'])) {
                    $error['pass-new'] = "Mat khau khong dung dinh dang";
                } else {
                    $password = md5($_POST['pass-new']);
                }
            }
        }
        if (empty($_POST['confirm-pass'])) {
            $error['confirm-pass'] = "Ban can xac nhan lai mat khau";
        } else {
            if (!is_password($_POST['confirm-pass'])) {
                $error['confirm-pass'] = "Ban nhap mat khau khong dung dinh dang";
            } else {
                if ($_POST['confirm-pass'] != $_POST['pass-new']) {
                    $error['confirm-pass'] = "Mat khau ban nhap khong giong mat khau moi";
                }
            }
        }
        if (empty($error)) {
            $username = user_login();
            $data = array(
                'password' => $password
            );
            change_pass($username, $data);
            redirect("?mod=users&action=login");
        }
    }


    load_view('newPass');
}
