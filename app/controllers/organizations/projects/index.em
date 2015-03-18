`import config from '../../../config/environment'`

class OrganizationsProjectsIndexController extends Ember.ArrayController  
  actions:
    openNewProjectModal: ->
      Ember.run.begin()
      @send('closeModal')
      Ember.run.end()

      @send('openModal', 'projects/new', 'organizations/projects/new')

`export default OrganizationsProjectsIndexController`