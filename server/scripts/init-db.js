const mysql = require('mysql2/promise');
const fs = require('fs');
const path = require('path');

async function initDatabase() {
  const connection = await mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: '12345678',
    database: 'nest_admin',
    port: 3306,
    multipleStatements: true
  });

  try {
    console.log('Connected to database');
    
    // Read SQL file
    const sqlFile = path.join(__dirname, '../db/cms_init.sql');
    const sql = fs.readFileSync(sqlFile, 'utf8');
    
    // Remove USE statement as we're already connected to the database
    const cleanedSql = sql.replace(/USE nest_admin;/g, '');
    
    // Execute SQL
    await connection.query(cleanedSql);
    
    console.log('Database initialized successfully!');
    
    // Verify data
    const [articleCount] = await connection.execute('SELECT COUNT(*) as count FROM cms_article');
    const [categoryCount] = await connection.execute('SELECT COUNT(*) as count FROM cms_category');
    const [focusCount] = await connection.execute('SELECT COUNT(*) as count FROM cms_focus');
    const [noticeCount] = await connection.execute('SELECT COUNT(*) as count FROM cms_notice');
    
    console.log('\nData summary:');
    console.log(`- Articles: ${articleCount[0].count}`);
    console.log(`- Categories: ${categoryCount[0].count}`);
    console.log(`- Focus images: ${focusCount[0].count}`);
    console.log(`- Notices: ${noticeCount[0].count}`);
    
  } catch (error) {
    console.error('Error initializing database:', error.message);
  } finally {
    await connection.end();
  }
}

initDatabase();
