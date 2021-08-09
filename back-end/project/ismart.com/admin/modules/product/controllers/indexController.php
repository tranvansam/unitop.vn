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
    // Search 
    if (isset($_GET['search'])) {
        if ($_GET['search_by'] == 'all') {
            $search_value = $_GET['search_value'];
            $result = pagging("SELECT * FROM `tbl_product` WHERE `product_name` LIKE '%$search_value%' OR `created_name` LIKE '%$search_value%'", "`product_name` LIKE '%$search_value%' OR `created_name` LIKE '%$search_value%'", 5);
            // show_array($result['list_pages']);
            $data = array(
                'num_page' => $result['num_page'],
                'page' => $result['page'],
                'product_list' => $result['list_pages'],
                'search_by' => $_GET['search_by'],
                'search_value' => $search_value
            );
        }
        if ($_GET['search_by'] == 'product_name') {
            $search_value = $_GET['search_value'];
            $result = pagging("SELECT * FROM `tbl_product` WHERE `product_name` LIKE '%$search_value%'", "`product_name` LIKE '%$search_value%'", 5);
            // show_array($result['list_pages']);
            $data = array(
                'num_page' => $result['num_page'],
                'page' => $result['page'],
                'product_list' => $result['list_pages'],
                'search_by' => $_GET['search_by'],
                'search_value' => $search_value
            );
        }
        if ($_GET['search_by'] == 'price') {
            $search_value = $_GET['search_value'];
            $result = pagging("SELECT * FROM `tbl_product` WHERE `price` LIKE '%$search_value%'", "`price` LIKE '%$search_value%'", 5);
            // show_array($result['list_pages']);
            $data = array(
                'num_page' => $result['num_page'],
                'page' => $result['page'],
                'product_list' => $result['list_pages'],
                'search_by' => $_GET['search_by'],
                'search_value' => $search_value
            );
        }
        if ($_GET['search_by'] == 'created_name') {
            $search_value = $_GET['search_value'];
            $result = pagging("SELECT * FROM `tbl_product` WHERE `created_name` LIKE '%$search_value%'", "`created_name` LIKE '%$search_value%'", 5);
            // show_array($result['list_pages']);
            $data = array(
                'num_page' => $result['num_page'],
                'page' => $result['page'],
                'product_list' => $result['list_pages'],
                'search_by' => $_GET['search_by'],
                'search_value' => $search_value
            );
        }
    } else {
        $result = pagging("SELECT * FROM `tbl_product`", "", 5);
        $data = array(
            'num_page' => $result['num_page'],
            'page' => $result['page'],
            'product_list' => $result['list_pages']
        );
    }
    load_view('index', $data);
}
function addAction()
{
    global $error, $product_name, $product_code, $price, $excerpt, $desc, $product_sub_category, $new_qty, $status;

    if (isset($_POST['btn_submit'])) {

        $error = array();
        if (empty($_POST['product_name'])) {
            $error['product_name'] = "Khong duoc de trong ten san pham";
        } else {
            $product_name = $_POST['product_name'];
        }
        if (empty($_POST['product_code'])) {
            $error['product_code'] = "Khong duoc de trong ma san pham";
        } else {
            $product_code = $_POST['product_code'];
        }
        if (empty($_POST['status'])) {
            $error['status'] = "Khong duoc de trong trang thai bai viet";
        } else {
            $status = $_POST['status'];
        }
        if (empty($_POST['price'])) {
            $error['price'] = "Khong duoc de trong gia san pham";
        } else {
            $price = $_POST['price'];
        }
        if (!empty($_POST['qty'])) {
            $qty = $_POST['qty'];
            $product_record = get_product_info_by_name($product_name);
            $old_qty = $product_record['qty'];
            $new_qty = $old_qty + $qty;
        }
        if (empty($_POST['excerpt'])) {
            $error['excerpt'] = "Khong duoc de trong mo ta ngan san pham";
        } else {
            $excerpt = $_POST['excerpt'];
        }
        if (empty($_POST['desc'])) {
            $error['desc'] = "Khong duoc de trong mo ta san pham";
        } else {
            $desc = $_POST['desc'];
        }
        if (empty($_POST['parent_id'])) {
            $error['cat_id'] = "Ban can chon danh muc san pham";
        }
        if (empty($_POST['product_sub_category'])) {
            $error['product_sub_category'] = "Ban can chon danh muc con cua san pham";
        } else {
            $product_sub_category = $_POST['product_sub_category'];
        }


        // kiem tra upload
        if (empty($_FILES['file'])) {
            $error['file'] = "Khong duoc de trong file";
        } else {
            $upload_dir = 'uploads/products/';
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
            if (empty($new_qty)) {
                $data = array(
                    'product_name' => $product_name,
                    'code' => $product_code,
                    'status' => $status,
                    'price' => $price,
                    'excerpt' => $excerpt,
                    'content' => $desc,
                    'image' => $upload_file,
                    'cat_id' => $product_sub_category,
                    'created_name' => $username,
                    'created_at' => $created_at
                );
            } else {
                $data = array(
                    'product_name' => $product_name,
                    'code' => $product_code,
                    'status' => $status,
                    'price' => $price,
                    'qty' => $new_qty,
                    'excerpt' => $excerpt,
                    'content' => $desc,
                    'image' => $upload_file,
                    'cat_id' => $product_sub_category,
                    'created_name' => $username,
                    'created_at' => $created_at
                );
            }

            $insert_id =  insert_product_info($data);
            $_SESSION['insert_id'] = $insert_id;
        }
    }
    $cat_list = get_cat_list();
    $data['cat_list'] = $cat_list;
    load_view('add', $data);
}

