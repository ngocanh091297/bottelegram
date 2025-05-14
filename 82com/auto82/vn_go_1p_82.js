const db = require('../db/db');
const axios = require('axios')
axios.defaults.timeout = 10000;
var randomstring = require("randomstring");
const json = require('../../json_82')
let table = "users_telegram_vngo"
const md5 = require('md5');
const userAgent = 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36';
let first_time = false;
let data_bet = {

}


let bonhotam = {

}
let data_loi_nhuan = {

}

let data_tong_tien_cuoc = {
}
let so_du_hien_tai = {

}
let so_du_ban_dau = {

}

let chienluocvon_index = 0
let phien_thu = []

async function guigaytoicacuser(len, bot) {
    let list = await db(table).select("*").where('doigay', 'on').andWhere("vngo1", 1)
    await db(table).update('doigay', 'off').where('doigay', 'on').andWhere("vngo1", 1)
    for (let el of list) {
        bot.sendMessage(el.chatId, `🔂 Tín hiệu đã gãy VN-GO  1 phút, bắt đầu copy tín hiệu
Entry: 0
Len: ${len}`)
        await delay(300)
    }
}
const moment = require('moment-timezone');
function getCurrentTime() {
    const now = new Date();

    // Lấy giờ và phút
    const currentTimeHanoi = moment().tz('Asia/Ho_Chi_Minh').format('HH:mm');

    return currentTimeHanoi;
}
async function tonghopphien(data_copy, gay, tim_kiem, tinhieu, bot) {
    try {
        let list = await db("lichsu_ma_group").select('*').where("session", tim_kiem.session)
        let lo = 0
        let lai = 0
        for (let item of list) {

            if (item.dudoan == item.xoso) {
                lai = lai + item.betcount
            } else {
                lo = lo + item.betcount
            }
        }
        let currentTime = getCurrentTime();

        await db("lichsu_tong_hop").insert({
            group_id: data_copy.id_group,
            sophien: list.length,
            lo: lo,
            lai: lai,
            session: tim_kiem.session,
            type: "vngo1",
            "currentTime": currentTime
        })
        let sophien = data_copy.sophien ? data_copy.sophien : 50;
        let result = await db("lichsu_tong_hop").select('*')
            .where('group_id', data_copy.id_group).andWhere("type", "vngo1")
            .orderBy('id', 'desc')
            .paginate({ perPage: sophien, currentPage: 1 });
        let list_send = result.data
        let total = result.pagination.total

        let text = `❇️ 𝐓𝐡ố𝐧𝐠 𝐤ê ${list_send.length} 𝐩𝐡𝐢ê𝐧 𝐠ầ𝐧 𝐧𝐡ấ𝐭  ....
    
`;
        let sophien_ban_dau = total - list_send.length + 1
        for (let item of list_send.reverse()) {

            let soduong = Math.round((item.lai * 0.96 - item.lo) * 100) / 100

            text = text + `🕗 ${item.currentTime}: Phiên ${sophien_ban_dau} -${soduong > 0 ? " -THẮNG 🟢" : "THUA 🟡"}  ${soduong}\n`
            sophien_ban_dau = sophien_ban_dau + 1
        }

        text = text + `
    
    ${data_copy.datatext}`

        bot.sendMessage(data_copy.id_group, text, {
            parse_mode: "HTML"
        })
    } catch (e) {
        console.log('tonghopphien err : ', e)
    }

}
function rs(input) {
    // Thực hiện logic để tạo chữ ký từ chuỗi đầu vào
    // (Thông tin chi tiết không được cung cấp)
    // ...
    const md5Hash = md5(input);
    // Giả sử return một giá trị chữ ký
    const signature = md5Hash.toUpperCase().slice(0, 32);

    // Trả về chữ ký đã tạo\

    return signature;
}

