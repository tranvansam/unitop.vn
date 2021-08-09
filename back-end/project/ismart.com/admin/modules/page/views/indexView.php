<?php
get_header();
?>
<div id="main-content-wp" class="list-post-page">
    <div class="wrap clearfix">
        <?php get_sidebar(); ?>
        <div id="content" class="fl-right">
            <div class="section" id="title-page">
                <div class="clearfix">
                    <h3 id="index" class="fl-left">Danh sách trang</h3>
                    <a href="?mod=page&action=add" title="" id="add-new" class="fl-left">Thêm mới</a>
                </div>
            </div>
            <div class="section" id="detail-page">
                <div class="section-detail">
                    <div class="filter-wp clearfix">
                        <ul class="post-status fl-left">
                            <li class="all"><a href="">Tất cả <span class="count">(<?php echo count($page_list) ?>)</span></a></li>
                        </ul>
                        <form method="GET" class="form-s fl-right form-actions">
                            <input type="hidden" name="mod" value="page">
                            Search by <select name="search_by" id="">
                                <option value="all" <?php if (!empty($search_by) && $search_by == "all") {
                                                        echo "selected";
                                                    } ?>>Tất cả</option>
                                <option value="page_title" <?php if (!empty($search_by) && $search_by == "page_title") {
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
                    <?php
                    if (!empty($page_list)) {
                    ?>

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
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $num = 0;
                                    foreach ($page_list as $item) {
                                        $num++;
                                    ?>
                                        <tr>
                                            <td><input type="checkbox" name="checkItem" class="checkItem"></td>
                                            <td><span class="tbody-text"><?php echo $num ?></h3></span>
                                            <td class="clearfix">
                                                <div class="tb-title fl-left">
                                                    <a href="" title=""><?php echo $item['page_title'] ?></a>
                                                </div>
                                                <ul class="list-operation fl-right">
                                                    <li><a href="?mod=page&action=edit&id=<?php echo $item['id'] ?>" title="Sửa" class="edit"><i class="fa fa-pencil" aria-hidden="true"></i></a></li>
                                                    <li><a href="?mod=page&action=delete&id=<?php echo $item['id'] ?>" title="Xóa" class="delete"><i class="fa fa-trash" aria-hidden="true"></i></a></li>
                                                </ul>
                                            </td>
                                            <td><span class="tbody-text"><?php echo $item['status'] ?></span></td>
                                            <td><span class="tbody-text"><?php echo $item['created_name'] ?></span></td>
                                            <td><span class="tbody-text"><?php echo date('d/m/Y H:i', $item['created_at']) ?></span></td>
                                        </tr>
                                    <?php
                                    }
                                    ?>
                                </tbody>
                            </table>
                        </div>
                    <?php
                    }
                    ?>
                </div>
            </div>
            <div class="section" id="paging-wp">
                <div class="section-detail clearfix">
                    <?php
                    if (empty($search_value)) {
                        echo get_pagging($num_page, $page, "?mod=page");
                    } else {
                        echo get_pagging($num_page, $page, "?mod=page&search_by={$search_by}&search_value={$search_value}&search=searched");
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