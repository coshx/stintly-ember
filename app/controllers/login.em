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

  validations:
    identification:
      presence: true

    password:
      presence: true

`export default LoginController`