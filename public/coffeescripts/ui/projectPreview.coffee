class ProjectPreview

	constructor: ( @target ) ->
		@init()
		$( @target ).hover @over, @out
		# $( @target ).mouseover @over

	init: ->
		@$h3 = $( @target ).find "h3"
		@$project = $( @target ).find ".project"
		@$details = $( @target ).find ".details"

		@baseProjectHeight = @$project.height()
		@$project.css { "height": @baseProjectHeight - 50
					  , "opacity": 0 }

	over: =>
		console.log @$project
	out: =>
		console.log "out"

	show: ( delay ) ->
		TweenLite.to @$project, .4, { opacity: 1, height: @baseProjectHeight, delay: delay }
