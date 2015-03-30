`import Model from '../overrides/model'`

CurrentUser = Model.extend
  email: DS.attr('string')
  authentication_token: DS.attr('string')

  firstOrganizationId: Ember.computed 'roles_with_organization', ->
    if @roles_with_organization[0]
      return @roles_with_organization[0].organization_id
  
`export default CurrentUser`
