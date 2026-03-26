#!/usr/bin/env python3
"""
启动本地预览服务器
"""

import http.server
import socketserver
import os
import sys

# 切换到当前目录
os.chdir(os.path.dirname(os.path.abspath(__file__)))

PORT = 8080

class MyHandler(http.server.SimpleHTTPRequestHandler):
    def log_message(self, format, *args):
        # 自定义日志格式
        pass

def get_local_ip():
    """获取本地IP地址"""
    import socket
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    try:
        # 不需要真正连接
        s.connect(('10.255.255.255', 1))
        ip = s.getsockname()[0]
    except Exception:
        ip = '127.0.0.1'
    finally:
        s.close()
    return ip

def main():
    print("=" * 60)
    print("💰 赚钱系统监控面板 - 本地预览服务器")
    print("=" * 60)
    
    local_ip = get_local_ip()
    
    print(f"\n🌐 访问方式:")
    print(f"   电脑: http://localhost:{PORT}")
    print(f"   电脑: http://127.0.0.1:{PORT}")
    print(f"   手机: http://{local_ip}:{PORT} (同一WiFi下)")
    
    print(f"\n📁 可用页面:")
    print(f"   /index.html     - 完整监控面板")
    print(f"   /preview.html   - 快速预览页面")
    
    print(f"\n🎯 功能说明:")
    print("   - 实时收入监控")
    print("   - 6个赚钱渠道状态")
    print("   - Token自养循环数据")
    print("   - 响应式设计")
    
    print(f"\n⏳ 服务器启动中...")
    print("   按 Ctrl+C 停止服务器")
    print("=" * 60)
    
    try:
        with socketserver.TCPServer(("", PORT), MyHandler) as httpd:
            print(f"✅ 服务器已启动在端口 {PORT}")
            print(f"🕒 开始时间: {__import__('datetime').datetime.now().strftime('%H:%M:%S')}")
            httpd.serve_forever()
    except KeyboardInterrupt:
        print("\n\n⏹️  服务器已停止")
        print("👋 再见！")
    except Exception as e:
        print(f"\n❌ 启动服务器失败: {e}")
        print(f"💡 可能端口 {PORT} 已被占用，请尝试其他端口")
        sys.exit(1)

if __name__ == "__main__":
    main()