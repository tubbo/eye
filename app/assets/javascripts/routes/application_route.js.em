class Eye.ApplicationRoute extends Em.Route
  setupController: (controller, model) ->
    controller.model = model
    userID = $('meta[name="current-user"]').val()
    controller.currentUser = @store.find('user', id: userID) if userID?
