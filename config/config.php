<?php
define('SITE_ROOT', "../");
define('WWW_ROOT', SITE_ROOT . '/public');

/* DB config */
define('HOST', 'localhost');
define('USER', 'root');
define('PASS', '');
define('DB', 'shop');

define('DATA_DIR', SITE_ROOT . 'data');
define('LIB_DIR', SITE_ROOT . 'engine');
define('TPL_DIR', SITE_ROOT . 'templates');
define('SMALL_IMG_DIR', './img/small');
define('BIG_IMG_DIR', './img/big');
define('CSS_DIR', './css');

define('SITE_TITLE', 'Магазин');
//подгружаем основные функции
require_once(LIB_DIR . '/functions.php');
require_once(LIB_DIR . '/db.php');
require_once(LIB_DIR . '/log.php');
session_start();


