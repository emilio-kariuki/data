const mongodb = require('mongodb');
const dotenv = require('dotenv');

dotenv.config();

mongodb.connect(
    process.env.port.MONGODB_URL,
    {
        useUnifiedTopology: true,
    },
    (error,client)=>{
        if(error) throw error;
        const database = client.db(process.env.MONGODB_URL);
        const collection = database.collection("data");
    }
);