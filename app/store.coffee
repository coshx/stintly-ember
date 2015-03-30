`import DS from 'ember-data'`

Store = DS.Store.extend
  namespace: null
  action: null

  coerceId: (id) ->
    if id == null then null else id + ''

  _setNamespaceAndAction: (query) ->
    @namespace = if query.namespace then query.namespace else null
    @action = if query.action then query.action else null
    @parent = if query.parent then query.parent else null

  find: (type, query, preload) ->
    if query then @_setNamespaceAndAction(query)

    Ember.assert("You need to pass a type to the store's find method", arguments.length >= 1)
    Ember.assert("You may not pass `" + query + "` as id to the store's find method", arguments.length is 1 or not Ember.isNone(query))
    
    if arguments.length is 1
      return @findAll(type)
    else
      # We are passed a query instead of an id.
      if Ember.typeOf(query) is "object"
        if query.id
          result = @findById(type, @coerceId(query.id), preload)
          return result
        else
          return @findQuery(type, query)
      else
        @findById(type, @coerceId(query), preload)

  adapterFor: (type) ->
    container = @container
    adapter = undefined
    adapterName = if @namespace then @namespace else type.typeKey
    adapter = container.lookup("adapter:" + adapterName) or container.lookup("adapter:application")  if container    

`export default Store`