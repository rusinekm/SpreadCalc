$(document).ready(function(){

  var data_refreshing = function(){
    setInterval(function(){
      if ((!!window.location.pathname.match("/currencies")) || (window.location.pathname === "/")) {
        $.ajax({
          url: document.URL,
          ifModified: true,
          success: function(data,status,xhr) {
            if (status === "success") {
              $('#table_wrapper').html(data);
            }
          }
        });
      }
    }, 300000);
  };


  data_refreshing();
});