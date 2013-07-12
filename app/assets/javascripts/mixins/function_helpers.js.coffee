class App.Mixins.FunctionHelper

	setFocus: (selector) ->
		setTimeout( => 
			$(selector).focus()
		, 100) 