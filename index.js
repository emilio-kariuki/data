import { MongoClient } from "mongodb";

async function main() {
  const uri =
    "mongodb+srv://emilio:0722937438@cluster0.xdlrq.mongodb.net/myFirstDatabase?retryWrites=true";
  const client = new MongoClient(uri);
  try {
    await client.connect();
    console.log("Conneceted to database");
    // await listDatabase(client);
    // 
    await findListingWithName(client, )
  } catch (e) {
    console.error(e);
  } finally {
    await client.close();
  }
}
main().catch(console.error);

async function listDatabase(client) {
  const databasesList = await client.db().admin().listDatabases();
  console.log("Databases:");
  databasesList.databases.forEach((db) => console.log(" -" + db.name));
}

async function createListing(client, newListing) {
  const result = await client
    .db("youthing")
    .collection("data")
    .insertOne(newListing);
  console.log("New Listing added with the following id : " + result.insertedId);
}
async function findListingWithName(client, newListingName){
  const result = await client.db('youth').collection('data').findOne({name: NewListingName});
  if(result){
    console.log("The result found is " + result);
  }else{
    console.log("No results found in the database");
  }
}
