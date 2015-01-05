$(document).on('ready', function () {

  setInterval(function() {
    console.log("trending tweets");
    refresh_tweets();
  },
  10000);

  function refresh_tweets() {
    var data = $.get('/dashboard/update_tweets').done(function( response_html ) {
      $("#user_trending_tweets").html(response_html);
    });
  };
});
