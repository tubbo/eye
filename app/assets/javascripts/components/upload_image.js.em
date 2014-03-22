class Eye.UploadImage extends Em.Component
  tagName: 'form'
  attributeBindings: ['action', 'method']
  method: 'POST'
  action: '/images'

  # Create a new Image record with the data in the form.
  submit: ->
    @store.createRecord 'image', $(@).serializeHash()
    false
