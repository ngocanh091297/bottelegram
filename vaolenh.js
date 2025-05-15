const userAgent = 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36';
const axios = require('axios')
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
async function vaolenhtaikhoan(token, issuenumber) {
  
    try {
      
        let body = {
            amount: 1000,
            betMultiple: 5,
            gameCode:"WinGo_1M",
            issuenumber: issuenumber,
            language:'vi',
            random: It(),
            timestamp: getTime_now(),
            betContent:"BigSmall_Small"
        
        }
     
        let result

        let signature = getsignature(body)
        body.signature = signature

 
            console.log('body ',token)
            result = await axios.post("https://h5.ar-lottery01.com/api/Lottery/WinGoBet", body, { // https://h5.ar-lottery01.com/api/Lottery/WinGoBet
                headers: {
                    'content-type': 'application/json;charset=UTF-8',
                    'Authorization': `Bearer ${token}`,
                    'User-Agent': userAgent
                },
            })
            console.log('result ',result)

        

    } catch (error) {
        console.log('err ',error)
       
            // c
          
    }




}
let tokem ="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJUb2tlblR5cGUiOiJBY2Nlc3NfVG9rZW4iLCJUZW5hbnRJZCI6IjEwMzUiLCJVc2VySWQiOiIxMDM1MDAwMDY5ODQ3MCIsIkFnZW50Q29kZSI6IjEwMzUwMSIsIlRlbmFudEFjY291bnQiOiI2OTg0NzAiLCJMb2dpbklQIjoiMTcxLjIzNC44LjEyNiIsIkxvZ2luVGltZSI6IjE3NDcyNzI0NDYxMDQiLCJTeXNDdXJyZW5jeSI6IlZORCIsIlN5c0xhbmd1YWdlIjoidmkiLCJEZXZpY2VUeXBlIjoiUEMiLCJMb3R0ZXJ5TGltaXRHcm91cE51bSI6IjAiLCJVc2VyVHlwZSI6IjEiLCJuYmYiOjE3NDcyNzI4NTAsImV4cCI6MTc0NzI3NjQ1MCwiaXNzIjoiand0SXNzdWVyIiwiYXVkIjoibG90dGVyeVRpY2tldCJ9.FZOHSTa49bJiUk4Txhq-7mp2PKUIcM6kKEHFxulJDGg"
let issuenumber ="20250515100010099"
vaolenhtaikhoan(tokem,issuenumber)
// "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJUb2tlblR5cGUiOiJBY2Nlc3NfVG9rZW4iLCJUZW5hbnRJZCI6IjEwMzUiLCJVc2VySWQiOiIxMDM1MDAwMDY5ODQ3MCIsIkFnZW50Q29kZSI6IjEwMzUwMSIsIlRlbmFudEFjY291bnQiOiI2OTg0NzAiLCJMb2dpbklQIjoiMTcxLjIzNC44LjEyNiIsIkxvZ2luVGltZSI6Ii0xNzQ3MjcyNDQ2MTA0IiwiU3lzQ3VycmVuY3kiOiJWTkQiLCJTeXNMYW5ndWFnZSI6InZpIiwiRGV2aWNlVHlwZSI6IlBDIiwiTG90dGVyeUxpbWl0R3JvdXBOdW0iOiIwIiwiVXNlclR5cGUiOiIxIiwibmJmIjoxNzQ3MjcyNDQ2LCJleHAiOjE3NDczNTg4NDYsImlzcyI6Imp3dElzc3VlciIsImF1ZCI6ImxvdHRlcnlUaWNrZXQifQ.DsdMSNB6WV6tvaMVdtrN1sAb58E78qIn6fct3KXpHkc"
// "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJUb2tlblR5cGUiOiJBY2Nlc3NfVG9rZW4iLCJUZW5hbnRJZCI6IjEwMzUiLCJVc2VySWQiOiIxMDM1MDAwMDY5ODQ3MCIsIkFnZW50Q29kZSI6IjEwMzUwMSIsIlRlbmFudEFjY291bnQiOiI2OTg0NzAiLCJMb2dpbklQIjoiMTcxLjIzNC44LjEyNiIsIkxvZ2luVGltZSI6IjE3NDcyNzI0NDYxMDQiLCJTeXNDdXJyZW5jeSI6IlZORCIsIlN5c0xhbmd1YWdlIjoidmkiLCJEZXZpY2VUeXBlIjoiUEMiLCJMb3R0ZXJ5TGltaXRHcm91cE51bSI6IjAiLCJVc2VyVHlwZSI6IjEiLCJuYmYiOjE3NDcyNzI4NTAsImV4cCI6MTc0NzI3NjQ1MCwiaXNzIjoiand0SXNzdWVyIiwiYXVkIjoibG90dGVyeVRpY2tldCJ9.FZOHSTa49bJiUk4Txhq-7mp2PKUIcM6kKEHFxulJDGg"