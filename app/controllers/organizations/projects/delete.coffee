`import config from '../../../config/environment'`

class OrganizationsProjectsDeleteController extends Ember.ObjectController
  setProject: (project_id) ->
    @set('model', @store.getById('project', project_id))

  actions:
    delete: ->
      self = @

      @model.destroyRecord().then((response) ->
        self.send('closeModal')
        self.flashManager.setFlash("Successfully deleted the project", "success")
      )

`export default OrganizationsProjectsDeleteController`