function getsignature(data) {
    let data_filter = {}
    const c = ["signature", "track", "xosoBettingData", "timestamp"];
    for (let el of Object.keys(data).sort()) {
        if (data_filter[el] !== null && data_filter[el] !== "" && !c.includes(el)) {

            data_filter[el] = data[el]
        }
    }
    let sigture = rs(JSON.stringify(data_filter));
    return sigture

}
function It() {
    // Thực hiện logic để tạo giá trị ngẫu nhiên
    // (Thông tin chi tiết không được cung cấp)
    // ...

    // Giả sử return một giá trị ngẫu nhiên
    return "xxxxxxxxxxxx4xxxyxxxxxxxxxxxxxxx".replace(/[xy]/g, function (c) {
        var r = Math.random() * 16 | 0,
            v = c === "x" ? r : (r & 3 | 8); // r & 3 | 8 ensures that the character is one of "8", "9", "a", or "b"
        return v.toString(16);
    });
}
function getTime_now() {
    const currentTime = new Date();

    // Thêm 7 giờ (7 * 60 * 60 * 1000 milliseconds) để có múi giờ +7
    const adjustedTime = new Date(currentTime.getTime() + 7 * 60 * 60 * 1000);

    // Lấy timestamp từ đối tượng Date
    const timestamp = Math.floor(adjustedTime.getTime() / 1000);
    return timestamp
}
let token = "";
let refreshToken = ""
async function getToken() {

    if (refreshToken) {
        let body = {
            language: 2,
            random: It(),
            timestamp: getTime_now()
        }
        let signature = getsignature(body)
        body.signature = signature
        let newtoken = await axios.post("https://82vn82vnapi.com/api/webapi/RefreshToken", body, {
            headers: {
                'content-type': 'application/json;charset=UTF-8',
                'Authorization': `Bearer ${refreshToken}`,
                'User-Agent': userAgent
            },
        }).catch(e => {
            console.log('dnahnhhaha vngo')
        })
        if (newtoken && newtoken.data && newtoken.data.data && newtoken.data.data.token) {
            await db("taikhoan_he_thong").update('token', newtoken.data.data.token)
        } else {
            //  đăng nhập lại
            let body = {
                username: "0967745536",
                pwd: "hoanganh123",
                phonetype: -1,
                language: 2,
                random: It(),
                timestamp: getTime_now(),
                logintype: "email",


            }
            let signature = getsignature(body)
            body.signature = signature
            let user = await axios({
                method: 'post',
                url: 'https://82vn82vnapi.com/api/webapi/Login',
                data: body,
                headers: {
                    'content-type': 'application/json;charset=UTF-8',
                    'User-Agent': userAgent
                },
            })
            if (user && user.data && user.data.code == 0 && user.data.data.token) {
                await db("taikhoan_he_thong").update({
                    'token': user.data.data.token,
                    "refreshToken": user.data.data.refreshToken
                })
            }

        }
    }

}
async function test(bot) {
    let timeout = 60000

    try {

        let tk = await db('taikhoan_he_thong').select('*').first()
        if (tk) {
            token = tk.token
            refreshToken = tk.refreshToken
        } else {
            timeout = 60000
        }

        let body = {
            typeId: 1,
            language: 2,
            random: It(),
            timestamp: getTime_now(),

        }
        let signature = getsignature(body)
        body.signature = signature

        let data = await axios.post("https://82vn82vnapi.com/api/webapi/GetGameIssue", body, {
            headers: {
                'content-type': 'application/json;charset=UTF-8',
                'Authorization': `Bearer ${token}`,
                'User-Agent': userAgent
            },

        })
  console.log('aa ',data.data)
        if (data.data && data.data.code == 0) {
            let datalist = data.data.data


            // runAtFutureTime(data_1phut.EndTime, data_1phut.ServiceTime, data_1phut.IssueNumber, bot);

            let time = datalist.startTime
            let timestamp_start = new Date(time).getTime();

            let EndTime = timestamp_start + 60000
            let ServiceTime = new Date(datalist.serviceTime).getTime();


            const timeToWait = EndTime - ServiceTime;

            if (timeToWait > 4000) {
                //  gọi hàm đặt cược
                 console.log('akkaka ',timeToWait,datalist)

                await check_dk(datalist.issueNumber, bot)
            }
            if (timeToWait > 0) {

                // Sử dụng setTimeout để đợi đến thời gian cụ thể
                timeout = timeToWait + 3000

            } else {
                // Nếu timestamp đã qua, bạn có thể xử lý ở đây nếu cần
                timeout = 1000
            }
        } else {
            if (data.data && data.data.code == 4 && data.data.msg == "No operation permission") {
                getToken()
                timeout = 5000
            } else {
                timeout = 60000
            }


        }
    } catch (error) {
        if (error && error.response && error.response.data && error.response.data.msg == "No operation permission") {
            getToken()
        }
        timeout = 5000

    }
    first_time = true
    setTimeout(function () {
        test(bot)
    }, timeout);

}


