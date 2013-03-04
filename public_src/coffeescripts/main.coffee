$( document ).ready ->
	document.body.style.opacity = 1
	init()

init = ->
	show()
	new Menu()

show = ->
	do module.show for module in ModuleManager.modules

	$( ".animated" ).each ->
		$this = $( this )
		$this.removeClass "hide"
		$this.addClass "show"

	return