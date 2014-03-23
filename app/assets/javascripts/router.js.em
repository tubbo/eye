# For more information see: http://emberjs.com/guides/routing/

Eye.Router.map ->
  @resource 'images', ->
    @route 'new', path: 'new'
    @route 'show', path: ':id'
  @route 'login', path: '/login'
