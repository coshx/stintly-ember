`import Model from '../overrides/model'`

class Project extends Model
  name: DS.attr('string')
  description: DS.attr('string')
  duration_weeks: DS.attr('number')
  start_date: DS.attr('date')
  client: DS.attr('string')
  created_at: DS.attr('date')
  updated_at: DS.attr('date')

`export default Project`
