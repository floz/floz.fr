class Home extends Module

	init: ->
		for element in [ $( ".scrolling_content" ) ]
			element = $( element )
			element.css { "top": element.height() }
		
		return

	show: ->
		showBot( showTop() - .75 )

	showTop = ->
		delay = 0
		contents = $( "article.top .scrolling_content" )
		for element in contents
			TweenLite.to element, .4, { top: 0, delay: delay, ease: Quad.easeOut }
			delay += 0.075
		delay

	showBot = ( delay ) ->
		$botTitle = $( "article.bot .scrolling_content" )
		TweenLite.to $botTitle, .4, { top: 0, delay: delay, ease: Quad.easeOut }

		delayAdd = .2
		$projects = $( "article.bot li" )
		for i in [0...$projects.length] by 1
			p = new ProjectPreview( $projects[ i ] )
			p.show delay + .1
			delay += delayAdd
			delayAdd *= .92
			if( delayAdd < .05 )
				delayAdd = .05

	hide: ->

new Home()