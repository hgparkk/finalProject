const firebaseConfig = {
    apiKey: "AIzaSyDV3yFI-FnQVxEFxcXRzhnX_wS7ldS_l9U",
    authDomain: "finaleproject-f5e95.firebaseapp.com",
    projectId: "finaleproject-f5e95",
    storageBucket: "finaleproject-f5e95.firebasestorage.app",
    messagingSenderId: "290878061658",
    appId: "1:290878061658:web:5ae52eb3799705868eac63"
};

// Firebase 초기화
firebase.initializeApp(firebaseConfig);

function makeUniqueId(){
    let date = new Date();

    let v_year = date.getFullYear() + "";
    let v_month = date.getMonth()+1 + "";
    let v_date = date.getDate() + "";
    let v_hour = date.getHours() + "";
    let v_min = date.getMinutes() + "";
    let v_sec = date.getSeconds() + "";
    let v_miliSec = date.getMilliseconds() + "";

    let v_uniqueId = v_year + v_month.padStart(2, 0)
                    + v_date.padStart(2, 0) + v_hour.padStart(2, 0)
                    + v_min.padStart(2, 0) + v_sec.padStart(2, 0)
                    + v_miliSec.padStart(3, 0);

    // v_uniqueId 에 랜덤 숫자 6자리 붙이기
    // 0_9 숫자를 6번 붙여주기
    for(let i = 0; i < 6; i++){
        v_uniqueId += Math.floor((Math.random()*10)) + "";
    }

    return v_uniqueId;
}