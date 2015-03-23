`import config from '../../../config/environment'`
`import EmberValidations from 'ember-validations'`

class OrganizationsProjectsNewController extends Ember.ObjectController with EmberValidations.Mixin
  needs: ['organizations/people/index']

  setOrganization: (organization_id) ->
    @set('model', @store.createRecord('project', parent: organization_id))

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
    duration_weeks:
      numericality:
        allowBlank: true

`export default OrganizationsProjectsNewController`
