//6855735816:AAESodAlPPtcB7DVMDyGtjd1-mK4tgxPk1E
const TelegramBot = require('node-telegram-bot-api');


const Vn_go_1p = require("./82com/auto82/vn_go_1p_82");


const token = '8113336478:AAGqf5qO4SI1XrpI4a5w-FlrOgNbVprrKGM';
console.log(" ------------------- bắt đầu bot VN GO 82COM---------------------------")
const adminGroup = require('./82com/admingroup_82')
// Create a bot that uses 'polling' to fetch new updates
const bot = new TelegramBot(token, { polling: true });
const axios = require("axios")
const replyMarkup = {
    keyboard: [
        [
            'Bắt đầu',
            'Cài DCA Thua'
        ],
        [
            "Đăng Nhập",
            "Cài Ngược",
            "Chốt lời/lỗ"
        ],
        [
            "Chiến lược",
            "Bật copy",
            "Lịch sử"
        ],
        [
            "Cài công thức",
            "Bật đợi gãy"
        ]

    ],

};
// Listen for any kind of message. There are different kinds of
// messages.
const help = require('./82com/help82/vngohelp_82')
const Res = require("./json_82");
bot.on('channel_post', (msg) => {
    if(msg.text =='/check id'){
        bot.sendMessage(msg.chat.id, "ID group là "+msg.chat.id)
    }
  
});
bot.on('message', async (msg) => {

    let type = msg.chat?.type
    const chatId = msg.chat.id;
    const messageId = msg.message_id;
    // send a message to the chat acknowledging receipt of their message
    let text = msg.text ? msg.text : false
    if (type == 'group' || type =="supergroup") {
        if (text) {
            let check = text[0]
            if (check == '/') {
                let array = text.split("\n")
                let key_work = array[0]
                if (key_work == '/check id') {
                    return bot.sendMessage(chatId, "ID group là " + chatId, {
                        reply_to_message_id: messageId
                    })
                }
            }
            if (chatId==-1001759197056 && (check == '/' || check=="A") ) {
                
                // return adminGroup.admingroup(chatId, msg, text, bot, messageId,"users_telegram_vngo" ,"copytinhieu_vngo")
            }
        }
        return

    }
    let checklogin = await help.check_login(chatId)
    let name = msg.from.first_name ? msg.from.first_name : msg.from.last_name ? msg.from.last_name : msg.from.username
    let userLink = msg.from.username ? msg.from.username : ""

    if (text) {
        if (text.includes('Login') || text.toLocaleLowerCase().includes('login')) {
            // đăng nhập
            help.login_telegram(text, chatId, bot, messageId, name,userLink)
        } else if (text.includes('/THEMCT') || text.toLocaleLowerCase().includes('/themct')) {
            //  thêm công thức vào 

            if (checklogin) {
                help.themcongthuc(text, chatId, bot, checklogin, messageId)
            } else {
                bot.sendMessage(chatId, Res.dangnhap, {
                    reply_to_message_id: messageId,
                })
            }

        }
        else if (text.includes('BET') || text.toLocaleLowerCase().includes('bet')) {
            //  thêm chiến lược chọn 

            if (checklogin) {
                help.themchienluoc(text, chatId, bot, checklogin, messageId)
            } else {
                bot.sendMessage(chatId, Res.dangnhap, {
                    reply_to_message_id: messageId,
                })
            }
        }
        else if (text.includes('/CT') || text.toLocaleLowerCase().includes('/ct')) {
            //  chọn theo công thức nào
            if (checklogin && checklogin.activeacc == 0) {
                return bot.sendMessage(chatId, "Tài khoản của bạn chưa được active, Liên hệ Hỗ trợ ")
            }
            if (checklogin) {
                help.choncongthuc(text, chatId, bot, checklogin, messageId)
            } else {
                bot.sendMessage(chatId, Res.dangnhap, {
                    reply_to_message_id: messageId,
                })
            }

        }
        // else if (text.includes('/ADD') || text.includes('/Add') || text.includes('/add')) {
        //     //  chọn theo công thức nào
        //     if (checklogin && checklogin.activeacc == 0) {
        //         return bot.sendMessage(chatId, "Tài khoản của bạn chưa được active, Liên hệ Hỗ trợ ")
        //     }
        //     if (checklogin) {
        //         help.addthemso(text, chatId, bot, checklogin, messageId)
        //     } else {
        //         bot.sendMessage(chatId, Res.dangnhap, {
        //             reply_to_message_id: messageId,
        //         })
        //     }

        // }
        // else if (text.includes('/STOP') || text.includes('/stop')) {
        //     //  chọn theo công thức nào

        //     if (checklogin) {
        //         help.stopthemso(text, chatId, bot, checklogin, messageId)
        //     } else {
        //         bot.sendMessage(chatId, Res.dangnhap, {
        //             reply_to_message_id: messageId,
        //         })
        //     }

        // }
        else if (text.includes('SLTP') || text.toLocaleLowerCase().includes('sltp')) {
            //   chốt lời cắt lỗi

            if (checklogin) {
                help.dunglocatloi(text, chatId, bot, checklogin, messageId)
            } else {
                bot.sendMessage(chatId, Res.dangnhap, {
                    reply_to_message_id: messageId,
                })
            }
        }
        else {
            switch (text.toLocaleLowerCase()) {
                case "/start":
                    // code block
                    if (checklogin) {
                        help.batdau(text, chatId, bot, checklogin, messageId)
                    } else {
                        Res.send_dang_nhap(name, chatId, messageId, bot)

                        // bot.sendMessage(chatId, Res.dangnhap, {
                        //     reply_to_message_id: messageId,
                        // })
                    }

                    break;
                case "bắt đầu":
                    // code block
                    if (checklogin) {
                        help.batdau(text, chatId, bot, checklogin, messageId)
                    } else {
                        bot.sendMessage(chatId, Res.dangnhap, {
                            reply_to_message_id: messageId,
                        })
                    }


                    break;
                case "cài dca thua":
                    // code block caiDCA cài DCA thắng
                    if (checklogin) {
                        help.caiDCA(text, chatId, bot, checklogin, messageId)
                    } else {
                        bot.sendMessage(chatId, Res.dangnhap, {
                            reply_to_message_id: messageId,
                        })
                    }

                    break;
                case "cài dca thắng":
                    // code block caiDCA cài DCA thắng
                    if (checklogin) {
                        help.caiDCA(text, chatId, bot, checklogin, messageId)
                    } else {
                        bot.sendMessage(chatId, Res.dangnhap, {
                            reply_to_message_id: messageId,
                        })
                    }

                    break;
                case "đăng nhập":

                    bot.sendMessage(chatId, Res.dangnhap, {
                        reply_to_message_id: messageId,
                    })
                    // code block
                    break;
                case "cài ngược":
                    // code block 

                    if (checklogin) {
                        help.cainguoc(text, chatId, bot, checklogin, messageId)
                    } else {
                        bot.sendMessage(chatId, Res.dangnhap, {
                            reply_to_message_id: messageId,
                        })
                    }
                    break;
                case "cài thuận":
                    // code block 

                    if (checklogin) {
                        help.cainguoc(text, chatId, bot, checklogin, messageId)
                    } else {
                        bot.sendMessage(chatId, Res.dangnhap, {
                            reply_to_message_id: messageId,
                        })
                    }
                    break;
                case "chốt lời/lỗ":
                    // code block
                    bot.sendMessage(chatId, Res.chot_loi, {
                        reply_to_message_id: messageId,
                    })
                    break;
                case "chiến lược":
                    // code block
                    bot.sendMessage(chatId, Res.chienluoc, {
                        reply_to_message_id: messageId,
                        parse_mode: "HTMl"
                    })
                    break;
                case "bật copy":
                    // code block coppy
                    if (checklogin && checklogin.activeacc == 0) {
                        return bot.sendMessage(chatId, "Tài khoản của bạn chưa được active, Liên hệ Hỗ trợ ")
                    }
                    if (checklogin) {
                        help.batcopy(text, chatId, bot, checklogin, messageId)
                    } else {
                        bot.sendMessage(chatId, Res.dangnhap, {
                            reply_to_message_id: messageId,
                        })
                    }
                    break;
                case "tắt copy":
                    // code block coppy
                    if (checklogin && checklogin.activeacc == 0) {
                        return bot.sendMessage(chatId, "Tài khoản của bạn chưa được active, Liên hệ Hỗ trợ ")
                    }
                    if (checklogin) {
                        help.batcopy(text, chatId, bot, checklogin, messageId)
                    } else {
                        bot.sendMessage(chatId, Res.dangnhap, {
                            reply_to_message_id: messageId,
                        })
                    }
                    break;
                case "tắt công thức":
                    // code block coppy
                    if (checklogin) {
                        help.tatcongthuc(text, chatId, bot, checklogin, messageId)
                    } else {
                        bot.sendMessage(chatId, Res.dangnhap, {
                            reply_to_message_id: messageId,
                        })
                    }
                    break;
                case "Lịch sử":
                    // code block
                    break;
                case "cài công thức":
                    // code block congthuc
                    if (checklogin) {

                        help.caicongthuc(text, chatId, bot, checklogin, messageId)


                    } else {
                        bot.sendMessage(chatId, Res.dangnhap, {
                            reply_to_message_id: messageId,
                        })
                    }

                    break;
                case "bật đợi gãy":
                    // code block ✅ Đã đổi trạng thái chờ gãy sang ON
                    if (checklogin) {
                        help.battatdoigay(text, chatId, bot, checklogin, messageId)
                    } else {
                        bot.sendMessage(chatId, Res.dangnhap, {
                            reply_to_message_id: messageId,
                        })
                    }

                    break;
                case "tắt đợi gãy":
                    // code block ✅ Đã đổi trạng thái chờ gãy sang ON
                    if (checklogin) {
                        help.battatdoigay(text, chatId, bot, checklogin, messageId)
                    } else {
                        bot.sendMessage(chatId, Res.dangnhap, {
                            reply_to_message_id: messageId,
                        })
                    }
                    break;
                default:
                    bot.sendMessage(chatId, `Cú pháp sai
/START để quay lại`, {
                        reply_to_message_id: messageId,
                    })

                // code block
            }
        }
    }

});

