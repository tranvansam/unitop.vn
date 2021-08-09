<?php
function construct()
{
    //    echo "DÙng chung, load đầu tiên";
    //khai bao nhu nay thi tat ca cac action se duoc ap dung goi sang phan model
    load_model('index');
    load('lib', 'validation');
}

function indexAction()
{
    if (isset($_GET['search'])) {
        if ($_GET['search_by'] == 'all') {
            $search_value = $_GET['search_value'];
            $result = pagging_order("SELECT * FROM `tbl_order_detail` WHERE `product_name` LIKE '%$search_value%' OR `code` LIKE '%$search_value%'", "`product_name` LIKE '%$search_value%' OR `code` LIKE '%$search_value%'", 5, "tbl_order_detail");
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
            $result = pagging_order("SELECT * FROM `tbl_order_detail` WHERE `product_name` LIKE '%$search_value%'", "`product_name` LIKE '%$search_value%'", 5, "tbl_order_detail");
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
            $result = pagging_order("SELECT * FROM `tbl_order_detail` WHERE `price` LIKE '%$search_value%'", "`price` LIKE '%$search_value%'", 5, "tbl_order_detail");
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
        $result = pagging_order("SELECT * FROM `tbl_order_detail`", "", 5, "tbl_order_detail");
        $data = array(
            'num_page' => $result['num_page'],
            'page' => $result['page'],
            'product_list' => $result['list_pages']
        );
    }
    load_view('index', $data);
}
function customer_listAction()
{
    if (isset($_GET['search'])) {
        if ($_GET['search_by'] == 'all') {
            $search_value = $_GET['search_value'];
            $result = pagging_order("SELECT * FROM `tbl_order` WHERE `fullname` LIKE '%$search_value%' OR `address` LIKE '%$search_value%'", "`fullname` LIKE '%$search_value%' OR `address` LIKE '%$search_value%'", 5, "tbl_order");
            // show_array($result['list_pages']);
            $data = array(
                'num_page' => $result['num_page'],
                'page' => $result['page'],
                'product_list' => $result['list_pages'],
                'search_by' => $_GET['search_by'],
                'search_value' => $search_value
            );
        }
        if ($_GET['search_by'] == 'fullname') {
            $search_value = $_GET['search_value'];
            $result = pagging_order("SELECT * FROM `tbl_order` WHERE `fullname` LIKE '%$search_value%'", "`fullname` LIKE '%$search_value%'", 5, "tbl_order");
            // show_array($result['list_pages']);
            $data = array(
                'num_page' => $result['num_page'],
                'page' => $result['page'],
                'product_list' => $result['list_pages'],
                'search_by' => $_GET['search_by'],
                'search_value' => $search_value
            );
        }
        if ($_GET['search_by'] == 'phone') {
            $search_value = $_GET['search_value'];
            $result = pagging_order("SELECT * FROM `tbl_order` WHERE `phone` LIKE '%$search_value%'", "`phone` LIKE '%$search_value%'", 5, "tbl_order");
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
        $result = pagging_order("SELECT * FROM `tbl_order`", "", 5, "tbl_order");
        $data = array(
            'num_page' => $result['num_page'],
            'page' => $result['page'],
            'product_list' => $result['list_pages']
        );
    }
    load_view('customer_list', $data);
}
function detailAction()
{
    $id = (int)$_GET['id'];
    $order_info = get_order_info($id);
    $customer_info = get_customer_info($id);
    $data = array(
        'order_info' => $order_info,
        'customer_info' => $customer_info
    );
    load_view('detail', $data);
}
function deleteAction()
{
    if (isset($_GET['id'])) {
        $id = (int)$_GET['id'];
        delete_order($id);
    }
    if (isset($_POST["submit_delete_item"])) {
        foreach ($_POST["checkItem"] as $key => $value) {
            $id = $value;
            $where = "id='$id'";
            db_delete("tbl_order_detail", $where);
        }
        redirect('?mod=sales');
    }
   
}
function delete_customerAction()
{
    if (isset($_GET['id'])) {
        $id = (int)$_GET['id'];
        delete_customer($id);
    }
    if (isset($_POST["submit_delete_item"])) {
        foreach ($_POST["checkItem"] as $key => $value) {
            $id = $value;
            $where = "order_id='$id'";
            db_delete("tbl_order", $where);
        }
        redirect('?mod=sales');
    }
   
}