$(document).ready(function(){

  $('.inside_link a').on('click',function(event){
    var url_name = $(this).attr('href')
    $.ajax({
      url: url_name,
      success: function(data,status,xhr) {
        $('#page_content').html(data);
        window.history.pushState( null,'hi', url_name);
      }
    });
    event.preventDefault();
  });
});