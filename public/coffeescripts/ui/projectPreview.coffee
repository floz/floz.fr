class ProjectPreview

	constructor: ( @target ) ->
		@$target = $( @target )
		@projectTitle = new ProjectTitle( @$target.find ".project_title" )

		@init()

		$( @target ).find( "a" ).hover @over, @out

	init: ->
		@$project = @$target.find ".project"
		@$details = @$target.find ".details"
		@$img = @$target.find "img"

		@baseProjectHeight = @$target.height()
		@$target.css { height: @baseProjectHeight * .6 }
		@$project.css { opacity: 0 }
		@$img.css { opacity: 0 }

	over: =>
		console.log @$project
	out: =>
		console.log "out"

	show: ( delay ) ->
		@projectTitle.show delay
		delay += .2
		TweenLite.to @target, .3, { height: @baseProjectHeight, delay: delay, easing: Cubic.easeOut }
		TweenLite.to @$project, .3, { autoAlpha: 1, delay: delay, easing: Cubic.easeOut }
		TweenLite.to @$img, .4, { autoAlpha: 1, delay: delay + .3, easing: Quad.easeOut }

class ProjectTitle

	constructor: ( @$bg ) ->
		@$text = @$bg.find "h3"

		@width = @$bg.width()
		@$bg.css { opacity: 0, width: @width * .4 }
		@$text.css { opacity: 0 }

	show: ( delay ) ->
		TweenLite.to @$bg, .4, { autoAlpha: 1, delay: delay, width: @width + 10 }
		TweenLite.to @$text, .4, { autoAlpha: 1, delay: delay + .3 }

		# tl = new TimelineLite()
		# tl.to @$text, .4, { width: @width + 10, delay: delay }
		# tl.to @$text, .4, { autoAlpha: 1 }
