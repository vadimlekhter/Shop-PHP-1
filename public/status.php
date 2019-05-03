<?php
require_once('../config/config.php');
$sessionId = $_POST["id_session"];
$id_status = $_POST["id_status"];
//echo $sessionId;
//echo $id_status;
$sql = "UPDATE `order` SET `status`='{$id_status}' WHERE `sessid`='{$sessionId}'";


$result = executeQuery($sql);

if ($result) {
    $response['result'] = 1;
    $response['status'] = $id_status;
}
echo json_encode($response);