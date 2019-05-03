
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
    </header>    <div class="leftblock">
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
        </nav>    </div>
    <div class="content">




        <a href='/login/'>Вход для администратора</a>

        <a class="admin_out_href" href='/adminout/'>Выход администратора</a>
        <a class="admin_out_href" href='/newclient/'>Войти как новый клиент</a>
        <h2>Главная страница</h2>

        <!--<div class='item'>
            <form action='buy.php' method='GET'>
                <img src='uploads/mini/64270.jpg'>
                <h3 class='item-name'>Ноутбук Acer</h3>
                <p class='price'>10000 руб.</p>
                <input class='add-to-basket' type='submit' value='Купить'>
                <input hidden type='text' name='id_good' value='1'>
            </form>
        </div><div class='item'>
            <form action='buy.php' method='GET'>
                <img src='uploads/mini/5a48e1b05e92bbc5a50a809e516e1edf.jpg'>
                <h3 class='item-name'>Ноутбук HP 15-bs516ur 2GF21EA</h3>
                <p class='price'>20000 руб.</p>
                <input class='add-to-basket' type='submit' value='Купить'>
                <input hidden type='text' name='id_good' value='2'>
            </form>
        </div><div class='item'>
            <form action='buy.php' method='GET'>
                <img src='uploads/mini/7.jpg'>
                <h3 class='item-name'>Ноутбук Lenovo IdeaPad 110-15IBR (80T700С2RK)</h3>
                <p class='price'>30000 руб.</p>
                <input class='add-to-basket' type='submit' value='Купить'>
                <input hidden type='text' name='id_good' value='3'>
            </form>
        </div>-->



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
        <p>&copy; Все права защищены</p>    </footer>
</div>
</body>
</html>