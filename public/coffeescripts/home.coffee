class Home

	init: ->
		for element in $( "article.top .content" )
			element = $( element )
			element.css { "top": element.height() }
		return

	show: ->
		delay = showTop()
		showBot( delay )

	showTop = ->
		delay = 0
		contents = $( "article.top .content" )
		for element in contents
			TweenLite.to element, .4, { top: 0, delay: delay, ease: Quad.easeOut }
			delay += 0.075
		delay

	showBot = ( delay ) ->
		console.log delay

	hide: ->

home = new Home
home.init()
$( document ).ready ->
	home.show()