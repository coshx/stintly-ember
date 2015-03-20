`import config from '../../../config/environment'`

class OrganizationsPeopleIndexController extends Ember.ArrayController  
  actions:
    openNewPersonModal: ->
      Ember.run.begin()
      @send('closeModal')
      Ember.run.end()

      @send('openModal', 'people/new', 'organizations/people/new')

`export default OrganizationsPeopleIndexController`