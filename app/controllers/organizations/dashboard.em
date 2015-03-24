`import config from '../../config/environment'`

class OrganizationsDashboardController extends Ember.ObjectController
  needs: ["organizations/people/index"]

  init: ->
    @._super()

`export default OrganizationsDashboardController`

