`import config from '../../../config/environment'`

class OrganizationsProjectsIndexController extends Ember.ArrayController  
  needs: ['organizations/projects/new', 'organizations/projects/edit', 'organizations/projects/delete']

  init: ->
    @._super()
    @newController = @get('controllers.organizations/projects/new')
    @editController = @get('controllers.organizations/projects/edit')
    @deleteController = @get('controllers.organizations/projects/delete')

  actions:
    openNewProjectModal: ->
      @newController.setOrganization(@model.store.parent)
      @send('openModal', 'projects/form', 'organizations/projects/new')

    openEditProjectModal: (project_id) ->
      @editController.setProject(project_id)
      @send('openModal', 'projects/form', 'organizations/projects/edit')

    openDeleteProjectModal: (project_id) ->
      @deleteController.setProject(project_id)
      @send('openModal', 'projects/delete', 'organizations/projects/delete')


`export default OrganizationsProjectsIndexController`
