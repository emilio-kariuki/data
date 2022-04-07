const express = require('express')
const app = express()
app.use(express.json())
app.get('/', (req, res) => {
  res.status(200).json({ name: 'Emilio' })
});
app.post('/add',(req, res)=>{
    const data = red.body;
    console.log(data);
    res.end()

})
app.listen(3000, () => console.log('Server running'))
