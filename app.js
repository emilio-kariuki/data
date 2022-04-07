import mongoDbConnection from './database';
import express, { Request, response } from 'express';
import router from './routes/routes';
const app = express();

app.use(urlencoded({ extended: false}));
app.use(json());
mongoDbConnection();
app.use('/', router);
app.listen(8080, () => console.log("Server rocking at port 8080"));
