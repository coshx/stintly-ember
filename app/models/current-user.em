`import Model from '../overrides/model'`

class CurrentUser extends Model
  email: DS.attr('string')
  authentication_token: DS.attr('string')

  +computed roles_with_organization
  firstOrganizationId: ->
    if @roles_with_organization[0]
      return @roles_with_organization[0].organization_id
  
`export default CurrentUser`
