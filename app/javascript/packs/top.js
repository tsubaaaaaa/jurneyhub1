
/*( ".search" ).click(function() {
    ( "ul" ).toggleClass( "active" );
    ( ".search_box" ).toggleClass( "search_box_active" );
   });
  
  $(document).ready(function(){
  $(".search-wrapper input").mouseenter(function(){
    $(".search-wrapper button").css("background-color", "#4aba10");
    
    
  });
  $(".search-wrapper input").mouseout(function(){
    $(".search-wrapper button").css("background-color", "" );
    });
  });
*/
  $(document).on('turbolinks:load', function() {
    $("p").text("jQuery稼働テスト(稼働中)");
  });