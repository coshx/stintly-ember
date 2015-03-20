`import config from '../../../config/environment'`
`import EmberValidations from 'ember-validations'`

class OrganizationsProjectsNewController extends Ember.ObjectController with EmberValidations.Mixin
  needs: ['organizations/projects/index']

  init: ->
    @._super()
    @indexController = @get('controllers.organizations/projects/index')
    @project_id = @indexController.project_id
    @set('model', @store.getById('project', @project_id))

  actions:
    submit: ->
      self = @

      @model.save().then((response) ->
        self.send('closeModal')
        self.indexController.model.unshiftObject(self.model)
      ).catch((response) ->
        self.flashManager.setModalFlash(response.responseJSON.error, 'error')
      )

  validations:
    name:
      presence: true

    client:
      presence: true

`export default OrganizationsProjectsNewController`
