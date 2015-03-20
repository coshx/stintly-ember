`import config from '../../../config/environment'`
`import EmberValidations from 'ember-validations'`

class OrganizationsPeopleNewController extends Ember.ObjectController with EmberValidations.Mixin
  needs: ['organizations/people/index']

  init: ->
    @._super()
    @indexController = @get('controllers.organizations/people/index')
    @organization_id = @indexController.store.parent
    @set('model', @store.createRecord('employee', parent: @organization_id))
  
  actions:

    submit: ->
      self = @

      @model.save().then((response) ->
        self.send('closeModal')
        self.indexController.model.unshiftObject(self.model)
      ).catch((response) ->
        console.log response
        self.flashManager.setModalFlash(response.responseJSON.error, 'error')
      )

  validations:
    name:
      presence: true

    title:
      presence: true

    hour_capacity:
      presence: true

`export default OrganizationsPeopleNewController`