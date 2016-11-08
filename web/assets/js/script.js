$(".button-collapse").sideNav();
$(document).ready(function () {
    $('#timepicker').pickatime({
        autoclose: false,
        twelvehour: false
    });

    $('.datepicker').pickadate({
        selectMonths: true, // Creates a dropdown to control month
        selectYears: 15 // Creates a dropdown of 15 years to control year
    });


    $.getJSON(Routing.generate('ciudad_index'), function( data ) {
    $( "#autocomplete-destino" ).autocomplete(
        {
            data:data
        });
        $( "#autocomplete-origen" ).autocomplete(
            {
                data:data
            });
    });

    $.ajax({
        url: Routing.generate('tipo_index'),
        content: "JSON",
        success: function (json)
        {
            $.each(json, function(i, value)
            {
                $('#clase').append($('<option>').text(value.tipo). attr('value', value.tipo));
            });
            $('select').material_select();
        }
    });

    $.ajax({
        url: Routing.generate('hotel_index'),
        content: "JSON",
        success: function (json)
        {
            $.each(json, function(i, value)
            {
                $('#hotel').append($('<option>').text(value.hotel). attr('value', value.hotel));
            });
            $('select').material_select();
        }
    });

});