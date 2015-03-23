`import config from '../../../config/environment'`

class OrganizationsPeopleIndexController extends Ember.ArrayController  
  needs: ['organizations/people/new', 'organizations/people/edit', 'organizations/people/delete']

  init: ->
    @._super()
    @newController = @get('controllers.organizations/people/new')
    @editController = @get('controllers.organizations/people/edit')
    @deleteController = @get('controllers.organizations/people/delete')

  actions:
    openNewPersonModal: ->
      self = @
      organizationId = @store.parent

      $.get(config.APP.HOST + '/' + organizationId + '/employees/new').then((response) ->
        self.newController.setOrganization(organizationId)
        self.send('openModal', 'people/form', 'organizations/people/new')
      ).fail((response) ->
        console.log 'You are not authorized'
      )

    openEditPersonModal: (person_id) ->
      self = @
      organizationId = @store.parent
      
      $.get(config.APP.HOST + '/' + organizationId + '/employees/' + person_id + '/edit').then((response) ->
        self.editController.setPerson(person_id)
        self.send('openModal', 'people/form', 'organizations/people/edit')
      ).fail((response) ->
        console.log 'You are not authorized'
      )

    openDeletePersonModal: (person_id) ->
      @deleteController.setPerson(person_id)
      @send('openModal', 'people/delete', 'organizations/people/delete')


`export default OrganizationsPeopleIndexController`