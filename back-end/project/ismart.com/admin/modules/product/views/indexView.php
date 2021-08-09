<?php
get_header();
?>
<div id="main-content-wp" class="list-product-page">
    <div class="wrap clearfix">
        <?php get_sidebar() ?>
        <div id="content" class="fl-right">
            <div class="section" id="title-page">
                <div class="clearfix">
                    <h3 id="index" class="fl-left">Danh sách sản phẩm</h3>
                    <a href="?mod=product&action=add" title="" id="add-new" class="fl-left">Thêm mới</a>
                </div>
            </div>
            <div class="section" id="detail-page">
                <div class="section-detail">
                    <div class="filter-wp clearfix">
                        <ul class="post-status fl-left">
                            <li class="all"><a href="">Tất cả <span class="count">(<?php echo count($product_list) ?>)</span></a> |</li>
                            <li class="publish"><a href="">Đã đăng <span class="count">(51)</span></a> |</li>
                            <li class="pending"><a href="">Chờ xét duyệt<span class="count">(0)</span> |</a></li>
                            <li class="pending"><a href="">Thùng rác<span class="count">(0)</span></a></li>
                        </ul>
                        <form method="GET" class="form-s fl-right form-actions">
                            <input type="hidden" name="mod" value="product">
                            Search by <select name="search_by" id="">
                                <option value="all" <?php if (!empty($search_by) && $search_by == "all") {
                                                        echo "selected";
                                                    } ?>>Tất cả</option>
                                <option value="product_name" <?php if (!empty($search_by) && $search_by == "product_name") {
                                                                    echo "selected";
                                                                } ?>>Tên sản phẩm</option>
                                <option value="price" <?php if (!empty($search_by) && $search_by == "price") {
                                                            echo "selected";
                                                        } ?>>Gía</option>
                                <option value="created_name" <?php if (!empty($search_by) && $search_by == "created_name") {
                                                                    echo "selected";
                                                                } ?>>Người tạo</option>
                            </select>
                            <input type="text" name="search_value" value="<?php if (!empty($search_value)) echo $search_value ?>">
                            <button type="submit" name="search" value="searched" class="btn-success"><i class="fa fa-search"></i>Tìm kiếm</button>
                        </form>
                    </div>
                    <form action="?mod=product&action=delete" method="POST">
                        <div class="table-responsive">
                            <table class="table list-table-wp">
                                <thead>
                                    <tr>
                                        <td><input type="checkbox" name="checkAll" id="checkAll"></td>
                                        <td><span class="thead-text">STT</span></td>
                                        <td><span class="thead-text">Mã sản phẩm</span></td>
                                        <td><span class="thead-text">Hình ảnh</span></td>
                                        <td><span class="thead-text">Tên sản phẩm</span></td>
                                        <td><span class="thead-text">Giá</span></td>
                                        <td><span class="thead-text">Số lượng</span></td>
                                        <td><span class="thead-text">Danh mục</span></td>
                                        <td><span class="thead-text">Trạng thái</span></td>
                                        <td><span class="thead-text">Người tạo</span></td>
                                        <td><span class="thead-text">Thời gian</span></td>
                                        <td><span class="thead-text">Thời gian cập nhật</span></td>
                                    </tr>
                                </thead>
                                <?php
                                if (!empty($product_list)) {
                                ?>
                                    <tbody>
                                        <?php
                                        $ordinal_numbers = 0;
                                        foreach ($product_list as $item) {
                                            $ordinal_numbers += 1;
                                        ?>

                                            <tr>
                                                <td><input type="checkbox" name="checkItem" class="checkItem"></td>
                                                <td><span class="tbody-text"><?php echo $ordinal_numbers; ?></h3></span>
                                                <td><span class="tbody-text"><?php echo $item['code'] ?></h3></span>
                                                <td>
                                                    <div class="tbody-thumb">
                                                        <img src="<?php echo $item['image'] ?>" alt="">
                                                    </div>
                                                </td>
                                                <td class="clearfix">
                                                    <div class="tb-title fl-left">
                                                        <a href="" title=""><?php echo $item['product_name'] ?></a>
                                                    </div>
                                                    <ul class="list-operation fl-right">
                                                        <li><a href="?mod=product&action=edit&id=<?php echo $item['product_id'] ?>" title="Sửa" class="edit"><i class="fa fa-pencil" aria-hidden="true"></i></a></li>
                                                        <li><a href="?mod=product&action=delete&id=<?php echo $item['product_id'] ?>" title="Xóa" class="delete"><i class="fa fa-trash" aria-hidden="true"></i></a></li>
                                                    </ul>
                                                </td>
                                                <td><span class="tbody-text"><?php echo currency_format($item['price'])  ?></span></td>
                                                <td><span class="tbody-text"><?php echo $item['qty'] ?></span></td>
                                                <td><span class="tbody-text"><?php echo $item['cat_id'] ?></span></td>
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
                                <button type="submit" name="submit_delete_item" onclick="if(confirm('Bạn có chắc chắn muốn xóa các mục này không ?')){
                                        return true;
                                    }else{return false;}">Xóa tất cả</button>
                            </table>
                        </div>
                    </form>
                </div>
            </div>
            <div class="section" id="paging-wp">
                <div class="section-detail clearfix">
                    <p id="desc" class="fl-left">Chọn vào checkbox để lựa chọn tất cả</p>
                    <?php
                    if (empty($search_value)) {
                        echo get_pagging($num_page, $page, "?mod=product");
                    } else {
                        echo get_pagging($num_page, $page, "?mod=product&search_by={$search_by}&search_value={$search_value}&search=searched");
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