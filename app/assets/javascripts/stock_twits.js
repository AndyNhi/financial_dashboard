$(document).on('ready', function () {

  setInterval(function() {
    console.log("stock twits");
    refresh_tweets(); },
    300000);

    function refresh_tweets() {
      var data = $.get('/dashboard/update_stock_twits').done(function( response_html ) {
        $("#general_trending_tweets").html(response_html);
      });
    };
  });
