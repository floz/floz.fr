class BasicButton

	constructor: ( @target ) ->
		console.log @target
		$( @target ).hover( over, out )
		$( @target ).css "opacity", 0

	show: (delay = 0) ->
		TweenLite.to @target, .4, { opacity: 1, delay: delay }

	hide: ->
		TweenLite.to @target, .4, { opacity: 0 }

	over = ->
		TweenLite.to @, .2, { color: "#ffffff", backgroundColor: "#ff9c66", ease: Quad.easeOut }

	out = ->
		TweenLite.to @, .2, { color: "#3d3944", backgroundColor: "#ffffff", ease: Quad.easeOut }