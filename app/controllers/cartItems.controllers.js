const db = require('../index');

exports.addItemToCart = (req, res) => {

    let { userId, itemId, itemPrice } = req.body;

    if (!userId || !itemId || !itemPrice) {
        res.status(400)
            .send({
                message: "id, customer_id, product_id, quantity, and total must be defined",
                data: req.body
            });
        return;
    }


    if (!itemId || !userId || !itemPrice) {
        res.status(400)
            .send({
                message: "user id and product id must be defined",
                data: req.body
            });
        return;

    }

    const query = `
            SELECT * FROM cart_items
                WHERE customer_id = ?
                AND product_id = ?;
        `;
    const placeholders = [userId, itemId];

    db.query(query, placeholders, (err, results) => {
        if (err) {
            // send 500 
        } else if (results.length == 0) {
            // item not in cart yet

            const query = `
                INSERT INTO cart_items (customer_id, product_id, quantity, total)
                    VALUES ( ?, ?, 1, ?);
            `;
            const placeholders = [userId, itemId, itemPrice];

            db.query(query, placeholders, (err, results) => {

                if (err) {
                    res.status(500)
                        .send({
                            message: "There was an error adding a product to your shopping cart.",
                            error: err
                        });
                } else {
                    res.send({
                        message: "your product was added to your shopping cart successfully!"
                    });
                }
            });
        } else {
            // item is in cart
            // increase quantity in cart
            this.increaseQtyInCart(req, res);
        }
    })
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

exports.decreaseQtyInCart = (req, res) => {

    let { itemId, userId } = req.body;

    if (!itemId || !userId) {
        res.status(400)
            .send({
                message: "user id and product id must be defined",
                data: req.body
            });
        return;

    } else {

        const query = `
            UPDATE watches.cart_items 
                SET quantity = quantity - 1
                WHERE  customer_id = ? 
                    AND product_id = ?;
        `;
        const placeholders = [userId, itemId];

        db.query(query, placeholders, (err, results) => {

            if (err) {
                res.status(500)
                    .send({
                        message: "There was an error decreasing item quantity.",
                        error: err
                    });
            } else {
                console.log(results, results.affectedRows)
                // check if rows affected == 0 -> 400 error 
                if (results.affectedRows != 0) {
                    res.status(200)
                    .send({
                        message: "your item was decreased successfully!"
                    });
                } else {
                    res.status(400)
                    .send({
                        message: "item was not decreased"
                    });
                }
            }
        });
    }


}

exports.increaseQtyInCart = (req, res) => {

    let { itemId, userId } = req.body;

    if (!itemId || !userId) {
        res.status(400)
            .send({
                message: "user id and product id must be defined",
                data: req.body
            });
        return;

    } else {

        const query = `
            UPDATE watches.cart_items 
                SET quantity = quantity + 1
                WHERE  customer_id = ? 
                    AND product_id = ?;
        `;
        const placeholders = [userId, itemId];

        db.query(query, placeholders, (err, results) => {

            if (err) {
                res.status(500)
                    .send({
                        message: "There was an error increasing item quantity.",
                        error: err
                    });
            } else {
                console.log(results, results.affectedRows)
                // check if rows affected == 0 -> 400 error 
                if (results.affectedRows != 0) {
                    res.status(200)
                    .send({
                        message: "your item was increased successfully!"
                    });
                } else {
                    res.status(400)
                    .send({
                        message: "item was not increased"
                    });
                }
            }
        });
    }
}

exports.deleteCartItem = (req, res) => {

    let { userId, itemId } = req.params;

    if (!userId || !itemId) {
        res.status(400)
            .send({
                message: "user id and product id must be defined",
                data: req.body
            });
        return;
    } else {
        const query = `
            DELETE FROM cart_items 
                WHERE customer_id = ? 
                   AND product_id = ?;
        `;

        const placeholders = [userId, itemId];

        db.query(query, placeholders, (err, results) => {

            if (err) {
                res.status(500)
                    .send({
                        message: "There was an error deleting item.",
                        error: err
                    });
            } else {
                console.log(results, results.affectedRows)
                // check if rows affected == 0 -> 400 error 
                if (results.affectedRows != 0) {
                    res.status(200)
                    .send({
                        message: "your item was deleted successfully!"
                    });
                } else {
                    res.status(400)
                    .send({
                        message: "item was not deleted"
                    });
                }
            }
        });
    }


}