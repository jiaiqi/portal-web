# Nest Admin Windows 服务器部署指南

## 一、环境准备

### 1.1 系统要求
- Windows Server 2016/2019/2022 或 Windows 10/11
- 内存：建议 4GB 以上
- 磁盘：建议 20GB 以上可用空间

### 1.2 所需软件
1. **Node.js** (v18 或更高版本)
2. **MySQL** (v8.0 或更高版本) 或 **SQL Server** (2019 或更高版本)
3. **Redis** (Windows 版本)
4. **Nginx** (Windows 版本) 或 **IIS**
5. **PM2** (Node.js 进程管理器)
6. **Git** (可选，用于拉取代码)

---

## 二、软件安装

### 2.1 安装 Node.js

1. 下载 Node.js LTS 版本：
   - 访问 https://nodejs.org/
   - 下载 Windows Installer (.msi)

2. 安装并验证：
   ```powershell
   # 验证安装
   node -v
   npm -v
   ```

3. 配置 npm 镜像（推荐）：
   ```powershell
   npm config set registry https://registry.npmmirror.com
   ```

### 2.2 安装 PM2

```powershell
npm install -g pm2
```

### 2.3 安装 MySQL

1. 下载 MySQL Installer：
   - 访问 https://dev.mysql.com/downloads/installer/
   - 选择 "Windows (x86, 32-bit), MSI Installer"

2. 安装配置：
   - 选择 "Server only" 或 "Full" 安装类型
   - 设置 root 密码：`12345678`
   - 记住端口号（默认 3306）

3. 创建数据库：
   ```sql
   CREATE DATABASE nest_admin CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   ```

4. 导入初始化数据：
   ```powershell
   # 使用 MySQL Command Line Client
   mysql -u root -p nest_admin < D:\deploy\nest-admin\server\db\nest_admin_init.sql
   ```

### 2.4 安装 SQL Server（可选，如果使用 SQL Server）

1. 下载 SQL Server Express：
   - 访问 https://www.microsoft.com/zh-cn/sql-server/sql-server-downloads

2. 安装配置：
   - 选择 "基本" 或 "自定义" 安装
   - 记住实例名称和 sa 密码

3. 导入初始化数据：
   ```powershell
   # 使用 sqlcmd
   sqlcmd -S localhost -U sa -P your_password -d nest_admin -i D:\deploy\nest-admin\server\db\nest_admin_init_mssql.sql
   ```

### 2.5 安装 Redis

1. 下载 Redis for Windows：
   - 访问 https://github.com/microsoftarchive/redis/releases
   - 下载 Redis-x64-xxx.msi

2. 安装并启动服务：
   ```powershell
   # 验证安装
   redis-cli ping
   # 应返回 PONG
   ```

3. 或者使用 Memurai（Redis 的 Windows 替代品）：
   - 下载地址：https://www.memurai.com/

### 2.6 安装 Nginx

1. 下载 Nginx：
   - 访问 http://nginx.org/en/download.html
   - 下载 Stable version

2. 解压到 `C:\nginx`

---

## 三、项目部署

### 3.1 创建部署目录

```powershell
mkdir D:\deploy\nest-admin
cd D:\deploy\nest-admin
```

### 3.2 上传项目文件

**方式一：使用 Git 克隆**
```powershell
git clone https://your-repo-url.git .
```

**方式二：手动上传**
- 将项目文件打包上传到 `D:\deploy\nest-admin`
- 确保包含 `server` 和 `admin-vue3` 目录

### 3.3 配置后端服务

1. 进入后端目录：
   ```powershell
   cd D:\deploy\nest-admin\server
   ```

2. 安装依赖：
   ```powershell
   npm install
   # 或使用 pnpm
   pnpm install
   ```

3. 创建生产环境配置文件：
   ```powershell
   # 复制配置文件
   copy .env.prod .env.production.local
   ```

4. 编辑 `.env.production.local`：
   ```ini
   # 数据库配置（MySQL）
   DB_TYPE=mysql
   DB_HOST=localhost
   DB_PORT=3306
   DB_DATABASE=nest_admin
   DB_USERNAME=root
   DB_PASSWORD=12345678
   DB_SYNC=false
   DB_LOGGING=false

   # 或者 SQL Server 配置
   # DB_TYPE=mssql
   # DB_HOST=localhost
   # DB_PORT=1433
   # DB_DATABASE=nest_admin
   # DB_USERNAME=sa
   # DB_PASSWORD=your_password

   # Redis 配置
   REDIS_HOST=localhost
   REDIS_PORT=6379
   REDIS_PASSWORD=
   REDIS_DB=0

   # 应用配置
   PORT=8080
   BASE_URL=http://localhost:8080

   # JWT 配置
   JWT_SECRET=your-secret-key-here
   JWT_EXPIRES_IN=7d

   # 文件上传路径
   UPLOAD_PATH=D:\deploy\nest-admin\uploads
   ```

5. 创建上传目录：
   ```powershell
   mkdir D:\deploy\nest-admin\uploads
   ```

6. 构建项目：
   ```powershell
   npm run build
   ```

### 3.4 配置前端项目

