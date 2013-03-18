class Home extends Module

	constructor: ->
		super "#home"

		for element in @_$module.find( ".scrolling_content" )
			$element = $( element )
			$element.css { "top": $element.height() }
		
		return

	_showBot: ( delay = 0 ) ->
		super delay

		delayAdd = .2
		$projects = @_$module.find( "article.bot li" )
		for project in $projects
			$project = $( project )

			p = new ProjectPreview( $project )
			p.show delay + .1
			delay += delayAdd
			delayAdd *= .92
			if( delayAdd < .05 )
				delayAdd = .05

			$project.find( "a" ).click( @_onProjectClick )

	_onProjectClick: ( e ) =>
		e.preventDefault()
		href = e.currentTarget.href
		projectName = href.split( "/" ).pop()
		history.pushState( {path: href}, "", href )
		$.ajax( { url: "/projects_ajax/" + projectName, success: @_onPageLoadSuccess } )

	_onPageLoadSuccess: ( data ) =>
		$( "#main_content" ).html( data )