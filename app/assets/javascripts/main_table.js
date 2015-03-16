$(document).ready(function(){

  setTimeout(function(){
    $.ajax({
      url: document.URL,
      type: 'GET', 
      ifModified: true,
      success: function(data,status,xhr) {
        $('#main_table_wrapper').html(data);
      }
    });
  }, 300000);
});