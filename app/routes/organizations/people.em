`import AuthenticatedRoute from '../../mixins/routes/authenticated-route'`

class OrganizationPeopleRoute extends Ember.Route with AuthenticatedRoute
  model: (params, transition) ->
    @store.find('employee', parent: transition.params.organizations.id)

`export default OrganizationPeopleRoute`