`import config from '../../../config/environment'`
`import EmberValidations from 'ember-validations'`

class OrganizationsPeopleEditController extends Ember.ObjectController with EmberValidations.Mixin
  setPerson: (person_id) ->
    @set('model', @store.getById('employee', person_id))

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

    title:
      presence: true

    hour_capacity:
      presence: true

`export default OrganizationsPeopleEditController`
