# 门户网站功能设计方案

## 一、需求分析

### 1.1 门户网站现有导航（硬编码）
根据 `AppHeader.vue`，当前导航如下：
- 首页
- 协会概况
- 要闻动态
- 党建工作
- 品牌活动
- 表彰激励
- 公告公示
- 专题
- 全国联动
- 智慧平台（外部链接）

### 1.2 用户需求的功能模块

| 序号 | 功能模块 | 类型 | 说明 |
|------|---------|------|------|
| 1 | 协会概况 | 特殊 | 列表页面，5条数据（概况、章程、领导、理事会、条例） |
| 2 | 要闻动态 | 文章列表 | 普通文章列表 |
| 3 | 党建工作 | 文章列表 | 普通文章列表 |
| 4 | 品牌活动 | 文章列表 | 普通文章列表 |
| 5 | 表彰激励 | 文章列表 | 普通文章列表 |
| 6 | 公告公示 | 文章列表 | 普通文章列表 |
| 7 | 专题 | 特殊 | 文章列表 + 栏目筛选 |
| 8 | 全国联动 | 文章列表 | 普通文章列表 |
| 9 | 网站导航管理 | 导航管理 | 管理门户网站导航 |

## 二、现有数据库结构分析

### 2.1 已有的表

#### cms_category（文章分类表）
```sql
- category_id: 分类ID
- category_name: 分类名称
- category_code: 分类编码
- parent_id: 父分类ID
- sort_order: 排序
- status: 状态
- icon: 图标
```

#### cms_article（文章表）
```sql
- article_id: 文章ID
- title: 文章标题
- category_id: 分类ID
- summary: 文章摘要
- cover_image: 封面图
- content: 文章内容
- publish_time: 发布时间
- status: 状态
- is_top: 是否置顶
- view_count: 浏览量
```

#### cms_special（专题表）
```sql
- special_id: 专题ID
- title: 专题标题
- cover_image: 封面图
- description: 专题描述
- sort_order: 排序
- status: 状态
```

#### cms_special_article（专题文章关联表）
```sql
- id: 主键
- special_id: 专题ID
- article_id: 文章ID
- sort_order: 排序
```

#### cms_about_section（协会概况栏目表）
```sql
- section_id: 栏目ID
- section_key: 栏目标识（overview/charter/leadership/council/regulations）
- section_name: 栏目名称
- section_type: 栏目类型（richText/list）
- content: 富文本内容
- sort_order: 排序
- status: 状态
```

#### cms_about_article（协会文章表）
```sql
- article_id: 文章ID
- section_key: 栏目标识
- title: 文章标题
- content: 文章内容
- sort_order: 排序
- status: 状态
```

## 三、推荐设计方案

### 方案一：基于现有表的优化方案（推荐）

#### 3.1 数据库设计

##### 新增 cms_navigation（网站导航表）
```sql
CREATE TABLE `cms_navigation` (
  `nav_id` int NOT NULL AUTO_INCREMENT COMMENT '导航ID',
  `nav_name` varchar(50) NOT NULL COMMENT '导航名称',
  `nav_path` varchar(200) NOT NULL COMMENT '导航路径/路由',
  `nav_type` varchar(20) NOT NULL DEFAULT 'internal' COMMENT '导航类型：internal内部 external外部',
  `nav_target` varchar(20) DEFAULT '_self' COMMENT '打开方式：_self当前页 _blank新标签页',
  `is_fixed` char(1) NOT NULL DEFAULT '0' COMMENT '是否固定：0否 1是（不可编辑删除）',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `status` char(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`nav_id`),
  KEY `idx_sort_order` (`sort_order`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='网站导航表';
```

##### 新增 cms_special_category（专题栏目表）
```sql
CREATE TABLE `cms_special_category` (
  `category_id` int NOT NULL AUTO_INCREMENT COMMENT '栏目ID',
  `special_id` int NOT NULL COMMENT '专题ID',
  `category_name` varchar(100) NOT NULL COMMENT '栏目名称',
  `category_code` varchar(50) NOT NULL COMMENT '栏目编码',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `status` char(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `uk_special_code` (`special_id`, `category_code`),
  KEY `idx_special_id` (`special_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='专题栏目表';
