module.exports = (app) => {
    
    const carts = require('../controllers/cartItems.controllers');
    
    app.get('/api/carts/:customerId', carts.getUserShoppingCartById);
    app.post('/api/carts', carts.addItemToCart);

    app.put('/api/carts/decrease', carts.decreaseQtyInCart);
    app.put('/api/carts/increase', carts.increaseQtyInCart);
    app.delete('/api/carts/:userId/:itemId', carts.deleteCartItem);

}

