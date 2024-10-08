# 定义变量
$mid = 2
$wts = 1685070149
$w_rid = 'f7b376124782ae8cb42c56fdd69144ed'
$cookie = "SESSDATA=xxx"  # 替换为你的 SESSDATA 值

# 构建 API 请求 URL
$url = "https://api.bilibili.com/x/space/wbi/acc/info"

# 设置请求头
$headers = @{
    "User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"
    "Accept" = "application/json"
    "Cookie" = $cookie
}

# 构建请求的参数
$params = @{
    "mid" = $mid
    "wts" = $wts
    "w_rid" = $w_rid
}

# 发送 GET 请求
$response = Invoke-RestMethod -Uri $url -Method Get -Headers $headers -Body $params

# 输出响应内容
$response | ConvertTo-Json | Write-Output