function deleteAction()
{
    if (!empty($_GET['id'])) {
        $id = $_GET['id'];
        delete_product($id);
    }
    if (isset($_POST["submit_delete_item"])) {
        foreach ($_POST["checkItem"] as $key => $value) {
            $id = $value;
            $where = "product_id='$id'";
            db_delete("tbl_product", $where);
        }
    }
    redirect('?mod=product');
}
function editAction()
{
    if (!empty($_GET['id'])) {
        $id = (int)$_GET['id'];
        global $error, $product_name, $product_code, $price, $excerpt, $desc, $product_cat, $file;
        if (isset($_POST['btn_update'])) {

            $error = array();
            if (empty($_POST['product_name'])) {
                $error['product_name'] = "Khong duoc de trong ten san pham";
            } else {
                $product_name = $_POST['product_name'];
            }
            if (empty($_POST['product_code'])) {
                $error['product_code'] = "Khong duoc de trong ma san pham";
            } else {
                $product_code = $_POST['product_code'];
            }
            if (empty($_POST['price'])) {
                $error['price'] = "Khong duoc de trong gia san pham";
            } else {
                $price = $_POST['price'];
            }
            if (!empty($_POST['qty'])) {
                $qty = $_POST['qty'];
                $product_record = get_product_info_by_name($product_name);
                $old_qty = $product_record['qty'];
                $new_qty = $old_qty + $qty;
            }
            if (empty($_POST['excerpt'])) {
                $error['excerpt'] = "Khong duoc de trong mo ta ngan san pham";
            } else {
                $excerpt = $_POST['excerpt'];
            }
            if (empty($_POST['desc'])) {
                $error['desc'] = "Khong duoc de trong mo ta san pham";
            } else {
                $desc = $_POST['desc'];
            }
            if (empty($_POST['parent_id'])) {
                $error['cat_id'] = "Ban can chon danh muc san pham";
            }
            if (empty($_POST['product_sub_category'])) {
                $error['product_sub_category'] = "Ban can chon danh muc con cua san pham";
            } else {
                $product_sub_category = $_POST['product_sub_category'];
            }
            // kiem tra upload
            if (empty($_FILES['file'])) {
                $error['file'] = "Khong duoc de trong file";
            } else {
                $upload_dir = 'uploads/products/';
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
                $last_update = time();
                if (empty($new_qty)) {
                    $data = array(
                        'product_name' => $product_name,
                        'code' => $product_code,
                        'price' => $price,
                        'excerpt' => $excerpt,
                        'content' => $desc,
                        'image' => $upload_file,
                        'cat_id' => $product_sub_category,
                        'created_name' => $username,
                        'last_update' => $last_update
                    );
                } else {
                    $data = array(
                        'product_name' => $product_name,
                        'code' => $product_code,
                        'price' => $price,
                        'qty' => $qty,
                        'excerpt' => $excerpt,
                        'content' => $desc,
                        'image' => $upload_file,
                        'cat_id' => $product_sub_category,
                        'created_name' => $username,
                        'last_update' => $last_update
                    );
                }

                update_product_info($data, $id);
            }
        }

        $product_info = get_product_info($id);
        $product_cat_id = $product_info['cat_id'];
        $record = get_product_cat_info($product_cat_id);
        $product_parent_id = $record['parent_id'];
        $data['product_parent_id'] = $product_parent_id;
        $data['product_info'] = $product_info;
        $cat_list = get_cat_list();
        $data['cat_list'] = $cat_list;
        // $data['id'] = $id;
        load_view('edit', $data);
    }
}
function upload_singleAction()
{

    if ($_SERVER['REQUEST_METHOD'] == "POST") {
        global $error;
        //Bước 1: Tạo thư mục lưu file
        $error = array();
        $target_dir = "uploads/product-thumb/";
        $target_file = $target_dir . basename($_FILES['file']['name']);
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
            if (file_exists($target_file)) {
                $old_file_name = pathinfo($_FILES['file']['name'], PATHINFO_FILENAME);
                //Tao ra ten file moi
                $new_file_name = $old_file_name . ' - Copy.';
                $new_upload_file = $target_dir . $new_file_name . $file_tail;
                $k = 1;
                while (file_exists($new_upload_file)) {
                    //=====================================================
                    //Tiep tuc tao ra ten file moi
                    //=====================================================
                    $new_file_name = $old_file_name . " - Copy({$k}).";
                    $k++;
                    $new_upload_file = $target_dir . $new_file_name . $file_tail;
                }
                $target_file = $new_upload_file;
            }
        }
        //
        if (empty($error)) {
            if (move_uploaded_file($_FILES["file"]["tmp_name"], $target_file)) {
                $flag = true;
                echo json_encode(array('status' => 'ok', 'file_path' => $target_file));
                $_SESSION['insert_id'] = 29;
                $data = array(
                    'product_id' => $_SESSION['insert_id'],
                    'thumb_path' => $target_file
                );
                insert_thumb_product_info($data);
            } else {
                echo json_encode(array('status' => 'error'));
            }
        } else {
            echo json_encode(array('status' => 'error'));
        }
    }
}
