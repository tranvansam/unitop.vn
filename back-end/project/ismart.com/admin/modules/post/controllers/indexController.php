<?php
function construct()
{
    //    echo "DÙng chung, load đầu tiên";
    //khai bao nhu nay thi tat ca cac action se duoc ap dung goi sang phan model
    load_model('index');
    load('lib', 'validation');
    load('lib', 'email-function');
}
function indexAction()
{
    if (isset($_GET['search'])) {
        if ($_GET['search_by'] == 'all') {
            $search_value = $_GET['search_value'];
            $result = pagging_post("SELECT * FROM `tbl_posts` WHERE `post_title` LIKE '%$search_value%' OR `created_name` LIKE '%$search_value%'", "`post_title` LIKE '%$search_value%' OR `created_name` LIKE '%$search_value%'", 5);
            // show_array($result['list_pages']);
            $data = array(
                'num_page' => $result['num_page'],
                'page' => $result['page'],
                'post_list' => $result['list_pages'],
                'search_by' => $_GET['search_by'],
                'search_value' => $search_value
            );
        }
        if ($_GET['search_by'] == 'post_title') {
            $search_value = $_GET['search_value'];
            $result = pagging_post("SELECT * FROM `tbl_posts` WHERE `post_title` LIKE '%$search_value%'", "`post_title` LIKE '%$search_value%'", 5);
            // show_array($result['list_pages']);
            $data = array(
                'num_page' => $result['num_page'],
                'page' => $result['page'],
                'post_list' => $result['list_pages'],
                'search_by' => $_GET['search_by'],
                'search_value' => $search_value
            );
        }
        if ($_GET['search_by'] == 'created_name') {
            $search_value = $_GET['search_value'];
            $result = pagging_post("SELECT * FROM `tbl_posts` WHERE `created_name` LIKE '%$search_value%'", "`created_name` LIKE '%$search_value%'", 5);
            // show_array($result['list_pages']);
            $data = array(
                'num_page' => $result['num_page'],
                'page' => $result['page'],
                'post_list' => $result['list_pages'],
                'search_by' => $_GET['search_by'],
                'search_value' => $search_value
            );
        }
    } else {
        $result = pagging_post("SELECT * FROM `tbl_posts`", "", 5);
        $data = array(
            'num_page' => $result['num_page'],
            'page' => $result['page'],
            'post_list' => $result['list_pages']
        );
    }

    load_view('index', $data);
}
function addAction()
{
    global $error, $product_name, $product_code, $price, $excerpt, $desc, $new_qty;
    if (isset($_POST['btn_submit'])) {

        $error = array();
        if (empty($_POST['post_title'])) {
            $error['post_title'] = "Khong duoc de trong ten bai viet";
        } else {
            $post_title = $_POST['post_title'];
        }
        if (empty($_POST['slug'])) {
            $error['slug'] = "Khong duoc de trong slug";
        } else {
            $slug = $_POST['slug'];
        }
        if (empty($_POST['status'])) {
            $error['status'] = "Khong duoc de trong trang thai bai viet";
        } else {
            $status = $_POST['status'];
        }
        if (empty($_POST['excerpt'])) {
            $error['excerpt'] = "Khong duoc de trong mo ta ngan bai viet";
        } else {
            $excerpt = $_POST['excerpt'];
        }
        if (empty($_POST['desc'])) {
            $error['desc'] = "Khong duoc de trong mo ta bai viet";
        } else {
            $desc = $_POST['desc'];
        }

        // kiem tra upload
        if (empty($_FILES['file'])) {
            $error['file'] = "Khong duoc de trong file";
        } else {
            $upload_dir = 'uploads/posts/';
            $upload_file = $upload_dir . $_FILES['file']['name']; // dich den quan trong nhat 
            //Chuan hoa du lieu file khi upload len
            $type_allow = array('png', 'jpg', 'gift', 'jpeg');
            $file_tail = pathinfo($_FILES['file']['name'], PATHINFO_EXTENSION);
            //=======================================
            //XU DUNG THUAT TOAN DAT CO HIEU DE XU LY CHUAN HOA DU LIEU FILE UPLOAD
            //=======================================
            #1. phat co 
            if (!in_array(strtolower($file_tail), $type_allow)) {
                #2. Ha co
                $error['file'] = 'Chi chap nhan file co duoi png, jpg, jpeg, gift';
            } else {
                //Kiem tra size cua file
                if ($_FILES['file']['size'] > 29000000) {
                    $error['file'] = "File upload khong duoc phep vuot qua 20MB";
                }
                //=====================================================
                //kiem tra va xu ly khi trung ten file
                //=====================================================
                if (file_exists($upload_file)) {
                    $old_file_name = pathinfo($_FILES['file']['name'], PATHINFO_FILENAME);
                    //Tao ra ten file moi
                    $new_file_name = $old_file_name . ' - Copy.';
                    $new_upload_file = $upload_dir . $new_file_name . $file_tail;
                    $k = 1;
                    while (file_exists($new_upload_file)) {
                        //=====================================================
                        //Tiep tuc tao ra ten file moi
                        //=====================================================
                        $new_file_name = $old_file_name . " - Copy({$k}).";
                        $k++;
                        $new_upload_file = $upload_dir . $new_file_name . $file_tail;
                    }
                    $upload_file = $new_upload_file;
                }
            }
        }
        if (empty($error)) {
            move_uploaded_file($_FILES['file']['tmp_name'], $upload_file);
            $username = user_login();
            $created_at = time();
            $slug = makeUrl($slug);
            $data = array(
                'post_title' => $post_title,
                'slug' => $slug,
                'status' => $status,
                'excerpt' => $excerpt,
                'description' => $desc,
                'image' => $upload_file,
                'created_name' => $username,
                'created_at' => $created_at
            );


            insert_post_info($data);
        }
    }
    load_view('add');
}
function editAction()
{
    $id = (int)$_GET['id'];
    if (isset($_POST['btn_submit'])) {

        $error = array();
        if (empty($_POST['post_title'])) {
            $error['post_title'] = "Khong duoc de trong ten bai viet";
        } else {
            $post_title = $_POST['post_title'];
        }
        if (empty($_POST['slug'])) {
            $error['slug'] = "Khong duoc de trong slug";
        } else {
            $slug = $_POST['slug'];
        }
        if (empty($_POST['status'])) {
            $error['status'] = "Khong duoc de trong trang thai bai viet";
        } else {
            $status = $_POST['status'];
        }
        if (empty($_POST['excerpt'])) {
            $error['excerpt'] = "Khong duoc de trong mo ta ngan bai viet";
        } else {
            $excerpt = $_POST['excerpt'];
        }
        if (empty($_POST['desc'])) {
            $error['desc'] = "Khong duoc de trong mo ta bai viet";
        } else {
            $desc = $_POST['desc'];
        }

        // kiem tra upload
        if (empty($_FILES['file'])) {
            $error['file'] = "Khong duoc de trong file";
        } else {
            $upload_dir = 'uploads/posts/';
            $upload_file = $upload_dir . $_FILES['file']['name']; // dich den quan trong nhat 
            //Chuan hoa du lieu file khi upload len
            $type_allow = array('png', 'jpg', 'gift', 'jpeg');
            $file_tail = pathinfo($_FILES['file']['name'], PATHINFO_EXTENSION);
            //=======================================
            //XU DUNG THUAT TOAN DAT CO HIEU DE XU LY CHUAN HOA DU LIEU FILE UPLOAD
            //=======================================
            #1. phat co 
            if (!in_array(strtolower($file_tail), $type_allow)) {
                #2. Ha co
                $error['file'] = 'Chi chap nhan file co duoi png, jpg, jpeg, gift';
            } else {
                //Kiem tra size cua file
                if ($_FILES['file']['size'] > 29000000) {
                    $error['file'] = "File upload khong duoc phep vuot qua 20MB";
                }
                //=====================================================
                //kiem tra va xu ly khi trung ten file
                //=====================================================
                if (file_exists($upload_file)) {
                    $old_file_name = pathinfo($_FILES['file']['name'], PATHINFO_FILENAME);
                    //Tao ra ten file moi
                    $new_file_name = $old_file_name . ' - Copy.';
                    $new_upload_file = $upload_dir . $new_file_name . $file_tail;
                    $k = 1;
                    while (file_exists($new_upload_file)) {
                        //=====================================================
                        //Tiep tuc tao ra ten file moi
                        //=====================================================
                        $new_file_name = $old_file_name . " - Copy({$k}).";
                        $k++;
                        $new_upload_file = $upload_dir . $new_file_name . $file_tail;
                    }
                    $upload_file = $new_upload_file;
                }
            }
        }
        if (empty($error)) {
            move_uploaded_file($_FILES['file']['tmp_name'], $upload_file);
            $username = user_login();
            $slug = makeUrl($slug);
            $last_update = time();
            $data = array(
                'post_title' => $post_title,
                'slug' => $slug,
                'status' => $status,
                'excerpt' => $excerpt,
                'description' => $desc,
                'image' => $upload_file,
                'created_name' => $username,
                'last_update' => $last_update
            );


            update_post_info($data,$id);
        }
    }
    $post_info = get_post_info($id);
    $data['post_info'] = $post_info;
    load_view('edit', $data);
}
function deleteAction()
{
    if (isset($_GET['id'])) {
        $id = (int)$_GET['id'];
        delete_post($id);
    }
    if (isset($_POST["submit_delete_item"])) {
        foreach ($_POST["checkItem"] as $key => $value) {
            $id = $value;
            $where = "id='$id'";
            db_delete("tbl_posts", $where);
        }
        redirect('?mod=post');
    }
}
