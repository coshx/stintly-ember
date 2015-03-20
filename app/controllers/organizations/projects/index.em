`import config from '../../../config/environment'`

class OrganizationsProjectsIndexController extends Ember.ArrayController  
  actions:
    openNewProjectModal: ->
      Ember.run.begin()
      @send('closeModal')
      Ember.run.end()

      @send('openModal', 'projects/new', 'organizations/projects/new')

    openEditProjectModal: (project_id) ->
      Ember.run.begin()
      @send('closeModal')
      Ember.run.end()
      @project_id = project_id
      @send('openModal', 'projects/edit', 'organizations/projects/edit')

    openDestroyProjectModal: (project_id) ->
      Ember.run.begin()
      @send('closeModal')
      Ember.run.end()
      @project_id = project_id
      @send('openModal', 'projects/destroy', 'organizations/projects/destroy')


`export default OrganizationsProjectsIndexController`
