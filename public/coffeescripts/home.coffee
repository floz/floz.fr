class Home extends Module

	init: ->
		for element in [ $( "article.top .content" ), $( "article.bot h4" ) ]
			element = $( element )
			element.css { "top": element.height() }
		
		return

	show: ->
		showBot( showTop() - .75 )

	showTop = ->
		delay = 0
		contents = $( "article.top .content" )
		for element in contents
			TweenLite.to element, .4, { top: 0, delay: delay, ease: Quad.easeOut }
			delay += 0.075
		delay

	showBot = ( delay ) ->
		$botTitle = $( "article.bot h4" )
		TweenLite.to $botTitle, .4, { top: 0, delay: delay, ease: Quad.easeOut }

		$projects = $( "article.bot li a" )
		p = new ProjectPreview( $projects )
		p.show delay + .1

	hide: ->

new Home