`import EmberValidations from 'ember-validations'`

class PersonRow extends Ember.Component with EmberValidations
  classNames: ['person']
  
  didInsertElement: ->
    console.log 'inserted!'
    console.log @person.name
    console.log @
    @content = @person

  actions:
    renderNewPersonForm: ->
      $('#new-person-form').css('display', 'block')
      $('#new-person-button').css('display', 'none')

  validations: {
    'content.name': {
      presence: true
    }
  }

`export default PersonRow`