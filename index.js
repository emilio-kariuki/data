import { MongoClient } from 'mongodb';

async function main(){
  const uri = 'mongodb+srv://emilio:0722937438@cluster0.xdlrq.mongodb.net/myFirstDatabase?retryWrites=true&w=majorityL';
  const client = new MongoClient(uri);
  try{
    await client.connect();
    console.log("Conneceted to database");
  }catch(e){
    console.error(e);
  }finally{
    await client.close();
  }
 
}
main().catch(console.error);