async function guitinnhantunggroup(gameslist, bot, total, issuenumber) {
    try {
        let list_thang_da_chon = await db("lichsu_ma_group")
            .select('*').where('status', 0)
            .andWhere("type", "1phut")
            .andWhere("name", "vngo")
            .andWhere("xoso", "NONE")
        // .andWhere('issuenumber', IssueNumber_old)


        let update = false
        for (let item of list_thang_da_chon) {
            let gan_nhat = gameslist.filter(e => e.issueNumber == item.issuenumber)
            if (gan_nhat && gan_nhat.length > 0) {
                let Number_one = parseInt(gan_nhat[0].number)
                let ketqua = Number_one > 4 ? "H" : 'L'
                if (update == false) {
                    if (list_thang_da_chon.filter(e => e.issuenumber == gan_nhat[0].issueNumber).length == list_thang_da_chon.length) {
                        await db('lichsu_ma_group').update({
                            "xoso": ketqua,
                            status: 1
                        }).where("type", "1phut")
                            .andWhere("name", "vngo")
                            .andWhere('issuenumber', gan_nhat[0].issueNumber)
                        update = true
                    } else {
                        await db('lichsu_ma_group').update({
                            "xoso": ketqua,
                            status: 1
                        }).where("type", "1phut")
                            .andWhere("name", "vngo")
                            .andWhere('issuenumber', gan_nhat[0].issueNumber)
                    }
                    await delay(500)
                }
                let data_copy = await db("copytinhieu_vngo").select("*").where('start', 1).andWhere("type", "1").andWhere("id_group", item.group_id).first()
                if (!data_copy) {
                    continue
                }
                let chienluocvon = JSON.parse(data_copy.chienlucvon)


                if (item.dudoan == ketqua) {
                    //  gửi tin nhắn thắng
                    bot.sendMessage(item.group_id, "🔊 🟢 THẮNG")

                    await tonghopphien(data_copy, true, item, chienluocvon.length, bot)
                    await delay(500)
                } else {
                    //  gửi tin nhắn thua
                    // (chienluocvon.length - 1)
                    // if (data_copy.status == 1) {
                    //     guigaytoicacuser(chienluocvon.length, bot)
                    // }
                    bot.sendMessage(item.group_id, "🔊 🟡 THUA")
                    if (item.chienluocvon_index >= (chienluocvon.length - 1)) {
                        await delay(500)
                        await tonghopphien(data_copy, true, item, chienluocvon.length, bot)
                        //  gãy rồi
                        if (data_copy.status == 1) {
                            guigaytoicacuser(chienluocvon.length, bot)
                        }
                    }
                }
            }
        }
        await delay(2000)
        let check_curent = await db("lichsu_ma_group").select('*')
            .where("issuenumber", issuenumber)
            .andWhere("type", "1phut")
            .andWhere("name", "vngo")
            .first()
        if (check_curent) {
            return
        }

        let list = await db("copytinhieu_vngo").select("*").where('start', 1).andWhere("type", "1")
        for (let data_copy of list) {
            let dudoan = ""
            let dk_trung = ""

            if (data_copy && data_copy.chienluocdata) {
                let check_dk = JSON.parse(data_copy.chienluocdata)

                for (let element of check_dk) {
                    // 3L_N  2L2N_N
                    let check = element.slice(0, element.length - 2);

                    let check2 = total.slice(0, check.length);

                    if (check === check2) {
                        //  đúng dk
                        // vào lệnh
                        let last = element.slice(element.length - 1, element.length)
                        if (last == "N") {
                            //  nhỏ
                            dudoan = 'L'
                        } else {
                            // lớn
                            dudoan = "H"
                        }
                        dk_trung = check
                        // "issuenumber": issuenumber,
                        // "dudoan": dudoan,
                        // "ketqua": "NONE",
                        // "dieukien": data_copy.chienluocdata,
                        // "dk_trung": dk_trung,
                        // "xoso": false,// false , "small";"big"
                        // "betcount": value_bet_coppy //   betcount: Mat
                        let tim_kiem = await db('lichsu_ma_group').select('*')
                            .where('group_id', data_copy.id_group)
                            .andWhere("type", "1phut")
                            .andWhere("name", "vngo")
                            .andWhere("status", "1")
                            .orderBy('id', 'desc')
                            .first()
                        let chienluocvon_index = 0
                        let session_moi
                        let chienluocvon = JSON.parse(data_copy.chienlucvon)

                        if (tim_kiem && tim_kiem.dudoan) {
                            if (tim_kiem.dudoan == tim_kiem.xoso) {
                                //  ket quả đúng r
                                //   reset sesion
                                session_moi = randomstring.generate({
                                    length: 12,
                                    charset: 'alphabetic'
                                });
                                chienluocvon_index = 0

                            } else {
                                //  cộng thêm
                                let old_index = tim_kiem.chienluocvon_index
                                if (old_index >= (chienluocvon.length - 1)) {
                                    //  gãy rồi
                                    session_moi = randomstring.generate({
                                        length: 12,
                                        charset: 'alphabetic'
                                    });
                                    chienluocvon_index = 0
                                } else {
                                    session_moi = tim_kiem.session
                                    chienluocvon_index = old_index + 1
                                }
                            }

                        } else {

                            session_moi = randomstring.generate({
                                length: 12,
                                charset: 'alphabetic'
                            });
                        }

                        let dai = dudoan == 'H' ? "LỚN" : "NHỎ"
                        bot.sendMessage(data_copy.id_group, `🧏‍♀  ${dai} ${Math.round(parseInt(chienluocvon[chienluocvon_index]))}!
Kỳ xổ (${issuenumber})`)
                        await db("lichsu_ma_group").insert({
                            "issuenumber": issuenumber,
                            type: "1phut",
                            "dudoan": dudoan,
                            group_id: data_copy.id_group,
                            "ketqua": "NONE",
                            "dk_trung": check,
                            "xoso": "NONE",
                            "chienluocvon_index": chienluocvon_index,
                            "betcount": Math.round(parseInt(chienluocvon[chienluocvon_index])),
                            name: "vngo",
                            session: session_moi,
                            status: 0

                        })
                        break
                    }
                    //   9359237.64 :9359237.64 9349237.64
                }
                await delay(1000)


            }
        }

    } catch (e) {
        console.log("gui tn group ", e)

    }


}

