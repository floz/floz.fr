var projects = require( "../models/projects.js" );

/*
 * GET home page.
 */

exports.home = function(req, res){
	res.render('home', { data: projects.getFeatured(), navId: "about" });
};

exports.works = function(req, res){
	res.render('works', { data: projects.get(), navId: "works" });
};

exports.project = function( req, res ) {
	var id = req.params.id;
	if( projects.isValidProject( id ) ) {
		res.render('project', { data: projects.get( id ), navId: "works" } );
	}
	else {
		goTo404();
	}
};

function goTo404() {
	res.render('404', {} );
}