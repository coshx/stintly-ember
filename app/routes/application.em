`import config from '../config/environment'`
`import ApplicationRouteMixin from 'simple-auth/mixins/application-route-mixin'`

class ApplicationRoute extends Ember.Route with ApplicationRouteMixin
  beforeModel: ->
    @._super()

    return @csrf.fetchToken()

  actions:
    # willTransition: (transition) ->
      
    #   # keep flash for one transition if keep is true
    #   if @flashManager.get('keep')
    #     @flashManager.set('keep', false)
    #   # clear flash otherwise
    #   else
    #     @flashManager.clearFlash()

    #   @_super() 

    sessionAuthenticationSucceeded: (arg) ->
      @send('closeModal')

    sessionAuthenticationFailed: (error) ->
      @flashManager.setModalFlash('Invalid email or password', 'error')


    openModal: (modalName, controller) ->
      console.log 'session', @session
      Ember.run.begin()
      @render('modals/' + modalName, {
        into: 'application'
        outlet: 'modal'
        controller: controller
      })
      Ember.run.end()

      @flashManager.clearModalFlash()
      $('.ui.modal').modal('show')

    closeModal: ->
      $(".modal").modal('hide')
      @send('disconnectModal')
      
      
    disconnectModal: ->
      $('.ui.modal').remove()
      @disconnectOutlet(
        outlet: 'modal'
        parentView: 'application'
      )

`export default ApplicationRoute`