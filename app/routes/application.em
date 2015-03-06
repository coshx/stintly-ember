`import config from '../config/environment'`

class ApplicationRoute extends Ember.Route
  actions:
    # willTransition: (transition) ->
      
    #   # keep flash for one transition if keep is true
    #   if @flashManager.get('keep')
    #     @flashManager.set('keep', false)
    #   # clear flash otherwise
    #   else
    #     @flashManager.clearFlash()

    #   @_super() 

    openModal: (modalName, controller) ->
      console.log 'here yo'
      Ember.run.begin()
      @render('modals/' + modalName, {
        into: 'application'
        outlet: 'modal'
        controller: controller
      })
      Ember.run.end()

      @flashManager.clearModalFlash()
      $('.ui.modal').modal('show')

    # closeModal: ->
    #   $(".modal").modal('hide')
    #   @send('disconnectModal')
      
      
    # disconnectModal: ->
    #   $('.ui.modal').remove()
    #   @disconnectOutlet(
    #     outlet: 'modal'
    #     parentView: 'application'
    #   )

`export default ApplicationRoute`