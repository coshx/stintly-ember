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

`export default OrganizationsProjectsDestroyController`
