class Eye.ImagesNewRoute extends Em.Route
  setupController: (controller) ->
    @transitionTo 'login' unless controller.currentUser?
