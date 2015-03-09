`import Resolver from 'ember/resolver'`
`import loadInitializers from 'ember/load-initializers'`
`import config from './config/environment'`
`import { setCsrfUrl } from 'rails-csrf/config'`

Ember.MODEL_FACTORY_INJECTIONS = true

class App extends Ember.Application
  modulePrefix: config.modulePrefix,
  podModulePrefix: config.podModulePrefix,
  Resolver: Resolver

setCsrfUrl(config.APP.HOST + '/csrf')
loadInitializers(App, config.modulePrefix)
loadInitializers(App, 'rails-csrf')

`export default App`
