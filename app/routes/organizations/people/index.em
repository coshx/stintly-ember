`import AuthenticatedRoute from '../../../mixins/routes/authenticated-route'`

class OrganizationPeopleIndexRoute extends Ember.Route with AuthenticatedRoute
  model: (params, transition) ->
    @store.find('employee', parent: transition.params.organizations.id)

`export default OrganizationPeopleIndexRoute`