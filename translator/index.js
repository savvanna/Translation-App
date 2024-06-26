


const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send({ message: 'Привет, мир!' });
});

app.use(express.static('build'));

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log(`Сервер запущен на порту ${PORT}`);
});
