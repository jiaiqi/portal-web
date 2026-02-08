# Nest Admin 多数据库兼容方案

## 概述

本方案实现同时支持 MySQL 和 SQL Server，通过配置即可切换，无需修改业务代码。

---

## 一、实现方案

### 1.1 安装依赖

```bash
cd server

# 同时安装两个数据库驱动
npm install mysql2 mssql @types/mssql
```

---

### 1.2 修改数据库连接配置

**文件**: `server/src/app.module.ts`

```typescript
import { Module, Global } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { TypeOrmModule, TypeOrmModuleOptions } from '@nestjs/typeorm';
import configuration from './config/index';
import { APP_GUARD } from '@nestjs/core';
import { JwtAuthGuard } from 'src/common/guards/auth.guard';
import { PermissionGuard } from 'src/common/guards/permission.guard';
import { RolesGuard } from './common/guards/roles.guard';

import { MainModule } from './module/main/main.module';
import { UploadModule } from './module/upload/upload.module';
import { SystemModule } from './module/system/system.module';
import { CommonModule } from './module/common/common.module';
import { MonitorModule } from './module/monitor/monitor.module';
import { CmsModule } from './module/cms/cms.module';
import { DashboardModule } from './module/dashboard/dashboard.module';

@Global()
@Module({
  imports: [
    // 配置模块
    ConfigModule.forRoot({
      cache: true,
      load: [configuration],
      isGlobal: true,
    }),
    // 数据库
    TypeOrmModule.forRootAsync({
      imports: [ConfigModule],
      inject: [ConfigService],
      useFactory: (config: ConfigService) => {
        const dbType = config.get('db.type') || 'mysql';
        
        // 基础配置
        const baseConfig = {
          entities: [`${__dirname}/**/*.entity{.ts,.js}`],
          autoLoadEntities: true,
          keepConnectionAlive: true,
        };

        // 根据数据库类型返回不同配置
        if (dbType === 'mssql') {
          return {
            ...baseConfig,
            type: 'mssql' as const,
            ...config.get('db.mssql'),
            options: {
              encrypt: config.get('db.mssql.encrypt') || false,
              trustServerCertificate: config.get('db.mssql.trustServerCertificate') || true,
            },
          } as TypeOrmModuleOptions;
        }

        // 默认 MySQL
        return {
          ...baseConfig,
          type: 'mysql' as const,
          timezone: '+08:00',
          ...config.get('db.mysql'),
        } as TypeOrmModuleOptions;
      },
    }),

    MainModule,
    UploadModule,
    CommonModule,
    SystemModule,
    MonitorModule,
    CmsModule,
    DashboardModule,
  ],
  providers: [
    {
      provide: APP_GUARD,
      useClass: JwtAuthGuard,
    },
    {
      provide: APP_GUARD,
      useClass: RolesGuard,
    },
    {
      provide: APP_GUARD,
      useClass: PermissionGuard,
    },
  ],
})
export class AppModule {}
```

---

### 1.3 修改配置文件

**文件**: `server/src/config/dev.yml`

```yaml
# 数据库类型: mysql 或 mssql
db:
  type: mysql  # 切换数据库类型: mysql / mssql
  
  # MySQL 配置
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
    synchronize: true
    supportBigNumbers: true
    bigNumberStrings: true

  # SQL Server 配置
  mssql:
    host: 'localhost'
    port: 1433
    username: 'sa'
    password: 'YourPassword123'
    database: 'nest_admin'
    synchronize: true
    logging: true
    encrypt: false
    trustServerCertificate: true
```

**文件**: `server/src/config/prod.yml`

```yaml
# 数据库类型: mysql 或 mssql
db:
  type: mysql  # 生产环境切换数据库类型
  
  # MySQL 配置
  mysql:
    host: 'your_mysql_host'
    username: 'nest_admin'
    password: 'your_password'
    database: 'nest_admin'
    port: 3306
    charset: 'utf8mb4'
    logger: 'file'
    logging: false
    multipleStatements: true
    dropSchema: false
    synchronize: false
    supportBigNumbers: true
    bigNumberStrings: true

  # SQL Server 配置
  mssql:
    host: 'your_sqlserver_host'
    port: 1433
    username: 'nest_admin'
    password: 'your_password'
    database: 'nest_admin'
    synchronize: false
    logging: false
    encrypt: true
    trustServerCertificate: false
```

