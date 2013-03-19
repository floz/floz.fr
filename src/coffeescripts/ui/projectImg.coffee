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