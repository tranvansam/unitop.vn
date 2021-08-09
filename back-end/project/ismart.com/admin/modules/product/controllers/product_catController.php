<?php
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
    global $error, $title, $desc, $parent_id;
    if (isset($_POST['btn_submit'])) {
        $error = array();
        if (empty($_POST['title'])) {
            $error['title'] = "Ban khong duoc de trong ten danh muc";
        } else {
            $title = $_POST['title'];
            $record = check_cat();
            foreach ($record as $item) {
                if ($title == $item['cat_title']) {
                    $error['title'] = "Danh muc nay da ton tai";
                }
            }
        }
        if (empty($_POST['status'])) {
            $error['status'] = "Khong duoc de trong trang thai danh muc";
        } else {
            $status = $_POST['status'];
        }
      
        if (empty($_POST['parent_id'])) {
            $parent_id = 0;
        } else {
            $parent_id = $_POST['parent_id'];
            $record = get_cat_info($parent_id);
            $parent_id = $record['cat_id'];
        }
        if (empty($error)) {
            $created_at = time();
            $created_name = user_login();
            $data  = array(
                'cat_title' => $title,
                'status' => $status,
                'parent_id' => $parent_id,
                // 'desc' => $desc,
                'created_at' => $created_at,
                'created_name' => $created_name
            );

            db_insert('tbl_product_cat', $data);
        }
    }
    $cat_list = get_cat_list();
    $data['cat_list'] = $cat_list;
    load_view('add_cat', $data);
}
function product_catAction()
{
    $num_rows = db_num_rows("SELECT * FROM `tbl_product_cat`");
    // so luong ban ghi tren trang
    $num_per_page = 5;
    $total_rows = $num_rows;
    $num_page = ceil($total_rows / $num_per_page);

    //Tinh duoc diem xuat phat
    $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
    $start = ($page - 1) * $num_per_page;
    $product_cat = get_product_cat_pages($start, $num_per_page);
    // show_array($page_info);
    $data['num_page'] = $num_page;
    $data['page'] = $page;
    $data['product_cat'] = $product_cat;
    load_view('product_cat', $data);
}
function edit_catAction()
{
}
function delete_catAction()
{
}
function ajax_sub_catAction()
{
    $sub_cat = $_POST['sub_cat'];
    $sub_cat_list =  get_sub_list($sub_cat);
    $list_sub = "";
    $list_sub .= "<option value=''>-Sub Category-</option>";
    foreach ($sub_cat_list as $sub_cat) {
        $list_sub .= "<option value='" . $sub_cat['cat_id'] . "'>" . $sub_cat['cat_title'] . "</option>";
    }
    echo $list_sub;
}