---

### 1.4 创建数据库类型工具类

**文件**: `server/src/common/utils/db-type.util.ts`

```typescript
import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';

@Injectable()
export class DbTypeUtil {
  constructor(private readonly configService: ConfigService) {}

  /**
   * 获取当前数据库类型
   */
  getDbType(): 'mysql' | 'mssql' {
    return this.configService.get<'mysql' | 'mssql'>('db.type') || 'mysql';
  }

  /**
   * 是否为 MySQL
   */
  isMySQL(): boolean {
    return this.getDbType() === 'mysql';
  }

  /**
   * 是否为 SQL Server
   */
  isMSSQL(): boolean {
    return this.getDbType() === 'mssql';
  }

  /**
   * 获取长文本字段类型
   * MySQL: longtext
   * SQL Server: nvarchar(max)
   */
  getLongTextType(): string {
    return this.isMySQL() ? 'longtext' : 'nvarchar';
  }

  /**
   * 获取长文本字段长度
   * MySQL: undefined
   * SQL Server: 'max'
   */
  getLongTextLength(): string | undefined {
    return this.isMySQL() ? undefined : 'max';
  }

  /**
   * 获取当前时间函数
   * MySQL: NOW()
   * SQL Server: GETDATE()
   */
  getCurrentTimeFunction(): string {
    return this.isMySQL() ? 'NOW()' : 'GETDATE()';
  }

  /**
   * 获取日期格式化函数
   */
  getDateFormat(column: string, format: string): string {
    if (this.isMySQL()) {
      return `DATE_FORMAT(${column}, '${format}')`;
    }
    // SQL Server 格式转换
    const formatMap: Record<string, string> = {
      '%Y-%m-%d': 'yyyy-MM-dd',
      '%Y-%m-%d %H:%i:%s': 'yyyy-MM-dd HH:mm:ss',
      '%H:%i:%s': 'HH:mm:ss',
    };
    return `FORMAT(${column}, '${formatMap[format] || 'yyyy-MM-dd'}')`;
  }

  /**
   * 获取分页语句
   */
  getLimitClause(limit: number, offset?: number): string {
    if (this.isMySQL()) {
      return offset !== undefined 
        ? `LIMIT ${limit} OFFSET ${offset}` 
        : `LIMIT ${limit}`;
    }
    // SQL Server 使用 OFFSET FETCH
    return offset !== undefined
      ? `OFFSET ${offset} ROWS FETCH NEXT ${limit} ROWS ONLY`
      : `TOP ${limit}`;
  }

  /**
   * 获取字符串连接符
   */
  getConcatOperator(): string {
    return this.isMySQL() ? 'CONCAT' : 'CONCAT';
  }

  /**
   * 获取 IFNULL 函数
   * MySQL: IFNULL
   * SQL Server: ISNULL
   */
  getIfNullFunction(): string {
    return this.isMySQL() ? 'IFNULL' : 'ISNULL';
  }
}
```

---

### 1.5 修改实体类支持多数据库

**文件**: `server/src/module/cms/article/entities/article.entity.ts`

