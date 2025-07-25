<?php
$servername = "localhost:3306";
$username = "root"; // MySQL用户名
$password = "123456"; // MySQL密码
$dbname = "patch_management"; // 数据库名称

// 创建数据库连接
$conn = new mysqli($servername, $username, $password, $dbname);
$conn->set_charset("utf8mb4");

// 检查连接
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>