async function check_dk(issuenumber, bot) {

    try {
        let list = []
        let body = {
            language: 2,
            pageNo: 1,
            pageSize: 10,
            random: It(),

            timestamp: getTime_now(),
            typeId: 1
        }
        let signature = getsignature(body)
        body.signature = signature

        let list_lich_su = await axios.post("https://82vn82vnapi.com/api/webapi/GetNoaverageEmerdList", body, {
            headers: {
                'content-type': 'application/json;charset=UTF-8',
                'Authorization': `Bearer ${token}`,
                'User-Agent': userAgent
            },
        })


        if (list_lich_su.data && list_lich_su.data.data && list_lich_su.data.code == 0) {
            let gameslist = list_lich_su.data.data.list;
            //  ["3L_N","3N_L"]


            let total = await xacdinhlichsu(gameslist, bot)
            guitinnhantunggroup(gameslist, bot, total, issuenumber)
            let trybonhotam = await db('bonhotam').select('*').where('issuenumber', issuenumber).andWhere('type', "vngo1").andWhere("status", 1).first()
            if (trybonhotam) {
                return
            }

            list = await db(table).select("*")
                .where("status", 1)
                .andWhere('chienluoc_id', '<>', 0)
                .andWhere("vngo1", 1)
                .andWhere("chienluocdata", "<>", "NONE")
                .andWhere("chienluoc", "<>", "NONE")
                .andWhere("activeacc", 1)
            //  .where('status_trade', 1)

            let list2 = await db(table).select("*")
                .where("status", 1)
                .andWhere('coppy', "on")
                .andWhere("doigay", "off")
                .andWhere("vngo1", 1)
                .andWhere("chienluoc", "<>", "NONE")
                .andWhere("chienluocdata", "NONE")
                .andWhere("activeacc", 1)

            let data_copy = await db('copytinhieu_vngo').select('*').where('status', 1).andWhere("type", "1").first()
            if (data_copy) {
                let list_copy = list2.map(e => {
                    e.chienluoc_id = 100
                    e.chienluocdata = data_copy.chienluocdata
                    e.chienluocdata_goc = data_copy.chienluocdata_goc
                    e.copystatus = true
                    return e
                })
                list = list.concat(list_copy)
            }



            await delay(1000)
           
            for (let item of list) {

                let json = JSON.parse(item.chienluocdata)

                for (let element of json) {
                    // 3L_N  2L2N_N
                    let check = element.slice(0, element.length - 2);

                    let check2 = total.slice(0, check.length);

                    if (check === check2) {
                        //  đúng dk
                        // vào lệnh
                    
                        await vaolenhtaikhoan(item, element, issuenumber, bot)
                        break
                    }
                    //   9359237.64 :9359237.64 9349237.64
                }

            }


        }

        let arr = Object.keys(data_loi_nhuan)
        let list_user = list.map(e => e.usersname)
        for (let el of arr) {
            if (list_user.includes(el)) {

            } else {
                delete data_loi_nhuan[el]
                delete data_bet[el]
                delete data_tong_tien_cuoc[el]
            }
        }
    } catch (e) {
        console.log('loi vao lenh ', e)
    }
    if (bonhotam[issuenumber] && bonhotam[issuenumber].length > 0) {
        await db("bonhotam").insert({
            issuenumber: issuenumber,
            type: "vngo1",
            data: JSON.stringify(bonhotam[issuenumber]),
            status: 1
        })
    }


}
//  status
//  1 là đang hoạt động
//  2 là user tele đó đã đăng nhập nick khác
//  3 là 1 user tele đã đăng nhập . bị đá ra
// status_trade
// 0 chưa hoạt động
//  1 đã chọn ct
//  2L1N

