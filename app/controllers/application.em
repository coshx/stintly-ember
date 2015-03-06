class ApplicationController extends Ember.Controller
  init: ->
    @_super()

  actions:
    openSignUpModal: ->
      @send('openModal', 'sign-up', 'sign-up') 

`export default ApplicationController`