const mongodb = require('mongodb');
const dotenv = require('dotenv');

dotenv.config();

export const mongoDbConnection = mongodb.connect(
    process.env.port.MONGODB_URL,
    {
        useUnifiedTopology: true,
    },
    (error,client)=>{
        if(error) throw error;
        console.log
        const database = client.db(process.env.MONGODB_URL);
        const collection = database.collection("data");
        // await collection.find().toArray();

        var dataFromDb = await collection.find().toArray();
        console.log(dataFromDb)
    }
);