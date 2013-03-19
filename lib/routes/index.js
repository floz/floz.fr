var projects = require( "../models/projects.js" );

/*
 * GET home page.
 */

exports.home = function(req, res){
	loadHome( "home", req, res );
};

exports.layoutHome = function( req, res ) {
	loadHome( "layoutHome", req, res );
}

loadHome = function( templateName, req, res ) {
	res.render( templateName, { data: projects.get(), navId: "home" } );
}

exports.project = function( req, res ) {
	loadProject( "project", req, res );
};

exports.layoutProject = function( req, res ) {
	loadProject( "layoutProject", req, res );
};

loadProject = function( templateName, req, res ) {
	var id = req.params.id;
	if( projects.isValidProject( id ) ) {
		res.render( templateName, { data: projects.get( id ), navId: "works" } );
	}
	else {
		res.render('404', {} );
	}
};