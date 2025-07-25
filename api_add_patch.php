<?php
include('config.php'); // 确保正确连接数据库

// 读取 JSON 数据
$data = json_decode(file_get_contents('php://input'), true);
$data = $data['text'];


if (!$data) {
    error_log("JSON 解析失败: " . file_get_contents('php://input'));
    echo json_encode(["status" => "error", "message" => "无效的 JSON 数据"]);
    exit;
}

// 逐行处理数据
$lines = explode("\n", $data['content']);
$inserted = 0;

foreach ($lines as $line) {
    $fields = explode(",", trim($line));

    // 确保数据格式正确
    if (count($fields) < 5) {
        error_log("数据格式错误: " . $line);
        continue;
    }

    list($hostname, $ip_list, $mac_address, $patch_num, $timestamp) = $fields;

    // // 提取以 172.26 开头的 IP
    // $ips = explode(" ", $ip_list);
    // $filtered_ips = array_filter($ips, function ($ip) {
    //     return strpos($ip, "172.26") === 0;
    // });

    // if (empty($filtered_ips)) {
    //     error_log("未找到 172.26 开头的 IP: " . $ip_list);
    //     continue;
    // }

    // $ip_address = implode(", ", $filtered_ips);

    $date = DateTime::createFromFormat('m/d/Y H:i:s', $timestamp);
    $timestamp = $date->format('Y/m/d');

    // 插入数据库
    $sql = "INSERT INTO patches (hostname, ip_address, mac_address, patch_num, timestamp) VALUES (?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);

    if (!$stmt) {
        error_log("SQL 预处理失败: " . $conn->error);
        continue;
    }

    $stmt->bind_param("sssss", $hostname, $ip_list, $mac_address, $patch_num, $timestamp);

    if ($stmt->execute()) {
        $inserted++;
    } else {
        error_log("SQL 执行失败: " . $stmt->error);
        // var_dump($stmt->error);
    }
}

echo json_encode(["status" => "success", "message" => "成功插入 {$inserted} 条数据"]);
?>

