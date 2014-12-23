$(document).on('ready', function () {

  setInterval(function() {
    console.log("yahoo quotes");
    refresh_quotes(); },
    30000);

  function refresh_quotes() {
    var data = $.get('/dashboard/update_yahoo_quotes').done(function( response_html ) {
      $("#user_portfolio_performance").html(response_html);
    });
  };
});
