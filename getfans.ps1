function Get-BilibiliFans {
    param (
        [string]$uid  # 传入的 UP 主 ID
    )

    # 发送请求到 Bilibili API 获取粉丝数据
    $url = "https://api.bilibili.com/x/relation/stat?vmid=$uid"
    $response = Invoke-RestMethod -Uri $url -Method Get

    # 检查是否返回数据并获取粉丝数量
    if ($response.code -eq 0) {
        $fans = $response.data.follower
        Write-Output "UP 主 $uid 的粉丝数量是: $fans"
    } else {
        Write-Output "无法获取 UP 主的粉丝数据。错误代码: $($response.code)"
    }
}

# 示例调用: 使用 Bilibili 上某个 UP 主的 UID
Get-BilibiliFans -uid 293793435  # 请将 '12345678' 替换为实际的 UP 主 UID
