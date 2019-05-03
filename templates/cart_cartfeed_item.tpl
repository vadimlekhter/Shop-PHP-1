<!--<form action='/cart/' method='GET'>
    <a href='/gooditem/?idx={{IDX}}'><img class="smallPic" src='{{SMALL}}' alt='Picture' width='150'></a>
    <h3 class='item-name'>{{NAME}}</h3>
    <p class='price'>Цена {{PRICE}} руб.</p>
    <input class='add-to-basket' type='submit' value='Удалить'>
    <input hidden type='text' name='id_good_del' value='{{ID_CART}}'>
</form>-->

<div class="good">
    <a href='/gooditem/?idx={{IDX}}'><img class="smallPic" src='{{SMALL}}' alt='Picture' width='150'></a>
    <h3 class='item-name'>{{NAME}}</h3>
    <p class='price'>Цена {{PRICE}} руб.</p>
    <button class='add-to-basket remajax' id = '{{ID_CART}}'>Удалить</button>
</div>