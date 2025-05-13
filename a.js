const axios = require('axios');
const crypto = require('crypto');

function md5Info(data, uppercase = true) {
  const hash = crypto.createHash('md5').update(data, 'utf8').digest('hex');
  return uppercase ? hash.toUpperCase() : hash.toLowerCase();
}

function getRandomStr(k = 32) {
  const chars = '0123456789abcdef';
  let result = '';
  for (let i = 0; i < k; i++) {
    result += chars.charAt(Math.floor(Math.random() * chars.length));
  }
  return result;
}

function getTime() {
  return Math.floor(Date.now() / 1000);
}

function getSignature(body, verifyPwd = null) {
  // Chưa có thuật toán rõ ràng để tính signature => placeholder
  // Cần implement đúng dựa vào backend API server yêu cầu
  return '';
}

async function getLoginToken(session, url, username, password, verifyPwd) {
  const timestamp = getTime();
  const randomStr = getRandomStr(32);
  const body = {
    username: username,
    pwd: password,
    verifyPwd: '',
    signature: '',
    timestamp: timestamp,
    random: randomStr
  };

  body.verifyPwd = md5Info(username + password + randomStr + timestamp + verifyPwd, false);
  body.signature = getSignature(body);

  try {
    const response = await session.post(url + 'GetLoginToken', body);
    const data = response.data;

    if (data.msg === 'Succeed') {
      const token = data.data?.token;
      console.info(`Người dùng ${username} đăng nhập thành công`);
      return token;
    } else {
      console.error(`Người dùng ${username} đăng nhập thất bại: ${data.msg}`);
    }
  } catch (error) {
    console.error(`Lỗi yêu cầu đăng nhập: ${error}`);
  }
  return null;
}

async function getBalance(session, url, token) {
  const body = {
    language: 0,
    timestamp: getTime(),
    random: getRandomStr(32),
    signature: ''
  };

  body.signature = getSignature(body);

  const headers = {
    'content-type': 'application/json;charset=UTF-8',
    'authorization': 'Bearer ' + token
  };

  try {
    const response = await session.post(url + 'GetBalanceByArGame', body, { headers });
    const data = response.data;
    if (data.code === 0) {
      console.info(`Lấy số dư thành công: ${data.data?.balance}`);
      return data.data?.balance;
    } else {
      console.error(`Không thể lấy được số dư: ${data.msg}`);
    }
  } catch (error) {
    console.error(`Lỗi yêu cầu số dư: ${error.message}`);
  }

  return null;
}

(async function main() {
  const url = 'https://82vn82vnapi.com/api/webapi/';
  const username = '8496525987';
  const password = '82vnvip39';
  const verifyPwd = 'Lottery9527';

  const session = axios.create();

  const token = await getLoginToken(session, url, username, password, verifyPwd);
  console.log('token ',token)
  if (token) {
    const balance = await getBalance(session, url, token);
    if (balance !== null) {
      console.info(`Tên người dùng ${username} số dư là: ${balance}`);
    }
  }
})();
