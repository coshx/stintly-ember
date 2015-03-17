AuthService = {
  name: 'auth-service',
  initialize: (container, app) ->
    app.inject('route', 'authManager', 'service:authenticationManager')
    app.inject('controller', 'authManager', 'service:authenticationManager')
    app.inject('component', 'authManager', 'service:authenticationManager')
}

`export default AuthService`