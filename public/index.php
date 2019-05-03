<?php

//подключаем все библиотеки
require_once('../config/config.php');


//создание базы данных с адресами картинок для галереи
createBase();

//получаем URL запроса к сайту и разбиваем его в массив url_array
$url_array = explode("/", $_SERVER['REQUEST_URI']);

//анализируем имя страница в адресе, если его нет, то page_name = index
if ($url_array[1] == "")
	$page_name = "index";
else
	$page_name = $url_array[1];


//подготовку переменных вынесли в отдельную функцию
//в нее передаем имя страницы, переменные для которой нужно подготовить
$variables = prepareVariables($page_name);

//строим страницу и выводим ее на экран
//входные данные имя страницы и ассоциотивный массив переменных
//Например "title"=>"Шапка сайта"
echo renderPage($page_name, $variables);





