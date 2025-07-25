<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}

include('config.php');

// 获取所有漏洞补丁，并关联 `patchinfo` 获取补丁级别和发布时间
$sql = "
    SELECT p.hostname, p.ip_address, p.mac_address, p.patch_num, p.timestamp, 
           pi.patch_level, pi.patch_time
    FROM patches p
    LEFT JOIN patchinfo pi ON p.patch_num = pi.patch_num
    ORDER BY p.timestamp DESC
";
$result = $conn->query($sql);

?>

<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>Patch Management</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<h1>Welcome, <?php echo htmlspecialchars($_SESSION['username']); ?>!</h1>
<h2>Patch Management</h2>

<table>
    <thead>
        <tr>
            <th>序号</th>
            <th>终端名称</th>
            <th>IP 地址</th>
            <th>MAC 地址</th>
            <th>补丁编号</th>
            <th>漏洞定级</th>
            <th>补丁修复时间</th>
            <th>补丁发布时间</th>
            <th>漏洞 Age（天）</th>
            <th>是否按期修复</th>
        </tr>
    </thead>
    <tbody>
        <?php $index = 1; ?>
        <?php while ($row = $result->fetch_assoc()) { 
            $patch_time = new DateTime($row['patch_time']);
            $fix_time = new DateTime($row['timestamp']);
            $age_days = $patch_time->diff($fix_time)->days;

            // 判断是否按期修复
            $on_time = ($fix_time <= $patch_time) ? "否" : "是";
        ?>
        <tr>
            <td><?php echo $index++; ?></td>
            <td><?php echo htmlspecialchars($row['hostname']); ?></td>
            <td><?php echo htmlspecialchars($row['ip_address']); ?></td>
            <td><?php echo htmlspecialchars($row['mac_address']); ?></td>
            <td><?php echo htmlspecialchars($row['patch_num']); ?></td>
            <td><?php echo htmlspecialchars(mb_convert_encoding($row['patch_level'], "UTF-8", "auto")); ?></td>
            <td><?php echo htmlspecialchars($row['timestamp']); ?></td>
            <td><?php echo htmlspecialchars($row['patch_time']); ?></td>
            <td><?php echo $age_days; ?></td>
            <td><?php echo $on_time; ?></td>
        </tr>
        <?php } ?>
    </tbody>
</table>

<a href="logout.php">Logout</a>
<a href="list_patches.php">全量补丁列表</a>

</body>
</html>
