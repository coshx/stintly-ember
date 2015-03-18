`import AuthenticatedRoute from '../../mixins/routes/authenticated-route'`

class OrganizationProjectsRoute extends Ember.Route with AuthenticatedRoute
  model: (params, transition) ->
  
  setupController: (controller, model) ->
    controller.set('organization', model)

`export default OrganizationProjectsRoute`