var cron = require('node-cron');
let db = require('knex')({
    client: 'mysql',
    connection: {
        host: '127.0.0.1',
        port: 3306,
        user: 'root',
        password: 'pass123',
        database: 'bot_telegram_82'
    }
})
const userAgent = 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36';
const md5 = require('md5');
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
async function thutest() {
    
// language:  2
// logintype :  "email"
// phonetype :  0
// pwd: "aaa123123"
// random:  "53f9dae59278411a9db269da6654ab86"
// signature: "CB157C790346A313D50F56FAB1E90FB9"
// timestamp: 1745718515
// username: "koko@gmail.com"
    let tk = await db('taikhoan_he_thong').select('*').first()
    if (!tk) {
        console.log('ahahah')
        let body = {
            username: "koko@gmail.com",
            pwd: "aaa123123",
            phonetype: 0,
            language: 2,
            random: It(),
            timestamp: getTime_now(),
            logintype: "email",
        }
        let test = {
            username: "koko@gmail.com",
            timestamp: 1745718515,
            random:  "53f9dae59278411a9db269da6654ab86",
            pwd: "aaa123123",
            phonetype :  0,
            logintype :  "email",
            language:  2,
            signature:"CB157C790346A313D50F56FAB1E90FB9"
        }
        let a = getsignature(test)
        console.log('aa ',a)
        let signature = getsignature(body)
        body.signature = signature
        console.log(body)
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
            await db("taikhoan_he_thong").insert({
                username: "0967745536",
                pass: "hoanganh123",
                'token': user.data.data.token,
                "refreshToken": user.data.data.refreshToken
            })
        }
    } else {

    }
}
thutest()
setTimeout(() => {
     Vn_go_1p.runbot(bot)
}, 5000);
cron.schedule('*/10 * * * *', async () => {
    // Hàm bạn muốn thực hiện mỗi giờ
    console.log('Chạy hàm mỗi giờ');
    await db("lichsu_ma_group").del().where('created_at', '<', db.raw('NOW() - INTERVAL 3 HOUR'))
    await db("lichsu_tong_hop").del().where('created_at', '<', db.raw('NOW() - INTERVAL 4 HOUR'))
    await db("bonhotam").del().where('created_at', '<', db.raw('NOW() - INTERVAL 20 MINUTE'));
  });


