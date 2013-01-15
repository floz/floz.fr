$ ->
	setTimeout init, 100
	#do init
	return

init = ->
	do show
	return

show = ->
	$( ".animated" ).each ->
		$this = $( this )
		$this.removeClass "hide"
		$this.addClass "show"
		return