```typescript
import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
  ManyToOne,
  JoinColumn,
} from 'typeorm';
import { CategoryEntity } from '../../category/entities/category.entity';

@Entity('cms_article')
export class ArticleEntity {
  @PrimaryGeneratedColumn({ name: 'article_id' })
  articleId: number;

  @Column({ name: 'title', length: 200, comment: '文章标题' })
  title: string;

  @Column({ name: 'category_id', comment: '分类ID' })
  categoryId: number;

  @ManyToOne(() => CategoryEntity, (category) => category.articles)
  @JoinColumn({ name: 'category_id' })
  category: CategoryEntity;

  @Column({ name: 'sub_category_id', nullable: true, comment: '子分类ID' })
  subCategoryId: number;

  @Column({ name: 'summary', length: 500, nullable: true, comment: '文章摘要' })
  summary: string;

  @Column({ name: 'cover_image', length: 255, nullable: true, comment: '封面图' })
  coverImage: string;

  @Column({ name: 'cover_image_source_type', length: 20, default: 'upload', comment: '封面图片来源类型' })
  coverImageSourceType: string;

  @Column({ name: 'content_type', length: 20, default: 'editor', comment: '内容类型' })
  contentType: string;

  // 兼容 MySQL 和 SQL Server 的长文本字段
  // TypeORM 会自动根据数据库类型处理
  @Column({ 
    name: 'content', 
    type: 'text',  // 使用 text 类型，TypeORM 会自动映射
    nullable: true, 
    comment: '文章内容' 
  })
  content: string;

  @Column({ name: 'external_link', length: 500, nullable: true, comment: '外部链接' })
  externalLink: string;

  @Column({ name: 'source', length: 100, nullable: true, comment: '文章来源' })
  source: string;

  @Column({ name: 'author', length: 50, nullable: true, comment: '作者' })
  author: string;

  @Column({ name: 'publish_time', type: 'datetime', nullable: true, comment: '发布时间' })
  publishTime: Date;

  @Column({ name: 'status', length: 1, default: '0', comment: '状态' })
  status: string;

  @Column({ name: 'audit_status', length: 1, nullable: true, comment: '审核状态' })
  auditStatus: string;

  @Column({ name: 'view_count', type: 'int', default: 0, comment: '浏览次数' })
  viewCount: number;

  @Column({ name: 'sort_order', type: 'int', default: 0, comment: '排序' })
  sortOrder: number;

  @Column({ name: 'is_top', type: 'tinyint', default: 0, comment: '是否置顶' })
  isTop: number;

  @Column({ name: 'is_hot', type: 'tinyint', default: 0, comment: '是否热门' })
  isHot: number;

  @Column({ name: 'create_by', length: 64, default: '', comment: '创建者' })
  createBy: string;

  @CreateDateColumn({ name: 'create_time', type: 'datetime', comment: '创建时间' })
  createTime: Date;

  @Column({ name: 'update_by', length: 64, default: '', comment: '更新者' })
  updateBy: string;

  @UpdateDateColumn({ name: 'update_time', type: 'datetime', comment: '更新时间' })
  updateTime: Date;
}
```

---

### 1.6 使用通用类型的实体类示例

对于需要明确指定类型的字段，可以使用条件类型：

**文件**: `server/src/common/decorators/db-column.decorator.ts`

```typescript
import { Column, ColumnOptions } from 'typeorm';
import { ConfigService } from '@nestjs/config';

/**
 * 获取长文本列配置
 * 兼容 MySQL 和 SQL Server
 */
export function LongTextColumn(options: Omit<ColumnOptions, 'type' | 'length'> = {}): PropertyDecorator {
  return function (target: any, propertyKey: string | symbol) {
    // 使用 TypeORM 的 text 类型，它会自动映射到对应数据库的类型
    Column({
      ...options,
      type: 'text',
    })(target, propertyKey);
  };
}

/**
 * 获取布尔列配置
 * 兼容 MySQL 和 SQL Server
 */
export function BooleanColumn(options: Omit<ColumnOptions, 'type'> = {}): PropertyDecorator {
  return function (target: any, propertyKey: string | symbol) {
    Column({
      ...options,
      type: 'boolean',
      default: options.default ?? false,
    })(target, propertyKey);
  };
}

/**
 * 获取日期时间列配置
 */
export function DateTimeColumn(options: Omit<ColumnOptions, 'type'> = {}): PropertyDecorator {
  return function (target: any, propertyKey: string | symbol) {
    Column({
      ...options,
      type: 'datetime',
    })(target, propertyKey);
  };
}
```

---

### 1.7 修改脚本文件支持多数据库

**文件**: `server/scripts/init-db.js`

