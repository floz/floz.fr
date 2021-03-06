
/**
 * Module dependencies.
 */

var express = require('express')
  , stylus = require('stylus')
  , nib = require('nib')
  , routes = require('./lib/routes')
  , http = require('http')
  , path = require('path');

var app = express();

app.configure(function(){
  app.set('port', process.env.PORT || 8080);
  app.set('views', __dirname + '/views');
  app.set('view engine', 'jade');
  app.use(express.favicon());
  app.use(express.logger('dev'));
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(app.router);
  app.use(stylus.middleware( { src: path.join( __dirname, '/src' )
                             , dest: path.join( __dirname, '/public' )
                             , compile: compile }) );
  app.use(express.static(path.join(__dirname, 'public')));
});

app.configure('development', function(){
  app.use(express.errorHandler());
});

app.get('/', routes.layoutHome);
app.get('/ajax', routes.home);
app.get('/projects/:id?', routes.layoutProject);
app.get('/projects_ajax/:id?', routes.project);

http.createServer(app).listen(app.get('port'), function(){
  console.log("Express server listening on port " + app.get('port'));
});

function compile(str, path) {
  return stylus(str).set('filename', path)
                    .use(nib());
}
