# For more information see: http://emberjs.com/guides/routing/

Eye.Router.map ->
  @resource 'images', ->
    @route 'new', path: 'images/new'
    @route 'show', path: 'images/:id'
