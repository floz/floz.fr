class ProjectPreview

	constructor: ( @target ) ->
		@$target = $( @target )
		@projectTitle = new ProjectTitle( @$target.find ".project_title" )

		@init()

	init: ->
		@$projectHolder = @$target.find ".project_holder"
		@$project = @$target.find ".project"
		@$details = @$target.find ".details"
		@$detailsText = @$details.find "span"
		@$img = @$target.find "img"

		@baseProjectWidth = @$target.width()
		@$project.css { width: @baseProjectWidth * .6, opacity: 0 }
		@$img.css { opacity: 0, left: -10 }

	over: =>
		TweenLite.to @$details, .3, { bottom: 0, easing: Quad.easeOut }
		TweenLite.to @$detailsText, .3, { autoAlpha: 1, delay: .2, easing: Quad.easeOut }

	out: =>
		TweenLite.to @$details, .3, { bottom: -40, easing: Quad.easeIn, delay: .1 }
		TweenLite.to @$detailsText, .3, { autoAlpha: 0, easing: Quad.easeIn }

	show: ( delay ) ->
		@projectTitle.show delay
		delay += .2
		TweenLite.to @$project, .3, { width: @baseProjectWidth, autoAlpha: 1, delay: delay + .05, easing: Quad.easeOut }
		TweenLite.to @$img, .3, { autoAlpha: 1, left:0, delay: delay + .1, easing: Quad.easeOut, onComplete: @activate }

	activate: =>
		$( @target ).find( "a" ).hover @over, @out


class ProjectTitle

	constructor: ( @$bg ) ->
		@$text = @$bg.find "h3"

		@width = @$bg.width()
		@$bg.css { opacity: 0, width: @width * .4 }
		@$text.css { opacity: 0 }

	show: ( delay ) ->
		TweenLite.to @$bg, .4, { autoAlpha: 1, delay: delay, width: @width + 10 }
		TweenLite.to @$text, .4, { autoAlpha: 1, delay: delay + .3 }
