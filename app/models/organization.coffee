`import Model from '../overrides/model'`

Organization = Model.extend
  name: DS.attr('string')
  employees: DS.hasMany('employee')

`export default Organization`
