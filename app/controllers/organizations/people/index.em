`import config from '../../../config/environment'`

class OrganizationsPeopleIndexController extends Ember.ArrayController  
  actions:
    openNewPersonModal: ->
      self = @

      $.get(config.APP.HOST + '/' + @store.parent + '/employees/new').then((response) ->
        self.send('openModal', 'people/new', 'organizations/people/new')
      ).fail((response) ->
        console.log 'You are not authorized'
      )

`export default OrganizationsPeopleIndexController`