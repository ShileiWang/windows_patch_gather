<?php
session_start();
include('config.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // $hostname = $_POST['hostname'];
    // $ip_address = $_POST['ip_address'];
    // $mac_address = $_POST['mac_address'];
    $patch_num = $_POST['patch_num'];
    $patch_level = $_POST['patch_level'];
    $patch_descri = $_POST['patch_descri'];
    $patch_time = $_POST['patch_time'];

    $sql = "INSERT INTO patchinfo (patch_num, patch_level, patch_descri, patch_time) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssss", $patch_num, $patch_level, $patch_descri, $patch_time);

    if ($stmt->execute()) {
        echo "补丁记录添加成功！";
    } else {
        echo "添加失败: " . $stmt->error;
    }
}
?>

<!-- HTML表单 -->
<form method="post" action="add_patch.php">
    <!-- 终端名称: <input type="text" name="hostname" required><br>
    IP 地址: <input type="text" name="ip_address" required><br>
    MAC 地址: <input type="text" name="mac_address" required><br> -->
    补丁编号: <input type="text" name="patch_num" required><br>
    补丁级别: <input type="text" name="patch_level" required><br>
    补丁描述: <textarea name="patch_descri" required></textarea><br>
    补丁发布时间: <input type="text" name="patch_time" required><br>
    <button type="submit">添加补丁</button>
</form>

