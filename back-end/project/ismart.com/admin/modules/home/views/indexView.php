<?php
get_header();
?>
<div id="main-content-wp" class="list-post-page">
    <div class="wrap clearfix">
        <?php get_sidebar() ?>
        <div id="content" class="fl-right">
            <div class="section" id="title-page">
                <div class="clearfix">
                    <h3 id="index" class="fl-left">Danh sách bài viết</h3>
                    <a href="?mod=post&action=add" title="" id="add-new" class="fl-left">Thêm mới</a>
                </div>
            </div>
            <div class="section" id="detail-page">
                <div class="section-detail">
                    <div class="filter-wp clearfix">
                        <ul class="post-status fl-left">
                            <li class="all"><a href="">Tất cả <span class="count">(<?php echo count($post_list) ?>)</span></a></li>
                        </ul>
                        <form method="GET" class="form-s fl-right form-actions">
                            Search by <select name="search_by" id="">
                                <option value="all" <?php if (!empty($search_by) && $search_by == "all") {
                                                        echo "selected";
                                                    } ?>>Tất cả</option>
                                <option value="post_title" <?php if (!empty($search_by) && $search_by == "product_name") {
                                                                echo "selected";
                                                            } ?>>Tiêu đề</option>
                                <option value="created_name" <?php if (!empty($search_by) && $search_by == "created_name") {
                                                                    echo "selected";
                                                                } ?>>Người tạo</option>
                            </select>
                            <input type="text" name="search_value" value="<?php if (!empty($search_value)) echo $search_value ?>">
                            <button type="submit" name="search" value="searched" class="btn-success"><i class="fa fa-search"></i>Tìm kiếm</button>
                        </form>
                    </div>
                    <div class="actions">
                        <form method="GET" action="" class="form-actions">
                            <select name="actions">
                                <option value="0">Tác vụ</option>
                                <option value="1">Chỉnh sửa</option>
                                <option value="2">Bỏ vào thủng rác</option>
                            </select>
                            <input type="submit" name="sm_action" value="Áp dụng">
                        </form>
                    </div>
                    <div class="table-responsive">
                        <table class="table list-table-wp">
                            <thead>
                                <tr>
                                    <td><input type="checkbox" name="checkAll" id="checkAll"></td>
                                    <td><span class="thead-text">STT</span></td>
                                    <td><span class="thead-text">Tiêu đề</span></td>
                                    <td><span class="thead-text">Trạng thái</span></td>
                                    <td><span class="thead-text">Người tạo</span></td>
                                    <td><span class="thead-text">Thời gian</span></td>
                                    <td><span class="thead-text">Thời gian cập nhật</span></td>
                                </tr>
                            </thead>
                            <?php
                            if (!empty($post_list)) {
                            ?>
                                <tbody>
                                    <?php
                                    $ordinal_number = 0;
                                    foreach ($post_list as $item) {
                                        $ordinal_number += 1;
                                    ?>
                                        <tr>
                                            <td><input type="checkbox" name="checkItem" class="checkItem"></td>
                                            <td><span class="tbody-text"><?php echo $ordinal_number ?></h3></span>
                                            <td class="clearfix">
                                                <div class="tb-title fl-left">
                                                    <a href="" title=""><?php echo $item['post_title'] ?></a>
                                                </div>
                                                <ul class="list-operation fl-right">
                                                    <li><a href="?mod=post&action=edit&id=<?php echo $item['id'] ?>" title="Sửa" class="edit"><i class="fa fa-pencil" aria-hidden="true"></i></a></li>
                                                    <li><a href="?mod=post&action=delete&id=<?php echo $item['id'] ?>" title="Xóa" class="delete"><i class="fa fa-trash" aria-hidden="true"></i></a></li>
                                                </ul>
                                            </td>
                                            <td><strong class="tbody-text text-uppercase" style="color:<?php if ($item["status"] == "Active") {
                                                                                                            echo "green";
                                                                                                        } else {
                                                                                                            echo "red";
                                                                                                        } ?>"><?php echo $item["status"] ?></strong></td>
                                            <td><span class="tbody-text"><?php echo $item['created_name'] ?></span></td>
                                            <td><span class="tbody-text"><?php echo date('d/m/Y H:i', $item['created_at'])  ?></span></td>
                                            <td><span class="tbody-text"><?php echo date('d/m/Y H:i', $item['last_update'])  ?></span></td>
                                        </tr>
                                    <?php
                                    }
                                    ?>
                                </tbody>
                            <?php
                            }
                            ?>
                            </tfoot>
                        </table>
                    </div>

                </div>
            </div>
            <div class="section" id="paging-wp">
                <div class="section-detail clearfix">
                    <?php
                    // echo get_pagging($num_page, $page, "?mod=post");
                    if (empty($search_value)) {
                        echo get_pagging($num_page, $page, "?");
                    } else {
                        echo get_pagging($num_page, $page, "?search_by={$search_by}&search_value={$search_value}&search=searched");
                    }
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
get_footer();
?>