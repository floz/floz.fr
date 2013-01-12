var projects = require( "../models/projects.js" );

/*
 * GET home page.
 */

exports.home = function(req, res){
	var featured = projects.getFeatured();
	res.render('index', { data: featured });
};

exports.works = function(req, res){
	res.render('works', { data: projects.get() });
};

exports.project = function( req, res ) {
	var id = req.params.id;
	if( projects.isValidProject( id ) ) {
		res.render('project', { data: projects.get( id ) } );
	}
	else {
		goTo404();
	}
};

function goTo404() {

}