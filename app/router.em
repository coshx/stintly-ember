`import config from './config/environment'`

class Router extends Ember.Router
  location: config.locationType

Router.map ->
  @route 'home', path: '/'
  @route 'pricing', path: 'pricing'
  @route 'demo', path: 'demo'

  @resource 'organizations', path: '/organizations/:id', ->
    @route('dashboard', path: '/dashboard')
    @route('people', path: '/people', ->
      @route('index', path: '/')
    )
    @route('projects', path: '/projects', ->
      @route('index', path: '/')
    )

`export default Router`