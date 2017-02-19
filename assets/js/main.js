(function () {
  $(function () {
    $('#origen').autocomplete({
      source: function (request, response) {
        $.ajax({
          url: 'lugar.php',
          dataType: 'xml',
          data: request,
          success: function (xmlResponse) {
            var data =  $('lugar', xmlResponse).map(function () {
              return {
                nombre: $('nombre', this).text()
              }
            });
            response(data);
          }
        })
      },
      minLength: 2,
      select: function( event, ui ) {
        $( "#origen" ).val( ui.item.nombre );
        return false;
      }
    })
    .autocomplete('instance')._renderItem = renderItem;

    $('#destino').autocomplete({
      source: function (request, response) {
        $.ajax({
          url: 'lugar.php',
          dataType: 'xml',
          data: request,
          success: function (xmlResponse) {
            var data =  $('lugar', xmlResponse).map(function () {
              return {
                nombre: $('nombre', this).text()
              }
            });
            response(data);
          }
        })
      },
      minLength: 2,
      select: function( event, ui ) {
        $( "#destino" ).val( ui.item.nombre );
        return false;
      }
    })
    .autocomplete('instance')._renderItem = renderItem;

    $('#desde').datepicker({
      dateFormat: 'dd/mm/yy',
      minDate: 0
    });

    $('#hasta').datepicker({
      dateFormat: 'dd/mm/yy',
      minDate: 0
    });

    $("#no-fechas").on('change', function () {
      if ($(this).is(':checked')) {
        $('#desde').prop('disabled', true);
        $('#hasta').prop('disabled', true);
        $('#desde').val('');
        $('#hasta').val('');
      } else {
        $('#desde').prop('disabled', false);
        $('#hasta').prop('disabled', false);
      }
    });

    $("#solo-ida").on('change', function () {
      if ($(this).is(':checked')) {
        $('#hasta').prop('disabled', true);
        $('#hasta').val('');
      } else {
        $('#hasta').prop('disabled', false);
      }
    });
  });

  function renderItem( ul, item ) {
      return $( "<li>" )
        .append( "<div>" + item.nombre +  "</div>" )
        .appendTo( ul );
    };
})();