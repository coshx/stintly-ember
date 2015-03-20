`import config from '../../../config/environment'`

class OrganizationsProjectsDestroyController extends Ember.ObjectController
  needs: ['organizations/projects/index']

  init: ->
    @._super()
    @indexController = @get('controllers.organizations/projects/index')
    @project_id = @indexController.project_id
    @set('model', @store.getById('project', @project_id))

  actions:
    destroy: ->
      self = @
      @model.destroyRecord().then((response) ->
        self.send('closeModal')
        self.flashManager.setFlash("Successfully destroy the project", "success")
      )

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
