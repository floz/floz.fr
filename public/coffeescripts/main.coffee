$( document ).ready ->
	do init

init = ->
	do show

show = ->
	$( ".animated" ).each ->
		$this = $( this )
		$this.removeClass "hide"
		$this.addClass "show"