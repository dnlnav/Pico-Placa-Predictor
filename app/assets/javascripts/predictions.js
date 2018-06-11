$(function(){
    disableButton();
    $(".predictor__form").on("ajax:success", function (data, status, xhr) {
        $('#result').text(status.message);
    }).on("ajax:error", function (ajaxrequest, ajaxOptions, thrownError) {
        console.log(thrownError);
    });

    $('#license_plate, #date, #time').on('change', disableButton);

    function disableButton(){
        let emptyPlate = $('#license_plate').val() == '';
        let emptyDate = $('#date').val() == '';
        let emptyTime = $('#time').val() == '';
        if (emptyPlate || emptyDate || emptyTime){
            $('.predictor__btn').attr('disabled', 'disabled');
        } else {
            $('.predictor__btn').removeAttr('disabled');
        }
    }
});