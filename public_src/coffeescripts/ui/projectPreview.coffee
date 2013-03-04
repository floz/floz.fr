class ProjectPreview

	constructor: ( @target ) ->
		@$target = $( @target )
		@$project = @$target.find ".project"

		@projectTitle = new ProjectTitle( @$target.find ".cnt_project_title" )
		@projectImg = new ProjectImg( @$target.find( ".cnt_img" ), @$project )
		@layer = new ProjectLayer( @$target.find ".layer" )

		@init()

	init: ->
		@$projectHolder = @$target.find ".project_holder"

		@baseProjectWidth = @$target.width()
		@$project.css { opacity: 0 }

	over: =>
		@projectTitle.over()
		@layer.show()

	out: =>
		@projectTitle.out()
		@layer.hide()

	show: ( delay ) ->
		@projectImg.startLoad()
		@projectTitle.show delay
		delay += .2
		TweenLite.to @$project, .3, { autoAlpha: 1, delay: delay + .05, easing: Quad.easeOut }
		TweenLite.to @, delay + .4, { onComplete: @activate }

	activate: =>
		$( @target ).find( "a" ).hover @over, @out

class ProjectTitle

	constructor: ( @$title ) ->
		@$cnt = @$title.find ".cnt"
		@$txt = @$title.find ".project_title"

		@init()
	
	over: ->
		TweenLite.to @$title, .4, { backgroundColor: "#ff9c66", ease: Quad.easeOut }
		TweenLite.to @$txt, .4, { color: "#fff", ease: Quad.easeOut }

	out: ->
		TweenLite.to @$title, .4, { backgroundColor: "#ffffff", ease: Quad.easeIn }
		TweenLite.to @$txt, .4, { color: "#3d3944", ease: Quad.easeIn }

	init: ->
		@width = @$cnt.width()
		@$title.css { opacity: 0, width: @width * .4 }

	show: ( delay ) ->
		TweenLite.to @$title, .3, { opacity: 1, width: @width + 2, delay: delay, easing: Cubic.easeOut, onComplete: @onComplete }
		TweenLite.to @$txt, .3, { top: 0, delay: delay + .2, easing: Cubic.easeOut }

	onComplete: =>
		@$txt.css "width", "auto"

class ProjectImg

	widthImgOrigin: 0
	heightImgOrigin: 0

	constructor: ( @$cntImg, @$ref ) ->
		@img = new Image()
		@$img = $( @img )

	startLoad: ->
		@img.src = @$cntImg.attr( "data-url_img" )
		@$img.load( @onImageLoaded )
	
	onImageLoaded: =>
		@$img.css "opacity", 0
		@$cntImg.append( @img )
		@widthImgOrigin = @$img.width()
		@heightImgOrigin = @$img.height()

		$( window ).resize( @resize )
		@resize()

		TweenLite.to @img, .3, { autoAlpha: 1, easing: Quad.easeOut }

	resize: =>
		rw = @$ref.width() / @widthImgOrigin
		rh = @$ref.height() / @heightImgOrigin
		ratio = if ( rw > rh ) then rw else rh
		@$img.width( @widthImgOrigin * ratio )
		@$img.height( @heightImgOrigin * ratio )
		@$img.css( { top: @$ref.height() - @$img.height() >> 1, left: @$ref.width() - @$img.width() >> 1 })


class ProjectLayer 

	constructor: ( @$layer ) ->
		@details = new ProjectDetails( @$layer.find ".details" )

		@init()

	init: ->
		@$bg = @$layer.find ".background"
		@$btZoomCircle = @$layer.find ".circle"
		@$btZoomPlus = @$layer.find ".plus"
		@$bt = @$layer.find ".bt"
		@$btTxt = @$layer.find ".bt .txt"

		TweenLite.set @$btZoomCircle, { autoAlpha: 0, scale: .8 }
		TweenLite.set @$btZoomPlus, { autoAlpha: 0, scale: .8, autoAlpha: 0, rotation: 20 }
		TweenLite.set @$bt, { x: 20 }

	show: ( delay ) ->
		@killTweens()
		TweenLite.set @$btTxt, { top: 10 }
		TweenLite.to @$bg, .4, { autoAlpha: 1, easing: Cubic.easeOut }
		TweenLite.to @$btZoomCircle, .2, { autoAlpha: 1, scale: 1, delay: .2, easing: Cubic.easeOut }
		TweenLite.to @$btZoomPlus, .2, { autoAlpha: 1, scale: 1, rotation: 0, delay: .3, easing: Cubic.easeOut }
		TweenLite.to @$bt, .2, { x: 0, autoAlpha: 1, delay: .3, easing: Cubic.easeOut }
		TweenLite.to @$btTxt, .2, { top: 0, delay: .45, easing: Cubic.easeOut }
		@details.show()

	hide: ( delay ) ->
		@details.hide()
		@killTweens()
		TweenLite.to @$bg, .4, { autoAlpha: 0, delay: .2, easing: Cubic.easeIn }
		TweenLite.to @$btZoomCircle, .2, { autoAlpha: 0, scale: .8, delay: .05, easing: Cubic.easeIn }
		TweenLite.to @$btZoomPlus, .2, { autoAlpha: 0, scale: .8, rotation: 20, easing: Cubic.easeIn }
		TweenLite.to @$bt, .2, { x: 20, autoAlpha: 0, delay: .15, easing: Cubic.easeIn }
		TweenLite.to @$btTxt, .2, { top: 0, easing: Cubic.easeIn }

	killTweens: ->
		TweenLite.killTweensOf @$bg
		TweenLite.killTweensOf @$btZoomCircle
		TweenLite.killTweensOf @$btZoomPlus
		TweenLite.killTweensOf @$bt
		TweenLite.killTweensOf @$btTxt

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
