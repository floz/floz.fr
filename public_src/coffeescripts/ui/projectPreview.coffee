class ProjectPreview

	constructor: ( @target ) ->
		@$target = $( @target )
		@layer = new ProjectLayer( @$target.find ".layer" )
		@projectTitle = new ProjectTitle( @$target.find ".project_title" )

		@init()

	init: ->
		@$projectHolder = @$target.find ".project_holder"
		@$project = @$target.find ".project"
		@$img = @$target.find "img"

		@baseProjectWidth = @$target.width()
		@$project.css { width: @baseProjectWidth * .6, opacity: 0 }
		@$img.css { opacity: 0, left: -10 }

	over: =>
		@layer.show()

	out: =>
		@layer.hide()

	show: ( delay ) ->
		@projectTitle.show delay
		delay += .2
		TweenLite.to @$project, .3, { width: @baseProjectWidth, autoAlpha: 1, delay: delay + .05, easing: Quad.easeOut }
		TweenLite.to @$img, .3, { autoAlpha: 1, left:0, delay: delay + .1, easing: Quad.easeOut, onComplete: @activate }

	activate: =>
		$( @target ).find( "a" ).hover @over, @out

class ProjectTitle

	constructor: ( @$title ) ->
		@$cnt = @$title.find ".cnt"
		@$txt = @$title.find "h3"

		@init()
		
	init: ->
		@width = @$title.width()
		@$title.css { opacity: 0, width: @width * .4 }

	show: ( delay ) ->
		TweenLite.to @$title, .3, { autoAlpha: 1, width: @width + 2, delay: delay, easing: Cubic.easeOut }
		TweenLite.to @$txt, .3, { top: 0, delay: delay + .2, easing: Cubic.easeOut }

class ProjectLayer 

	constructor: ( @$layer ) ->
		@details = new ProjectDetails( @$layer.find ".details" )

		@init()

	init: ->
		@$bg = @$layer.find ".background"
		@$btZoomCircle = @$layer.find ".circle"
		@$btZoomPlus = @$layer.find ".plus"
		@$bt = @$layer.find ".bt"

		TweenLite.set @$btZoomCircle, { autoAlpha: 0, scale: .8 }
		TweenLite.set @$btZoomPlus, { autoAlpha: 0, scale: .8, autoAlpha: 0, rotation: 20 }
		TweenLite.set @$bt, { x: 20 }

	show: ( delay ) ->
		@killTweens()
		TweenLite.to @$bg, .4, { autoAlpha: 1, easing: Cubic.easeOut }
		TweenLite.to @$btZoomCircle, .2, { autoAlpha: 1, scale: 1, delay: .2, easing: Cubic.easeOut }
		TweenLite.to @$btZoomPlus, .2, { autoAlpha: 1, scale: 1, rotation: 0, delay: .3, easing: Cubic.easeOut }
		TweenLite.to @$bt, .2, { x: 0, autoAlpha: 1, delay: .3, easing: Cubic.easeOut }
		@details.show()

	hide: ( delay ) ->
		@details.hide()
		@killTweens()
		TweenLite.to @$bg, .4, { autoAlpha: 0, delay: .2, easing: Cubic.easeIn }
		TweenLite.to @$btZoomCircle, .2, { autoAlpha: 0, scale: .8, delay: .05, easing: Cubic.easeIn }
		TweenLite.to @$btZoomPlus, .2, { autoAlpha: 0, scale: .8, rotation: 20, easing: Cubic.easeIn }
		TweenLite.to @$bt, .2, { x: 20, autoAlpha: 0, easing: Cubic.easeIn }

	killTweens: ->
		TweenLite.killTweensOf @$bg
		TweenLite.killTweensOf @$btZoomCircle
		TweenLite.killTweensOf @$btZoomPlus
		TweenLite.killTweensOf @$bt

class ProjectDetails

	constructor: ( @$details ) ->
		@$cnt = @$details.find ".cnt"
		@$txt = @$details.find ".txt"

	show: ( delay ) ->
		TweenLite.to @$details, .2, { bottom: 0, easing: Cubic.easeOut }
		TweenLite.to @$txt, .2, { top: 0, delay: .25, easing: Cubic.easeOut }

	hide: ( delay ) ->
		TweenLite.to @$details, .3, { bottom: -40, easing: Cubic.easeIn, delay: .15 }
		TweenLite.to @$txt, .2, { top: 11, easing: Cubic.easeIn }
