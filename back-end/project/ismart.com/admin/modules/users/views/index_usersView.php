<?php
get_header();
?>
<div id="main-content-wp" class="list-post-page">
    <div class="wrap clearfix">
        <?php get_sidebar() ?>
        <div id="content" class="fl-right">
            <div class="section" id="title-page">
                <div class="clearfix">
                    <h3 id="index" class="fl-left">Danh sách thành viên quản lý web</h3>
                    <a href="?mod=users&controller=team&action=add" title="" id="add-new" class="fl-left">Thêm mới</a>
                </div>
            </div>
            <div class="section" id="detail-page">
                <div class="section-detail">
                    <div class="filter-wp clearfix">
                        <ul class="post-status fl-left">
                            <li class="all"><a href="">Tất cả <span class="count">(<?php echo count($list_users) ?>)</span></a></li>
                        </ul>
                        <form method="GET" class="form-s fl-right form-actions">
                            <input type="hidden" name="mod" value="users">
                            <input type="hidden" name="controller" value="team">
                            Search by <select name="search_by" id="">
                                <option value="all" <?php if (!empty($search_by) && $search_by == "all") {
                                                        echo "selected";
                                                    } ?>>Tất cả</option>
                                <option value="fullname" <?php if (!empty($search_by) && $search_by == "fullname") {
                                                                echo "selected";
                                                            } ?>>Họ và tên</option>
                                <option value="email" <?php if (!empty($search_by) && $search_by == "email") {
                                                            echo "selected";
                                                        } ?>>Email</option>
                                <option value="address" <?php if (!empty($search_by) && $search_by == "address") {
                                                            echo "selected";
                                                        } ?>>Địa chỉ</option>
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
                                    <td><span class="thead-text">Họ và tên</span></td>
                                    <td><span class="thead-text">Email</span></td>
                                    <td><span class="thead-text">Địa chỉ</span></td>
                                    <td><span class="thead-text">Số điện thoại</span></td>
                                    <td><span class="thead-text">Chức năng</span></td>
                                    <td><span class="thead-text">Thời gian tạo</span></td>
                                </tr>
                            </thead>
                            <?php
                            if (!empty($list_users)) {
                            ?>
                                <tbody>
                                    <?php
                                    $ordinal_number = 0;
                                    foreach ($list_users as $item) {
                                        $ordinal_number += 1;
                                    ?>
                                        <tr>
                                            <td><input type="checkbox" name="checkItem" class="checkItem"></td>
                                            <td><span class="tbody-text"><?php echo $ordinal_number ?></h3></span>
                                            <td class="clearfix">
                                                <div class="tb-title fl-left">
                                                    <a href="" title=""><?php echo $item['fullname'] ?></a>
                                                </div>
                                                <ul class="list-operation fl-right">
                                                    <li><a href="?mod=users&action=info_account" title="Sửa" class="edit"><i class="fa fa-pencil" aria-hidden="true"></i></a></li>
                                                    <li><a href="?mod=users&controller=team&action=delete&id=<?php echo $item['user_id'] ?>" title="Xóa" class="delete"><i class="fa fa-trash" aria-hidden="true"></i></a></li>
                                                </ul>
                                            </td>
                                            <td><span class="tbody-text"><?php echo $item['email'] ?></span></td>
                                            <td><span class="tbody-text"><?php echo $item['address'] ?></span></td>
                                            <td><span class="tbody-text"><?php echo $item['phone_number'] ?></span></td>
                                            <td><span class="tbody-text"><?php echo $item['role'] ?></span></td>
                                            <td><span class="tbody-text"><?php echo date('d/m/Y H:i', $item['created_date'])  ?></span></td>
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
                        echo get_pagging($num_page, $page, "?mod=users&controller=team");
                    } else {
                        echo get_pagging($num_page, $page, "?mod=users&controller=team&search_by={$search_by}&search_value={$search_value}&search=searched");
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