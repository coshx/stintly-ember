`import DS from 'ember-data'`

class CustomModel extends DS.Model
  save: (namespace) ->
    promiseLabel = "DS: Model#save " + @
    resolver = Ember.RSVP.defer(promiseLabel)

    if namespace
      @get('store').set('namespace', namespace)

    @get('store').scheduleSave(@, resolver)
    @._inFlightAttributes = @._attributes
    @._attributes = {}

    return DS.PromiseObject.create
      promise: resolver.promise

  destroyRecord: (namespace) ->
    @deleteRecord()
    @save(namespace)
    
`export default CustomModel`