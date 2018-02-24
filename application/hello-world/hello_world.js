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
    pipeline_name: process.env.GO_PIPELINE_NAME,
    pipeline_counter: process.env.GO_PIPELINE_COUNTER,
    stage_name: process.env.GO_STAGE_NAME,
    stage_counter: process.env.GO_STAGE_COUNTER,
    job_name: process.env.GO_JOB_NAME
  })
})

var server = app.listen(process.env.SERVER_PORT, () => console.log(`Example app listening on port ${process.env.SERVER_PORT}!`))

exports.closeServer = function(){
  server.close();
};
