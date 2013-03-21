$( document ).ready ->
	console.log "bouboup"
	document.body.style.opacity = 1
	new Main()

class Main

	_menu: null
	_moduleManager: null

	constructor: ->
		@_menu = new Menu()		
		@_moduleManager = new ModuleManager()

		@_show()

	_show: ->
		# do module.show for module in ModuleManager.modules

		@_menu.show()
		@_moduleManager.show()

		TweenLite.to $( "#main" ), .4, 
			opacity: 1

		return