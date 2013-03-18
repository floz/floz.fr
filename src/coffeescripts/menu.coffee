class Menu

	_bts: []

	constructor: ->
		bts = @_bts
		$( "nav#menu li" ).each ->
			if not $( @ ).hasClass "activated"
				bts[ bts.length ] = new BasicButton( $( @ ).find( ".bt" ) )

	show: ->
		for bt in @_bts
			bt.show()

	hide: ->
		for bt in @_bts
			bt.hide()
			