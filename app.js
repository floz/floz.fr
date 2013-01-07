
/**
 * Module dependencies.
 */

var express = require('express')
  , stylus = require('stylus')
  , nib = require('nib')
  , routes = require('./routes')
  , user = require('./routes/user')
  , works = require('./routes/works')
  , project = require('./routes/project')
  , http = require('http')
  , path = require('path');

var app = express();

app.configure(function(){
  app.set('port', process.env.PORT || 3001);
  app.set('views', __dirname + '/views');
  app.set('view engine', 'jade');
  app.use(express.favicon());
  app.use(express.logger('dev'));
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(app.router);
  app.use(stylus.middleware( { src: path.join( __dirname, 'public' )
                             , compile: compile }) );
  app.use(express.static(path.join(__dirname, 'public')));
});

console.log( __dirname )

app.configure('development', function(){
  app.use(express.errorHandler());
});

app.get('/', routes.index);
app.get('/users', user.list);
app.get('/works', works.index);
app.get('/project', project.index);

http.createServer(app).listen(app.get('port'), function(){
  console.log("Express server listening on port " + app.get('port'));
});

function compile(str, path) {
  return stylus(str).set('filename', path)
                    .use(nib());
}
