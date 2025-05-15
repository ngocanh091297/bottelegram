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
let tokem ="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOiIxNzQ3MjcyNDQ2IiwibmJmIjoiMTc0NzI3MjQ0NiIsImV4cCI6IjE3NDcyNzQyNDYiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL2V4cGlyYXRpb24iOiI1LzE1LzIwMjUgODo1NzoyNiBBTSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IkFjY2Vzc19Ub2tlbiIsIlVzZXJJZCI6IjY5ODQ3MCIsIlVzZXJOYW1lIjoiODQ5MzE5MTkxMDIiLCJVc2VyUGhvdG8iOiIxIiwiTmlja05hbWUiOiJNZW1iZXJOTkdQTFJNTyIsIkFtb3VudCI6IjAuMDAiLCJJbnRlZ3JhbCI6IjAiLCJMb2dpbk1hcmsiOiJINSIsIkxvZ2luVGltZSI6IjUvMTUvMjAyNSA4OjI3OjI2IEFNIiwiTG9naW5JUEFkZHJlc3MiOiIxNzEuMjM0LjguMTI2IiwiRGJOdW1iZXIiOiIwIiwiSXN2YWxpZGF0b3IiOiIwIiwiS2V5Q29kZSI6IjE3IiwiVG9rZW5UeXBlIjoiQWNjZXNzX1Rva2VuIiwiUGhvbmVUeXBlIjoiMCIsIlVzZXJUeXBlIjoiMSIsIlVzZXJOYW1lMiI6IiIsImlzcyI6Imp3dElzc3VlciIsImF1ZCI6ImxvdHRlcnlUaWNrZXQifQ.wDZ2ssDA1ODcX-Jf6zvPfNTzVP3btYMW7bLjTtU4q_g"
let issuenumber ="20250515100010090"
vaolenhtaikhoan(tokem,issuenumber)