module.exports = (app) => {

    const watches = require('../controllers/watches.controller');

    // router = ...router...

    app.get('/api/watches', watches.getAllPalettes);
    app.get('/api/watches/:id', watches.getPaletteById);
    app.get('/api/watches/user/:userId', watches.getPalettesByUser);
    app.get('/api/watches/color/', watches.getPalettesByHexColor);
    app.get('/api/watches/style/', watches.getPalettesByTitle);

    app.post('/api/watches', watches.createNewPalette);

// ALl Put requests are for the cart and we will get to it if we can! :)

    app.put('/api/watches/:id', watches.updatePaletteById);
    // app.put('/api/watches/title/:title', watches.updateTitle);

    app.delete('/api/watches/:id', watches.deletePaletteById);

    // app.use router
}