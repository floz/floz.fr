$( document ).ready ->
	document.body.style.opacity = 1
	new Main()

class Main
	constructor: ->
		history.pushState( { path: "/" }, "", "/" )

		new Home()
		new Project()

		menu = new Menu()
		menu.show()
		
		show()

	show = ->
		do module.show for module in ModuleManager.modules
		return