class Eye.LoginView extends Em.View
  tagName: 'form'
  submit: ->
    params = $(@).serializeToHash()
    @store.createRecord 'sessions', params
    false
