`import config from '../../../config/environment'`

class OrganizationsPeopleDeleteController extends Ember.ObjectController
  setPerson: (person_id) ->
    @set('model', @store.getById('employee', person_id))

  actions:
    delete: ->
      self = @

      @model.destroyRecord().then((response) ->
        self.send('closeModal')
        self.flashManager.setFlash("Successfully deleted the employee", "success")
      )

`export default OrganizationsPeopleDeleteController`
