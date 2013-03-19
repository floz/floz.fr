class navManager

	class NavManager

		_$mainContent: null

		constructor: ->
			@_$mainContent = $( "#main_content" )
			$( window ).bind( "popstate", @_onPopState )

		_onPopState: ( e ) =>
			window.history.replaceState( { path: "/ajax" }, "", "/" ) if !window.history.state
			@_load()

		set: ( url, urlAjax ) ->
			window.history.pushState( { path: urlAjax }, "", url )
			@_load()

		_load: ->
			path = window.history.state.path
			$.ajax
				url: path#if path != "/" then path else "/ajax"
				success: @_onLoadSuccess

		_onLoadSuccess: ( data ) =>
			console.log window.history.state
			@_$mainContent.html data


	_instance = null
	@get: ->
		_instance ?= new NavManager()