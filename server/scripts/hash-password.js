const bcrypt = require('bcrypt');

const password = '123456';
const salt = bcrypt.genSaltSync(10);
const hash = bcrypt.hashSync(password, salt);

console.log('密码:', password);
console.log('加密后:', hash);
