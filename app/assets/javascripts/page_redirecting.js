$(document).ready(function(){

  $('a').on('click',function(event){
    var url_name = $(this).attr('href')
    $.ajax({
      url: $(this).attr('href'),
      type: 'GET', 
      success: function(data,status,xhr) {
        $('#page_content').html(data);
        window.history.pushState( null,'hi', url_name);
      }
    });
    event.preventDefault();
  });
});