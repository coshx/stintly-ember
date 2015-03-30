ApplicationController = Ember.Controller.extend
  init: ->
    @_super()

  currentUser: Ember.computed 'authManager.currentUser', ->
    return @authManager.currentUser

  actions:
    openSignUpModal: ->
      @send('openModal', 'sign-up', 'sign-up') 

    openLoginModal: ->
      @send('openModal', 'login', 'login')

    logout: ->
      @authManager.reset()

`export default ApplicationController`