// function GetURLParameter(sParam) {
//     var sPageURL = window.location.search.substring(1);
//     var sURLVariables = sPageURL.split('&');
//     for (var i = 0; i < sURLVariables.length; i++) {
//         var sParameterName = sURLVariables[i].split('=');
//         if (sParameterName[0] == sParam) {
//             return sParameterName[1];
//         }
//     }
// }
// $(document).on('click', 'div#str_pagging ul.pagging li a', function (e) {
//     //e.stopPropagation(); // important
//     e.preventDefault();
//     var page = $(this).attr('data-id');
//     var mod = GetURLParameter('mod')
//     var data = { page: page };
//     console.log(data);
//     if (mod == 'sales') {
//         $.ajax({
//             url: "?mod=sales&action=ajax_pag",
//             method: "POST",
//             data: data,
//             dataType: "json",
//             success: function (data) {
//                 $('tbody.order_info').html(data.order_info);
//                 $('#str_pagging').html(data.str_pagging);

//             }
//         })
//     }
// })
// function search_ajax() {
//     $(document).on('click', 'form#search_ajax input#submit', function (e) {
//         e.preventDefault();
//         var search = GetURLParameter('s');
//         var data = {search}
//     })

// }
$(document).ready(function () {
    function GetURLParameter(sParam) {
        var sPageURL = window.location.search.substring(1);
        var sURLVariables = sPageURL.split('&');
        for (var i = 0; i < sURLVariables.length; i++) {
            var sParameterName = sURLVariables[i].split('=');
            if (sParameterName[0] == sParam) {
                return sParameterName[1];
            }
        }
    }
    // AJAX SUB CATEGORY
    $('#product_category').change(function () {
        var sub_cat = $(this).val();
        var data = { sub_cat: sub_cat };
        $.ajax({
            url: "?mod=product&controller=product_cat&action=ajax_sub_cat",
            method: "POST",
            data: data,
            dataType: "text",
            success: function (data) {
                $('#product_sub_category').html(data);

            }
        })
    })

})
