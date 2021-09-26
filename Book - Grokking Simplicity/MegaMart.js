/*
  Welcome to MegaMart.com!
  Where your shopping cart is always full
  
  MegaMart is an online store. One of its key features, and how it 
  stays competitive, is that the shopping cart always shows you the 
  total cost of its contents—even while you’re shopping.

  (See modifications through git history)

  Status: The code contains business rules that are not easy to test

  The code contains business rules that are not easy to test

  In order to test it easily:
  - Separate the business rules from the DOM updates.
  - Get rid of those global variables!

  We need to make it more reusable
  - Don’t depend on global variables.
  - Don’t assume the answer goes in the DOM.
  - Return the answer from the function.

  Eliminating some of the inputs and outputs can improve the design of actions.
*/

// global variables
var shopping_cart = [];
var shopping_cart_total = 0;

function add_item_to_cart(name, price) {
    // assign return value to global in original function
    shopping_cart = add_item(shopping_cart, name, price)

    // update total because cart just changed
    calc_cart_total();
}

function copy_array(array) {
    // common way to copy an array in Javascript
    return array.slice()
}

function add_item(cart, name, price) {
    // no implicit inputs or outputs
    var new_cart = copy_array(cart)

    // modify copy
    new_cart.push({
        name: name,
        price: price
    });

    // return copy
    return new_cart
}

function calc_total(cart) {
    // no implicit inputs or outputs
    var total = 0;

    for(var i = 0; i < cart.length; i++) {
        var item = cart[i];
        total += item.price;
    }

    return total
}

function calc_cart_total() {
    // we pass shopping_cart as an argument
    shopping_cart_total = calc_total(shopping_cart)

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

        // figure out if they get free shipping
        if(gets_free_shipping(shopping_cart_total, item.price))
            button.show_free_shipping_icon();
        else
            button.hide_free_shipping_icon();
    }
}

// Business rule we wanted to be reusable
function gets_free_shipping(total, item_price) {
    // no implicit inputs or outputs
    return item_price + total >= 20
}

function update_tax_dom() {
    var tax = calc_tax(shopping_cart_total)
    set_tax_dom(tax);
}

// nice, clean tax calculation that the accountants can use
function calc_tax(amount) {
    // no implicit inputs or outputs
    return amount * 0.10
}