const express = require('express');
const mongoose = require('mongoose');
const Item = require('./models/Item');

const app = express();
const port = 3002;
// apna naam daal dena wad2 ki jgh
mongoose.connect('mongodb+srv://maniac_psycho13:123Aryan.@cluster0.wflrtqr.mongodb.net/wad2', {
  useNewUrlParser: true,
  useUnifiedTopology: true
}).then(() => console.log("MongoDB Connected"))
  .catch(err => console.log(err));

app.use(express.json()); 
app.use(express.static('public')); 


app.get('/', (req, res) => {
  res.send('<h2>Welcome! This is the default route served by Express.</h2>');
});

app.post('/api/items', async (req, res) => {
  const item = new Item(req.body);
  await item.save();
  res.status(201).send(item);
});


app.get('/api/items', async (req, res) => {
  const items = await Item.find();
  res.send(items);
});


app.put('/api/items/:id', async (req, res) => {
  const item = await Item.findByIdAndUpdate(req.params.id, req.body, { new: true });
  if (!item) return res.status(404).send('Item not found');
  res.send(item);
});


app.delete('/api/items/:id', async (req, res) => {
  const item = await Item.findByIdAndDelete(req.params.id);
  if (!item) return res.status(404).send('Item not found');
  res.send({ message: 'Item deleted' });
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