```

##### 修改 cms_special_article（专题文章关联表）
```sql
-- 添加 category_id 字段
ALTER TABLE `cms_special_article`
ADD COLUMN `category_id` int DEFAULT NULL COMMENT '栏目ID' AFTER `article_id`,
ADD KEY `idx_category_id` (`category_id`);
```

#### 3.2 分类编码设计

基于 cms_category 表，定义以下分类编码：

| 分类编码 | 分类名称 | 对应导航 | 说明 |
|---------|---------|---------|------|
| news | 要闻动态 | 要闻动态 | 普通文章列表 |
| party | 党建工作 | 党建工作 | 普通文章列表 |
| activities | 品牌活动 | 品牌活动 | 普通文章列表 |
| awards | 表彰激励 | 表彰激励 | 普通文章列表 |
| notice | 公告公示 | 公告公示 | 普通文章列表 |
| cooperation | 全国联动 | 全国联动 | 普通文章列表 |

#### 3.3 功能模块映射

| 后台菜单 | 数据表 | 说明 |
|---------|--------|------|
| 协会概况 | cms_about_section, cms_about_article | 特殊处理，使用概况栏目表 |
| 要闻动态 | cms_article (category_code='news') | 通过分类筛选 |
| 党建工作 | cms_article (category_code='party') | 通过分类筛选 |
| 品牌活动 | cms_article (category_code='activities') | 通过分类筛选 |
| 表彰激励 | cms_article (category_code='awards') | 通过分类筛选 |
| 公告公示 | cms_article (category_code='notice') | 通过分类筛选 |
| 专题 | cms_special, cms_special_category, cms_special_article | 专题 + 栏目 + 文章 |
| 全国联动 | cms_article (category_code='cooperation') | 通过分类筛选 |
| 网站导航管理 | cms_navigation | 导航管理 |

#### 3.4 接口设计

##### 协会概况接口
```
GET /cms/about/sections          # 获取协会概况栏目列表
GET /cms/about/section/:key      # 获取单个栏目内容（富文本类型）
GET /cms/about/articles/:key      # 获取栏目文章列表（列表类型）
POST /cms/about/section          # 创建/更新栏目内容
POST /cms/about/article          # 创建/更新栏目文章
```

##### 文章列表接口（通用）
```
GET /cms/article/list?categoryCode=news&pageNum=1&pageSize=10
```

##### 专题接口
```
GET /cms/special/list            # 获取专题列表
GET /cms/special/:id            # 获取专题详情
GET /cms/special/:id/categories  # 获取专题栏目列表
GET /cms/special/:id/articles?categoryId=1  # 获取专题下的文章列表
POST /cms/special                # 创建专题
PUT /cms/special                # 更新专题
DELETE /cms/special/:id          # 删除专题
POST /cms/special/category       # 创建专题栏目
PUT /cms/special/category       # 更新专题栏目
DELETE /cms/special/category/:id # 删除专题栏目
POST /cms/special/article        # 添加文章到专题
DELETE /cms/special/article/:id  # 从专题移除文章
```

##### 导航管理接口
```
GET /cms/navigation/list         # 获取导航列表
GET /cms/navigation/:id         # 获取导航详情
POST /cms/navigation             # 创建导航
PUT /cms/navigation             # 更新导航
DELETE /cms/navigation/:id       # 删除导航
```

### 方案二：简化方案（快速实现）

#### 3.5 简化设计

如果时间紧迫，可以采用以下简化方案：

1. **协会概况**：保持现有 cms_about_section 和 cms_about_article 表不变
2. **文章列表**：所有文章列表都使用 cms_article 表，通过 category_code 区分
3. **专题**：保持现有 cms_special 和 cms_special_article 表不变，栏目使用 cms_category 表
4. **导航管理**：暂时不实现，保持硬编码

#### 3.6 初始化数据

```sql
-- 初始化分类数据
INSERT INTO `cms_category` (`category_name`, `category_code`, `parent_id`, `sort_order`, `status`) VALUES
('要闻动态', 'news', 0, 1, '1'),
('党建工作', 'party', 0, 2, '1'),
('品牌活动', 'activities', 0, 3, '1'),
('表彰激励', 'awards', 0, 4, '1'),
('公告公示', 'notice', 0, 5, '1'),
('全国联动', 'cooperation', 0, 6, '1');

-- 初始化协会概况栏目
INSERT INTO `cms_about_section` (`section_key`, `section_name`, `section_type`, `sort_order`, `status`) VALUES
('overview', '协会概况', 'richText', 1, '1'),
('charter', '协会章程', 'richText', 2, '1'),
('leadership', '协会领导', 'richText', 3, '1'),
('council', '理事会', 'list', 4, '1'),
('regulations', '会员工作条例', 'richText', 5, '1');
```

## 四、推荐实施步骤

### 阶段一：基础功能（优先级：高）
1. 创建 cms_category 初始化数据
2. 创建 cms_about_section 初始化数据
3. 实现协会概况管理接口
4. 实现文章列表管理接口（要闻动态、党建工作、品牌活动、表彰激励、公告公示、全国联动）

### 阶段二：专题功能（优先级：中）
1. 创建 cms_special_category 表
2. 修改 cms_special_article 表，添加 category_id 字段
3. 实现专题管理接口
4. 实现专题栏目管理接口
5. 实现专题文章管理接口

### 阶段三：导航管理（优先级：低）
1. 创建 cms_navigation 表
2. 实现导航管理接口
3. 修改门户网站导航，从接口获取

## 五、后台菜单调整建议

### 内容管理菜单结构

```
内容管理
├── 协会概况
├── 要闻动态
├── 党建工作
├── 品牌活动
├── 表彰激励
├── 公告公示
├── 专题
│   ├── 专题列表
│   └── 专题文章
├── 全国联动
├── 网站导航
├── 文章分类
├── 轮播图管理
├── 焦点图管理
├── 友情链接
├── 快捷链接
├── 单页管理
└── 网站配置
```

## 六、总结

### 推荐方案：方案一

**优点：**
1. 灵活性高，可以动态管理导航
2. 专题功能完善，支持栏目筛选
3. 数据结构清晰，易于扩展
4. 符合 CMS 系统的设计理念

**缺点：**
1. 需要新增表和修改现有表
2. 开发工作量较大

### 备选方案：方案二

**优点：**
1. 实现快速，改动最小
2. 可以快速上线

**缺点：**
1. 灵活性差，导航无法动态管理
2. 专题功能受限

### 建议

如果时间允许，建议采用**方案一**，完整实现所有功能。如果时间紧迫，可以先实现**方案二**，后续再逐步完善。
