<?php
/*	Обертки функция для обращений к базе данных
	getAssocResult возвращает результат запроса 
	в виде ассоциативного массива array_result,
	где каждый элемент это строка ответа базы

	executeQuery возвращает результат запроса
	как есть, можно использовать для удаления, 
	или изменения даннных, когда не требуется
	ответа от базы

*/


function getAssocResult($sql)
{
    $db = mysqli_connect(HOST, USER, PASS, DB);
    //$result = mysqli_query($db, $sql);
    $result = executeQuery($sql);
    $array_result = array();
    while ($row = mysqli_fetch_assoc($result)) {
        $array_result[] = $row;
    }
    mysqli_close($db);
    return $array_result;
}

function executeQuery($sql)
{
    $db = mysqli_connect(HOST, USER, PASS, DB);
    $result = mysqli_query($db, $sql);
    mysqli_close($db);
    return $result;
}

//проверка существования базы данных и таблицы, создание, если нет

function createBase()
{


    $db = mysqli_connect(HOST, USER, PASS);

    $sql = 'USE ' . DB;

    if (!$res = mysqli_query($db, $sql)) {

//получаем массив имен файлов картинок для галереи из директории с маленькими картинками
        $pics = array_slice(scandir(SMALL_IMG_DIR), 2);

//создаем базу данных gallery
        $sql = 'CREATE DATABASE ' . DB;
        mysqli_query($db, $sql);

//создаем таблицу pictures

        $sql = 'CREATE TABLE `shop`.`goods` ( `idx` INT(6) NOT NULL AUTO_INCREMENT , `name` VARCHAR(48) NOT NULL , 
`small` VARCHAR(32) NOT NULL , 
`big` VARCHAR(32) NOT NULL , `descrsm` TEXT NOT NULL , `descrbig` TEXT NOT NULL , `price` INT(10) NOT NULL ,
PRIMARY KEY (`idx`)) ENGINE = InnoDB;';
        //mysqli_query($db, $sql);
        executeQuery($sql);

        //заполняем базу адресами маленьких и больших картинок

        $db = mysqli_connect(HOST, USER, PASS, DB);

        foreach ($pics as $item) {
            $itemSmall = substr(SMALL_IMG_DIR, 1) . '/' . $item;
            $itemBig = substr(BIG_IMG_DIR, 1) . '/' . $item;
            $sql = "INSERT INTO `goods` (`idx`, `name`, `small`, `big`, `descrsm`, `descrbig`, `price`) 
VALUES (NULL, 'Ноутбук', '{$itemSmall}','{$itemBig}', 'Короткое описание товара', 'Полное описание товара', '0')";
            executeQuery($sql);
        }

        $sql = 'CREATE TABLE `shop`.`cart` ( `id_cart` INT(3) NOT NULL AUTO_INCREMENT , `idx` INT(6) NOT NULL , 
`sessid` TEXT NOT NULL, PRIMARY KEY (`id_cart`) ) ENGINE = InnoDB;';
        executeQuery($sql);

        $sql = 'CREATE TABLE `shop`.`order` ( `id` INT(3) NOT NULL AUTO_INCREMENT , `tel` TEXT NOT NULL , 
`sessid` TEXT NOT NULL, `status` VARCHAR (32), PRIMARY KEY (`id`) ) ENGINE = InnoDB;';
        executeQuery($sql);
    }
}