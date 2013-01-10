var projects = require( "../../data/projects.json" );

exports.get = function get( callback ) {
	//callback( projects );
	return projects;
};