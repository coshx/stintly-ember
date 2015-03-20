`import config from '../../../config/environment'`
`import EmberValidations from 'ember-validations'`

class OrganizationsProjectsNewController extends Ember.ObjectController with EmberValidations.Mixin
  needs: ['organizations/projects/index']

  init: ->
    @._super()
    @indexController = @get('controllers.organizations/projects/index')
    @organization_id = @indexController.store.parent
    console.log 'initing!'
    @set('model', @store.createRecord('project', parent: @organization_id))
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
