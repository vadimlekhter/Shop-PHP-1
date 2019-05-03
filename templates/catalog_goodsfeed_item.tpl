<!--<form class="good_item">
    <a href='/gooditem/?idx={{IDX}}'><img class="smallPic" src='{{SMALL}}' alt='Picture' width='150'
                                                             height='100'></a>
    <p>{{NAME}}</p>
    <p>{{DESCRSM}}</p>
    <p>Цена: {{PRICE}} руб.</p>
    <input type="submit" value="Купить">
</form>-->



<!--<form action='/catalog/' method='POST'>
    <a href='/gooditem/?idx={{IDX}}'><img class="smallPic" src='{{SMALL}}' alt='Picture' width='150'></a>
    <h3 class='item-name'>{{NAME}}</h3>
    <p>{{DESCRSM}}</p>
    <p class='price'>Цена {{PRICE}} руб.</p>
    <input class='add-to-basket buyajax' id = '{{IDX}}' type='submit' value='Купить'>
    <input hidden type='text' name='id_good' value='{{IDX}}'>
</form>-->

<div class="good">
    <a href='/gooditem/?idx={{IDX}}'><img class="smallPic" src='{{SMALL}}' alt='Picture' width='150'></a>
    <h3 class='item-name'>{{NAME}}</h3>
    <p>{{DESCRSM}}</p>
    <p class='price'>Цена {{PRICE}} руб.</p>
    <button class='add-to-basket buyajax' id = '{{IDX}}'>Купить</button>
</div>