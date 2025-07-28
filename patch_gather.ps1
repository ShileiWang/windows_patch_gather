# 设置 PowerShell 输出为 UTF-8 编码以防止乱码
 
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

 
# 定义企业微信 Webhook URL
$webhookUrl = "https://域名/路径/api_add_patch.php"

# 获取已安装的补丁信息
$patches = Get-HotFix
 
# 获取计算机名和 IP 地址
$computerName = $env:COMPUTERNAME
 
$ipAddress = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -ne "Loopback Pseudo-Interface 1" }).IPAddress
 
$macAddress = (Get-NetAdapter | Where-Object { $_.Status -eq 'Up' }).MacAddress
 
# 构建消息内容
$message = ""
 
foreach ($patch in $patches) {
    $message += "$computerName,$ipAddress,$macAddress,$($patch.HotFixID),$($patch.InstalledOn)`n"
}
 
# 打印 $message 变量内容（用于调试）
Write-Output $message
 
# 构建推送的 JSON 数据
$jsonPayload = @{
    msgtype = "text"
        text = @{
        content = $message
 	    }
	} | ConvertTo-Json
 
# 通过 Webhook 推送到企业微信
Invoke-RestMethod -Uri $webhookUrl -Method Post -ContentType 'application/json' -Body $jsonPayload
