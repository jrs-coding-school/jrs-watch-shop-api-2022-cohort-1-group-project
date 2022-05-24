module.exports = (app) => {
    
    const carts = require('../controllers/cartItems.controllers');
    
    app.get('/api/carts/:customerId', carts.getUserShoppingCartById);
    app.post('/api/carts', carts.addItemToCart);

}

