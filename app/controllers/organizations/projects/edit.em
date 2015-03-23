`import config from '../../../config/environment'`
`import EmberValidations from 'ember-validations'`

class OrganizationsProjectsEditController extends Ember.ObjectController with EmberValidations.Mixin
  setProject: (project_id) ->
    @set('model', @store.getById('project', project_id))

  actions:
    submit: ->
      self = @

      @model.save().then((response) ->
        self.send('closeModal')
      ).catch((response) ->
        self.flashManager.setModalFlash(response.responseJSON.error, 'error')
      )

  validations:
    name:
      presence: true

    client:
      presence: true

`export default OrganizationsProjectsEditController`
