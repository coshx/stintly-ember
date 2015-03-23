`import config from '../config/environment'`

class ApplicationRoute extends Ember.Route
  beforeModel: ->
    @._super()
    @authManager.authenticate()

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

    error: (err) ->
      if err.status == 401
        @flashManager.setFlash(err.responseText, 'danger')

        if err.responseText == "You are not authorized to perform this action."
          @transitionTo('home')
        else
          @transitionTo('home')

    sessionAuthenticationSucceeded: (arg) ->
      @send('closeModal')

    sessionAuthenticationFailed: (error) ->
      @flashManager.setModalFlash('Invalid email or password', 'error')


    openModal: (modalName, controller) ->
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