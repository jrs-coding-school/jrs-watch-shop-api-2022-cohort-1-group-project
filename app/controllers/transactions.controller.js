const db = require('../index');

exports.getAllTransactionsByUserId = (req, res) => {

    let id = req.params.userId;

    const query = `
        SELECT * FROM watches.transactions 
            WHERE (customer_id = ?);
    `;
    const placeholders = [id];

    db.query(query, placeholders, (err, results) => {
        if (err) {
            res.status(500)
                .send({
                    message: "There was an error getting transactions.",
                    error: err
                })
        } else if (results.length == 0) {
            res.status(404)
                .send({
                    message: "no transactions found"
                })
        } else {
            res.send({
                transactions: results
            });
        }
    });
}

exports.createTransaction = (req, res) => {

    let { id, customer_id, total } = req.body;
    // If the title, author, or coverImage was not defined -> ERROR
    if (!id || !customer_id || !total) {
        res.status(400)
            .send({
                message: "Could not create transaction. You must provide a 'customer_id' and 'total'."
            });
        return;
    }

    const query = `
            INSERT INTO watches.transactions (id, customer_id, total) 
            VALUES 
                (?, ?, ?);
    `;
    const placeholders = [id, customer_id, total];

    db.query(query, placeholders, (err, results) => {

        if (err) {
            // case #3
            res.status(500)
                .send({
                    message: "There was an error creating transaction.",
                    error: err
                });
        } else {
            // case # 1
            res.send({
                message: 'your transaction was successfull.'
            });
        }
    });

}
