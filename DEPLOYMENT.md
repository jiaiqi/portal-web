# CMS-Admin 项目部署文档

## 一、项目简介

CMS-Admin 是一个基于 NestJS + Nuxt 3 的全栈管理系统，包含以下模块：

- **后端**: NestJS + TypeORM + MySQL + Redis
- **前端**: Nuxt 3 + Vue 3 + UnoCSS
- **数据库**: MySQL 8.0+
- **缓存**: Redis

## 二、环境要求

### 2.1 服务器环境

- **操作系统**: Linux (推荐 CentOS 7+ / Ubuntu 18.04+) / macOS / Windows
- **Node.js**: >= 18.0.0
- **pnpm**: >= 8.0.0 (前端依赖管理)
- **MySQL**: >= 8.0
- **Redis**: >= 5.0
- **Nginx**: >= 1.18 (可选，用于反向代理)

### 2.2 开发工具

- Git
- PM2 (进程管理，推荐)
- VS Code (开发环境)

## 三、数据库初始化

### 3.1 创建数据库

```bash
# 登录 MySQL
mysql -u root -p

# 创建数据库
CREATE DATABASE nest_admin CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

# 创建数据库用户（可选）
CREATE USER 'nest_admin'@'localhost' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON nest_admin.* TO 'nest_admin'@'localhost';
FLUSH PRIVILEGES;

# 退出 MySQL
exit;
```

### 3.2 导入数据库

项目提供了完整的数据库初始化脚本，包含所有表结构和测试数据：

```bash
# 进入项目目录
cd /path/to/cms-admin-master/server/db

# 导入数据库
mysql -u root -p nest_admin < nest_admin_complete.sql
```

或者使用 MySQL 客户端工具（如 Navicat、DBeaver 等）导入 `nest_admin_complete.sql` 文件。

### 3.3 验证数据库

```bash
mysql -u root -p nest_admin -e "SHOW TABLES;"
```

应该能看到以下表：

- 系统基础表：sys_user, sys_role, sys_menu, sys_dept, sys_post 等
- CMS 模块表：cms_article, cms_category, cms_focus, cms_notice 等

### 3.4 默认管理员账号

导入完成后，系统会创建默认管理员账号：

- **用户名**: admin
- **密码**: admin123
- **邮箱**: ry@163.com

⚠️ **重要**: 首次登录后请立即修改密码！

## 四、后端部署

### 4.1 安装依赖

```bash
# 进入后端目录
cd /path/to/cms-admin-master/server

# 安装依赖
npm install
# 或使用 pnpm
pnpm install
```

### 4.2 配置环境变量

根据部署环境创建对应的配置文件：

**开发环境** (`src/config/dev.yml`):

```yaml
app:
  prefix: ''
  port: 8080
  logger:
    dir: '../logs'
  file:
    isLocal: true
    location: 'public/upload'
    domain: 'http://localhost:8080'
    serveRoot: '/public'
    maxSize: 50

db:
  mysql:
    host: '127.0.0.1'
    username: 'root'
    password: '12345678'
    database: 'nest_admin'
    port: 3306
    charset: 'utf8mb4'
    logger: 'file'
    logging: true
    multipleStatements: true
    dropSchema: false
    synchronize: false  # 生产环境建议关闭
    supportBigNumbers: true
    bigNumberStrings: true

redis:
  host: 'localhost'
  password: ''
  port: 6379
  db: 2
  keyPrefix: ''

jwt:
  secretkey: 'your_secretkey_change_in_production'
  expiresin: '1h'
  refreshExpiresIn: '2h'

user:
  initialPassword: '123456'
```

**生产环境** (`src/config/prod.yml`):

```yaml
app:
  prefix: '/api'
  port: 8080
  logger:
    dir: '/var/log/cms-admin'
  file:
    isLocal: false  # 使用对象存储
    location: '/var/www/cms-admin/upload'
    domain: 'https://your-domain.com'
    serveRoot: '/public'
    maxSize: 50

# 腾讯云 COS 配置（如果使用对象存储）
cos:
  secretId: 'your_secret_id'
  secretKey: 'your_secret_key'
  bucket: 'your_bucket'
  region: 'your_region'
  domain: 'https://your-cos-domain.com'
  location: '/'

db:
  mysql:
    host: 'your_mysql_host'
    username: 'your_mysql_user'
    password: 'your_mysql_password'
    database: 'nest_admin'
    port: 3306
    charset: 'utf8mb4'
    logger: 'file'
    logging: false  # 生产环境关闭 SQL 日志
    multipleStatements: true
    dropSchema: false
    synchronize: false
    supportBigNumbers: true
    bigNumberStrings: true

redis:
  host: 'your_redis_host'
  password: 'your_redis_password'
  port: 6379
  db: 0
  keyPrefix: 'cms-admin:'

jwt:
  secretkey: 'your_very_long_random_secret_key'
  expiresin: '24h'
  refreshExpiresIn: '7d'

user:
  initialPassword: '123456'
```

