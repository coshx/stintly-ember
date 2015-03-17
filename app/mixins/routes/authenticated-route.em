mixin AuthenticatedRoute
  beforeModel: (transition) ->
    if @authManager.currentUser is null
      @transitionTo('home')

`export default AuthenticatedRoute`