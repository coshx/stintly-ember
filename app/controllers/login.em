`import config from '../config/environment'`
`import EmberValidations from 'ember-validations'`
`import LoginControllerMixin from 'simple-auth/mixins/login-controller-mixin'`

class LoginController extends Ember.ObjectController with EmberValidations.Mixin, LoginControllerMixin
  model: {}
  authenticator: 'simple-auth-authenticator:devise'

  actions:
    openSignUpModal: ->
      Ember.run.begin()
      @send('closeModal')
      Ember.run.end()

      @send('openModal', 'sign-up', 'sign-up')

    login: ->
      self = @
      userParams = { user: { email: @get('email').toLowerCase(), password: @get('password') } }

      $.post(config.APP.HOST + "/users/sign_in", userParams, (response) ->
        user = response.user
        self.authManager.setCurrentUser(user)
        self.authManager.setAjaxHeader(user.authentication_token, user.id)
        self.send('closeModal')
      ).fail((response) ->
        if response.status == 401
          self.flashManager.setModalFlash(response.responseJSON.error, 'error')
      )


  validations:
    email:
      presence: true

    password:
      presence: true

`export default LoginController`