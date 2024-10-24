const express = require('express');
const path = require('path');
const loginRoute = require('./routes/login');


const app = express();
const PORT = 3000;

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

app.use(express.urlencoded({ extended: true }));

app.use('/', loginRoute);



const vehicleRoutes = require('./routes/vehicle');

app.use('/vehicle', vehicleRoutes);




app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