### 4.3 构建项目

```bash
# 设置环境变量
export NODE_ENV=production

# 构建
npm run build
```

构建完成后，会在 `dist` 目录生成编译后的文件。

### 4.4 启动服务

**方式一：直接启动**

```bash
export NODE_ENV=production
npm run start:prod
```

**方式二：使用 PM2 启动（推荐）**

1. 安装 PM2

```bash
npm install -g pm2
```

2. 创建 PM2 配置文件 `ecosystem.config.js`:

```javascript
module.exports = {
  apps: [{
    name: 'cms-admin-server',
    script: './dist/main.js',
    instances: 1,
    autorestart: true,
    watch: false,
    max_memory_restart: '1G',
    env: {
      NODE_ENV: 'production',
      PORT: 8080
    },
    error_file: './logs/err.log',
    out_file: './logs/out.log',
    log_date_format: 'YYYY-MM-DD HH:mm:ss'
  }]
};
```

3. 启动服务

```bash
pm2 start ecosystem.config.js
pm2 save
pm2 startup
```

4. 常用 PM2 命令

```bash
# 查看状态
pm2 status

# 查看日志
pm2 logs cms-admin-server

# 重启服务
pm2 restart cms-admin-server

# 停止服务
pm2 stop cms-admin-server

# 删除服务
pm2 delete cms-admin-server
```

### 4.5 验证后端服务

```bash
# 检查服务是否启动
curl http://localhost:8080/api/health

# 访问 Swagger 文档
# 浏览器打开: http://your-domain.com/api/swagger-ui/
```

## 五、前端部署

### 5.1 安装依赖

```bash
# 进入前端目录
cd /path/to/cms-admin-master/web-portal

# 安装依赖（使用 pnpm）
pnpm install
```

### 5.2 配置环境变量

创建 `.env.production` 文件：

```bash
# API 地址
NUXT_PUBLIC_API_BASE_URL=https://your-domain.com/api

# 其他配置
NUXT_PUBLIC_APP_TITLE=CMS-Admin
```

### 5.3 构建项目

```bash
# 构建静态站点
pnpm build
```

构建完成后，会在 `.output` 目录生成静态文件。

### 5.4 部署方式

**方式一：使用 Nuxt 内置服务器**

```bash
# 启动生产服务器
pnpm start
```

默认监听 3000 端口。

**方式二：使用 PM2 启动**

1. 创建 PM2 配置文件 `ecosystem.config.js`:

```javascript
module.exports = {
  apps: [{
    name: 'cms-admin-web',
    script: './.output/server/index.mjs',
    instances: 1,
    autorestart: true,
    watch: false,
    max_memory_restart: '512M',
    env: {
      NODE_ENV: 'production',
      PORT: 3000
    },
    error_file: './logs/web-err.log',
    out_file: './logs/web-out.log',
    log_date_format: 'YYYY-MM-DD HH:mm:ss'
  }]
};
```

2. 启动服务

```bash
pm2 start ecosystem.config.js
```

**方式三：部署到 Nginx（静态部署）**

1. 将 `.output/public` 目录复制到 Nginx 根目录：

```bash
cp -r .output/public /var/www/cms-admin
```

2. 配置 Nginx：

```nginx
server {
    listen 80;
    server_name your-domain.com;

    root /var/www/cms-admin;
    index index.html;

    # 前端路由
    location / {
        try_files $uri $uri/ /index.html;
    }

    # 代理后端 API
    location /api/ {
        proxy_pass http://localhost:8080/api/;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_cache_bypass $http_upgrade;
    }

    # 静态资源缓存
    location ~* \.(jpg|jpeg|png|gif|ico|css|js|svg|woff|woff2|ttf|eot)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
    }
}
```

3. 重启 Nginx：

```bash
nginx -t
nginx -s reload
```

## 六、Nginx 完整配置（推荐）

以下是一个完整的 Nginx 配置示例，同时处理前端和后端：

```nginx
upstream nest_admin_backend {
    server localhost:8080;
}

upstream nest_admin_frontend {
    server localhost:3000;
}

server {
    listen 80;
    server_name your-domain.com;

    # 强制 HTTPS（可选）
    # return 301 https://$server_name$request_uri;

    # 前端
    location / {
        proxy_pass http://nest_admin_frontend;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }

    # 后端 API
    location /api/ {
        proxy_pass http://nest_admin_backend/api/;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_cache_bypass $http_upgrade;
    }

    # 静态文件上传目录
    location /public/ {
        alias /path/to/cms-admin/server/public/upload/;
        expires 30d;
        add_header Cache-Control "public";
    }

    # Swagger 文档（生产环境建议关闭或添加认证）
    location /api/swagger-ui/ {
        proxy_pass http://nest_admin_backend/api/swagger-ui/;
    }
}

# HTTPS 配置（可选）
server {
    listen 443 ssl http2;
    server_name your-domain.com;

    ssl_certificate /path/to/your/cert.pem;
    ssl_certificate_key /path/to/your/key.pem;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    # 其他配置同上...
}
```

