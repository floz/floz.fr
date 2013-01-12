var projects = require( "../../data/projects.json" ).projects;

exports.get = function get( id ) {
	if( id != null )
	{
		var n = projects.length;
		for( var i = 0; i < n; i++ )
			if( projects[ i ].id == id )
				return projects[ i ];
	}
	return projects;
};

exports.getFeatured = function getFeatured() {
	var featured = [];
	var n = projects.length;
	for( var i = 0; i < n; i++ ) { 
		if( projects[ i ].featured == true )
 			featured.push( projects[ i ] );
	}
	return featured;
};

exports.isValidProject = function isValidProject( id ) {
	var n = projects.length;
	for( var i = 0; i < n; i++ ) {
		if( projects[ i ].id == id )
			return true;
	}
	return false;
}