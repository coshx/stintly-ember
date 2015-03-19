`import config from '../../../config/environment'`

class OrganizationsProjectsDestroyController extends Ember.ObjectController
  #needs: ['organizations/projects/index']

  init: ->
    #@._super()
    #@indexController = @get('controllers.organizations/projects/index')
    #@organization_id = @indexController.store.parent
    #console.log 'initing!'
    #@set('model', @store.find('project'))
  
  actions:

    destroy: ->
      self = @
      @model.destroyRecord()
      self.send('closeModal')

      #@model.save().then((response) ->
      #  self.send('closeModal')
      #  self.indexController.model.unshiftObject(self.model)
      #).catch((response) ->
      #  self.flashManager.setModalFlash(response.responseJSON.error, 'error')
      #)
###
  validations:
    name:
      presence: true

    client:
      presence: true
###
`export default OrganizationsProjectsDestroyController`
