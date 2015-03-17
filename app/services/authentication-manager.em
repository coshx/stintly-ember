`import config from '../config/environment'`

class AuthenticationManager extends Ember.Object
  authentication: null
  currentUser: null

  # Load the current user if the cookies exist and is valid
  init: ->
    @_super()

  # Set current user and authentication
  setCurrentUser: (user) ->
    @currentUser = @store.createRecord('current_user', user)

  # Set up ajax header to be sent with every ajax request
  setAjaxHeader: (authenticationToken, userId) ->
    $.ajaxSetup(headers: { "X-User-Token": userId + ":" + authenticationToken })

  # Authenticate the user. Once they are authenticated, set the access token to be submitted with all
  # future AJAX requests to the server.
  authenticate: () ->
    authenticationToken = localStorage.getItem("authentication_token")
    userId = localStorage.getItem("user_id")
    self = @

    if authenticationToken != "null" and userId != "null"
      @setAjaxHeader(authenticationToken, userId)

      return $.get(config.APP.HOST + '/users/' + userId).then((response) ->
        self.setCurrentUser(response.user)
      ).fail((response) ->
        localStorage.setItem("user_id", null)
        localStorage.setItem("authentication_token", null)
      )

    return

  # Log out the user
  reset: ->
    Ember.run.sync()
    self = @

    Ember.run.next ->
      currentUser = self.store.getById('current_user', self.currentUser.id)
      self.store.unloadRecord(currentUser)
      self.set("currentUser", null)
      $.ajaxSetup(headers: { "X-User-Token": null })

      return

    return

  # Ensure that when the current user changes, we store the data in localStorage
  # in order for us to load the user when the browser is refreshed
  +observer currentUser
  currentUserObserver: (->
    if @currentUser.authentication_token and @currentUser.id
      localStorage.setItem("authentication_token", @currentUser.authentication_token)
      localStorage.setItem("user_id", @currentUser.id)
    else
      localStorage.removeItem("authentiation_token")
      localStorage.removeItem("user_id")
  )

`export default AuthenticationManager`

# Reset the authentication if any ember data request returns a 401 unauthorized error
# DS.rejectionHandler = (reason) ->
#   App.AuthenticationManager.reset() if reason.status is 401
#   throw reasonreturn
