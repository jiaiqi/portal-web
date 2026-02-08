# 修复 getRouters 返回空数组问题

## 问题描述

访问 `http://localhost:8888/dev-api/getRouters` 返回空数组 `[]`，导致后台管理系统无法显示菜单。

## 原因分析

`getRouters` 接口返回空数组的原因是：
1. 用户没有分配角色
2. 角色没有分配菜单权限
3. 菜单数据不存在或状态不正确

根据代码逻辑（`menu.service.ts` 第123-158行）：
- 如果用户是超级管理员（role_id=1），返回所有启用的菜单
- 如果不是超级管理员，只返回角色关联的菜单

## 解决方案

### 方案一：执行完整菜单初始化（推荐）

如果菜单数据不存在或混乱，执行完整初始化：

```bash
mysql -u root -p nest_admin < server/db/init_menu_complete.sql
```

### 方案二：修复菜单权限

如果菜单数据正常但权限关联有问题，执行权限修复：

```bash
mysql -u root -p nest_admin < server/db/fix_menu_permission.sql
```

### 方案三：手动检查和修复

#### 1. 检查用户角色

```sql
USE nest_admin;

-- 查看所有用户
SELECT user_id, user_name, nick_name, status FROM sys_user;

-- 查看用户角色关联
SELECT ur.user_id, ur.role_id, r.role_name
FROM sys_user_role ur
LEFT JOIN sys_role r ON ur.role_id = r.role_id;
```

如果用户没有角色，添加角色：

```sql
-- 为管理员用户（user_id=1）添加角色
INSERT IGNORE INTO `sys_user_role` (`user_id`, `role_id`) VALUES (1, 1), (1, 2);
```

#### 2. 检查角色菜单权限

```sql
-- 查看角色菜单关联
SELECT rm.role_id, rm.menu_id, m.menu_name
FROM sys_role_menu rm
LEFT JOIN sys_menu m ON rm.menu_id = m.menu_id
WHERE rm.role_id = 2
ORDER BY rm.menu_id;

-- 查看角色菜单关联数量
SELECT role_id, COUNT(*) as menu_count
FROM sys_role_menu
GROUP BY role_id;
```

如果角色没有菜单权限，添加权限：

```sql
-- 清空并重新插入菜单数据
DELETE FROM sys_role_menu WHERE role_id = 2;

-- 为管理员角色（role_id=2）分配所有菜单权限
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES 
(2, 1), (2, 2), (2, 3), (2, 4), 
(2, 100), (2, 101), (2, 102), (2, 103), (2, 104), (2, 105), (2, 106), (2, 107), (2, 108), (2, 109), (2, 110), (2, 111), (2, 112), (2, 113), (2, 114), (2, 115), (2, 116), (2, 117),
(2, 500), (2, 501),
(2, 1000), (2, 1001), (2, 1002), (2, 1003), (2, 1004), (2, 1005), (2, 1006),
(2, 1007), (2, 1008), (2, 1009), (2, 1010), (2, 1011),
(2, 1012), (2, 1013), (2, 1014), (2, 1015),
(2, 1016), (2, 1017), (2, 1018), (2, 1019),
(2, 1020), (2, 1021), (2, 1022), (2, 1023), (2, 1024),
(2, 1025), (2, 1026), (2, 1027), (2, 1028),
(2, 1029), (2, 1030), (2, 1031), (2, 1032), (2, 1033),
(2, 1034), (2, 1035), (2, 1036), (2, 1037),
(2, 1038), (2, 1039), (2, 1040), (2, 1041), (2, 1042), (2, 1043), (2, 1044),
(2, 1045), (2, 1046), (2, 1047), (2, 1048), (2, 1049), (2, 1050), (2, 1051), (2, 1052), (2, 1053), (2, 1054), (2, 1055), (2, 1056), (2, 1057), (2, 1058);
```

#### 3. 检查菜单数据

```sql
-- 查看所有一级菜单
SELECT menu_id, menu_name, parent_id, order_num, status, visible, menu_type
FROM sys_menu
WHERE parent_id = 0 AND del_flag = '0'
ORDER BY order_num;

-- 查看所有菜单数量
SELECT COUNT(*) as total_menus FROM sys_menu WHERE del_flag = '0';
SELECT COUNT(*) as active_menus FROM sys_menu WHERE del_flag = '0' AND status = '0';
```

如果菜单数据不完整，执行完整初始化：

```bash
mysql -u root -p nest_admin < server/db/init_menu_complete.sql
```

