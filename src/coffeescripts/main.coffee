$( document ).ready ->
	console.log "bouboup"
	document.body.style.opacity = 1
	new Main()

class Main

	constructor: ->
		new Home()
		new Project()

		menu = new Menu()
		menu.show()
		
		show()

	show = ->
		do module.show for module in ModuleManager.modules
		return