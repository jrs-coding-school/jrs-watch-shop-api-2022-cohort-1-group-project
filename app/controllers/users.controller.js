const db = require('../index');
const bcrypt = require('bcrypt');
const saltRounds = 10;
const { v4: uuid } = require('uuid');


exports.login = (req, res) => {

    let { email, password } = req.body;

    if (!email || !password) {
        res.status(400)
            .send({
                message: "Could not login. You must provide a 'email' and 'password'."
            });
        return;
    }

    const query = `
        SELECT * FROM watches.users 
            WHERE email = ?;
    `;

    const placeholders = [email];

    db.query(query, placeholders, async (err, results) => {
        if (err) {
            res.status(500)
                .send({
                    message: "There was an error logging in. Please try again.",
                    error: err
                });
        } else if (results.length == 0) {
            res.status(404)
                .send({
                    message: "email or Password was incorrect."
                });
        } else {
            let encryptedPassword = results[0].password;
            const passwordMatched = await bcrypt.compare(password, encryptedPassword);

            if (passwordMatched) {
                //successful login

                let user = results[0];
                res.send({
                    message: "You have successfully logged in.",
                    user
                });
            } else {
                //failed login
                res.status(404)
                    .send({
                        message: "email or password was incorrect."
                    });
            }
        }
    });
}

exports.createNewUser = async (req, res) => {

    let { email, password } = req.body;

    if (!email || !password) {
        res.status(400)
            .send({
                message: " Could not create account. You must provide a 'email' and 'password'."
            });
        return;
    }

    const encryptedPassword = await bcrypt.hash(password, saltRounds);



    const query = `
        INSERT INTO users (id, email, password)
        VALUES
            (?, ?, ?);
    `;

    const placeholders = [uuid(), email, encryptedPassword];

    db.query(query, placeholders, (err, results) => {


        if (err) {
            if (err.errno === 1062) {
                res.status(400)
                    .send({
                        message: "That email already exists, try again with a different email",
                        error: err
                    });
            } else {
                // case #3
                res.status(500)
                    .send({
                        message: "There was an error creating your account.",
                        error: err
                    });
            }
        } else {
            // success
            this.login(req, res);
        }
    });
}

exports.deleteUserById = (req, res) => {

    let { id } = req.params;

    const query = `
        DELETE user, transactions, cart_items
        FROM users, transactions, cart_items
            WHERE (users.id = ? AND users.id = transactions.customer_id AND users.id = cart_items.customer_id);
    `;
    const placeholders = [id];

    // tell the database to execute that script
    db.query(query, placeholders, (err, results) => {

        if (err) {
            res.status(500)
                .send({
                    message: "There was an error deleting your account.",
                    error: err
                });
        } else if (results.affectedRows === 0) {
            res.status(404)
                .send({
                    message: "That account could not be deleted"
                })
        } else {
            res.send({
                message: 'the account was deleted successfully.'
            });
        }
    });
}

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
            // case #3
            res.status(500)
                .send({
                    message: "There was an error getting shopping cart.",
                    error: err
                })
        } else if (results.length == 0) {
            //case # 2
            res.status(404)
                .send({
                    message: "no shopping cart found",
                    data: results
                })
        } else {
            // case # 1
            res.send({
                books: results
            });
        }
    });
}
