class HomeButton extends BasicButton

	_$btHome: null

	constructor: ( _$target ) ->
		super _$target

		@_$btHome = $( "#bt_home" )

		navManager.get().signalOnHome.add @_onHome
		navManager.get().signalOnProject.add @_onProject

		if @_$btHome.hasClass "activated"
			@_onHome()
		else	
			@_onProject()

	_onHome: =>
		@_deactivate()
		@_$btHome.addClass "activated"
		@_$btHome.unbind "click"
		@_$btHome.click @_onKillClick

	_onProject: =>
		@_activate()
		@_$btHome.removeClass "activated"
		@_$btHome.unbind "click"
		@_$btHome.click @_onClick
		@out()

	_onClick: ( e ) =>
		e.preventDefault()
		navManager.get().set( "/", "/ajax" )

	_onKillClick: ( e ) =>
		e.preventDefault()

	_deactivate: ->
		@_$target.unbind( "mouseenter mouseleave" )
