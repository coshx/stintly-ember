FlashService = {
  name: 'flash-service',
  initialize: (container, app) ->
    console.log 'yea!'
    app.inject('route', 'flashManager', 'service:flashManager')
    app.inject('controller', 'flashManager', 'service:flashManager')
    app.inject('component', 'flashManager', 'service:flashManager')
}

`export default FlashService`