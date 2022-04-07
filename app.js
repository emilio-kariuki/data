import mongoDbConnection from '../database/database';
import express, { urlencoded, json } from 'express';
import router from './routes/routes';
const app = express();

app.use(urlencoded({ extended: false}));
app.use(json());
mongoDbConnection();
app.use('/', router);
app.listen(8080, () => console.log("Server rocking at port 8080"));
