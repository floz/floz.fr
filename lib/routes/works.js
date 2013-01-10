var projects = require( "../models/projects.js" );


exports.index = function(req, res){
	res.render('works', { title: 'List of works' });
};

exports.project = function( req, res ) {
	console.log( projects.get() );
	console.log( req.params );
	res.render('project', { title: 'project' });
};