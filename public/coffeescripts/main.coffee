$( document ).ready ->
	do init

init = ->
	do show
	# home = new Home
	# home.init()

show = ->
	$( ".animated" ).each ->
		$this = $( this )
		$this.removeClass "hide"
		$this.addClass "show"