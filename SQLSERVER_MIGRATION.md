# Nest Admin 迁移到 SQL Server 指南

## 概述

本项目使用 TypeORM 作为 ORM 框架，TypeORM 支持多种数据库，包括 SQL Server。迁移主要涉及驱动更换、配置修改和 SQL 语法适配。

---

## 一、需要修改的文件清单

### 1. 依赖包修改

**文件**: `server/package.json`

```json
{
  "dependencies": {
    // 移除 MySQL 驱动
    // "mysql2": "^3.6.5",
    
    // 添加 SQL Server 驱动
    "mssql": "^10.0.1",
    "@types/mssql": "^9.1.5"
  }
}
```

安装命令：
```bash
cd server
npm uninstall mysql2
npm install mssql @types/mssql
```

---

### 2. 数据库连接配置

**文件**: `server/src/app.module.ts`

```typescript
TypeOrmModule.forRootAsync({
  imports: [ConfigModule],
  inject: [ConfigService],
  useFactory: (config: ConfigService) => {
    return {
      type: 'mssql',  // 修改数据库类型
      entities: [`${__dirname}/**/*.entity{.ts,.js}`],
      autoLoadEntities: true,
      keepConnectionAlive: true,
      // SQL Server 不需要 timezone 配置
      // timezone: '+08:00',
      options: {
        encrypt: false,  // 开发环境设为 false，生产环境根据证书配置
        trustServerCertificate: true,
      },
      ...config.get('db.mssql'),  // 改为 mssql 配置
    } as TypeOrmModuleOptions;
  },
}),
```

---

### 3. 配置文件修改

**文件**: `server/src/config/dev.yml`

```yaml
# 数据库配置
db:
  mssql:
    host: 'localhost'
    port: 1433
    username: 'sa'
    password: 'YourPassword123'
    database: 'nest_admin'
    synchronize: true  # 开发环境使用，生产环境设为 false
    logging: true
    options:
      encrypt: false
      trustServerCertificate: true
```

**文件**: `server/src/config/prod.yml`

```yaml
# 数据库配置
db:
  mssql:
    host: 'your_sqlserver_host'
    port: 1433
    username: 'nest_admin'
    password: 'your_password'
    database: 'nest_admin'
    synchronize: false  # 生产环境必须设为 false
    logging: false
    options:
      encrypt: true  # 生产环境建议启用加密
      trustServerCertificate: false
```

---

### 4. 实体类字段类型调整

SQL Server 和 MySQL 的字段类型有差异，需要调整实体类：

#### 4.1 长文本类型

**MySQL**: `longtext`
**SQL Server**: `nvarchar(max)` 或 `varchar(max)`

**需要修改的实体文件**:
- `server/src/module/cms/article/entities/article.entity.ts`
- `server/src/module/cms/page/entities/page.entity.ts`
- `server/src/module/cms/notice/entities/notice.entity.ts`
- `server/src/module/cms/about/entities/*.entity.ts`

**修改示例**:
```typescript
// MySQL 版本
@Column({ name: 'content', type: 'longtext', nullable: true, comment: '文章内容' })
content: string;

// SQL Server 版本
@Column({ name: 'content', type: 'nvarchar', length: 'max', nullable: true, comment: '文章内容' })
content: string;
```

#### 4.2 日期时间类型

**MySQL**: `datetime`
**SQL Server**: `datetime` 或 `datetime2`

TypeORM 会自动处理，一般无需修改。

#### 4.3 自增主键

**MySQL**: `@PrimaryGeneratedColumn()`
**SQL Server**: 相同，但底层实现不同

一般无需修改，TypeORM 会自动适配。

---

### 5. SQL 脚本迁移

#### 5.1 数据类型映射表

| MySQL | SQL Server | 说明 |
|-------|------------|------|
| `INT` | `INT` | 相同 |
| `BIGINT` | `BIGINT` | 相同 |
| `VARCHAR(n)` | `NVARCHAR(n)` | 推荐用 NVARCHAR 支持中文 |
| `TEXT` | `NVARCHAR(MAX)` | |
| `LONGTEXT` | `NVARCHAR(MAX)` | |
| `DATETIME` | `DATETIME2` | 推荐使用 DATETIME2 |
| `TIMESTAMP` | `DATETIME2` | |
| `DECIMAL(p,s)` | `DECIMAL(p,s)` | 相同 |
| `TINYINT(1)` | `BIT` | 布尔值 |
| `JSON` | `NVARCHAR(MAX)` | SQL Server 2016+ 支持 JSON |

