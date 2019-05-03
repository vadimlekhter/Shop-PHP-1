<?php

//Константы ошибок
define('ERROR_NOT_FOUND', 1);
define('ERROR_TEMPLATE_EMPTY', 2);

/*
 	Обрабатывает указанный шаблон, подставляя нужные переменные
	Если во входных параметрах массив не указан, назначим
	пустой массив variables
*/
function renderPage($page_name, $variables = [])
{
    //дополним до полного имени файл шаблона из имени страницы page_name
    $file = TPL_DIR . "/" . $page_name . ".tpl";

    //Если шаблон отсутствует выведем ошибку
    if (!is_file($file)) {
        echo 'Template file "' . $file . '" not found';
        exit(ERROR_NOT_FOUND);
    }

    //Если шаблон есть но пустой тоже выведем ошибку
    if (filesize($file) === 0) {
        echo 'Template file "' . $file . '" is empty';
        exit(ERROR_TEMPLATE_EMPTY);
    }

    // если переменных для подстановки не указано, просто
    // возвращаем шаблон как есть
    if (empty($variables)) {
        $templateContent = file_get_contents($file);
    } else {
        $templateContent = file_get_contents($file);

        // заполняем значениями если variables не пустая и нужно делать замену
        $templateContent = pasteValues($variables, $page_name, $templateContent);
    }
    //возвращаем текст шаблона
    return $templateContent;
}

/*
	Функция замены значений в шаблоне по массиву замен variables
	Если массив variables двумерный то замена происходит по дополнительному шаблону
	Например variables:
	[
		"newsfeed"=>[
						"news1"=>"Текст новости 1",
						"news1"=>"Текст новости 1",
						"news1"=>"Текст новости 1"		
					]
	]
	тогда поле {{newsfeed}} будет заменено не просто текстом, а по шаблону из файла
	index_picsfeed_item.tpl имя которого система построит сама
*/
function pasteValues($variables, $page_name, $templateContent)
{
    //перебираем массив замен
    foreach ($variables as $key => $value) {
        //Если массив двумерный, т.е. не одно значение для подстановки
        //то выполним подстановку через дополнительный шаблон
        if ($value != null) {
            // собираем ключи
            $p_key = '{{' . strtoupper($key) . '}}';

            if (is_array($value)) {
                // замена массивом
                $result = "";
                foreach ($value as $value_key => $item) {
                    //сформируем имя дополнительного шаблона
                    $itemTemplateContent = file_get_contents(TPL_DIR . "/" . $page_name . "_" . $key . "_item.tpl");

                    //выполним замену по дополнительному шаблону
                    foreach ($item as $item_key => $item_value) {
                        $i_key = '{{' . strtoupper($item_key) . '}}';
                        $itemTemplateContent = str_replace($i_key, $item_value, $itemTemplateContent);
                    }
                    //формируем общую строку с шаблоном уже с подставленными значениями
                    $result .= $itemTemplateContent;
                }
            } else
                //если подставляется просто значение, его и вернем
                $result = $value;
            //произведем основную замену элементов в шаблоне
            $templateContent = str_replace($p_key, $result, $templateContent);
        }
    }
    //вернем строку с готовым шаблоном со вставленными элементами
    return $templateContent;
}

