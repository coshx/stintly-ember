class ApplicationController extends Ember.Controller
  init: ->
    @_super()

  +computed authManager.currentUser
  currentUser: ->
    @authManager.currentUser

  actions:
    openSignUpModal: ->
      @send('openModal', 'sign-up', 'sign-up') 

    openLoginModal: ->
      @send('openModal', 'login', 'login')

    logout: ->
      @authManager.reset()

`export default ApplicationController`