/*
  Welcome to MegaMart.com!
  Where your shopping cart is always full
  
  MegaMart is an online store. One of its key features, and how it 
  stays competitive, is that the shopping cart always shows you the 
  total cost of its contents—even while you’re shopping.

  (See modifications through git history)

<<<<<<< HEAD
  Status: The code contains business rules that are not easy to test
=======
  The code contains business rules that are not easy to test
>>>>>>> ffe25b1 (MegaMart.js versão 0)

  In order to test it easily:
  - Separate the business rules from the DOM updates.
  - Get rid of those global variables!
<<<<<<< HEAD
=======

  We need to make it more reusable
>>>>>>> ffe25b1 (MegaMart.js versão 0)
*/

// global variables
var shopping_cart = [];
var shopping_cart_total = 0;

function add_item_to_cart(name, price) {
    shopping_cart.push({
        name: name,
        price: price
    });
    // update total because cart just changed
    calc_cart_total();
}

function calc_cart_total() {
    shopping_cart_total = 0;

    for (var i = 0; i < shopping_cart.length; i++) {
        var item = shopping_cart[i];
        shopping_cart_total += item.price;
    }
    // update DOM to reflect new total
    set_cart_total_dom();

    // update icons
    update_shipping_icons()

    // update the tax on the page
    update_tax_dom()
}

function update_shipping_icons() {
    var buy_buttons = get_buy_buttons_dom();
    for (var i = 0; i < buy_buttons.length; i++) {
        var button = buy_buttons[i];
        var item = button.item;

        // figure out if they get free shipping (business rule we want to be reusable)
        if(item.price + shopping_cart_total >= 20)
            button.show_free_shipping_icon();
        else
            button.hide_free_shipping_icon();
    }
}

// now need to calculate the amount of tax
function update_tax_dom() {
    set_tax_dom(shopping_cart_total * 0.10);
}