/*
	Так называемый роутер, навигатор, главное место в движке,
	где определяется какая страница вызвана и выполняются
	необходимые действия для нее, а именно
	присваиваются, получаются, вычисляются значения
	для подстановки в шаблон, формируется переменная vars
	На входе имя запрашиваемой страницы

*/
function prepareVariables($page_name)
{
    $vars = [];
    //в зависимости от того, какую страницу вызываем
    //такой блок кода для нее и выполняем
    switch ($page_name) {
        case "index":
            $vars ["title"] = 'Главная страница';
            if (empty($vars["orderscount"] = ordersCount())) $vars["orderscount"] = '0';
            break;
        case "catalog":
            //если вызвана страница index(галереи), получаем из БД данные картинок, её id,
            //адреса маленькой и большой картинки и количество просмотров каждой.
            $vars ["title"] = 'Каталог';
            //if ($_GET['id_good']) addToCart($_GET['id_good']);
            if (empty($vars["orderscount"] = ordersCount())) $vars["orderscount"] = '0';
            $vars["goodsfeed"] = getGoods();
            break;
        case "gooditem":
            //если открываем маленькую картинку, то по её IDX из БД загружаем адрес её большого варианта
            //и количество её просмотров.
            if ($_GET['id_good']) addToCart($_GET['id_good']);
            $idx = (int)$_GET['idx'];
            $content = getGoodsContent($idx);
            if (empty($vars["orderscount"] = ordersCount())) $vars["orderscount"] = '0';
            $vars ["title"] = $content["name"];
            $vars ["name"] = $content["name"];
            $vars["big"] = $content["big"];
            $vars["descrbig"] = $content["descrbig"];
            $vars["price"] = $content["price"];
            $vars["idx"] = $content["idx"];
            break;
        case "cart":
            $vars ["title"] = 'Корзина';
            // if ($_GET['id_good']) addToCart($_GET['id_good']);
            if ($_GET['id_good_del']) delFromCart($_GET['id_good_del']);
            if (empty($vars['cartfeed'] = getCart())) $vars['cartfeed'] = "Ваша корзина пуста";
            $cartSum = getCartSum();
            if (empty($vars ["sum"] = $cartSum)) $vars ["sum"] = '0';
            if (empty($vars["orderscount"] = ordersCount())) $vars["orderscount"] = '0';
            break;
        case "order":
            $vars['orderdone'] = ' ';
            $vars ["title"] = 'Оформление заказа';
            if (empty($vars["orderscount"] = ordersCount())) $vars["orderscount"] = '0';
            if ($_GET['tel']) {
                addOrder($_GET['tel']);
                $vars['orderdone'] = 'Заказ оформлен, спасибо за покупку!';
                $vars ["title"] = 'Новый клиент';
                session_regenerate_id();
                if (empty($vars["orderscount"] = ordersCount())) $vars["orderscount"] = '0';
            }
            break;
        case "login":
            session_start();
            if ($_SESSION["admin"] == 1) {
                $vars['loginfeed'] = 'Вы уже залогинились как admin';
            } else {
                $vars['loginfeed'] = [[]];
                $_SESSION["admin"] = '0';
            }

            $vars ["title"] = 'Авторизация админа';
            if (empty($vars["orderscount"] = ordersCount())) $vars["orderscount"] = '0';
            if (empty($vars['admin_access'])) {
                $vars['admin_access'] = ' ';
            }
            if ($_POST['login_submit']) {
                $allow = loginAdmin();
                if ($allow == true) {
                    $_SESSION["admin"] = '1';
                    $vars['admin_access'] = 'Доступ в админку разрешен';
                } else $vars['admin_access'] = 'Неверный логин и/или пароль';
            }
            break;
        case "admin":
            //session_start();
            $vars ["title"] = 'Админка';
            if (empty($vars["orderscount"] = ordersCount())) $vars["orderscount"] = '0';
            if ($_SESSION['admin'] == 1) {
                $vars['admin_greet'] = "Добро пожаловать, admin";
                if (empty($vars['ordersfeed'] = getOrders())) $vars['ordersfeed'] = "Заказов нет";
            } else {
                $vars['admin_greet'] = "У вас нет прав доступа";
                $vars['ordersfeed'] = " ";
            }
            break;
        case "adminordersitem":
            $vars ["title"] = 'Заказ';
            if (empty($vars["orderscount"] = ordersCount())) $vars["orderscount"] = '0';
            $orderSession = $_GET['session'];
            if (empty($vars['ordersitemsfeed'] = getOrderCart($orderSession))) $vars['ordersitemsfeed'] = "Заказ отсутствует";
            $cartSum = getOrderCartSum($_GET['session']);
            if (empty($vars ["sum"] = $cartSum)) $vars ["sum"] = '0';
            break;
        case "adminout":
            //session_start();
            $vars ["title"] = 'Выход из админки';
            if (empty($vars["orderscount"] = ordersCount())) $vars["orderscount"] = '0';
            if ($_SESSION['admin'] == 1) {
                unset($_SESSION['admin']);
                $vars['admin_out'] = "До свидания, admin";
            } else $vars['admin_out'] = "Вы не admin";
            break;
        case "newclient":
            $vars ["title"] = 'Новый клиент';
            session_regenerate_id();
            if (empty($vars["orderscount"] = ordersCount())) $vars["orderscount"] = '0';
    }
    //возвращаем готовый массив значения vars для шаблона
    return $vars;
}


