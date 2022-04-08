// const express = require('express')
// const app = express()
// app.use(express.json())
// app.get('/', (req, res) => {
//   res.status(200).json({ name: 'Emilio' })
// });
// app.post('/add',(req, res)=>{
//     const {name,email} = req.body;
//     console.log(name);
//     console.log(email);
//     res.json({
//         name,email
//     });
//     res.end()

// })
// app.listen(3000, () => console.log('Server running'))
// const mongoDbConnection = require('../datab/database');
import express, { Request, Response } from 'express';
import router from './routes';
const app = express();
import { connect } from 'mongodb';
import { config } from 'dotenv';

config();


function mongoDbConnection (){
    return new Promise((resolve, reject)=>{
        connect(process.env.MONGOdB_URL,(error,client)=>{
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

app.use(urlencoded({ extended: false}));
app.use(json());
mongoDbConnection();
app.use('/', router);
app.listen(8080, () => console.log("Server rocking at port 8080"));
