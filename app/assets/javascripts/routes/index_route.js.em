class Eye.IndexRoute extends Em.Route
  model: (params) -> @store.find 'image'
