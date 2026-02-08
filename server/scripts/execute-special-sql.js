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
    
  } catch (error) {
    console.error('执行SQL失败:', error.message);
    throw error;
  } finally {
    await connection.end();
    console.log('\n数据库连接已关闭');
  }
}

const sqlFilePath = path.join(__dirname, '../db/add_special_subcategory_data.sql');
executeSQLFile(sqlFilePath).catch(console.error);
