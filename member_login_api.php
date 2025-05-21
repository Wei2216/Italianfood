<?php
// input: {"username":"xx", "password":"xx"}
// 回傳JSON: {"state": true/false, "message": "訊息"}

$data = file_get_contents("php://input");
$mydata = json_decode($data, true);

if (isset($mydata["username"]) && isset($mydata["password"])) {
    if ($mydata["username"] !== "" && $mydata["password"] !== "") {
        $p_username = $mydata["username"];
        $p_password = $mydata["password"];

        // 從環境變數讀取 PostgreSQL 連線資訊
        $host = getenv('DB_HOST');
        $port = getenv('DB_PORT') ?: '5432'; // 預設5432，如果沒設定
        $dbname = getenv('DB_NAME');
        $user = getenv('DB_USER');
        $pass = getenv('DB_PASS');

        $conn_str = "host=$host port=$port dbname=$dbname user=$user password=$pass";
        $conn = pg_connect($conn_str);

        if (!$conn) {
            echo json_encode(["state" => false, "message" => "資料庫連線錯誤"]);
            exit;
        }

        // 防止 SQL Injection 用 pg_query_params
        $sql = "SELECT \"Username\", \"Password\" FROM member WHERE \"Username\" = $1";
        $result = pg_query_params($conn, $sql, [$p_username]);

        if ($result && pg_num_rows($result) == 1) {
            $row = pg_fetch_assoc($result);
            if (password_verify($p_password, $row["Password"])) {
                echo json_encode(["state" => true, "message" => "登入成功"]);
            } else {
                echo json_encode(["state" => false, "message" => "登入失敗"]);
            }
        } else {
            echo json_encode(["state" => false, "message" => "登入失敗"]);
        }

        pg_close($conn);
    } else {
        echo json_encode(["state" => false, "message" => "欄位不得空白"]);
    }
} else {
    echo json_encode(["state" => false, "message" => "欄位錯誤"]);
}
?>