exports.runbot = async function (bot) {
    // https://82vn82vnapi.com/api/webapi/GetGameIssueList
    //     type: 1
    // language: vi
    test(bot)

}
async function getInfor(token, refreshToken, username) {
    let status = {
        status: false,
        error: 0
    }

    try {
        let body = {
            language: 2,
            random: It(),
            timestamp: getTime_now()
        }
        let signature = getsignature(body)
        body.signature = signature
        let newtoken = await axios.post("https://82vn82vnapi.com/api/webapi/RefreshToken", body, {
            headers: {
                'content-type': 'application/json;charset=UTF-8',
                'Authorization': `Bearer ${refreshToken}`,
                'User-Agent': userAgent
            },
        }).catch(async error => {
            console.log('resfres token ', error.response)
            if (error && error.response && error.response.data && error.response.data.msg == "No operation permission") {
                //  đăng nhập lại
                console.log('đăng nhập lại')
                let tk = await db("taikhoan_bdg").where('username', username).first()
                if (tk) {
                    let body = {
                        username: tk.username,
                        pwd: tk.pass,
                        phonetype: -1,
                        language: 2,
                        random: It(),
                        timestamp: getTime_now(),
                        logintype: tk.username.startsWith("84") ? "mobile" : "email",
                    }
                    let signature = getsignature(body)
                    body.signature = signature
                    let user = await axios({
                        method: 'post',
                        url: 'https://82vn82vnapi.com/api/webapi/Login',
                        data: body,
                        headers: {
                            'content-type': 'application/json;charset=UTF-8',
                            'User-Agent': userAgent
                        },
                    })

                    if (user && user.data && user.data.code == 0 && user.data.data.token) {
                        console.log('đăng nhập lại thanh công ', user.data)
                        await db("taikhoan_bdg").update({
                            "token": user.data.data.token,
                            "refreshToken": user.data.data.refreshToken,
                        }).where("id", tk.id)
                        await db("users_telegram_d5go").update({
                            'Sign': user.data.data.token,
                            "refreshToken": user.data.data.refreshToken
                        }).where('usersname', username)
                        await db("users_telegram_vngo").update({
                            'Sign': user.data.data.token,
                            "refreshToken": user.data.data.refreshToken
                        }).where('usersname', username)
                        await db("users_telegram_trxhash").update({
                            'Sign': user.data.data.token,
                            "refreshToken": user.data.data.refreshToken
                        }).where('usersname', username)
                        await db("users_telegram_k3go").update({
                            'Sign': user.data.data.token,
                            "refreshToken": user.data.data.refreshToken
                        }).where('usersname', username)
                        status = {
                            status: true,
                            error: 1
                        }
                    }
                }

            }
        });
        console.log('check newtoken ', newtoken.data)

        if (newtoken && newtoken.data && newtoken.data.data && newtoken.data.data.token) {

            await db("taikhoan_bdg").update({
                'token': newtoken.data.data.token,
            }).where('username', username)
            await db("users_telegram_d5go").update('Sign', newtoken.data.data.token).where('usersname', username)
            await db("users_telegram_vngo").update('Sign', newtoken.data.data.token).where('usersname', username)
            await db("users_telegram_trxhash").update('Sign', newtoken.data.data.token).where('usersname', username)
            await db("users_telegram_k3go").update('Sign', newtoken.data.data.token).where('usersname', username)
            let body = {
                language: 2,
                random: It(),
                timestamp: getTime_now()
            }
            let signature = getsignature(body)
            body.signature = signature
            // let amount = await axios.post("https://82vn82vnapi.com/api/webapi/GetUserInfo", body, {
            //     headers: {
            //         'content-type': 'application/json;charset=UTF-8',
            //         'Authorization': `Bearer ${newtoken.data.data.token}`,
            //         'User-Agent': userAgent
            //     },
            // })
            console.log('check newtoken thành công')
            status = {
                status: true,
                error: 0
            }

        } else {
            if (newtoken && newtoken.data && newtoken.data.code == 12 && newtoken.data.msg == "Your account is already logged in elsewhere") {
                console.log('đăng nhập lại 2')
                let tk = await db("taikhoan_bdg").where('username', username).first()
                if (tk) {
                    let body = {
                        username: tk.username,
                        pwd: tk.pass,
                        phonetype: -1,
                        language: 2,
                        random: It(),
                        timestamp: getTime_now(),
                        logintype: tk.username.startsWith("84") ? "mobile" : "email",
                    }
                    let signature = getsignature(body)
                    body.signature = signature
                    let user = await axios({
                        method: 'post',
                        url: 'https://82vn82vnapi.com/api/webapi/Login',
                        data: body,
                        headers: {
                            'content-type': 'application/json;charset=UTF-8',
                            'User-Agent': userAgent
                        },
                    })

                    if (user && user.data && user.data.code == 0 && user.data.data.token) {

                        console.log('đăng nhập lại thanh công 2', user.data)
                        await db("taikhoan_bdg").update({
                            "token": user.data.data.token,
                            "refreshToken": user.data.data.refreshToken,
                        }).where("id", tk.id)
                        await db("users_telegram_d5go").update({
                            'Sign': user.data.data.token,
                            "refreshToken": user.data.data.refreshToken
                        }).where('usersname', username)
                        await db("users_telegram_vngo").update({
                            'Sign': user.data.data.token,
                            "refreshToken": user.data.data.refreshToken
                        }).where('usersname', username)
                        await db("users_telegram_trxhash").update({
                            'Sign': user.data.data.token,
                            "refreshToken": user.data.data.refreshToken
                        }).where('usersname', username)
                        await db("users_telegram_k3go").update({
                            'Sign': user.data.data.token,
                            "refreshToken": user.data.data.refreshToken
                        }).where('usersname', username)
                        status = {
                            status: true,
                            error: 1
                        }
                    }
                }
            }
            if (!status.status) {
                status = {
                    status: false,
                    error: 1
                }
            }

        }

    } catch (error) {
        console.log('loi check freshtoken')
        status = {
            status: true,
            error: 2
        }

    }
    return status

}
async function dangnhaplaitk(user, bot, chatId) {
    let body = {
        language: 2,
        random: It(),
        timestamp: getTime_now()
    }
    let signature = getsignature(body)
    body.signature = signature
    let newtoken = await axios.post("https://82vn82vnapi.com/api/webapi/RefreshToken", body, {
        headers: {
            'content-type': 'application/json;charset=UTF-8',
            'Authorization': `Bearer ${user.refreshToken}`,
            'User-Agent': userAgent
        },
    }).catch(async error => { })
    if (newtoken && newtoken.data && newtoken.data.data && newtoken.data.data.token) {
        await db(table).update('Sign', newtoken.data.data.token).where('id', user.id)

    } else {
        //  đăng nhập lại
        let body = {
            username: user.usersname,
            pwd: user.pass,
            phonetype: -1,
            language: 2,
            random: It(),
            timestamp: getTime_now(),
            logintype: user.usersname.startsWith("84") ? "mobile" : "email",
        }
        let signature = getsignature(body)
        body.signature = signature
        let user3 = await axios({
            method: 'post',
            url: 'https://82vn82vnapi.com/api/webapi/Login',
            data: body,
            headers: {
                'content-type': 'application/json;charset=UTF-8',
                'User-Agent': userAgent
            },
        })
        if (user3 && user3.data && user3.data.code == 0 && user3.data.data.token) {
            await db(table).update({
                'Sign': user3.data.data.token,
                "refreshToken": user3.data.data.refreshToken
            }).where('id', user.id)
        } else {
            await db(table).update("vngo1", 0).where('id', user.id)
            bot.sendMessage(chatId, `❌ Dừng copy vì lý do: Tài khoản đã đăng xuất
            Kỳ này: ${issuenumber}`)
        }
    }


}

