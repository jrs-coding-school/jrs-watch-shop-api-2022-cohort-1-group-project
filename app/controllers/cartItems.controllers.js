const db = require('../index');

exports.addItemToCart = (req, res) => {

    let { id, customer_id, product_id, quantity, total } = req.body;

    if (!id || !customer_id || !product_id || !quantity || !total) {
        res.status(400)
            .send({
                message: "id, customer_id, product_id, quantity, and total must be defined",
                data: req.body
            });
        return;
    }

    const query = `
        INSERT INTO watches.cart_items (id, customer_id, product_id, quantity, total)
            VALUES (?, ?, ?, ?, ?);
    `;
    const placeholders = [id, customer_id, product_id, quantity, total];

    db.query(query, placeholders, (err, results) => {

        if (err) {
            // case #3
            res.status(500)
                .send({
                    message: "There was an error adding a product to your shopping cart.",
                    error: err
                });
        } else {
            // case # 1
            res.send({
                message: "your product was added to your shopping cart successfully!"
            });
        }
    });
}

exports.getUserShoppingCartById = (req, res) => {

    let { customerId } = req.params;
   
    const query = `
        SELECT product_id AS id, name, price, brand, color, style, description, image, cart_items.quantity
            FROM watches.cart_items 
            INNER JOIN products
                ON cart_items.product_id = products.id
            WHERE (customer_id = ?);
    `;
    const placeholders = [customerId];

    db.query(query, placeholders, (err, results) => {
        
        if (err) {
            res.status(500)
                .send({
                    message: "There was an error getting shopping cart.",
                    error: err
                })
        } else if (results.length == 0) {
            res.status(404)
                .send({
                    message: "no shopping cart found",
                    data: results
                })
        } else {
            res.send({
                watches: results
            });
        }
    });
}
