<?php

function construct()
{
    //    echo "DÙng chung, load đầu tiên";
    load_model('index');
    load('lib', 'validation');
}
function indexAction()
{
    // Search 
    if (isset($_GET['search'])) {
        if ($_GET['search_by'] == 'all') {
            $search_value = $_GET['search_value'];
            $result = pagging_page("SELECT * FROM `tbl_page` WHERE `page_title` LIKE '%$search_value%' OR `created_name` LIKE '%$search_value%'", "`page_title` LIKE '%$search_value%' OR `created_name` LIKE '%$search_value%'", 5);
            $data = array(
                'num_page' => $result['num_page'],
                'page' => $result['page'],
                'page_list' => $result['list_pages'],
                'search_by' => $_GET['search_by'],
                'search_value' => $search_value
            );
        }
        if ($_GET['search_by'] == 'title') {
            $search_value = $_GET['search_value'];
            $result = pagging_page("SELECT * FROM `tbl_page` WHERE `page_title` LIKE '%$search_value%'", "`page_title` LIKE '%$search_value%'", 5);
            $data = array(
                'num_page' => $result['num_page'],
                'page' => $result['page'],
                'page_list' => $result['list_pages'],
                'search_by' => $_GET['search_by'],
                'search_value' => $search_value
            );
        }
        if ($_GET['search_by'] == 'created_name') {
            $search_value = $_GET['search_value'];
            $result = pagging_page("SELECT * FROM `tbl_page` WHERE `created_name` LIKE '%$search_value%'", "`created_name` LIKE '%$search_value%'", 5);
            $data = array(
                'num_page' => $result['num_page'],
                'page' => $result['page'],
                'page_list' => $result['list_pages'],
                'search_by' => $_GET['search_by'],
                'search_value' => $search_value
            );
        }
    } else {
        $result = pagging_page("SELECT * FROM `tbl_page`", "", 5);
        $data = array(
            'num_page' => $result['num_page'],
            'page' => $result['page'],
            'page_list' => $result['list_pages']
        );
    }
    load_view('index', $data);
}
function addAction()
{
    global $error, $product_name, $product_code, $price, $excerpt, $desc, $product_sub_category, $new_qty, $status;

    if (isset($_POST['btn_submit'])) {

        $error = array();
        if (empty($_POST['title'])) {
            $error['title'] = "Không được để trống tiêu đề";
        } else {
            $title = $_POST['title'];
        }
        if (empty($_POST['slug'])) {
            $error['slug'] = "Không được để trống slug";
        } else {
            $slug = makeUrl($_POST['slug']);
        }
        if (empty($_POST['status'])) {
            $error['status'] = "Không được để trống trạng thái trang";
        } else {
            $status = $_POST['status'];
        }
        if (empty($_POST['desc'])) {
            $error['desc'] = "Không được để trống mô tả trang";
        } else {
            $desc = $_POST['desc'];
        }

        // kiem tra upload
        if (empty($_FILES['file'])) {
            $error['file'] = "Khong duoc de trong file";
        } else {
            $upload_dir = 'uploads/pages/';
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
            $data = array(
                'page_title' => $title,
                'status' => $status,
                'description' => $desc,
                'image' => $upload_file,
                'slug' => $slug,
                'created_name' => $username,
                'created_at' => $created_at
            );
            insert_page($data);
        }
    }
    load_view('add');
}
function editAction()
{
    $id = (int)$_GET['id'];
    global $error, $desc, $status;

    if (isset($_POST['btn_submit'])) {

        $error = array();
        if (empty($_POST['title'])) {
            $error['title'] = "Không được để trống tiêu đề";
        } else {
            $title = $_POST['title'];
        }
        if (empty($_POST['slug'])) {
            $error['slug'] = "Không được để trống slug";
        } else {
            $slug = makeUrl($_POST['slug']);
        }
        if (empty($_POST['status'])) {
            $error['status'] = "Không được để trống trạng thái trang";
        } else {
            $status = $_POST['status'];
        }
        if (empty($_POST['desc'])) {
            $error['desc'] = "Không được để trống mô tả trang";
        } else {
            $desc = $_POST['desc'];
        }

        // kiem tra upload
        if (empty($_FILES['file'])) {
            $error['file'] = "Khong duoc de trong file";
        } else {
            $upload_dir = 'uploads/pages/';
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
            $data = array(
                'page_title' => $title,
                'status' => $status,
                'description' => $desc,
                'image' => $upload_file,
                'slug' => $slug,
                'created_name' => $username,
                'created_at' => $created_at
            );
            update_page($data, $id);
        }
    }
    $page_info = get_page_info($id);
    $data['page_info'] = $page_info;
    load_view('edit', $data);
}
function deleteAction()
{
    if (!empty($_GET['id'])) {
        $id = $_GET['id'];
        delete_page($id);
    }
}
