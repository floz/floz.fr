class ModuleManager

	@modules = []

	@register = ( module ) ->
		ModuleManager.modules.push module
