<?php
get_header();
?>
<div id="main-content-wp" class="list-cat-page">
    <div class="wrap clearfix">
        <?php get_sidebar() ?>
        <div id="content" class="fl-right">
            <div class="section" id="title-page">
                <div class="clearfix">
                    <h3 id="index" class="fl-left">Danh sách danh mục</h3>
                    <a href="?mod=product&controller=product_cat&action=add" title="" id="add-new" class="fl-left">Thêm mới</a>
                </div>
            </div>
            <div class="section" id="detail-page">
                <div class="section-detail">
                    <div class="table-responsive">
                        <table class="table list-table-wp">
                            <thead>
                                <tr>
                                    <td><input type="checkbox" name="checkAll" id="checkAll"></td>
                                    <td><span class="thead-text">STT</span></td>
                                    <td><span class="thead-text">Tiêu đề</span></td>
                                    <td><span class="thead-text">Danh mục cha</span></td>
                                    <td><span class="thead-text">Trạng thái</span></td>
                                    <td><span class="thead-text">Người tạo</span></td>
                                    <td><span class="thead-text">Thời gian</span></td>
                                    <td><span class="thead-text">Thời gian cập nhật</span></td>

                                </tr>
                            </thead>
                            <?php
                            if (!empty($product_cat)) {
                                $ordinal_number = 0;
                            ?>
                                <tbody>
                                    <?php
                                    foreach ($product_cat as $item) {
                                        $ordinal_number += 1;
                                    ?>
                                        <tr>
                                            <td><input type="checkbox" name="checkItem" class="checkItem"></td>
                                            <td><span class="tbody-text"><?php echo $ordinal_number; ?></h3></span>
                                            <td class="clearfix">
                                                <div class="tb-title fl-left">
                                                    <a href="" title=""><?php echo $item['cat_title'] ?></a>
                                                </div>
                                                <ul class="list-operation fl-right">
                                                    <li><a href="?mod=product&controller=product_cat&action=edit_cat&id=<?php echo $item['cat_id'] ?>" title="Sửa" class="edit"><i class="fa fa-pencil" aria-hidden="true"></i></a></li>
                                                    <li><a href="?mod=product&controller=product_cat&action=delete_cat&id=<?php echo $item['cat_id'] ?>" title="Xóa" class="delete"><i class="fa fa-trash" aria-hidden="true"></i></a></li>
                                                </ul>
                                            </td>
                                            <td><span class="tbody-text"><?php echo $item['parent_id'] ?></span></td>
                                            <td><strong class="tbody-text text-uppercase" style="color:<?php if ($item["status"] == "Active") {
                                                                                                            echo "green";
                                                                                                        } else {
                                                                                                            echo "red";
                                                                                                        } ?>"><?php echo $item["status"] ?></strong></td>
                                            <td><span class="tbody-text"><?php echo $item['created_name'] ?></span></td>
                                            <td><span class="tbody-text"><?php echo date('d/m/Y H:i', $item['created_at']) ?></span></td>
                                            <td><span class="tbody-text"><?php echo date('d/m/Y H:i', $item['last_update']) ?></span></td>
                                        </tr>
                                    <?php
                                    }
                                    ?>
                                </tbody>
                            <?php
                            }
                            ?>
                            <tfoot>
                                <tr>
                                    <td><input type="checkbox" name="checkAll" id="checkAll"></td>
                                    <td><span class="tfoot-text">STT</span></td>
                                    <td><span class="tfoot-text-text">Tiêu đề</span></td>
                                    <td><span class="tfoot-text">Danh mục cha</span></td>
                                    <td><span class="tfoot-text">Trạng thái</span></td>
                                    <td><span class="tfoot-text">Người tạo</span></td>
                                    <td><span class="tfoot-text">Thời gian</span></td>
                                    <td><span class="thead-text">Thời gian cập nhật</span></td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
            <div class="section" id="paging-wp">
                <div class="section-detail clearfix">
                    <p id="desc" class="fl-left">Chọn vào checkbox để lựa chọn tất cả</p>
                    <?php
                    echo get_pagging($num_page, $page, "?mod=product&controller=product_cat&action=product_cat");
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
get_footer();
?>