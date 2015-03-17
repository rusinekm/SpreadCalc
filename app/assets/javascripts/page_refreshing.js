$(document).ready(function(){

  var data_refreshing = function(){
    setInterval(function(){
      $.ajax({
        url: document.URL,
        type: 'GET', 
        ifModified: true,
        success: function(data,status,xhr) {
          if (status === "success") {
            $('#table_wrapper').html(data);
          }
        }
      });
    }, 300000);
  };

  data_refreshing()
});