## 七、Docker 部署（可选）

### 7.1 创建 Dockerfile

**后端 Dockerfile** (`server/Dockerfile`):

```dockerfile
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm ci --only=production

COPY . .
RUN npm run build

EXPOSE 8080

CMD ["node", "dist/main.js"]
```

**前端 Dockerfile** (`web-portal/Dockerfile`):

```dockerfile
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN pnpm install --frozen-lockfile

COPY . .
RUN pnpm build

EXPOSE 3000

CMD ["node", ".output/server/index.mjs"]
```

### 7.2 创建 docker-compose.yml

```yaml
version: '3.8'

services:
  mysql:
    image: mysql:8.0
    container_name: cms-admin-mysql
    environment:
      MYSQL_ROOT_PASSWORD: 12345678
      MYSQL_DATABASE: nest_admin
    ports:
      - "3306:3306"
    volumes:
      - mysql_data:/var/lib/mysql
      - ./server/db/nest_admin_complete.sql:/docker-entrypoint-initdb.d/init.sql
    networks:
      - cms-admin-network

  redis:
    image: redis:7-alpine
    container_name: cms-admin-redis
    ports:
      - "6379:6379"
    networks:
      - cms-admin-network

  backend:
    build: ./server
    container_name: cms-admin-backend
    environment:
      NODE_ENV: production
    ports:
      - "8080:8080"
    depends_on:
      - mysql
      - redis
    networks:
      - cms-admin-network

  frontend:
    build: ./web-portal
    container_name: cms-admin-frontend
    environment:
      NUXT_PUBLIC_API_BASE_URL: http://localhost:8080/api
    ports:
      - "3000:3000"
    depends_on:
      - backend
    networks:
      - cms-admin-network

  nginx:
    image: nginx:alpine
    container_name: cms-admin-nginx
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf
      - ./ssl:/etc/nginx/ssl
    depends_on:
      - backend
      - frontend
    networks:
      - cms-admin-network

volumes:
  mysql_data:

networks:
  cms-admin-network:
    driver: bridge
```

### 7.3 启动服务

```bash
docker-compose up -d
```

## 八、常见问题

### 8.1 数据库连接失败

- 检查 MySQL 服务是否启动
- 检查数据库用户名、密码是否正确
- 检查防火墙是否开放 3306 端口
- 检查数据库是否已创建

### 8.2 Redis 连接失败

- 检查 Redis 服务是否启动
- 检查 Redis 密码是否正确
- 检查防火墙是否开放 6379 端口

### 8.3 文件上传失败

- 检查上传目录权限
- 检查文件大小限制配置
- 检查磁盘空间是否充足

### 8.4 前端页面空白

- 检查 API 地址配置是否正确
- 检查浏览器控制台是否有错误
- 检查 Nginx 配置是否正确

## 九、安全建议

1. **修改默认密码**: 首次登录后立即修改管理员密码
2. **使用 HTTPS**: 生产环境必须启用 HTTPS
3. **关闭 Swagger**: 生产环境建议关闭或添加访问控制
4. **定期备份数据库**: 设置定时任务备份数据库
5. **限制 API 访问频率**: 已配置 rate-limit，可根据需要调整
6. **使用强密码**: 数据库、Redis、JWT 等都应使用强密码
7. **定期更新依赖**: 定期运行 `npm audit` 检查安全漏洞

## 十、监控与日志

### 10.1 日志位置

- **后端日志**: `server/logs/`
- **前端日志**: `web-portal/logs/`
- **PM2 日志**: `~/.pm2/logs/`

### 10.2 监控建议

- 使用 PM2 监控进程状态
- 配置日志轮转，避免日志文件过大
- 使用监控工具（如 Prometheus + Grafana）监控系统性能

## 十一、维护与更新

### 11.1 更新代码

```bash
# 拉取最新代码
git pull origin main

# 后端更新
cd server
npm install
npm run build
pm2 restart cms-admin-server

# 前端更新
cd ../web-portal
pnpm install
pnpm build
pm2 restart cms-admin-web
```

### 11.2 数据库迁移

如果有数据库结构变更，需要执行迁移脚本：

```bash
mysql -u root -p nest_admin < migration_script.sql
```

**文档版本**: 1.0
**更新日期**: 2026-02-07
