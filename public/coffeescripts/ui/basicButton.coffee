class BasicButton

	constructor: ( @target ) ->
		$( @target ).hover( over, out )

	show: ->
		console.log "show"

	hide: ->
		console.log "hide"

	over = ->
		TweenLite.to @, .2, { color: "#ffffff", backgroundColor: "#ff9c66", ease: Quad.easeOut }

	out = ->
		TweenLite.to @, .2, { color: "#3d3944", backgroundColor: "#ffffff", ease: Quad.easeOut }