/*function logInSession()
{
    session_start();
}*/

function loginAdmin()
{

    $login_admin = $_POST['login_admin'];
    $password_admin = $_POST['password_admin'];
    $sql = "SELECT * FROM admin";
    $res = getAssocResult($sql);
    $allow = false;
    if ($login_admin == $res[0]['login_admin'] && md5($password_admin) == $res[0]['password_admin']) {
//    if ($login_admin == $res[0]['login_admin'] && $password_admin == $res[0]['password_admin']) {
        $allow = true;
    }
    return $allow;
}

function ordersCount()
{
    $sessionId = session_id();
    $sql = "SELECT *  FROM cart, goods WHERE sessid = '{$sessionId}' AND cart.idx = goods.idx";
    $goods = executeQuery($sql);
    $rows = mysqli_num_rows($goods);
    return $rows;
}

function getOrders()
{
    $sql = "SELECT * FROM `order` WHERE status != 'delete'";
    $orders = getAssocResult($sql);
    return $orders;
}

function getOrderCart($sessionOrder)
{
    $sql = "SELECT *  FROM cart, goods WHERE sessid = '{$sessionOrder}' AND cart.idx = goods.idx";
    $goods = getAssocResult($sql);
    return $goods;
}

function getOrderCartSum($sessionOrder)
{
    $sql = "SELECT SUM(`price`) FROM `goods`, `cart` WHERE sessid = '{$sessionOrder}' AND cart.idx = goods.idx";
    $res = getAssocResult($sql);
    $sum = $res[0]['SUM(`price`)'];
    return $sum;
}

//функция возвращает массив всех картинок, отсортированных по количеству просмотров большой картинки
function getGoods()
{
    $sql = "SELECT * FROM goods";
    $goods = getAssocResult($sql);
    return $goods;
}

//функция вызыввает функцию увеличения прссмотров большой картинки на 1 и
//возвращает адрес большой картинки и уже увеличенное на 1 количество её просмотров
function getGoodsContent($id_good)
{
    $sql = "SELECT idx, name, big, descrbig, price FROM goods WHERE idx = {$id_good}";
    $goods = getAssocResult($sql);

    //В случае если новости нет, вернем пустое значение
    $result = [];
    if (isset($goods[0]))
        $result = $goods[0];

    return $result;
}

/*function addToCart($id_good)
{
    $sessionId = session_id();
    $sql = "INSERT INTO `shop`.`cart` (id_cart, idx, sessid) VALUES (NULL, '{$id_good}', '{$sessionId}')";
    executeQuery($sql);
}*/

function getCart()
{
    $sessionId = session_id();
    $sql = "SELECT *  FROM cart, goods WHERE sessid = '{$sessionId}' AND cart.idx = goods.idx";
    $goods = getAssocResult($sql);
    return $goods;
}

function getCartSum()
{
    $sessionId = session_id();
    $sql = "SELECT SUM(`price`) FROM `goods`, `cart` WHERE sessid = '{$sessionId}' AND cart.idx = goods.idx";
    $res = getAssocResult($sql);
    $sum = $res[0]['SUM(`price`)'];
    return $sum;
}

/*function delFromCart($id_good)
{
    $sessionId = session_id();
    $sql = "DELETE FROM cart WHERE sessid = '{$sessionId}' AND id_cart ='{$id_good}'";
    executeQuery($sql);
}*/

function addOrder($tel)
{
    $sessionId = session_id();
    $sql = "INSERT INTO `shop`.`order` (`id`, `tel`, `sessid`, `status`) VALUES (NULL , '{$tel}', '{$sessionId}', 'ordered')";
    executeQuery($sql);
}