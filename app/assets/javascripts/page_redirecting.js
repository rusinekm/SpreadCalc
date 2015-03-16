$(document).ready(function(){

  $('#new_site a').on('click',function(event){
    $.ajax({
      url: $(this).attr('href'),
      type: 'GET', 
      ifModified: false,
      success: function(data,status,xhr) {
        $('#page_content').html(data);
      }
    });
    event.preventDefault();
  });

  $('#new_currency_site a').on('click',function(event){
    $.ajax({
      url: $(this).attr('href'),
      type: 'GET',  
      success: function(data,status,xhr) {
        $('#page_content').html(data);
      }
    });
    event.preventDefault();
  });

  $('#delete_sites a').on('click',function(event){
   $.ajax({
    url: $(this).attr('href'),
    type: 'GET', 
    success: function(data,status,xhr) {
      $('#page_content').html(data);
    }
  });
   event.preventDefault();
 });

  $('#main_page a').on('click',function(event){
       $.ajax({
      url: $(this).attr('href'),
      type: 'GET', 
      success: function(data,status,xhr) {
        $('#page_content').html(data);
      }
    });
    event.preventDefault();
  });
});