`import config from '../config/environment'`
`import Saving from 'ember-easy-form-extensions/mixins/controllers/saving'`

LoginController = Ember.ObjectController.extend(
  Saving,
    validations:
      email:
        presence: true

      password:
        presence: true


  model: {}

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
)
`export default LoginController`