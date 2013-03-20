class BasicButton

	_$content: null

	constructor: ( @_$target ) ->
		@_activate()
		@_$target.css "opacity", 0
		@_$content = @_$target.find ".content"

	_activate: ->
		@_$target.hover( @over, @out )

	show: (delay = 0) ->
		TweenLite.to @_$target, .4, { opacity: 1, delay: delay }
		TweenLite.to @_$content, .25, { top: 0, delay: delay + .2, easing: Cubic.easeOut }

	hide: ->
		TweenLite.to @_$target, .4, { opacity: 0, delay: .2 }
		TweenLite.to @_$content, .2, { top: 0 }

	over: =>
		TweenLite.to @_$target, .2, { backgroundColor: "#ff9c66", ease: Quad.easeOut }
		TweenLite.to @_$content, .2, { color: "#ffffff", ease: Quad.easeOut }

	out: =>
		TweenLite.to @_$target, .2, { backgroundColor: "#ffffff", ease: Quad.easeOut }
		TweenLite.to @_$content, .2, { color: "#3d3944", ease: Quad.easeOut }