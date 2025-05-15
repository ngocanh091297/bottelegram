const axios = require('axios');
const crypto = require('crypto');

// Tạo MD5
function md5_Info(data, uppercase = true) {
    const hash = crypto.createHash('md5').update(data, 'utf8').digest('hex');
    return uppercase ? hash.toUpperCase() : hash.toLowerCase();
}

// TODO: Cần cài đặt thuật toán chữ ký chính xác
function getSignature(body, verifyPwd = null) {
    // Cài đặt thuật toán chữ ký theo yêu cầu
    return ""; // Tạm thời trả về chuỗi rỗng
}

// Tạo chuỗi ngẫu nhiên
function getRandomStr(k = 32) {
    const chars = '0123456789abcdef';
    let result = '';
    for (let i = 0; i < k; i++) {
        result += chars[Math.floor(Math.random() * chars.length)];
    }
    return result;
}

// Lấy timestamp
function get_time() {
    return Math.floor(Date.now() / 1000);
}

// Lấy token đăng nhập
async function GetLoginToken(session, url, username, password, VerifyPwd) {
    const timestamp = get_time();
    const randomStr = getRandomStr(32);

    const body = {
        username: username,
        pwd: password,
        verifyPwd: md5_Info(username + password + randomStr + timestamp + VerifyPwd, false),
        signature: "",
        timestamp: timestamp,
        random: randomStr
    };

    body.signature = getSignature(body);

    try {
        const resp = await session.post(url + "GetLoginToken", body);
        if (resp.status === 200) {
            const data = resp.data;
            const token = data?.data?.token;
            if (token && data.msg === "Succeed") {
                console.log(`Người dùng ${username} đăng nhập thành công`);
                return token;
            } else {
                console.error(`Người dùng ${username} đăng nhập thất bại: ${data.msg || 'Lỗi không xác định'}`);
            }
        }
    } catch (error) {
        console.error(`Yêu cầu đăng nhập thất bại:`, error.message);
    }
    return null;
}

// Lấy số dư
async function GetBalance(session, url, token) {
    const body = {
        language: 0,
        timestamp: get_time(),
        random: getRandomStr(32),
        signature: ""
    };

    body.signature = getSignature(body);

    const headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        'Authorization': 'Bearer ' + token
    };

    try {
        const resp = await session.post(url + "GetBalanceByArGame", body, { headers });
        if (resp.status === 200) {
            const data = resp.data;
            const balance = data?.data?.balance;
            if (data.code === 0) {
                console.log(`Lấy số dư thành công: ${balance}`);
                return balance;
            }
        }
        console.error(`Không thể lấy được số dư, mã trạng thái: ${resp.status}`);
    } catch (error) {
        console.error("Lỗi khi lấy số dư:", error.message);
    }
    return null;
}

// Main
(async () => {
    const url = "https://82vn82vnapi.com/api/webapi/";
    const username = "8496525987";
    const password = "82vnvip39";
    const VerifyPwd = "Lottery9527";

    const session = axios.create();

    const token = await GetLoginToken(session, url, username, password, VerifyPwd);
    if (token) {
        const balance = await GetBalance(session, url, token);
        if (balance !== null) {
            console.log(`Tài khoản ${username} có số dư: ${balance}`);
        }
    }
})();
