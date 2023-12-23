// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


// app/assets/javascripts/application.js
$(document).on('ajax:success', function (event) {
    var cartItems = $('#cart-items');
    cartItems.html(event.detail[2].responseText);
});

// app/assets/javascripts/application.js
//= require jquery
//= require jquery_ujs
//= require_tree .
