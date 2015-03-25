`import AuthenticatedRoute from '../../mixins/routes/authenticated-route'`

class OrganizationDashboardRoute extends Ember.Route with AuthenticatedRoute
  model: (params, transition) ->
    @organizationId = transition.params.organizations.id
    @store.find('organization', id: @organizationId, action: 'dashboard')

  setupController: (controller, model) ->
    @._super(controller, model)
    controller.set('people', model.employees)
    controller.set('new_person', @store.createRecord('employee', parent: @organizationId))

`export default OrganizationDashboardRoute`
