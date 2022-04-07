const express = require('express')
const app = express()
app.use(express.json())
app.get('/', (req, res) => {
  res.status(200).json({ name: 'Emilio' })
});
app.post('/add',(req, res)=>{
    const data = (num_1,num_2);
    res.send("The sum is " + num_1 + num_2);
    res.end()

})
app.listen(3000, () => console.log('Server running'))
