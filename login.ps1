# 定义请求的 URL
$url = "https://api.bilibili.com/x/web-interface/nav"

# 设置请求头
$headers = @{
    "User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"
}

# 发送 GET 请求
$response = Invoke-RestMethod -Uri $url -Method Get -Headers $headers

# 输出响应内容
$response | ConvertTo-Json | Write-Output