1. 进入前端目录：
   ```powershell
   cd D:\deploy\nest-admin\admin-vue3
   ```

2. 安装依赖：
   ```powershell
   npm install
   # 或使用 pnpm
   pnpm install
   ```

3. 配置生产环境：
   编辑 `.env.production`：
   ```ini
   # 页面标题
   VITE_APP_TITLE = 'Nest Admin'

   # 接口地址
   VITE_APP_BASE_API = '/api'

   # 代理地址（指向后端服务）
   VITE_APP_PROXY_URL = 'http://localhost:8080'
   ```

4. 构建项目：
   ```powershell
   npm run build:prod
   ```

5. 构建输出目录：`dist`

---

## 四、Nginx 配置

### 4.1 编辑 Nginx 配置文件

编辑 `C:\nginx\conf\nginx.conf`：

```nginx
worker_processes  1;

events {
    worker_connections  1024;
}

http {
    include       mime.types;
    default_type  application/octet-stream;

    sendfile        on;
    keepalive_timeout  65;

    # 前端服务
    server {
        listen       80;
        server_name  localhost;
        
        # 前端静态文件
        location / {
            root   D:\deploy\nest-admin\admin-vue3\dist;
            index  index.html index.htm;
            try_files $uri $uri/ /index.html;
        }

        # API 代理
        location /api/ {
            proxy_pass http://localhost:8080/;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }

        # 上传文件访问
        location /uploads/ {
            alias D:\deploy\nest-admin\uploads\;
        }

        # 错误页面
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }
    }
}
```

### 4.2 启动 Nginx

```powershell
cd C:\nginx
start nginx

# 检查是否启动成功
tasklist /fi "imagename eq nginx.exe"
```

### 4.3 Nginx 常用命令

```powershell
# 重新加载配置
nginx -s reload

# 停止 Nginx
nginx -s stop

# 快速停止
nginx -s quit
```

---

## 五、使用 PM2 启动后端服务

### 5.1 创建 PM2 配置文件

在 `D:\deploy\nest-admin\server` 目录创建 `ecosystem.config.js`：

```javascript
module.exports = {
  apps: [
    {
      name: 'nest-admin-api',
      script: 'dist/main.js',
      cwd: 'D:\\deploy\\nest-admin\\server',
      instances: 1,
      exec_mode: 'fork',
      env: {
        NODE_ENV: 'production',
      },
      // 日志配置
      log_file: 'D:\\deploy\\nest-admin\\logs\\combined.log',
      out_file: 'D:\\deploy\\nest-admin\\logs\\out.log',
      error_file: 'D:\\deploy\\nest-admin\\logs\\error.log',
      log_date_format: 'YYYY-MM-DD HH:mm:ss Z',
      // 自动重启
      autorestart: true,
      max_restarts: 10,
      min_uptime: '10s',
      // 内存限制
      max_memory_restart: '1G',
      // 监听文件变化（开发环境可用）
      watch: false,
      // 忽略监听的文件夹
      ignore_watch: ['node_modules', 'logs', 'uploads'],
    },
  ],
};
```

### 5.2 创建日志目录

```powershell
mkdir D:\deploy\nest-admin\logs
```

### 5.3 启动服务

```powershell
cd D:\deploy\nest-admin\server

# 启动服务
pm2 start ecosystem.config.js

# 查看状态
pm2 status

# 查看日志
pm2 logs nest-admin-api

# 保存 PM2 配置
pm2 save

# 设置开机自启
pm2 startup windows
```

### 5.4 PM2 常用命令

```powershell
# 停止服务
pm2 stop nest-admin-api

# 重启服务
pm2 restart nest-admin-api

# 删除服务
pm2 delete nest-admin-api

# 查看所有进程
pm2 list

# 监控
pm2 monit
```

---

## 六、使用 IIS 部署（替代方案）

### 6.1 安装 IIS

1. 打开 "服务器管理器" → "添加角色和功能"
2. 选择 "Web 服务器 (IIS)"
3. 确保安装以下功能：
   - ASP.NET 4.8
   - 静态内容
   - 默认文档
   - 目录浏览
   - HTTP 错误
   - 请求筛选
   - URL 重写（需单独下载安装）

### 6.2 安装 URL 重写模块

下载地址：https://www.iis.net/downloads/microsoft/url-rewrite

### 6.3 配置 IIS 站点

1. 打开 IIS 管理器
2. 右键 "网站" → "添加网站"
3. 配置：
   - 网站名称：NestAdmin
   - 物理路径：D:\deploy\nest-admin\admin-vue3\dist
   - 端口：80

4. 配置反向代理（安装 Application Request Routing）：
   - 下载地址：https://www.iis.net/downloads/microsoft/application-request-routing
   
5. 添加 URL 重写规则：
   ```xml
   <configuration>
     <system.webServer>
       <rewrite>
         <rules>
           <rule name="API Proxy" stopProcessing="true">
             <match url="^api/(.*)" />
             <action type="Rewrite" url="http://localhost:8080/{R:1}" />
           </rule>
           <rule name="SPA Fallback">
             <match url=".*" />
             <conditions>
               <add input="{REQUEST_FILENAME}" matchType="IsFile" negate="true" />
               <add input="{REQUEST_FILENAME}" matchType="IsDirectory" negate="true" />
             </conditions>
             <action type="Rewrite" url="/index.html" />
           </rule>
         </rules>
       </rewrite>
     </system.webServer>
   </configuration>
   ```

