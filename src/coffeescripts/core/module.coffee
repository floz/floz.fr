class Module

	_$module: null

	constructor: ( moduleName ) ->
		@_$module = $( moduleName )

		for element in [ @_$module.find( ".scrolling_content" ) ]
			$element = $( element )
			$element.css { "top": $element.height() }

	show: ( delay ) ->
		@_showBot( delay + @_showTop() - .75 )

	hide: ->
		0

	_showTop: ( delay = 0 ) ->
		delay = @_showScrollingContents( @_$module.find( "article.top .scrolling_content" ), delay )

	_showBot: ( delay = 0 ) ->	
		delay = @_showScrollingContents( @_$module.find( "article.bot .scrolling_content" ), delay )

	_showScrollingContents: ( $cnt, delay = 0 ) ->
		contents = $cnt
		for element in contents
			TweenLite.to element, .4, { top: 0, delay: delay, ease: Quad.easeOut }
			delay += 0.075
		delay