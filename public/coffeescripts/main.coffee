$( document ).ready ->
	init()

init = ->
	show()

show = ->
	do module.show for module in ModuleManager.modules

	$( ".animated" ).each ->
		$this = $( this )
		$this.removeClass "hide"
		$this.addClass "show"

	return