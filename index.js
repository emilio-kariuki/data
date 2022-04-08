const {MongoClient} = require('mongodb');

async function main(){
  const uri = process.env.MONGODB_URL;
  const client = new MongoClient(uri);
  try{
    await client.connect();
  }catch(e){
    console.error(e);
  }
 
}