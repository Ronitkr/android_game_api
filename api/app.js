const express = require('express');
const database = require('./config/database');
const createError = require('http-error');
const bodyParser = require('body-parser');
const cors= require('cors');
const app = express();
const useragent = require('express-useragent');



// CONFIGURATION MIDDLEWARE

app.use(bodyParser.json());
app.use(bodyParser.urlencoded(
    {extended: true}
));
app.use(cors());
// app.use(express.static(path.join(__dirname = 'public')));
app.use(useragent.express());



// import file
const env = require('./config/env');

// IMPORT ROUTER
const UserRouter = require('./router/user');
const UserActivityRouter = require('./router/login-activity');
const UserTransactionRouter = require('./router/user-transaction');

// CONFIGURE THE IMPORT ROUTER
app.use('/api/users', UserRouter);
app.use('/api/login-activity', UserActivityRouter);
app.use('/api/users/user-transactions', UserTransactionRouter);





// CONFIG PORT AND SERVER
app.listen(env.port, () => {
    console.log('Server is running in port' + env.port);
})