```javascript
const fs = require('fs');
const path = require('path');

// 读取配置文件
const configPath = path.join(__dirname, '../src/config/dev.yml');
const configContent = fs.readFileSync(configPath, 'utf8');

// 简单解析 YAML 获取数据库类型
const dbTypeMatch = configContent.match(/type:\s*(mysql|mssql)/);
const dbType = dbTypeMatch ? dbTypeMatch[1] : 'mysql';

console.log(`Database type: ${dbType}`);

async function initDb() {
  if (dbType === 'mssql') {
    // SQL Server 初始化
    const sql = require('mssql');
    
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

    try {
      await sql.connect(config);
      console.log('SQL Server connected successfully');
      
      // 执行 SQL Server 初始化脚本
      const sqlFile = path.join(__dirname, '../db/nest_admin_mssql.sql');
      if (fs.existsSync(sqlFile)) {
        const sqlContent = fs.readFileSync(sqlFile, 'utf8');
        // 分批执行 SQL（SQL Server 需要特殊处理）
        const statements = sqlContent.split(/\bGO\b/i).filter(s => s.trim());
        for (const statement of statements) {
          if (statement.trim()) {
            await sql.query(statement);
          }
        }
        console.log('SQL Server database initialized');
      }
      
      await sql.close();
    } catch (err) {
      console.error('SQL Server initialization failed:', err);
      process.exit(1);
    }
  } else {
    // MySQL 初始化
    const mysql = require('mysql2/promise');
    
    const dbConfig = {
      host: '127.0.0.1',
      user: 'root',
      password: '12345678',
      database: 'nest_admin',
      multipleStatements: true,
    };

    try {
      const connection = await mysql.createConnection(dbConfig);
      console.log('MySQL connected successfully');
      
      // 执行 MySQL 初始化脚本
      const sqlFile = path.join(__dirname, '../db/nest_admin.sql');
      if (fs.existsSync(sqlFile)) {
        const sqlContent = fs.readFileSync(sqlFile, 'utf8');
        await connection.query(sqlContent);
        console.log('MySQL database initialized');
      }
      
      await connection.end();
    } catch (err) {
      console.error('MySQL initialization failed:', err);
      process.exit(1);
    }
  }
}

initDb();
```

---

## 二、数据库初始化脚本

### 2.1 目录结构

```
server/db/
├── mysql/                    # MySQL 脚本
│   ├── nest_admin.sql
│   ├── add_article_audit_menu.sql
│   └── add_auditor_user.sql
├── mssql/                    # SQL Server 脚本
│   ├── nest_admin.sql
│   ├── add_article_audit_menu.sql
│   └── add_auditor_user.sql
└── init.js                   # 通用初始化脚本
```

### 2.2 自动选择脚本执行

**文件**: `server/db/init.js`

```javascript
#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

// 读取配置
const configPath = path.join(__dirname, '../src/config/dev.yml');
const configContent = fs.readFileSync(configPath, 'utf8');

// 解析数据库类型
const dbTypeMatch = configContent.match(/type:\s*(mysql|mssql)/);
const dbType = dbTypeMatch ? dbTypeMatch[1] : 'mysql';

console.log(`Initializing database: ${dbType}`);

const dbConfig = {
  mysql: {
    host: '127.0.0.1',
    user: 'root',
    password: '12345678',
    database: 'nest_admin',
  },
  mssql: {
    server: 'localhost',
    user: 'sa',
    password: 'YourPassword123',
    database: 'nest_admin',
    port: 1433,
  },
};

const config = dbConfig[dbType];

// 执行对应数据库的脚本
const scriptDir = path.join(__dirname, dbType);
const scripts = [
  'nest_admin.sql',
  'add_article_audit_menu.sql',
  'add_auditor_user.sql',
].filter(script => fs.existsSync(path.join(scriptDir, script)));

for (const script of scripts) {
  const scriptPath = path.join(scriptDir, script);
  console.log(`Executing: ${script}`);
  
  try {
    if (dbType === 'mysql') {
      execSync(
        `mysql -h ${config.host} -u ${config.user} -p${config.password} ${config.database} < "${scriptPath}"`,
        { stdio: 'inherit' }
      );
    } else {
      // SQL Server 使用 sqlcmd
      execSync(
        `sqlcmd -S ${config.server},${config.port} -U ${config.user} -P ${config.password} -d ${config.database} -i "${scriptPath}"`,
        { stdio: 'inherit' }
      );
    }
    console.log(`✓ ${script} executed successfully`);
  } catch (error) {
    console.error(`✗ ${script} failed:`, error.message);
    process.exit(1);
  }
}

console.log('\nDatabase initialization completed!');
```

