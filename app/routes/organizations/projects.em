`import AuthenticatedRoute from '../../mixins/routes/authenticated-route'`

class OrganizationProjectsRoute extends Ember.Route with AuthenticatedRoute
  model: (params, transition) ->

`export default OrganizationProjectsRoute`