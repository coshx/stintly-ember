`import config from '../../config/environment'`

class OrganizationsDashboardController extends Ember.ObjectController

  disabled: (->
    Ember.isEmpty @get('newName')
  ).property('newName')

  actions:
    renderNewPersonForm: ->
      console.log 'hmm?'

    createPerson: ->
      self = @
      newPerson =
        parent: @model.id
        name: @get('newName')
        title: @get('newTitle')
        hour_capacity: @get('newCapacity')
      @person = @store.createRecord('employee', newPerson)
      @person.save()
      @people.unshiftObject(@person)
      @set('newName', '')
      @set('newTitle', '')
      @set('newCapacity', '')

  validations:
    name:
      presence: true

`export default OrganizationsDashboardController`