#### 5.2 需要转换的 SQL 文件

将 `server/db/` 目录下的 SQL 文件从 MySQL 语法转换为 SQL Server 语法：

- `nest_admin.sql` → `nest_admin_mssql.sql`
- `add_article_audit_menu.sql` → 转换
- `add_auditor_user.sql` → 转换
- `fix_auditor_menu_role100.sql` → 转换

**主要转换点**:

1. **自增主键**:
   ```sql
   -- MySQL
   CREATE TABLE sys_user (
     user_id BIGINT AUTO_INCREMENT PRIMARY KEY,
     ...
   );
   
   -- SQL Server
   CREATE TABLE sys_user (
     user_id BIGINT IDENTITY(1,1) PRIMARY KEY,
     ...
   );
   ```

2. **字符串类型**:
   ```sql
   -- MySQL
   user_name VARCHAR(50) NOT NULL
   
   -- SQL Server
   user_name NVARCHAR(50) NOT NULL
   ```

3. **长文本**:
   ```sql
   -- MySQL
   content LONGTEXT
   
   -- SQL Server
   content NVARCHAR(MAX)
   ```

4. **日期时间**:
   ```sql
   -- MySQL
   create_time DATETIME DEFAULT CURRENT_TIMESTAMP
   
   -- SQL Server
   create_time DATETIME2 DEFAULT GETDATE()
   ```

5. **布尔值**:
   ```sql
   -- MySQL
   is_deleted TINYINT(1) DEFAULT 0
   
   -- SQL Server
   is_deleted BIT DEFAULT 0
   ```

6. **注释**:
   ```sql
   -- MySQL
   COMMENT ON COLUMN sys_user.user_name IS '用户名';
   
   -- SQL Server
   EXEC sp_addextendedproperty 'MS_Description', '用户名', 'SCHEMA', 'dbo', 'TABLE', 'sys_user', 'COLUMN', 'user_name';
   ```

---

### 6. 脚本文件修改

**文件**: `server/scripts/init-db.js`

```javascript
// 原 MySQL 版本
const mysql = require('mysql2/promise');

// 改为 SQL Server 版本
const sql = require('mssql');

// 连接配置
const config = {
  user: 'sa',
  password: 'YourPassword123',
  server: 'localhost',
  port: 1433,
  database: 'nest_admin',
  options: {
    encrypt: false,
    trustServerCertificate: true,
  },
};

async function initDb() {
  try {
    await sql.connect(config);
    console.log('SQL Server connected successfully');
    
    // 执行初始化 SQL
    const result = await sql.query`SELECT COUNT(*) as count FROM sys.tables`;
    console.log('Tables count:', result.recordset[0].count);
    
    await sql.close();
  } catch (err) {
    console.error('Database connection failed:', err);
  }
}

initDb();
```

**文件**: `server/scripts/execute-sql.js` 和 `execute-special-sql.js`

同样需要修改为使用 `mssql` 模块。

---

### 7. 部署文档更新

**文件**: `部署说明.md`

更新数据库安装部分：

```markdown
### 1.2 安装 SQL Server

```bash
# Ubuntu 安装 SQL Server 2022
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2022.list)"
sudo apt update
sudo apt install mssql-server

# 配置 SQL Server
sudo /opt/mssql/bin/mssql-conf setup

# 启动服务
sudo systemctl start mssql-server
sudo systemctl enable mssql-server

# 安装命令行工具
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/prod.list)"
sudo apt update
sudo apt install mssql-tools unixodbc-dev

# 添加到 PATH
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
source ~/.bashrc

# 创建数据库
sqlcmd -S localhost -U sa -P 'YourPassword123' -Q "CREATE DATABASE nest_admin"
```
```

---

## 二、SQL Server 数据库初始化脚本

创建 `server/db/nest_admin_mssql.sql`:

