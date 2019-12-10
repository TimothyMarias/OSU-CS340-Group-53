var exp = require('exp');
var mysql = require('./dbcon.js');
var parser = require('body-parser');
console.log("main ran");
var app = exp();
var handlebars = require('exp-handlebars').create({
        defaultLayout:'main',
        });

app.engine('handlebars', handlebars.engine);
app.use(parser.urlencoded({extended:true}));
app.use('/static', exp.static('public'));
app.set('view engine', 'handlebars');
app.set('port', process.argv[2]);
app.set('mysql', mysql);
app.use('/movies', require('./movies.js'));
app.use('/people', require('./people.js'));
app.use('/', exp.static('public'));

app.use(function(request, response, next, error){
  console.error("Error: 500");
  response.status(500);
  response.render('500');
});

app.use(function(request,response){
  console.error("Error: 400");
  response.status(404);
  response.render('404');
});
