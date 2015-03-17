DataStoreService = {
  name: 'data-store-service',
  initialize: (container, app) ->
    app.inject('service:authenticationManager', 'store', 'store:main')
}

`export default DataStoreService`