`import config from '../../../config/environment'`

OrganizationsProjectsIndexController = Ember.ArrayController.extend
  needs: ['organizations/projects/new', 'organizations/projects/edit', 'organizations/projects/delete']

  init: ->
    @._super()
    @newController = @get('controllers.organizations/projects/new')
    @editController = @get('controllers.organizations/projects/edit')
    @deleteController = @get('controllers.organizations/projects/delete')

  actions:
    openNewProjectModal: ->
      self = @
      organizationId = @store.parent

      $.get(config.APP.HOST + '/' + organizationId + '/projects/new').then((response) ->
        self.newController.setOrganization(organizationId)
        self.send('openModal', 'projects/form', 'organizations/projects/new')
      ).fail((response) ->
        console.log 'You are not authorized'
      )

    openEditProjectModal: (project_id) ->
      self = @
      organizationId = @store.parent

      $.get(config.APP.HOST + '/' + organizationId + '/projects/' + project_id + '/edit').then((response) ->
        self.editController.setProject(project_id)
        self.send('openModal', 'projects/form', 'organizations/projects/edit')
      ).fail((response) ->
        console.log 'You are not authorized'
      )

    openDeleteProjectModal: (project_id) ->
      @deleteController.setProject(project_id)
      @send('openModal', 'projects/delete', 'organizations/projects/delete')


`export default OrganizationsProjectsIndexController`
