class ModuleManager

	_$body: null
	_navManager: null
	_currentModule: null

	constructor: ->
		@_$body = $( "body" )

		@_navManager = navManager.get()
		@_navManager.signalOnHome.add( @_onRubSwitch )
		@_navManager.signalOnProject.add( @_onRubSwitch )

	_onRubSwitch: =>
		if @_currentModule
			@_hideCurrentModule()
			return

		@_showNewModule()

	_showNewModule: =>
		if !@_navManager.onHome
			TweenLite.to window, .5,
				scrollTo: { y: 0 }
				easing: Quad.easeOut

		_currentModule = if @_navManager.onHome then new Home() else new Project()
		_currentModule.show( .2 )

	_hideCurrentModule: =>
		delay = _currentModule.hide()
		TweenLite.to this, delay,
			onComplete: @_showNewModule

	show: ->
		@_showNewModule()