<?php
//input: {"username":"xx", "password":"xx"}
// {"state": true, "message" : "登入成功"}
// {"state": false "message" : "登入失敗"}
// {"state": false "message" : "欄位錯誤"}
// {"state": false "message" : "欄位不得空白"}

$data = file_get_contents("php://input", "r");
$mydata = array();
$mydata = json_decode($data, true);

if (isset($mydata["username"]) && isset($mydata["password"])) {
    if ($mydata["username"] != "" && $mydata["password"] != "") {
        // $p_username =前面輸入的帳號
        $p_username = $mydata["username"];
        // $p_password =前面輸入的密碼
        $p_password = $mydata["password"];
        //password_hash("123456", PASSWORD_DEFAULT)

        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "test20241021";

        $conn = mysqli_connect($servername, $username, $password, $dbname);
        if (!$conn) {
            die("連線錯誤!" . mysqli_connect_error());
        }

        $sql = "SELECT Username, Password FROM member WHERE Username = '$p_username'";

        $result = mysqli_query($conn, $sql);
        if (mysqli_num_rows($result) == 1) {
            $row = mysqli_fetch_assoc($result);
            // 印出帳號密碼
            // echo $row["Username"].'<br>';
            // echo $row["Password"].'<br>';
            if (password_verify($p_password, $row["Password"])) {
                //比對正確
                echo '{"state": true, "message" : "登入成功"}';
            } else {
                //比對失敗
                echo '{"state": false, "message" : "登入失敗"}';
            }
        } else {
            echo '{"state": false, "message" : "登入失敗"}';
        }
        mysqli_close($conn);
    } else {
        echo '{"state": false, "message" : "欄位不得空白"}';
    }
} else {
    echo '{"state": false, "message" : "欄位錯誤"}';
}
