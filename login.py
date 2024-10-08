import qrcode
import time
import requests

# Step 1: 生成二维码
# 提取二维码的 URL
qrcode_url = "https://account.bilibili.com/h5/account-h5/auth/scan-web?navhide=1&callback=close&qrcode_key=fbec6921e53ead04fb05dbd3e636568a&from="

# 生成二维码
qr = qrcode.QRCode(
    version=1,
    error_correction=qrcode.constants.ERROR_CORRECT_L,
    box_size=10,
    border=4,
)
qr.add_data(qrcode_url)
qr.make(fit=True)

# 创建并显示二维码
img = qr.make_image(fill='black', back_color='white')
img.show()

# Step 2: 等待扫码完成并轮询登录状态
qrcode_key = "fbec6921e53ead04fb05dbd3e636568a"  # 从二维码响应中获取
status_url = f"https://passport.bilibili.com/x/passport-login/web/qrcode/check?key={qrcode_key}"

# 创建 session 以保持会话
session = requests.Session()

# 轮询直到获取登录状态
while True:
    response = session.get(status_url)
    data = response.json()

    # 检查扫码登录是否成功
    if data['code'] == 0:
        print("扫码登录成功!")
        # 登录成功后，可以获取 sessdata
        sessdata = session.cookies.get('SESSDATA')
        if sessdata:
            print(f"获取到的 sessdata: {sessdata}")
        break
    elif data['code'] == 86040:  # 86040 表示扫码未完成
        print("扫码未完成，等待中...")
        time.sleep(2)  # 每2秒检查一次
    else:
        print("发生错误:", data['message'])
        break
