<?php

// 後面為了json格式所加入
$data = file_get_contents("php://input", "r");
$mydata = array();
$mydata = json_decode($data, true);

// start-1

//判斷username,password,email 是否有資料
// $mydata['username']-username式資料庫欄位(一般都使用大寫)or變數(答案=變數)
if (isset($mydata['username']) && isset($mydata['password']) && isset($mydata['email'])) {
    //判斷username,password,email 不得為空白,如果有就出現"輸入格式錯誤"
    if ($mydata['username'] != "" && $mydata['password'] != "" && $mydata['email'] != "") {

        $p_username = $mydata["username"];

        //password_hash("123456", PASSWORD_DEFAULT)

        //$p_password = $mydata["password"]; 
        $p_password = password_hash($mydata["password"], PASSWORD_DEFAULT);
        $p_email    = $mydata["email"];

        // 一開始起手式
        $servermame = "localhost";
        $username = "root";
        $password = "";
        $dbname = "test20241021";

        $conn = mysqli_connect($servermame, $username, $password, $dbname);

        if (!$conn) {
            die("連線錯誤" . mysqli_connect_error());
        }
        // 20241230 會員密碼加密必須寫在必須寫在INSERT INTO之前

        $sql = "INSERT INTO member(Username, Password, Email) VALUES('$p_username', '$p_password', '$p_email')";

        // 判斷資料是否有建檔成功

        if(mysqli_query($conn, $sql)){
            // 註冊成功 使用JSON方式回覆
            echo '{"state": true, "message" : "註冊成功"}';
        }else{
            echo '{"state": false, "message" : "註冊失敗"}';
        }
        mysqli_close($conn);            
    }else{
        echo '{"state": false, "message" : "欄位不得空白"}';
    }
}else{
    echo '{"state": false, "message" : "欄位錯誤"}';
}
?>
