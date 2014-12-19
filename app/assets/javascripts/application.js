// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap-sprockets

var symbols = ['^GSPC', '^NDX', '^RUT', '^GSPTSE', '^N225', '^FTSE', '^VIX', 'GOOG', 'MU'],
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

$.getJSON("http://query.yahooapis.com/v1/public/yql", {
  format: "json",
  diagnostics: "true",
  env: "http://datatables.org/alltables.env",
  q: "select * from yahoo.finance.quotes where symbol in ('" + symbols.join("','") + "')"
}, function (data, xhr, status) {
  // do some sanity checking of the data here
  var elements = data.query.results.quote.map(buildElement);
  $("#indices").append(elements);
});

function shrinker() {
  $('#indices').width($('#indices').parent().width());
}
$(window).on("resize", function() {
  shrinker();
});


// -------------------------------------------
