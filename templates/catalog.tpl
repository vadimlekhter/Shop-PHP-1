<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>{{TITLE}}</title>
    <link rel="stylesheet" href="/css/styles.css" type="text/css" media="all">
    <script src="/bower_components/jquery/dist/jquery.min.js"></script>

</head>
<body>
<div id="container">
    <header>
        <div class="logotip">
            <a href='/index/'><img src="/img/logotip.png" alt="Логотип сайта" title="Магазин ноутбуков"></a>
        </div>
    </header>
    <div class="leftblock">
        <nav>
            <div class="menu">
                <ul>
                    <li><a href="/index/">Главная</a></li>
                    <li><a href="/catalog/">Каталог</a></li>
                    <li><a href="/news/">Новости</a></li>
                    <li><a href="/guestbook/">Отзывы</a></li>
                    <li><a href="/contacts/">Контакты</a></li>
                    <li><a href='/cart/'>Корзина (<span class = 'orderscount'>{{ORDERSCOUNT}}</span>)</a></li>
                    <!--<li><a href='/admin/'>Админка</a></li>-->
                </ul>
            </div>
        </nav>
    </div>
    <div class="content">
        <!--<a href=''>Выход</a>-->
        <h2>Каталог</h2>


        <!--<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{TITLE}}</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
<br>
<div class="container">
<h1 class="center">Каталог</h1>
</div>
<br>
<br>-->
        <div class="catalog">
            {{GOODSFEED}}
        </div>


    </div>
    <footer>
        <div class="footer-menu">
            <div>
                <h4>Category</h4>
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">About us</a></li>
                    <li><a href="#">Shop</a></li>
                    <li><a href="#">Blog</a></li>
                </ul>
            </div>
            <div>
                <h4>Our Account</h4>
                <ul>
                    <li><a href="#">Discount</a></li>
                    <li><a href="#">Addres</a></li>
                    <li><a href="#">Search</a></li>
                    <li><a href="#">Blog</a></li>
                </ul>
            </div>
            <div>
                <h4>Category</h4>
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">About us</a></li>
                    <li><a href="#">Shop</a></li>
                    <li><a href="#">Blog</a></li>
                </ul>
            </div>
            <div>
                <h4>About Us</h4>
                Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenea
            </div>
        </div>
        <p>&copy; Все права защищены</p></footer>
</div>
<script src="/js/engine.js"></script>
</body>
</html>
