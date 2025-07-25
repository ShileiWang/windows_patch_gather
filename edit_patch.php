ession_start();

// 管理员角色验证
if ($_SESSION['role'] != 'admin') {
    header('Location: dashboard.php');
    exit();
}

include('config.php');

// 获取当前补丁
$id = $_GET['id'];
$sql = "SELECT * FROM patches WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();
$patch = $result->fetch_assoc();

// 处理更新操作
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $title = $_POST['title'];
    $description = $_POST['description'];
    $status = $_POST['status'];
    $patch_date = $_POST['patch_date'];

    $sql = "UPDATE patches SET title = ?, description = ?, status = ?, patch_date = ? WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssi", $title, $description, $status, $patch_date, $id);

    if ($stmt->execute()) {
        header('Location: dashboard.php');
    } else {
        echo "Error: " . $stmt->error;
    }
}
?>

<h2>Edit Patch</h2>
<form method="post" action="edit_patch.php?id=<?php echo $patch['id']; ?>">
    Title: <input type="text" name="title" value="<?php echo $patch['title']; ?>" required><br>
    Description: <textarea name="description" required><?php echo $patch['description']; ?></textarea><br>
    Status: <select name="status">
        <option value="open" <?php if ($patch['status'] == 'open') echo 'selected'; ?>>Open</option>
        <option value="closed" <?php if ($patch['status'] == 'closed') echo 'selected'; ?>>Closed</option>
    </select><br>
    Patch Date: <input type="date" name="patch_date" value="<?php echo $patch['patch_date']; ?>" required><br>
    <button type="submit">Update Patch</button>
</form>

