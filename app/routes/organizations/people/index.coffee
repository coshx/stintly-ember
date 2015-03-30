# `import AuthenticatedRoute from '../../../mixins/routes/authenticated-route'`

OrganizationPeopleIndexRoute = Ember.Route.extend
  model: (params, transition) ->
    @store.find('employee', parent: transition.params.organizations.id)
    
`export default OrganizationPeopleIndexRoute`