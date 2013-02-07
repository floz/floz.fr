class ProjectPreview

	constructor: ( @target ) ->
		init()
		$( @target ).hover over, out

	init = ->
		@h3 = $( @target ).find "h3"
		@details = $( @target ).find ".details"

	over = ->
		console.log "over"

	out = ->
		console.log "out"