---

## 三、切换数据库步骤

### 3.1 切换到 SQL Server

1. **修改配置文件** `src/config/dev.yml`:
   ```yaml
   db:
     type: mssql  # 改为 mssql
   ```

2. **安装 SQL Server 依赖**:
   ```bash
   npm install mssql @types/mssql
   ```

3. **初始化 SQL Server 数据库**:
   ```bash
   node db/init.js
   ```

4. **启动服务**:
   ```bash
   npm run start:dev
   ```

### 3.2 切换回 MySQL

1. **修改配置文件** `src/config/dev.yml`:
   ```yaml
   db:
     type: mysql  # 改为 mysql
   ```

2. **启动服务**:
   ```bash
   npm run start:dev
   ```

---

## 四、注意事项

### 4.1 SQL 语法差异

| 功能 | MySQL | SQL Server | 解决方案 |
|------|-------|------------|----------|
| 分页 | `LIMIT n OFFSET m` | `OFFSET m ROWS FETCH NEXT n ROWS ONLY` | 使用 TypeORM 的 `take`/`skip` |
| 字符串连接 | `CONCAT()` | `CONCAT()` | 相同 |
| 空值判断 | `IFNULL()` | `ISNULL()` | 使用 TypeORM 的 `COALESCE` |
| 当前时间 | `NOW()` | `GETDATE()` | 使用 `@CreateDateColumn` |
| 自增 ID | `AUTO_INCREMENT` | `IDENTITY(1,1)` | TypeORM 自动处理 |
| 长文本 | `LONGTEXT` | `NVARCHAR(MAX)` | 使用 `type: 'text'` |

### 4.2 推荐做法

1. **使用 TypeORM 标准类型**: 尽量使用 `varchar`, `text`, `int`, `datetime` 等标准类型
2. **避免原生 SQL**: 尽量使用 TypeORM 的 QueryBuilder
3. **日期处理**: 使用 TypeORM 的 `@CreateDateColumn` 和 `@UpdateDateColumn`
4. **分页查询**: 使用 TypeORM 的 `skip` 和 `take` 方法

### 4.3 实体类最佳实践

```typescript
@Entity('cms_article')
export class ArticleEntity {
  // 自增 ID - TypeORM 自动处理差异
  @PrimaryGeneratedColumn({ name: 'article_id' })
  articleId: number;

  // 普通字符串
  @Column({ name: 'title', length: 200 })
  title: string;

  // 长文本 - 使用 text 类型自动适配
  @Column({ name: 'content', type: 'text', nullable: true })
  content: string;

  // 布尔值 - 使用 boolean 类型
  @Column({ name: 'is_top', type: 'boolean', default: false })
  isTop: boolean;

  // 日期时间 - 使用 TypeORM 自动管理
  @CreateDateColumn({ name: 'create_time', type: 'datetime' })
  createTime: Date;

  @UpdateDateColumn({ name: 'update_time', type: 'datetime' })
  updateTime: Date;
}
```

---

## 五、测试验证

### 5.1 验证数据库连接

```bash
# 查看当前使用的数据库类型
curl http://localhost:8080/api/test/db-type
```

### 5.2 添加测试接口

**文件**: `server/src/module/main/main.controller.ts`

```typescript
import { Controller, Get } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';

@Controller()
export class MainController {
  constructor(private readonly configService: ConfigService) {}

  @Get('test/db-type')
  getDbType() {
    const dbType = this.configService.get('db.type') || 'mysql';
    return {
      code: 200,
      data: {
        dbType,
        message: `Current database type: ${dbType}`,
      },
    };
  }
}
```

---

## 六、总结

通过上述方案，您可以：

1. ✅ 通过简单修改配置切换数据库类型
2. ✅ 无需修改业务代码
3. ✅ 同时支持 MySQL 和 SQL Server
4. ✅ 使用 TypeORM 自动处理大部分差异
5. ✅ 保留数据库特定的优化能力

只需修改 `db.type` 配置即可在 MySQL 和 SQL Server 之间切换！
