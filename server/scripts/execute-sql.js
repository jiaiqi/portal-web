const fs = require('fs');
const path = require('path');
const mysql = require('mysql2/promise');

const dbConfig = {
  host: '127.0.0.1',
  port: 3306,
  user: 'root',
  password: '12345678',
  database: 'nest_admin',
  multipleStatements: true
};

async function executeSQLFile(filePath) {
  const connection = await mysql.createConnection(dbConfig);
  
  try {
    console.log('连接数据库成功');
    
    const sql = fs.readFileSync(filePath, 'utf8');
    console.log('读取SQL文件成功');
    
    await connection.query(sql);
    console.log('SQL执行成功');
    
    const [rows] = await connection.query(`
      SELECT '测试数据添加完成！' AS message;
      SELECT COUNT(*) AS '要闻动态文章数' FROM cms_article WHERE category_id = 1;
      SELECT COUNT(*) AS '党建工作文章数' FROM cms_article WHERE category_id = 2;
      SELECT COUNT(*) AS '品牌活动文章数' FROM cms_article WHERE category_id = 3;
      SELECT COUNT(*) AS '表彰激励文章数' FROM cms_article WHERE category_id = 4;
      SELECT COUNT(*) AS '公告公示文章数' FROM cms_article WHERE category_id = 5;
      SELECT COUNT(*) AS '专题文章数' FROM cms_article WHERE category_id = 6;
      SELECT COUNT(*) AS '全国联动文章数' FROM cms_article WHERE category_id = 7;
    `);
    
    console.log('\n数据统计：');
    rows.forEach(result => {
      if (Array.isArray(result)) {
        result.forEach(row => {
          const key = Object.keys(row)[0];
          console.log(`${key}: ${row[key]}`);
        });
      }
    });
    
  } catch (error) {
    console.error('执行SQL失败:', error.message);
    throw error;
  } finally {
    await connection.end();
    console.log('\n数据库连接已关闭');
  }
}

const sqlFilePath = path.join(__dirname, '../db/add_test_data.sql');
executeSQLFile(sqlFilePath).catch(console.error);
