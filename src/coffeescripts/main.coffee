$( document ).ready ->
	console.log "bouboup"
	document.body.style.opacity = 1
	new Main()

class Main

	_menu: null
	_moduleManager: null

	_$footerH3: null

	constructor: ->
		@_menu = new Menu()		
		@_moduleManager = new ModuleManager()

		@_$footerH3 = $( "footer h3" )
		@_$footerH3.css { "top": @_$footerH3.height() }
		console.log @_$footerH3
		@_show()

	_show: ->
		# do module.show for module in ModuleManager.modules

		@_menu.show()
		@_moduleManager.show()

		TweenLite.to @_$footerH3, .4,
			top: 0
			delay: .5

		TweenLite.to $( "#main" ), .4, 
			opacity: 1

		return