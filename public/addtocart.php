<?php
require_once('../config/config.php');
$sessionId = session_id();
$id_good = $_POST["id_good"];
$sql = "INSERT INTO `shop`.`cart` (id_cart, idx, sessid) VALUES (NULL, '{$id_good}', '{$sessionId}')";
$result = executeQuery($sql);


$sql = "SELECT *  FROM cart, goods WHERE sessid = '{$sessionId}' AND cart.idx = goods.idx";
$goods = executeQuery($sql);
$rows = mysqli_num_rows($goods);


if ($result) {
    $response['result'] = 1;
    $response['count'] = $rows;
}
echo json_encode($response);
