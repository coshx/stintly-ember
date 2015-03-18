`import AuthenticatedRoute from '../../mixins/routes/authenticated-route'`

class OrganizationProjectsRoute extends Ember.Route with AuthenticatedRoute
  model: (params, transition) ->
    @store.find('project', parent: transition.params.organizations.id)

`export default OrganizationProjectsRoute`
