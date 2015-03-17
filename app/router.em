`import config from './config/environment'`

class Router extends Ember.Router
  location: config.locationType

Router.map ->
  @route 'home', path: '/'
  @route 'pricing', path: 'pricing'
  @route 'demo', path: 'demo'

  @resource 'organizations', path: '/organizations/:id', ->
    @route('dashboard', path: '/dashboard')
  
`export default Router`