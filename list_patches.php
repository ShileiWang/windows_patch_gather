<?php
session_start();
include('config.php');

$sql = "SELECT * FROM patchinfo ORDER BY patch_time DESC";
$result = $conn->query($sql);
?>

<h2>漏洞补丁列表</h2>
<a href="add_patch.php">增加补丁信息</a>
<table border="1">
    <tr>
        <th>ID</th>
        <th>补丁编号</th>
        <th>补丁级别</th>
        <th>补丁描述</th>
        <th>补丁发布时间</th>
    </tr>
    <?php while ($row = $result->fetch_assoc()) { ?>
        <tr>
            <td><?php echo $row['id']; ?></td>
            <td><?php echo $row['patch_num']; ?></td>
            <td><?php echo $row['patch_level']; ?></td>
            <td><?php echo $row['patch_descri']; ?></td>
            <td><?php echo $row['patch_time']; ?></td>
        </tr>
    <?php } ?>
</table>

