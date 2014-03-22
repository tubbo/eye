class Eye.ImageTypeSelect extends Em.Component
  tagName: 'select'
  attributeBindings: ['name']

  name: 'image[source]'

  choices: ~> @choiceNames.split(',')

  # Hide all choices and fade in the current choice as found by the
  # value attribute of this element.
  change: ->
    @_hideAll() and @_fadeInCurrent()

  _hideAll: -> $('.upload .choice').hide()

  _fadeInCurrent: -> $("##{@value}").fadeIn 250
