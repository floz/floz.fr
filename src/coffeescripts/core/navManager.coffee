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

		_onPopState: ( e ) =>
			console.log window.history.state
			if window.history.state == null
				@_initState()
				return

			window.history.replaceState( { path: window.history.state.path, url: window.history.state.url }, "", window.history.state.url ) if !window.history.state
			@_load()

		_initState: ->
			href = window.location.href
			splits = href.split( "/" )
			if splits.length <= 4
				window.history.replaceState( { path: "/ajax", url: href }, "", href )
			else
				projectName = splits.pop()
				window.history.replaceState( { path: "/projects_ajax/" + projectName, url: href }, "", href )

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
			if path == "/ajax" || path == "/"
				@signalOnHome.dispatch()
			else
				@signalOnProject.dispatch()


	_instance = null
	@get: ->
		_instance ?= new NavManager()