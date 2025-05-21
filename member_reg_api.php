<?php
// input: {"username":"xx", "password":"xx", "email":"xx"}
// 回傳JSON: {"state": true/false, "message": "訊息"}

$data = file_get_contents("php://input");
$mydata = json_decode($data, true);

if (isset($mydata['username']) && isset($mydata['password']) && isset($mydata['email'])) {
    if ($mydata['username'] !== "" && $mydata['password'] !== "" && $mydata['email'] !== "") {

        $p_username = $mydata["username"];
        $p_password = password_hash($mydata["password"], PASSWORD_DEFAULT);
        $p_email = $mydata["email"];

        // 讀取環境變數
        $host = getenv('DB_HOST');
        $port = getenv('DB_PORT') ?: '5432';
        $dbname = getenv('DB_NAME');
        $user = getenv('DB_USER');
        $pass = getenv('DB_PASS');

        $conn_str = "host=$host port=$port dbname=$dbname user=$user password=$pass";
        $conn = pg_connect($conn_str);

        if (!$conn) {
            echo json_encode(["state" => false, "message" => "資料庫連線錯誤"]);
            exit;
        }

        $sql = 'INSERT INTO member ("Username", "Password", "Email") VALUES ($1, $2, $3)';
        $result = pg_query_params($conn, $sql, [$p_username, $p_password, $p_email]);

        if ($result) {
            echo json_encode(["state" => true, "message" => "註冊成功"]);
        } else {
            echo json_encode(["state" => false, "message" => "註冊失敗"]);
        }

        pg_close($conn);

    } else {
        echo json_encode(["state" => false, "message" => "欄位不得空白"]);
    }
} else {
    echo json_encode(["state" => false, "message" => "欄位錯誤"]);
}
?>
