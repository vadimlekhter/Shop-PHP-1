$(document).ready(function(){
    $('.buyajax').on('click', function(){
        //var id_good = $(this).attr("id").substr(5);
        var id_good = $(this).attr("id");

        // AJAX запрос к движку
        $.ajax({
            // адрес запроса
            url: "/addtocart.php",
            // HTTP-метод
            method: "POST",
            //данные
            data:{
                id_good: id_good,
            },
            success: function(answer){
                if(answer.result == 1){
                    //alert("Товар добавлен в корзину!");
                    $('.orderscount').html(answer.count);
                    // location.reload();
                }
                else
                    alert("Что-то пошло не так...");
            },

            dataType : "json"
        })
    });

       $('.remajax').on('click', function(){
           var id_good = $(this).attr("id");
           $.ajax({
               url: "/deletecard.php",
               type: "POST",
               data:{
                   id_good: id_good,
               },
               success: function(answer){
                   if(answer.result == 1){
                       //alert("Товар удален из корзины!");
                       $('.orderscount').html(answer.count);
                       location.reload();
                   }
                   else
                       alert("Что-то пошло не так...");
               },

               dataType : "json"
           })
       });

    $('.statusbtn').on('click', function(){
        let id_status = $(this).attr("id");
        let id_session = $(this).attr("id-session");
        let status = $("#" + id_session);

        $.ajax({
            url: "/status.php",
            type: "POST",
            data:{
                id_status: id_status,
                id_session: id_session
            },
            success: function(answer){
                if(answer.result == 1){
                    $(status).html(answer.status);
                    //location.reload();
                }
                else
                    alert("Что-то пошло не так...");
            },

            dataType : "json"
        })
    });
});