```sql
-- 创建数据库
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'nest_admin')
BEGIN
    CREATE DATABASE nest_admin;
END
GO

USE nest_admin;
GO

-- 用户表
CREATE TABLE sys_user (
    user_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    user_name NVARCHAR(50) NOT NULL,
    nick_name NVARCHAR(50) NULL,
    email NVARCHAR(50) NULL,
    phone_number NVARCHAR(11) NULL,
    sex NCHAR(1) DEFAULT '0',
    avatar NVARCHAR(100) NULL,
    password NVARCHAR(100) NOT NULL,
    status NCHAR(1) DEFAULT '0',
    del_flag NCHAR(1) DEFAULT '0',
    login_ip NVARCHAR(128) NULL,
    login_date DATETIME2 NULL,
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE(),
    update_by NVARCHAR(64) DEFAULT '',
    update_time DATETIME2 DEFAULT GETDATE(),
    remark NVARCHAR(500) NULL
);

-- 角色表
CREATE TABLE sys_role (
    role_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    role_name NVARCHAR(50) NOT NULL,
    role_key NVARCHAR(100) NOT NULL,
    role_sort INT DEFAULT 0,
    data_scope NCHAR(1) DEFAULT '1',
    status NCHAR(1) DEFAULT '0',
    del_flag NCHAR(1) DEFAULT '0',
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE(),
    update_by NVARCHAR(64) DEFAULT '',
    update_time DATETIME2 DEFAULT GETDATE(),
    remark NVARCHAR(500) NULL
);

-- 菜单表
CREATE TABLE sys_menu (
    menu_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    menu_name NVARCHAR(50) NOT NULL,
    parent_id BIGINT DEFAULT 0,
    order_num INT DEFAULT 0,
    path NVARCHAR(200) NULL,
    component NVARCHAR(255) NULL,
    is_frame INT DEFAULT 1,
    is_cache INT DEFAULT 0,
    menu_type NCHAR(1) NULL,
    visible NCHAR(1) DEFAULT '0',
    status NCHAR(1) DEFAULT '0',
    perms NVARCHAR(100) NULL,
    icon NVARCHAR(100) NULL,
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE(),
    update_by NVARCHAR(64) DEFAULT '',
    update_time DATETIME2 DEFAULT GETDATE(),
    remark NVARCHAR(500) NULL
);

-- 用户角色关联表
CREATE TABLE sys_user_role (
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, role_id)
);

-- 角色菜单关联表
CREATE TABLE sys_role_menu (
    role_id BIGINT NOT NULL,
    menu_id BIGINT NOT NULL,
    PRIMARY KEY (role_id, menu_id)
);

-- 部门表
CREATE TABLE sys_dept (
    dept_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    parent_id BIGINT DEFAULT 0,
    ancestors NVARCHAR(50) NULL,
    dept_name NVARCHAR(50) NOT NULL,
    order_num INT DEFAULT 0,
    leader NVARCHAR(20) NULL,
    phone NVARCHAR(11) NULL,
    email NVARCHAR(50) NULL,
    status NCHAR(1) DEFAULT '0',
    del_flag NCHAR(1) DEFAULT '0',
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE(),
    update_by NVARCHAR(64) DEFAULT '',
    update_time DATETIME2 DEFAULT GETDATE()
);

-- 岗位表
CREATE TABLE sys_post (
    post_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    post_code NVARCHAR(64) NOT NULL,
    post_name NVARCHAR(50) NOT NULL,
    post_sort INT DEFAULT 0,
    status NCHAR(1) DEFAULT '0',
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE(),
    update_by NVARCHAR(64) DEFAULT '',
    update_time DATETIME2 DEFAULT GETDATE(),
    remark NVARCHAR(500) NULL
);

-- 字典类型表
CREATE TABLE sys_dict_type (
    dict_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    dict_name NVARCHAR(100) DEFAULT '',
    dict_type NVARCHAR(100) DEFAULT '',
    status NCHAR(1) DEFAULT '0',
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE(),
    update_by NVARCHAR(64) DEFAULT '',
    update_time DATETIME2 DEFAULT GETDATE(),
    remark NVARCHAR(500) NULL
);

-- 字典数据表
CREATE TABLE sys_dict_data (
    dict_code BIGINT IDENTITY(1,1) PRIMARY KEY,
    dict_sort INT DEFAULT 0,
    dict_label NVARCHAR(100) DEFAULT '',
    dict_value NVARCHAR(100) DEFAULT '',
    dict_type NVARCHAR(100) DEFAULT '',
    css_class NVARCHAR(100) NULL,
    list_class NVARCHAR(100) NULL,
    is_default NCHAR(1) DEFAULT 'N',
    status NCHAR(1) DEFAULT '0',
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE(),
    update_by NVARCHAR(64) DEFAULT '',
    update_time DATETIME2 DEFAULT GETDATE(),
    remark NVARCHAR(500) NULL
);

-- 参数配置表
CREATE TABLE sys_config (
    config_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    config_name NVARCHAR(100) DEFAULT '',
    config_key NVARCHAR(100) DEFAULT '',
    config_value NVARCHAR(500) DEFAULT '',
    config_type NCHAR(1) DEFAULT 'N',
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE(),
    update_by NVARCHAR(64) DEFAULT '',
    update_time DATETIME2 DEFAULT GETDATE(),
    remark NVARCHAR(500) NULL
);

-- 通知公告表
CREATE TABLE sys_notice (
    notice_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    notice_title NVARCHAR(50) NOT NULL,
    notice_type NCHAR(1) NOT NULL,
    notice_content NVARCHAR(MAX) NULL,
    status NCHAR(1) DEFAULT '0',
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE(),
    update_by NVARCHAR(64) DEFAULT '',
    update_time DATETIME2 DEFAULT GETDATE(),
    remark NVARCHAR(500) NULL
);

-- 操作日志表
CREATE TABLE sys_oper_log (
    oper_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(50) DEFAULT '',
    business_type INT DEFAULT 0,
    method NVARCHAR(100) DEFAULT '',
    request_method NVARCHAR(10) DEFAULT '',
    operator_type NVARCHAR(1) DEFAULT '0',
    oper_name NVARCHAR(50) DEFAULT '',
    dept_name NVARCHAR(50) DEFAULT '',
    oper_url NVARCHAR(255) DEFAULT '',
    oper_ip NVARCHAR(128) DEFAULT '',
    oper_location NVARCHAR(255) DEFAULT '',
    oper_param NVARCHAR(2000) DEFAULT '',
    json_result NVARCHAR(2000) DEFAULT '',
    status INT DEFAULT 0,
    error_msg NVARCHAR(2000) DEFAULT '',
    oper_time DATETIME2 DEFAULT GETDATE()
);

-- 登录日志表
CREATE TABLE sys_logininfor (
    info_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    user_name NVARCHAR(50) DEFAULT '',
    ipaddr NVARCHAR(128) DEFAULT '',
    login_location NVARCHAR(255) DEFAULT '',
    browser NVARCHAR(50) DEFAULT '',
    os NVARCHAR(50) DEFAULT '',
    status NCHAR(1) DEFAULT '0',
    msg NVARCHAR(255) DEFAULT '',
    login_time DATETIME2 DEFAULT GETDATE()
);

-- 定时任务表
CREATE TABLE sys_job (
    job_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    job_name NVARCHAR(64) NOT NULL,
    job_group NVARCHAR(64) NOT NULL,
    invoke_target NVARCHAR(500) NOT NULL,
    cron_expression NVARCHAR(255) NULL,
    misfire_policy NVARCHAR(20) DEFAULT '3',
    concurrent NCHAR(1) DEFAULT '1',
    status NCHAR(1) DEFAULT '0',
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE(),
    update_by NVARCHAR(64) DEFAULT '',
    update_time DATETIME2 DEFAULT GETDATE(),
    remark NVARCHAR(500) NULL
);

-- 定时任务日志表
CREATE TABLE sys_job_log (
    job_log_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    job_name NVARCHAR(64) NOT NULL,
    job_group NVARCHAR(64) NOT NULL,
    invoke_target NVARCHAR(500) NOT NULL,
    job_message NVARCHAR(500) NULL,
    status NCHAR(1) DEFAULT '0',
    exception_info NVARCHAR(MAX) NULL,
    create_time DATETIME2 DEFAULT GETDATE()
);

-- 文章分类表
CREATE TABLE cms_category (
    category_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    category_name NVARCHAR(50) NOT NULL,
    parent_id BIGINT DEFAULT 0,
    category_code NVARCHAR(50) NULL,
    description NVARCHAR(200) NULL,
    sort_order INT DEFAULT 0,
    status NCHAR(1) DEFAULT '1',
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE(),
    update_by NVARCHAR(64) DEFAULT '',
    update_time DATETIME2 DEFAULT GETDATE()
);

-- 文章表
CREATE TABLE cms_article (
    article_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(200) NOT NULL,
    category_id BIGINT NOT NULL,
    sub_category_id BIGINT NULL,
    summary NVARCHAR(500) NULL,
    cover_image NVARCHAR(255) NULL,
    cover_image_source_type NVARCHAR(20) DEFAULT 'upload',
    content_type NVARCHAR(20) DEFAULT 'editor',
    content NVARCHAR(MAX) NULL,
    external_link NVARCHAR(500) NULL,
    source NVARCHAR(100) NULL,
    author NVARCHAR(50) NULL,
    publish_time DATETIME2 NULL,
    status NCHAR(1) DEFAULT '0',
    audit_status NCHAR(1) NULL,
    view_count INT DEFAULT 0,
    sort_order INT DEFAULT 0,
    is_top BIT DEFAULT 0,
    is_hot BIT DEFAULT 0,
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE(),
    update_by NVARCHAR(64) DEFAULT '',
    update_time DATETIME2 DEFAULT GETDATE()
);

-- 公告表
CREATE TABLE cms_notice (
    notice_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    notice_title NVARCHAR(100) NOT NULL,
    notice_type NVARCHAR(20) DEFAULT 'system',
    content NVARCHAR(MAX) NULL,
    status NCHAR(1) DEFAULT '0',
    sort_order INT DEFAULT 0,
    publish_time DATETIME2 NULL,
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE(),
    update_by NVARCHAR(64) DEFAULT '',
    update_time DATETIME2 DEFAULT GETDATE()
);

-- 焦点图表
CREATE TABLE cms_focus (
    focus_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    focus_key NVARCHAR(50) NOT NULL,
    focus_name NVARCHAR(100) NOT NULL,
    image_url NVARCHAR(500) NOT NULL,
    image_source_type NVARCHAR(20) DEFAULT 'upload',
    link_type NVARCHAR(20) DEFAULT 'external',
    link_value NVARCHAR(500) NULL,
    open_type NVARCHAR(20) DEFAULT 'new',
    sort_order INT DEFAULT 0,
    is_fixed NCHAR(1) DEFAULT '1',
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE(),
    update_by NVARCHAR(64) DEFAULT '',
    update_time DATETIME2 DEFAULT GETDATE()
);

-- 轮播图表
CREATE TABLE cms_banner (
    banner_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(100) NULL,
    image_url NVARCHAR(500) NOT NULL,
    link_url NVARCHAR(500) NULL,
    sort_order INT DEFAULT 0,
    status NCHAR(1) DEFAULT '1',
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE(),
    update_by NVARCHAR(64) DEFAULT '',
    update_time DATETIME2 DEFAULT GETDATE()
);

-- 友情链接表
CREATE TABLE cms_link (
    link_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    link_name NVARCHAR(50) NOT NULL,
    link_url NVARCHAR(255) NOT NULL,
    link_logo NVARCHAR(255) NULL,
    description NVARCHAR(200) NULL,
    sort_order INT DEFAULT 0,
    status NCHAR(1) DEFAULT '1',
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE(),
    update_by NVARCHAR(64) DEFAULT '',
    update_time DATETIME2 DEFAULT GETDATE()
);

-- 导航表
CREATE TABLE cms_navigation (
    nav_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    nav_name NVARCHAR(50) NOT NULL,
    parent_id BIGINT DEFAULT 0,
    nav_type NVARCHAR(20) DEFAULT 'header',
    link_type NVARCHAR(20) DEFAULT 'internal',
    link_value NVARCHAR(500) NULL,
    open_type NVARCHAR(20) DEFAULT 'current',
    sort_order INT DEFAULT 0,
    status NCHAR(1) DEFAULT '1',
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE(),
    update_by NVARCHAR(64) DEFAULT '',
    update_time DATETIME2 DEFAULT GETDATE()
);

-- 单页表
CREATE TABLE cms_page (
    page_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    page_key NVARCHAR(50) NOT NULL,
    page_name NVARCHAR(50) NOT NULL,
    title NVARCHAR(100) NULL,
    content NVARCHAR(MAX) NULL,
    meta_keywords NVARCHAR(200) NULL,
    meta_description NVARCHAR(500) NULL,
    status NCHAR(1) DEFAULT '1',
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE(),
    update_by NVARCHAR(64) DEFAULT '',
    update_time DATETIME2 DEFAULT GETDATE()
);

-- 专题表
CREATE TABLE cms_special (
    special_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    special_name NVARCHAR(50) NOT NULL,
    special_code NVARCHAR(50) NULL,
    description NVARCHAR(200) NULL,
    cover_image NVARCHAR(255) NULL,
    status NCHAR(1) DEFAULT '1',
    sort_order INT DEFAULT 0,
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE(),
    update_by NVARCHAR(64) DEFAULT '',
    update_time DATETIME2 DEFAULT GETDATE()
);

-- 专题分类表
CREATE TABLE cms_special_category (
    category_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    special_id BIGINT NOT NULL,
    category_name NVARCHAR(50) NOT NULL,
    sort_order INT DEFAULT 0,
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE(),
    update_by NVARCHAR(64) DEFAULT '',
    update_time DATETIME2 DEFAULT GETDATE()
);

-- 专题文章关联表
CREATE TABLE cms_special_article (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    special_id BIGINT NOT NULL,
    category_id BIGINT NULL,
    article_id BIGINT NOT NULL,
    sort_order INT DEFAULT 0,
    create_time DATETIME2 DEFAULT GETDATE()
);

-- 关于我们表
CREATE TABLE cms_about (
    about_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    about_key NVARCHAR(50) NOT NULL,
    about_name NVARCHAR(50) NOT NULL,
    description NVARCHAR(200) NULL,
    sort_order INT DEFAULT 0,
    status NCHAR(1) DEFAULT '1',
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE(),
    update_by NVARCHAR(64) DEFAULT '',
    update_time DATETIME2 DEFAULT GETDATE()
);

-- 关于我们板块表
CREATE TABLE cms_about_section (
    section_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    about_id BIGINT NOT NULL,
    section_name NVARCHAR(50) NOT NULL,
    section_type NVARCHAR(20) DEFAULT 'content',
    content NVARCHAR(MAX) NULL,
    sort_order INT DEFAULT 0,
    status NCHAR(1) DEFAULT '1',
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE(),
    update_by NVARCHAR(64) DEFAULT '',
    update_time DATETIME2 DEFAULT GETDATE()
);

-- 关于我们文章表
CREATE TABLE cms_about_article (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    about_id BIGINT NOT NULL,
    section_id BIGINT NULL,
    article_id BIGINT NOT NULL,
    sort_order INT DEFAULT 0,
    create_time DATETIME2 DEFAULT GETDATE()
);

-- 站点配置表
CREATE TABLE cms_site_config (
    config_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    config_key NVARCHAR(50) NOT NULL,
    config_value NVARCHAR(MAX) NULL,
    description NVARCHAR(200) NULL,
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE(),
    update_by NVARCHAR(64) DEFAULT '',
    update_time DATETIME2 DEFAULT GETDATE()
);

-- 快捷链接表
CREATE TABLE cms_quick_link (
    link_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    link_name NVARCHAR(50) NOT NULL,
    link_url NVARCHAR(255) NOT NULL,
    link_icon NVARCHAR(100) NULL,
    sort_order INT DEFAULT 0,
    status NCHAR(1) DEFAULT '1',
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE(),
    update_by NVARCHAR(64) DEFAULT '',
    update_time DATETIME2 DEFAULT GETDATE()
);

-- 焦点图历史记录表
CREATE TABLE cms_focus_history (
    history_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    focus_id BIGINT NOT NULL,
    old_image_url NVARCHAR(500) NULL,
    new_image_url NVARCHAR(500) NULL,
    old_link_value NVARCHAR(500) NULL,
    new_link_value NVARCHAR(500) NULL,
    change_type NVARCHAR(20) DEFAULT 'update',
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE()
);

-- 统计表
CREATE TABLE cms_statistics (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    stat_date DATE NOT NULL,
    visit_count INT DEFAULT 0,
    article_count INT DEFAULT 0,
    create_time DATETIME2 DEFAULT GETDATE()
);

-- 访问日志表
CREATE TABLE cms_visit_log (
    log_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    ip_address NVARCHAR(50) NULL,
    user_agent NVARCHAR(500) NULL,
    request_url NVARCHAR(500) NULL,
    referer NVARCHAR(500) NULL,
    visit_time DATETIME2 DEFAULT GETDATE()
);

-- 文件上传表
CREATE TABLE sys_upload (
    upload_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    file_name NVARCHAR(255) NOT NULL,
    original_name NVARCHAR(255) NULL,
    file_suffix NVARCHAR(10) NULL,
    url NVARCHAR(500) NOT NULL,
    file_size BIGINT NULL,
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE(),
    update_by NVARCHAR(64) DEFAULT '',
    update_time DATETIME2 DEFAULT GETDATE()
);

-- 代码生成表
CREATE TABLE gen_table (
    table_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    table_name NVARCHAR(200) DEFAULT '',
    table_comment NVARCHAR(500) DEFAULT '',
    sub_table_name NVARCHAR(64) NULL,
    sub_table_fk NVARCHAR(64) NULL,
    class_name NVARCHAR(100) DEFAULT '',
    tpl_category NVARCHAR(200) DEFAULT 'crud',
    tpl_web_type NVARCHAR(30) DEFAULT '',
    package_name NVARCHAR(100) NULL,
    module_name NVARCHAR(30) NULL,
    business_name NVARCHAR(30) NULL,
    function_name NVARCHAR(50) NULL,
    function_author NVARCHAR(50) NULL,
    gen_type NCHAR(1) DEFAULT '0',
    gen_path NVARCHAR(200) DEFAULT '/',
    options NVARCHAR(MAX) NULL,
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE(),
    update_by NVARCHAR(64) DEFAULT '',
    update_time DATETIME2 DEFAULT GETDATE(),
    remark NVARCHAR(500) NULL
);

-- 代码生成字段表
CREATE TABLE gen_table_column (
    column_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    table_id BIGINT NULL,
    column_name NVARCHAR(200) NULL,
    column_comment NVARCHAR(500) NULL,
    column_type NVARCHAR(100) NULL,
    java_type NVARCHAR(500) NULL,
    java_field NVARCHAR(200) NULL,
    is_pk NCHAR(1) NULL,
    is_increment NCHAR(1) NULL,
    is_required NCHAR(1) NULL,
    is_insert NCHAR(1) NULL,
    is_edit NCHAR(1) NULL,
    is_list NCHAR(1) NULL,
    is_query NCHAR(1) NULL,
    query_type NVARCHAR(200) DEFAULT 'EQ',
    html_type NVARCHAR(200) NULL,
    dict_type NVARCHAR(200) DEFAULT '',
    sort INT NULL,
    create_by NVARCHAR(64) DEFAULT '',
    create_time DATETIME2 DEFAULT GETDATE(),
    update_by NVARCHAR(64) DEFAULT '',
    update_time DATETIME2 DEFAULT GETDATE()
);

-- 插入默认数据

-- 默认用户 (密码: 123456)
INSERT INTO sys_user (user_name, nick_name, password, status, email) 
VALUES (N'admin', N'管理员', N'$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iAt6Z5EO', N'0', N'admin@example.com');

-- 默认角色
INSERT INTO sys_role (role_name, role_key, role_sort, status) 
VALUES (N'超级管理员', N'admin', 1, N'0');

-- 用户角色关联
INSERT INTO sys_user_role (user_id, role_id) VALUES (1, 1);

-- 默认部门
INSERT INTO sys_dept (parent_id, dept_name, order_num, status) 
VALUES (0, N'总公司', 0, N'0');

-- 更新用户部门
UPDATE sys_user SET dept_id = 1 WHERE user_id = 1;

-- 默认字典类型
INSERT INTO sys_dict_type (dict_name, dict_type, status) VALUES
(N'用户性别', N'sys_user_sex', N'0'),
(N'菜单状态', N'sys_show_hide', N'0'),
(N'系统是否', N'sys_yes_no', N'0'),
(N'通知类型', N'sys_notice_type', N'0'),
(N'通知状态', N'sys_notice_status', N'0'),
(N'操作类型', N'sys_oper_type', N'0'),
(N'系统状态', N'sys_common_status', N'0');

-- 默认字典数据
INSERT INTO sys_dict_data (dict_sort, dict_label, dict_value, dict_type, status) VALUES
(1, N'男', N'0', N'sys_user_sex', N'0'),
(2, N'女', N'1', N'sys_user_sex', N'0'),
(3, N'未知', N'2', N'sys_user_sex', N'0'),
(1, N'显示', N'0', N'sys_show_hide', N'0'),
(2, N'隐藏', N'1', N'sys_show_hide', N'0'),
(1, N'是', N'Y', N'sys_yes_no', N'0'),
(2, N'否', N'N', N'sys_yes_no', N'0'),
(1, N'通知', N'1', N'sys_notice_type', N'0'),
(2, N'公告', N'2', N'sys_notice_type', N'0'),
(1, N'正常', N'0', N'sys_common_status', N'0'),
(2, N'停用', N'1', N'sys_common_status', N'0');

-- 默认参数配置
INSERT INTO sys_config (config_name, config_key, config_value, config_type) VALUES
(N'系统名称', N'sys.name', N'Nest Admin', N'Y'),
(N'系统版本', N'sys.version', N'v1.0.0', N'Y'),
(N'版权信息', N'sys.copyright', N'Copyright 2024', N'Y');

-- 默认站点配置
INSERT INTO cms_site_config (config_key, config_value, description) VALUES
(N'site_name', N'Nest Admin', N'站点名称'),
(N'site_logo', N'', N'站点Logo'),
(N'site_icp', N'', N'ICP备案号'),
(N'site_copyright', N'Copyright 2024', N'版权信息');

-- 创建索引
CREATE INDEX IX_sys_user_user_name ON sys_user(user_name);
CREATE INDEX IX_sys_user_status ON sys_user(status);
CREATE INDEX IX_sys_role_role_key ON sys_role(role_key);
CREATE INDEX IX_sys_menu_parent_id ON sys_menu(parent_id);
CREATE INDEX IX_cms_article_category_id ON cms_article(category_id);
CREATE INDEX IX_cms_article_status ON cms_article(status);
CREATE INDEX IX_cms_notice_status ON cms_notice(status);
CREATE INDEX IX_sys_oper_log_oper_time ON sys_oper_log(oper_time);
CREATE INDEX IX_sys_logininfor_login_time ON sys_logininfor(login_time);

GO
```

