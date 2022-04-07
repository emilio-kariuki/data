const mongodb = require('mongodb');
const dotenv = require('dotenv');

dotenv.config();

mongodb.connect(
    process.env.port.MONGODB_URL,
    {
        useUnifiedTopology: true,
    },
    (error,client)=>{
        
    }
);