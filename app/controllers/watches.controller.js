const db = require("../index");

exports.getAllWatches = (req, res) => {
  const query = `SELECT * FROM watches.products;`;
  db.query(query, (err, results) => {


    if (err) {
      res.status(500).send({
        message: "There was an error getting waches.",
        error: err,
      });
    } else if (results.length == 0) {
      res.status(404).send({
        message: "No watches found",
      });
    } else {
      res.send({
        watches: results,
      });
    }
  });
};

exports.getWatchesById = (req, res) => {

  let watchId = req.params.id;

  const query = `
        SELECT * FROM watches.products
            WHERE id = ? ;
      `;

  const placeholders = [watchId];

  db.query(query, placeholders, (err, results) => {

    if (err) {
      res.status(500)
        .send({
          message: "There was an error getting watches.",
          error: err,
        });
    } else if (results.length == 0) {
      res.status(404).send({
        message: "No watches found",
      });
    } else {
      res.send({
        watches: results,
      });
    }
  });
};

exports.getWatchesByBrand = (req, res) => {

  let watchBrand = req.params.brand;

  const query = `
        SELECT * FROM watches.products
            WHERE brand = ? ;
      `;

  const placeholders = [watchBrand];

  db.query(query, placeholders, (err, results) => {

    if (err) {
      res.status(500)
        .send({
          message: "There was an error getting watches.",
          error: err,
        });
    } else if (results.length == 0) {
      res.status(404).send({
        message: "No brands found",
      });
    } else {
      res.send({
        watches: results,
      });
    }
  });
};

exports.getWatchesByStyle = (req, res) => {

  let watchStyle = req.params.style;

  const query = `
        SELECT * FROM watches.products
            WHERE style = ? ;
      `;

  const placeholders = [watchStyle];

  db.query(query, placeholders, (err, results) => {

    if (err) {
      res.status(500)
        .send({
          message: "There was an error getting watches.",
          error: err,
        });
    } else if (results.length == 0) {
      res.status(404).send({
        message: "No styles found",
      });
    } else {
      res.send({
        watches: results,
      });
    }
  });
};

exports.getWatchesByColor = (req, res) => {

  let watchColor = req.params.color;

  const query = `
        SELECT * FROM watches.products
            WHERE color = ? ;
      `;

  const placeholders = [watchColor];

  db.query(query, placeholders, (err, results) => {

    if (err) {
      res.status(500)
        .send({
          message: "There was an error getting watches.",
          error: err,
        });
    } else if (results.length == 0) {
      res.status(404).send({
        message: "No colors found",
      });
    } else {
      res.send({
        watches: results,
      });
    }
  });
};

exports.getWatchesByRating = (req, res) => {

  let watchRating = req.params.rating;

  const query = `
        SELECT * FROM watches.products
            WHERE rating = ? ;
      `;

  const placeholders = [watchBrand];

  db.query(query, placeholders, (err, results) => {

    if (err) {
      res.status(500)
        .send({
          message: "There was an error getting watches.",
          error: err,
        });
    } else if (results.length == 0) {
      res.status(404).send({
        message: "No ratings found",
      });
    } else {
      res.send({
        watches: results,
      });
    }
  });
};

exports.getWatchesByQuery = (req, res) => {

  var filters = ``;
  var placeholders = []

  let entries = Object.entries(req.query)
  for (let [key, value] of entries) {
    filters += ` ?? LIKE ? AND`
    placeholders.push(key, `%${value}%`);
  }

  filters = filters.slice(0, -3);

  const query = `
        SELECT * FROM watches.products
        WHERE
        ${filters}  
        ;`;

  db.query(query, placeholders, (err, results) => {

    if (err) {
      res.status(500)
        .send({
          message: 'There was an error getting watches',
          error: err
        });
    } else if (results.length == 0) {
      res.status(404)
        .send({
          message: 'No watches found',
          error: err
        })
    } else {
      res.send({
        watches: results
      });
    }
  });
}