---

## 三、实体类修改清单

需要修改以下实体类中的 `longtext` 类型：

| 实体文件 | 字段 | 修改方式 |
|---------|------|---------|
| `cms/article/entities/article.entity.ts` | `content` | `type: 'nvarchar', length: 'max'` |
| `cms/page/entities/page.entity.ts` | `content` | `type: 'nvarchar', length: 'max'` |
| `cms/notice/entities/notice.entity.ts` | `content` | `type: 'nvarchar', length: 'max'` |
| `cms/about/entities/about-section.entity.ts` | `content` | `type: 'nvarchar', length: 'max'` |
| `sys/notice/entities/notice.entity.ts` | `noticeContent` | `type: 'nvarchar', length: 'max'` |

**修改示例**:
```typescript
// 修改前
@Column({ name: 'content', type: 'longtext', nullable: true })
content: string;

// 修改后
@Column({ name: 'content', type: 'nvarchar', length: 'max', nullable: true })
content: string;
```

---

## 四、迁移步骤总结

1. **安装 SQL Server** 和命令行工具
2. **修改 `package.json`** - 替换 mysql2 为 mssql
3. **修改 `app.module.ts`** - 更改数据库类型为 mssql
4. **修改配置文件** - 更新 dev.yml 和 prod.yml
5. **修改实体类** - 将 longtext 改为 nvarchar(max)
6. **创建 SQL Server 初始化脚本** - 转换 MySQL SQL 为 SQL Server SQL
7. **修改脚本文件** - 更新 init-db.js 等使用 mssql 模块
8. **重新安装依赖** - `npm install`
9. **初始化数据库** - 执行 SQL Server 脚本
10. **启动服务** - `npm run start:dev`

---

## 五、注意事项

1. **字符集**: SQL Server 使用 NVARCHAR 存储 Unicode 字符，无需指定字符集
2. **大小写**: SQL Server 默认不区分大小写，但建议保持与 MySQL 一致
3. **分页**: TypeORM 会自动处理不同数据库的分页语法差异
4. **事务**: SQL Server 的事务处理与 MySQL 略有不同，但 TypeORM 已封装
5. **自增 ID**: SQL Server 使用 `IDENTITY(1,1)`，与 MySQL 的 `AUTO_INCREMENT` 类似
6. **时间类型**: 推荐使用 `DATETIME2` 替代 `DATETIME`
7. **JSON**: SQL Server 2016+ 支持 JSON 函数，但存储为 NVARCHAR(MAX)
