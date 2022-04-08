const {MongoClient} = require('mongodb');

async function main(){
  const uri = process.env.MONGODB_URL;
  const client = new MongoClient(uri);
  await client.connect();
}