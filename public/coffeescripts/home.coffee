class Home

	init: ->

	show: ->
		do showTop

	showTop = ->
		delay = 0
		contents = $( "article.top" ).find ".content"
		for element in contents
				TweenLite.to element, .4, { top: 0, delay: delay, ease: Quad.easeOut }
				delay += 0.075
			return

	hide: ->

$( document ).ready ->
	home = new Home
	do home.show