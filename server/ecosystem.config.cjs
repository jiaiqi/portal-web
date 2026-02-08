module.exports = {
  apps: [
    {
      name: 'cms_admin_server',
      namespace: 'cms_admin_server',
      max_memory_restart: '1024M',
      user: 'www',
      exec_mode: 'fork',
      cwd: '/www/wwwroot/cms-admin-server',
      script: 'dist/main.js',
      args: '',
      watch: false,
      out_file: '/www/wwwlogs/pm2/cms_admin_server/out.log',
      error_file: '/www/wwwlogs/pm2/cms_admin_server/err.log',
      log_date_format: 'YYYY-MM-DD HH:mm:ss',
      merge_logs: true,
      env: {
        // 环境变量
        NODE_ENV: 'production',
      },
    },
  ],
};
