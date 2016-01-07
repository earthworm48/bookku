$(document).on("click", ".open-AddPointDialog", function () {

     var myPoint = $(this).data('points');
     $(".modal-body #point_transaction_points").val( myPoint );
});