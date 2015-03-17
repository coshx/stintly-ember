`import AuthenticatedRoute from '../../mixins/routes/authenticated-route'`

class OrganizationPeopleRoute extends Ember.Route with AuthenticatedRoute
  model: (params, transition) ->

`export default OrganizationPeopleRoute`