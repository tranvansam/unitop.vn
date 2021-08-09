<?php
get_header();
?>

<div id="content">
    <h1>Danh sach thanh vien</h1>
    <table>
        <thead>
            <tr>
                <td>STT</td>
                <td>Ten</td>
                <td>Email</td>
                <td>Earn</td>
            </tr>
        </thead>
        <tbody>
            <?php

            if (!empty($list_users)) {
                $t = 0;
                foreach ($list_users as $users) {
                    $t++;
            ?>
                    <tr>
                        <td><?php echo $t;  ?></td>
                        <td><?php echo $users['username'] ?></td>
                        <td><?php echo $users['email'] ?></< /td>
                        <td><?php echo currency_format($users['earn'], 'k') ?></< /td>
                    </tr>
            <?php
                }
            }
            ?>

        </tbody>
    </table>
</div>

<?php
get_footer();
?>