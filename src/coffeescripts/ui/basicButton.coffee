class BasicButton

	constructor: ( @_$target ) ->
		@_activate()
		@_$target.css "opacity", 0

	_activate: ->
		@_$target.hover( @over, @out )

	show: (delay = 0) ->
		TweenLite.to @_$target, .4, { opacity: 1, delay: delay }

	hide: ->
		TweenLite.to @_$target, .4, { opacity: 0 }

	over: =>
		TweenLite.to @_$target, .2, { color: "#ffffff", backgroundColor: "#ff9c66", ease: Quad.easeOut }

	out: =>
		TweenLite.to @_$target, .2, { color: "#3d3944", backgroundColor: "#ffffff", ease: Quad.easeOut }