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

        <!--<form action='/gooditem/' method='GET'>
            <img class="smallPic" src='{{BIG}}' alt='Picture' width='450'>
            <h3 class='item-name'>{{NAME}}</h3>
            <p>{{DESCRBIG}}</p>
            <p class='price'>Цена {{PRICE}} руб.</p>
            <input class='add-to-basket' type='submit' value='Купить'>
            <input hidden type='text' name='id_good' value='{{IDX}}'>
            <input hidden type='text' name='idx' value='{{IDX}}'>
        </form>-->


        <img class="smallPic" src='{{BIG}}' alt='Picture' width='450'>
        <h3 class='item-name'>{{NAME}}</h3>
        <p>{{DESCRBIG}}</p>
        <p class='price'>Цена {{PRICE}} руб.</p>
        <button class='add-to-basket buyajax' id='{{IDX}}'>Купить</button>
        <!--<input class='add-to-basket' type='submit' value='Купить'>
        <input hidden type='text' name='id_good' value='{{IDX}}'>
        <input hidden type='text' name='idx' value='{{IDX}}'>-->


        <!--<h3 class="center"><a href="/catalog/">В каталог</a></h3>-->

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
