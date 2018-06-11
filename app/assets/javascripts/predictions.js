$(function(){
    $(".prediction-form").on("ajax:success", function (data, status, xhr) {
        $('#result').text(status.message);
    }).on("ajax:error", function (ajaxrequest, ajaxOptions, thrownError) {
        console.log(thrownError);
    });
});