---

## 七、防火墙配置

### 7.1 开放端口

```powershell
# 开放 HTTP 80 端口
netsh advfirewall firewall add rule name="HTTP" dir=in action=allow protocol=TCP localport=80

# 开放 HTTPS 443 端口
netsh advfirewall firewall add rule name="HTTPS" dir=in action=allow protocol=TCP localport=443

# 开放后端 API 8080 端口（如果直接暴露）
netsh advfirewall firewall add rule name="Nest Admin API" dir=in action=allow protocol=TCP localport=8080

# 开放 MySQL 3306 端口（如果需要远程访问）
netsh advfirewall firewall add rule name="MySQL" dir=in action=allow protocol=TCP localport=3306

# 开放 Redis 6379 端口（仅限内网）
netsh advfirewall firewall add rule name="Redis" dir=in action=allow protocol=TCP localport=6379 remoteip=localsubnet
```

---

## 八、SSL/HTTPS 配置

### 8.1 使用 Let's Encrypt（推荐）

1. 下载 win-acme：
   - 地址：https://www.win-acme.com/

2. 申请证书：
   ```powershell
   .\wacs.exe
   # 按照向导选择 IIS 站点或手动配置
   ```

3. Nginx 配置 HTTPS：
   ```nginx
   server {
       listen       443 ssl;
       server_name  your-domain.com;
       
       ssl_certificate      D:\ssl\your-domain.com.crt;
       ssl_certificate_key  D:\ssl\your-domain.com.key;
       
       # 其他配置...
   }
   
   # HTTP 重定向到 HTTPS
   server {
       listen       80;
       server_name  your-domain.com;
       return 301 https://$server_name$request_uri;
   }
   ```

---

## 九、备份与维护

### 9.1 数据库备份脚本

创建 `D:\deploy\nest-admin\backup\backup.bat`：

```batch
@echo off
set BACKUP_DIR=D:\deploy\nest-admin\backup\db
set DB_NAME=nest_admin
set DB_USER=root
set DB_PASS=12345678
set DATE=%date:~0,4%%date:~5,2%%date:~8,2%

if not exist %BACKUP_DIR% mkdir %BACKUP_DIR%

"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysqldump" -u%DB_USER% -p%DB_PASS% %DB_NAME% > %BACKUP_DIR%\%DB_NAME%_%DATE%.sql

:: 保留最近 30 天的备份
forfiles /p %BACKUP_DIR% /s /m *.sql /d -30 /c "cmd /c del @path"

echo Backup completed: %DATE%
```

### 9.2 设置定时任务

1. 打开 "任务计划程序"
2. 创建基本任务
3. 设置每天凌晨 2 点执行备份脚本

### 9.3 日志清理脚本

创建 `D:\deploy\nest-admin\scripts\cleanup-logs.bat`：

```batch
@echo off
set LOG_DIR=D:\deploy\nest-admin\logs

:: 删除 30 天前的日志
forfiles /p %LOG_DIR% /s /m *.log /d -30 /c "cmd /c del @path"

echo Log cleanup completed
```

---

## 十、故障排查

### 10.1 常见问题

**问题 1：后端服务启动失败**
```powershell
# 检查端口占用
netstat -ano | findstr :8080

# 查看详细错误
pm2 logs nest-admin-api --lines 100
```

**问题 2：数据库连接失败**
```powershell
# 测试 MySQL 连接
mysql -u root -p -e "SELECT 1"

# 检查 MySQL 服务状态
sc query MySQL80
```

**问题 3：前端页面空白**
- 检查 Nginx 配置中的 root 路径是否正确
- 确认 dist 目录存在且包含 index.html

**问题 4：API 请求 404**
- 检查 Nginx 代理配置
- 确认后端服务是否正常运行

### 10.2 查看日志

```powershell
# PM2 日志
pm2 logs

# Nginx 错误日志
type C:\nginx\logs\error.log

# Windows 事件查看器
eventvwr.msc
```

---

## 十一、更新部署

### 11.1 更新后端

```powershell
cd D:\deploy\nest-admin\server

# 拉取最新代码
git pull

# 安装新依赖
npm install

# 重新构建
npm run build

# 重启服务
pm2 restart nest-admin-api
```

### 11.2 更新前端

```powershell
cd D:\deploy\nest-admin\admin-vue3

# 拉取最新代码
git pull

# 安装新依赖
npm install

# 重新构建
npm run build:prod

# 无需重启 Nginx，刷新页面即可
```

---

## 十二、联系支持

如有问题，请查看：
- 项目文档
- GitHub Issues
- 系统日志文件

---

**部署完成！**

访问地址：
- 前端：http://localhost 或 http://服务器IP
- 后端 API：http://localhost:8080
- 默认账号：admin / admin123
