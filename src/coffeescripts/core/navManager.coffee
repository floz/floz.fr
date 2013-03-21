class navManager

	class NavManager

		signalOnHome: null
		signalOnProject: null

		_$mainContent: null
		_isLoading: false
		_initialized: false

		onHome: false

		constructor: ->
			@signalOnHome = new signals.Signal()
			@signalOnProject = new signals.Signal()

			@_$mainContent = $( "#main_content" )
			@_initState()

		_initState: ->
			href = window.location.href
			splits = href.split( "/" )

			if splits.length <= 4
				path = "/ajax"
			else
				projectName = splits.pop()
				path = "/projects_ajax/" + projectName

			window.history.replaceState( { path: path, url: href }, "", href )
			@_checkCurrentRub( path, false )

		set: ( url, urlAjax ) ->
			if not @_initialized
				$( window ).bind( "popstate", @_onPopState )
				@_initialized = true

			if @_isLoading
				return
			
			if window.history.state
				if window.history.state.path == urlAjax
					return

			window.history.pushState( { path: urlAjax, url: url }, "", url )
			@_load()

		_onPopState: ( e ) =>
			console.log window.history.state
			if window.history.state == null
				@_initState()
				return

			window.history.replaceState( { path: window.history.state.path, url: window.history.state.url }, "", window.history.state.url ) if !window.history.state
			@_load()

		_load: ->
			@_isLoading = true

			path = window.history.state.path
			$.ajax
				url: path
				success: @_onLoadSuccess

		_onLoadSuccess: ( data ) =>
			@_$mainContent.html data
			@_dispachCurrentRub()
			@_isLoading = false

		_dispachCurrentRub: ->
			path = window.history.state.path
			@_checkCurrentRub( path )

		_checkCurrentRub: ( path, andDispatch = true ) ->
			if path == "/ajax" || path == "/"
				@onHome = true
				@signalOnHome.dispatch() if andDispatch
			else
				@onHome = false
				@signalOnProject.dispatch() if andDispatch


	_instance = null
	@get: ->
		_instance ?= new NavManager()