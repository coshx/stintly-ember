# `import EmberValidations from 'ember-validations'`
`import config from '../config/environment'`

class SignUpController extends Ember.ObjectController 
  # with EmberValidations.Mixin
  model: {}

  actions:
    openLoginModal: ->
      Ember.run.begin()
      @send('closeModal')
      Ember.run.end()

      @send('openModal', 'login', 'login')

    signUp: ->  
      self = @
      userParams = { user: { email: @model.email, organization_name: @model.organization_name, password: @model.password } }

      $.post(config.APP.HOST + "/users", userParams, (response) ->
        user = response.user
        self.authManager.setCurrentUser(user)
        self.authManager.setAjaxHeader(user.authenication_token, user.id)
        self.send('closeModal')
      ).error((response) ->
        error = response.responseJSON.users.join(", ")
        self.flashManager.setModalFlash(error, 'error')
      )

  validations:
    email:
      presence: true

    organization_name:
      presence: true

    password:
      presence: true
      confirmation: true

`export default SignUpController`