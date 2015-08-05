$(document).ready(function(){

/* Method for faster redirecting pages using ajax
*/
  $('.inside_link a').on('click',function(event){
    var url_name = $(this).attr('href')
    $.ajax({
      url: url_name,
      success: function(data,status,xhr) {
        $('#page_content').html(data);
        window.history.pushState( null,'hi', url_name);
        $('.currency_site_currency_form').hide();
        $('.currency_site_site_form').hide();
        site_checkbox_event();
        currency_checkbox_event();
      }
    });
    event.preventDefault();
  });
/* Events for showing and hiding site and currency forms, for clearer viewing
*/
  var site_checkbox_event = function() {
    $('.new_site_checkbox input[type=checkbox]').on("change", function(event) {
      var state = event.currentTarget;
      if (state.checked) {
        $('.currency_site_site_form').show();
        $('.currency_site_site_collection').hide();
      }else {
        $('.currency_site_site_form').hide();
        $('.currency_site_site_collection').show();
      };
    });
  };

  var currency_checkbox_event = function() {
    $('.new_currency_checkbox input[type=checkbox]').on("change", function(event) {
      var state = event.currentTarget;
      if (state.checked) {
        $('.currency_site_currency_form').show();
        $('.currency_site_currency_collection').hide();
      }else {
        $('.currency_site_currency_form').hide();
        $('.currency_site_currency_collection').show();
      };
    });
  };
/*  Method for refreshing main and currency pages. It refreshes data on them every 5 minutes.
*/
  var data_refreshing = function(){
    setInterval(function(){
      if ((!!window.location.pathname.match("/currencies")) || (!!(window.location.pathname === "/"))) {
        $.ajax({
          url: document.URL,
          ifModified: true,
          success: function(data,status,xhr) {
            $('#table_wrapper').html(data);
          }
        });
      }
    }, 300000);
  };
/* Main
*/
  site_checkbox_event();
  currency_checkbox_event();
  data_refreshing();
  $('.currency_site_currency_form').hide();
  $('.currency_site_site_form').hide();
});