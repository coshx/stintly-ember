`import Model from '../overrides/model'`

class Organization extends Model
  name: DS.attr('string')
  employees: DS.hasMany('employee')

`export default Organization`
