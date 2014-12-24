$(document).ready(function () {


  setInterval(function() {
    console.log("ticker bar");
    refresh_bar();},
    6000);

  var symbols = ['^GSPC', '^NDX', '^RUT', '^GSPTSE', '^N225', '^FTSE', '^VIX', '^HSI'],

  properties = [
    {
      classname: 'name',
      property: 'Name'
    },
    {
      classname: 'resultsets',
      property: 'LastTradePriceOnly'
    },
    {
      classname: 'change',
      property: 'Change'
    }
  ];

function buildElement(quote) {
  var container = $("<div></div>").addClass("symbol");

  properties.forEach(function (prop) {
    var child = $("<span></span>").addClass(prop.classname);
    child.text(quote[prop.property]);
    container.append(child);
  });

  if (/^\+/.test(quote.PercentChange)) {
    container.addClass("up");
    } else {
    container.addClass("down");
    }
    return container;
  }


function refresh_bar () {
  $.getJSON("http://query.yahooapis.com/v1/public/yql", {
  format: "json",
  diagnostics: "true",
  env: "http://datatables.org/alltables.env",
  q: "select * from yahoo.finance.quotes where symbol in ('" + symbols.join("','") + "')"
  }, function (data, xhr, status) {
    var elements = data.query.results.quote.map(buildElement);
  $("#indices").html(elements);
  });

};

function shrinker() {
  $('#indices').width($('#indices').parent().width());
  }

$(window).on("resize", function() {
  shrinker();
  });


});
