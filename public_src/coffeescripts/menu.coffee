class Menu

	constructor: ->
		$( "nav#menu li" ).each ->
			if not $( @ ).hasClass "activated"
				new BasicButton( $( @ ).find( ".bt" ) )
			