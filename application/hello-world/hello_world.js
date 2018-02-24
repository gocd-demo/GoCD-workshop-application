const express = require('express')
const app = express()
const path = require('path')
const exphbs = require('express-handlebars')


app.engine('.hbs', exphbs({
  defaultLayout: 'main',
  extname: '.hbs',
  layoutsDir: path.join(__dirname, 'views/layouts')

}))
app.use(express.static("public"));
app.set('view engine', '.hbs')
app.set('views', path.join(__dirname, 'views'))

app.get('/', (request, response) => {
  response.render('home', {
    server_url: process.env.GO_SERVER_URL
  })
})

var server = app.listen(3000, () => console.log('Example app listening on port 3000!'))

exports.closeServer = function(){
  server.close();
};
