$(document).ready(function(){

  setTimeout(function(){
    $.ajax({
      url: document.URL,
      type: 'GET', 
      ifModified: true,
      success: function(data,status,xhr) {
        $('#current_currency_wrapper').html(data);
      }
    });
  }, 300000);
});