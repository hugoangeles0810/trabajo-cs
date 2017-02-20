(function () {
  angular.module('app', [])
    .controller('vuelosCtrl', ['$scope', '$timeout', function ($scope, $timeout) {
      $scope.vuelos = [];

      $scope.loader = true;
      $timeout(function () {
        $.ajax({
          method: 'GET',
          url: 'busqueda.php' + window.location.search,
          dataType: 'xml',
          success: function (xmlResponse) {
            $scope.$apply(function () {
              var datos = $('vuelo', xmlResponse).map(function () {
                return {
                  id: $('id', this).text(),
                  origen: $('origen', this).text(),
                  destino: $('destino', this).text(),
                  fecha: $('fecha', this).text(),
                  aerolinea: $('aerolinea', this).text()
                }
              });
              $scope.vuelos = datos;
              $scope.loader = false;
            });
          }
        })
      }, 2000);
    }])
    .filter('lugar', [function() {
      return function (name) {
        if (!name || typeof name != "string") return "";
        return name.substring(0, 3).toUpperCase();
 e     }
    }])
    .filter('fecha', [function() {
      return function (date) {
        if (!date || typeof date != "string") return "";
        return moment(date).locale('es').format("LL");
 e     }
    }])
    .filter('hora', [function() {
      return function (hour) {
        if (!hour || typeof hour != "string") return "";
        return moment(hour).locale('es').format("LT");
 e     }
    }]);
})();