## 验证修复

### 1. 检查数据库

```sql
-- 检查用户角色
SELECT ur.user_id, ur.role_id, r.role_name
FROM sys_user_role ur
LEFT JOIN sys_role r ON ur.role_id = r.role_id
WHERE ur.user_id = 1;

-- 检查角色菜单
SELECT COUNT(*) as menu_count
FROM sys_role_menu
WHERE role_id = 2;

-- 检查菜单数据
SELECT COUNT(*) as menu_count
FROM sys_menu
WHERE del_flag = '0' AND status = '0';
```

### 2. 测试接口

```bash
# 登录获取 token
curl -X POST http://localhost:8080/api/login \
  -H "Content-Type: application/json" \
  -d '{"userName":"admin","password":"admin123"}'

# 使用 token 测试 getRouters 接口
curl -X GET http://localhost:8080/api/getRouters \
  -H "Authorization: Bearer YOUR_TOKEN"
```

### 3. 检查前端

1. 清除浏览器缓存
2. 重新登录后台管理系统
3. 检查菜单是否正常显示
4. 打开浏览器控制台，查看是否有错误

## 代码逻辑说明

### getRouters 接口流程

1. **main.controller.ts** (第120-124行)
   ```typescript
   @Get('/getRouters')
   getRouters(@User() user: UserDto) {
     const userId = user.user.userId.toString();
     return this.mainService.getRouters(+userId);
   }
   ```

2. **main.service.ts** (第80-83行)
   ```typescript
   async getRouters(userId: number) {
     const menus = await this.menuService.getMenuListByUserId(userId);
     return ResultData.ok(menus);
   }
   ```

3. **menu.service.ts** (第123-158行)
   ```typescript
   async getMenuListByUserId(userId: number) {
     // 获取用户角色ID
     const roleIds = await this.userService.getRoleIds([userId]);
     
     if (roleIds.includes(1)) {
       // 超管roleId=1，所有菜单权限
       menuWidthRoleList = await this.sysMenuEntityRep.find({
         where: { delFlag: '0', status: '0' },
         select: ['menuId'],
       });
     } else {
       // 查询角色绑定的菜单
       menuWidthRoleList = await this.sysRoleWithMenuEntityRep.find({
         where: { roleId: In(roleIds) },
         select: ['menuId'],
       });
     }
     
     // 菜单Id去重
     const menuIds = Uniq(menuWidthRoleList.map((item) => item.menuId));
     
     // 获取菜单列表
     const menuList = await this.sysMenuEntityRep.find({
       where: {
         delFlag: '0',
         status: '0',
         menuId: In(menuIds),
       },
       order: { orderNum: 'ASC' },
     });
     
     // 构建前端需要的菜单树
     const menuTree = buildMenus(menuList);
     return menuTree;
   }
   ```

### 关键点

1. **用户必须有角色**：`sys_user_role` 表中必须有记录
2. **角色必须有菜单权限**：`sys_role_menu` 表中必须有记录
3. **菜单必须启用**：`status = '0'` 且 `del_flag = '0'`
4. **超级管理员**：如果用户有 role_id=1，自动拥有所有菜单权限

## 常见问题

### Q: 执行 SQL 后还是返回空数组
A:
1. 检查用户是否登录
2. 检查 token 是否有效
3. 检查用户是否有角色
4. 检查角色是否有菜单权限
5. 检查菜单状态是否为启用（status='0'）

### Q: 只显示部分菜单
A:
1. 检查角色菜单关联是否完整
2. 检查菜单状态是否为启用
3. 检查菜单是否被删除（del_flag='1'）

### Q: 如何查看当前用户的菜单权限
A:
```sql
-- 查看用户角色
SELECT ur.user_id, ur.role_id, r.role_name
FROM sys_user_role ur
LEFT JOIN sys_role r ON ur.role_id = r.role_id
WHERE ur.user_id = 1;

-- 查看角色菜单
SELECT rm.role_id, rm.menu_id, m.menu_name, m.path, m.component
FROM sys_role_menu rm
LEFT JOIN sys_menu m ON rm.menu_id = m.menu_id
WHERE rm.role_id IN (SELECT role_id FROM sys_user_role WHERE user_id = 1)
ORDER BY rm.menu_id;
```

## 技术支持

如有问题，请查看：
- 后端日志：`server/logs/`
- 数据库日志：MySQL 错误日志
- API 文档：`http://localhost:8080/api/swagger-ui/`
- 前端控制台：浏览器开发者工具