async function vaolenhtaikhoan(item, element, issuenumber, bot) {
    let dangnhaplai = ""
    try {
        let last = element.slice(element.length - 1, element.length)
        let chienluoc_von = item.chienluoc.split(',')
        if (!data_bet[item.usersname]) {
            data_bet[item.usersname] = 0
        }
        let body = {
            amount: 1000,
            betCount: Math.round(parseInt(chienluoc_von[data_bet[item.usersname]]) / 1000),
            gameType: 2,
            issuenumber: issuenumber,
            language: 2,
            random: It(),
            // selectType: "H",
            // signature: "7BC422BC2894CF55EC1B5056292A5D12",
            timestamp: getTime_now(),
            typeId: 1
        }
        let data = {
            uid: item.UserId,
            sign: item.Sign,
            gametype: 2,
            typeId: 1,
            language: "vi",
            amount: "1000",
            betcount: Math.round(parseInt(chienluoc_von[data_bet[item.usersname]]) / 1000),
            issuenumber: issuenumber

        }

        if (last == "N") {
            if (item.cainguoc == 'on') {
                body.selectType = 13
            } else {
                body.selectType = 14
            }

        } else {
            if (item.cainguoc == 'on') {
                body.selectType = 14
            } else {
                body.selectType = 13
            }

        }

        let result

        let signature = getsignature(body)
        body.signature = signature

        if (body.betCount >= 1) {
            console.log('body ',body)
            result = await axios.post("https://82vn82vnapi.com/api/webapi/GameBetting", body, {
                headers: {
                    'content-type': 'application/json;charset=UTF-8',
                    'Authorization': `Bearer ${item.Sign}`,
                    'User-Agent': userAgent
                },
            })

        } else {
            result = {
                data: {
                    code: 0,
                    data: [],
                    success: true,
                    msg: 'Bet success'
                }
            }
        }
        if (result.data) {

            if (result.data && result.data.msg == 'Bet success' && result.data.code == 0) {
                console.log('vào lênh thành công ', item.usersname)
                if (bonhotam[issuenumber]) {
                    body.id = item.id
                    body.token = item.Sign
                    body.refreshToken = item.refreshToken
                    body.chatId = item.tele_id
                    body.usersname = item.usersname
                    body.lodung = item.lodung
                    body.loidung = item.loidung
                    body.caidca = item.caidca
                    body.chienluoc_von = chienluoc_von
                    bonhotam[issuenumber].push(body)
                } else {
                    body.id = item.id
                    body.token = item.Sign
                    body.refreshToken = item.refreshToken
                    body.chatId = item.tele_id
                    body.usersname = item.usersname
                    body.lodung = item.lodung
                    body.loidung = item.loidung
                    body.caidca = item.caidca
                    body.chienluoc_von = chienluoc_von
                    bonhotam[issuenumber] = [body]
                }

                if (data_tong_tien_cuoc[item.usersname]) {
                    data_tong_tien_cuoc[item.usersname] = data_tong_tien_cuoc[item.usersname] + body.betCount;
                } else {
                    data_tong_tien_cuoc[item.usersname] = body.betCount;
                }

                bot.sendMessage(item.tele_id, `✅ Đã đặt cược VN-GO  1 ${body.selectType == 13 ? "Lớn" : "Nhỏ"} - ${body.betCount}000đ - Kỳ xổ ${issuenumber}`,)
            } else {
                //  đặt cược lỗi
                let msg = result.data.msg
                if (msg == "Balance is not enough") {
                    await db(table).update("vngo1", 0).where('id', item.id)
                }



            }
        }

    } catch (error) {
        if (error && error.response && error.response.data && error.response.data.msg == "No operation permission") {
            // c
            console.log('accont ', item.usersname)
            let check = await getInfor(item.Sign, item.refreshToken, item.usersname)
            console.log('ket qua ', check)
            if (!check || !check.status) {
                await db(table).update('status', 3).where('usersname', item.usersname)
                return bot.sendMessage(item.tele_id, `❌ Dừng copy vì lý do: Tài khoản đã đăng xuất
Kỳ này: ${issuenumber}`)
            }

        }
        console.log("loi vao lenh ko duoc ")
    }





}
function delay(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}
async function getsodu_hien_tai(sign) {
    try {
        let body = {
            language: 2,
            random: It(),

            timestamp: getTime_now(),
        }
        let signature = getsignature(body)
        body.signature = signature
        let result = await axios.post("https://82vn82vnapi.com/api/webapi/GetBalance", body, {
            headers: {
                'content-type': 'application/json;charset=UTF-8',
                'Authorization': `Bearer ${sign}`,
                'User-Agent': userAgent
            },
            timeout: 3000
        })

        if (result.data && result.data.data && result.data.code == 0 && result.data) {
            return {
                status: true,
                value: result.data.data.amount
            }
        } else {
            return {
                status: false,
                value: 0
            }
        }

    } catch (e) {
        console.log('eeeeee ', e)
        return {
            status: false,
            value: 0
        }
    }
}
// "Số tiền không đủ" "sign error"
async function ketqua_run_bot(ketqua, item, bot, Number_one) {
    for (let element of bonhotam[item.issueNumber]) {
        await delay(200)
        if (element.selectType == ketqua) {
            if (data_loi_nhuan[element.usersname]) {
                data_loi_nhuan[element.usersname] = data_loi_nhuan[element.usersname] + Math.round(parseInt(element.betCount) * 0.96 * 1000)
            } else {
                data_loi_nhuan[element.usersname] = Math.round(parseInt(element.betCount) * 0.96 * 1000)
            }
            //  chọn đúng
            if (element.caidca == 'thang') {
                if (data_bet[element.usersname] >= (element.chienluoc_von.length - 1)) {
                    data_bet[element.usersname] = 0
                } else {
                    data_bet[element.usersname] = data_bet[element.usersname] + 1
                }

            } else {
                data_bet[element.usersname] = 0
            }
            // let soduhientai = await getsodu_hien_tai(element.token)


            bot.sendMessage(element.chatId, `🟢 Chúc mừng bạn đã thắng ${Math.round(parseInt(element.betCount) * 0.96 * 1000)}đ VN-GO  1 kì ${element.issuenumber}
Tổng lợi nhuận: ${data_loi_nhuan[element.usersname]}đ
Tổng tiền cược:  ${data_tong_tien_cuoc[element.usersname] ? data_tong_tien_cuoc[element.usersname] + '000' : ''}đ`)
            // await db('lichsu_ma').insert({
            //     "uid": element.uid,
            //     "usersid": element.id,
            //     "gametype": element.gametype,
            //     "typeid": element.typeid,
            //     "amount": element.amount,
            //     "betcount": element.betcount,
            //     "issuenumber": element.issuenumber,
            //     "ketqua": Number_one,
            //     "selecttype": element.selecttype,
            //     "session": 1,
            //     "thang": 1
            // })
            if (element.loidung) {

                if (data_loi_nhuan[element.usersname] > element.loidung) {
                    bot.sendMessage(element.chatId, `🟢 Chúc mừng bạn đã đạt tới mức lợi nhuận kỳ vọng để dừng bot`)
                    await db(table).update("vngo1", 0).where('id', element.id)
                    delete data_loi_nhuan[element.usersname]
                    delete data_bet[element.usersname]

                }
            }

        } else {
            // kết quả sai
            // 🔴 Rất tiếc bạn đã thua 10000
            if (data_loi_nhuan[element.usersname]) {
                data_loi_nhuan[element.usersname] = data_loi_nhuan[element.usersname] - parseInt(element.betCount) * 1000
            } else {
                data_loi_nhuan[element.usersname] = -parseInt(element.betCount) * 1000
            }
            if (element.caidca == 'thua') {
                if (data_bet[element.usersname] >= (element.chienluoc_von.length - 1)) {
                    data_bet[element.usersname] = 0
                } else {
                    data_bet[element.usersname] = data_bet[element.usersname] + 1
                }

            } else {
                data_bet[element.usersname] = 0
            }

            bot.sendMessage(element.chatId, `🔴 Rất tiếc bạn đã thua ${element.betCount}000đ VN-GO  1 kì ${element.issuenumber}`)
            // await db('lichsu_ma').insert({
            //     "uid": element.uid,
            //     "usersid": element.id,
            //     "gametype": element.gametype,
            //     "typeid": element.typeid,
            //     "amount": element.amount,
            //     "betcount": element.betcount,
            //     "issuenumber": element.issuenumber,
            //     "ketqua": Number_one,
            //     "selecttype": element.selecttype,
            //     "session": 1,
            //     "thang": 0
            // })
            if (element.lodung) {
                //  -10000 100000
                if (data_loi_nhuan[element.usersname] < 0 && Math.abs(data_loi_nhuan[element.usersname]) > element.lodung) {
                    bot.sendMessage(element.chatId, `🔴 Rất tiếc bạn đã thua đến điểm dừng lỗ để dừng bot`)
                    await db(table).update("vngo1", 0).where('id', element.id)
                    delete data_loi_nhuan[element.usersname]
                    delete data_bet[element.usersname]
                }
            }

        }
    }
    delete bonhotam[item.issueNumber]
    await db("bonhotam").update('status', 0).where('issuenumber', item.issueNumber).andWhere('type', "vngo1").andWhere("status", 1)
}
async function xacdinhlichsu(gameslist, bot) {
    let total = "";

    for (let item of gameslist) {
        let Number_one = parseInt(item.number)
        if (!bonhotam[item.issueNumber]) {
            let trybonhotam = await db('bonhotam').select('*').where('issuenumber', item.issueNumber).andWhere('type', "vngo1").andWhere("status", 1).first()
            if (trybonhotam) {
                bonhotam[trybonhotam.issuenumber] = JSON.parse(trybonhotam.data)
            }
        }

        if (bonhotam[item.issueNumber] && bonhotam[item.issueNumber].length > 0) {
            let ketqua = Number_one > 4 ? 13 : 14
            await ketqua_run_bot(ketqua, item, bot, Number_one)
        }
        if (Number_one > 4) {
            //  số lớn
            total = total + "L"

        } else {
            //  số nhỏ
            total = total + "N"
        }
    }

    return total
}