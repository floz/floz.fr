class Project extends Module

	_btVisit: null
	_$scrolling_content: null
	_$lis: null
	_$imgs: null
	_$articleBot: null

	constructor: ->
		super "#project"

		@_btVisit = new BasicButton( $( "#bt_visit .bt" ) )

		$holder = @_$module.find( "#project_description .holder" )
		$holder.css
			"overflow": "hidden"
			"height": $holder.height()

		@_$scrolling_content = @_$module.find( "#project_description .scrolling_content" )
		for element in @_$scrolling_content
			$element = $( element )
			$element.css 
				"top": $holder.height()
				"position": "absolute"

		@_$lis = @_$module.find( "#diaporama li" )
		@_$imgs = @_$module.find( "#diaporama li .img" )
		for img in @_$imgs
			$img = $( img )
			p = new ProjectImg( $( img ).find( ".cnt_img" ), $img )
			p.startLoad()

		@_$articleBot = @_$module.find( "article.bot" )
		@_$articleBot.css "opacity", 0

	_showTop: ( delay = 0 ) ->
		delay = super delay
		@_btVisit.show( delay - .3 )
		delay

	_showBot: ( delay = 0 ) ->
		TweenLite.to @_$articleBot, .4, { opacity: 1, delay: delay + .75}
		

