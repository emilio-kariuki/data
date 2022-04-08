import { MongoClient } from "mongodb";
import express from 'express';
import {main} from './main';
const app = express();
app.use(express.json());


  app.get('/', async function (req, res) {
    res.send(main.findListingWithName(client, "emilio"));
  })

app.listen(3000, () => console.log("Server started and is running"));

