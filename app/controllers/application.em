class ApplicationController extends Ember.Controller
  init: ->
    @_super()

  actions:
    openSignUpModal: ->
      @send('openModal', 'sign-up', 'sign-up') 

    openLoginModal: ->
      @send('openModal', 'login', 'login')

`export default ApplicationController`