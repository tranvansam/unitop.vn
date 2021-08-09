<?php
get_header();
?>
<div id="main-content-wp" class="list-product-page">
    <div class="wrap clearfix">
        <?php get_sidebar(); ?>
        <div id="content" class="fl-right">
            <div class="section" id="title-page">
                <div class="clearfix">
                    <h3 id="index" class="fl-left">Danh sách đơn hàng</h3>
                </div>
            </div>
            <div class="section" id="detail-page">
                <div class="section-detail">
                    <div class="filter-wp clearfix">
                        <ul class="post-status fl-left">
                            <li class="all"><a href="">Tất cả <span class="count">(<?php echo count($product_list) ?>)</span></a></li>
                        </ul>
                        <form method="GET" class="form-s fl-right" id="search_ajax">
                            <input type="hidden" name="mod" value="sales">
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
                    <?php
                    if (!empty($product_list)) {
                    ?>
                        <form action="?mod=sales&action=delete" method="POST">
                            <div class="table-responsive">
                                <table class="table list-table-wp">
                                    <thead>
                                        <tr>
                                            <td><input type="checkbox" name="checkAll" id="checkAll"></td>
                                            <td><span class="thead-text">STT</span></td>
                                            <td><span class="thead-text">Mã đơn hàng</span></td>
                                            <td><span class="thead-text">Khách hàng</span></td>
                                            <td><span class="thead-text">Tên sản phẩm</span></td>
                                            <td><span class="thead-text">Số sản phẩm</span></td>
                                            <td><span class="thead-text">Tổng giá</span></td>
                                            <td><span class="thead-text">Thời gian</span></td>
                                            <td><span class="thead-text">Thời gian cập nhật</span></td>
                                        </tr>
                                    </thead>
                                    <tbody class="order_info">
                                        <?php
                                        $num = 0; 
                                        foreach ($product_list as $item) {
                                            $num++;
                                        ?>

                                            <tr>
                                                <td><input type="checkbox" name="checkItem[]" value="<?php echo $item["id"] ?>" class="checkItem"></td>
                                                <td><span class="tbody-text"><?php echo $num ?></span></td>
                                                <td><span class="tbody-text"><?php echo $item['code'] ?></span></td>
                                                <td>
                                                    <div class="tb-title fl-left">
                                                        <span class="tbody-text"><?php echo $item['order_id'] ?></span>
                                                    </div>
                                                    <ul class="list-operation fl-right">
                                                        <li><a href="" title="Sửa" class="edit"><i class="fa fa-pencil" aria-hidden="true"></i></a></li>
                                                        <li><a href="?mod=sales&action=delete&id=<?php echo $item['id'] ?>" title="Xóa" class="delete"><i class="fa fa-trash" aria-hidden="true"></i></a></li>
                                                    </ul>
                                                </td>
                                                <td><span class="tbody-text"><?php echo $item['product_name'] ?></span></td>
                                                <td><span class="tbody-text"><?php echo $item['qty'] ?></span></td>
                                                <td><span class="tbody-text"><?php echo currency_format($item['price'] * $item['qty']) ?></span></td>
                                                <td><span class="tbody-text"><?php echo date('d/m/Y H:i', $item['created_at']) ?></span></td>
                                                <td><span class="tbody-text"><?php echo date('d/m/Y H:i', $item['last_update']) ?></span></td>
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
                    <?php
                    }
                    ?>
                </div>
            </div>
            <div class="section" id="paging-wp">
                <div class="section-detail clearfix" id="section-sale">
                    <p id="desc" class="fl-left">Chọn vào checkbox để lựa chọn tất cả</p>
                    <div id="str_pagging">
                        <?php
                        if (empty($search_value)) {
                            echo get_pagging($num_page, $page, "?mod=sales");
                        } else {
                            echo get_pagging($num_page, $page, "?mod=sales&search_by={$search_by}&search_value={$search_value}&search=searched");
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