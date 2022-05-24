module.exports = (app) => {

    const watches = require('../controllers/watches.controller');


    app.get('/api/watches', watches.getAllWatches);
    app.get('/api/watches/:id', watches.getWatchesById);
    app.get('/api/watches/rating/:rating', watches.getWatchesByRating);
    app.get('/api/watches/color/:color', watches.getWatchesByColor);
    app.get('/api/watches/style/:style', watches.getWatchesByStyle);
    app.get('/api/watches/brand/:brand', watches.getWatchesByBrand);
    app.get('/api/watches/search', watches.getWatchesByQuery);

}