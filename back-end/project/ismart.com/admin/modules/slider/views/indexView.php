<?php
get_header();
?>
<div id="main-content-wp" class="list-product-page list-slider">
    <div class="wrap clearfix">
        <?php get_sidebar() ?>
        <div id="content" class="fl-right">
            <div class="section" id="title-page">
                <div class="clearfix">
                    <h3 id="index" class="fl-left">Danh sách slider</h3>
                    <a href="?page=add_cat" title="" id="add-new" class="fl-left">Thêm mới</a>
                </div>
            </div>
            <div class="section" id="detail-page">
                <div class="section-detail">
                    <div class="filter-wp clearfix">
                        <ul class="post-status fl-left">
                            <li class="all"><a href="">Tất cả <span class="count">(<?php echo count($slider_list) ?>)</span></a></li>
                        </ul>
                        <form method="GET" class="form-s fl-right">
                            <input type="hidden" name="mod" value="slider">
                            Search by <select name="search_by" id="">
                                <option value="all" <?php if (!empty($search_by) && $search_by == "all") {
                                                        echo "selected";
                                                    } ?>>Tất cả</option>
                                <option value="slider_title" <?php if (!empty($search_by) && $search_by == "slider_title") {
                                                                    echo "selected";
                                                                } ?>>Tên slider</option>
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
                                <option value="1">Công khai</option>
                                <option value="1">Chờ duyệt</option>
                                <option value="2">Bỏ vào thủng rác</option>
                            </select>
                            <input type="submit" name="sm_action" value="Áp dụng">
                        </form>
                    </div>
                    <form action="?mod=slider&action=delete" method="POST">
                        <div class="table-responsive">
                            <table class="table list-table-wp">
                                <thead>
                                    <tr>
                                        <td><input type="checkbox" name="checkAll" id="checkAll"></td>
                                        <td><span class="thead-text">STT</span></td>
                                        <td><span class="thead-text">Tên slider</span></td>
                                        <td><span class="thead-text">Hình ảnh</span></td>
                                        <td><span class="thead-text">Link</span></td>
                                        <td><span class="thead-text">Thứ tự</span></td>
                                        <td><span class="thead-text">Trạng thái</span></td>
                                        <td><span class="thead-text">Người tạo</span></td>
                                        <td><span class="thead-text">Thời gian</span></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $num = 0;
                                    foreach ($slider_list as $item) {
                                        $num++;
                                    ?>

                                        <tr>
                                            <td><input type="checkbox" name="checkItem[]" value="<?php echo $item["id"] ?>" class="checkItem"></td>
                                            <td><span class="tbody-text"><?php echo $num ?></h3></span>
                                            <td><span class="tbody-text"><?php echo $item['title'] ?></h3></span>
                                            <td>
                                                <div class="tbody-thumb">
                                                    <img src="<?php echo $item['image'] ?>" alt="">
                                                </div>
                                            </td>
                                            <td class="clearfix">
                                                <div class="tb-title fl-left">
                                                    <a href="" title=""><?php echo $item['link'] ?></a>
                                                </div>
                                                <ul class="list-operation fl-right">
                                                    <li><a href="?mod=slider&action=edit&id=<?php echo $item['id'] ?>" title="Sửa" class="edit"><i class="fa fa-pencil" aria-hidden="true"></i></a></li>
                                                    <li><a href="?mod=slider&action=delete&id=<?php echo $item['id'] ?>" title="Xóa" class="delete"><i class="fa fa-trash" aria-hidden="true"></i></a></li>
                                                </ul>
                                            </td>
                                            <td><span class="tbody-text"><?php echo $item['num_order'] ?></span></td>
                                            <td><span class="tbody-text"><?php echo $item['status'] ?></span></td>
                                            <td><span class="tbody-text"><?php echo $item['created_name'] ?></span></td>
                                            <td><span class="tbody-text"><?php echo date('d/m/Y H:i', $item['created_at']) ?></span></td>
                                        </tr>
                                    <?php
                                    }
                                    ?>
                                    <button type="submit" name="submit_delete_item" onclick="if(confirm('Bạn có chắc chắn muốn xóa các mục này không ?')){
                                        return true;
                                    }else{return false;}">Xóa tất cả</button>
                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>
            </div>
            <div class="section" id="paging-wp">
                <div class="section-detail clearfix">
                    <p id="desc" class="fl-left">Chọn vào checkbox để lựa chọn tất cả</p>
                    <div class="pagging">
                        <?php
                        if (empty($search_value)) {
                            echo get_pagging($num_page, $page, "?mod=slider");
                        } else {
                            echo get_pagging($num_page, $page, "?mod=slider&search_by={$search_by}&search_value={$search_value}&search=searched");
                        }
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
get_footer();
?>