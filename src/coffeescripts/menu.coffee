class Menu

	_$btHome: null

	constructor: ->
		console.log "menu"
		@_$btHome = new HomeButton( $( "#bt_home .bt" ) )

	show: ->
		@_$btHome.show()

	hide: ->
		@_$btHome.hide()
			