// const mongoDbConnection = require('../datab/database');
const express = require('express');
const router = require('./routes/routes');
const app = express();
const mongodb = require('mongodb');
const dotenv = require('dotenv');

dotenv.config();


function mongoDbConnection (){
    return new Promise((resolve, reject)=>{
        mongodb.connect(process.env.MONGOdB_URL,(error,client)=>{
            if(error) reject(error);
            console.log("Database Connected");
            const database = client.db(process.env.MONGODB_URL);
            const collection = database.collection("data");
            collection.find().toArray((error,data)=>{
                if(error) reject(error);
                resolve(data);
            })
        })
    })
}

app.use(express.urlencoded({ extended: false}));
app.use(express.json());
mongoDbConnection();
app.use('/', router);
app.listen(8080, () => console.log("Server rocking at port 8080"));
