<?php

function construct()
{
    //    echo "DÙng chung, load đầu tiên";
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
    #. Pagination


}
