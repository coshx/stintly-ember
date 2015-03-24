`import AuthenticatedRoute from '../../mixins/routes/authenticated-route'`

class OrganizationDashboardRoute extends Ember.Route with AuthenticatedRoute
  model: (params, transition) ->
    @store.find('organization', id: transition.params.organizations.id, action: 'dashboard')

  setupController: (controller, model) ->
    @._super(controller, model)
    controller.set('people', model.employees)

`export default OrganizationDashboardRoute`
