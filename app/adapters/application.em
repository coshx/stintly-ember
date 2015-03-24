`import DS from 'ember-data'`
`import config from '../config/environment'`

class ApplicationAdapter extends DS.ActiveModelAdapter
  host: config.APP.HOST

  findQuery: (store, type, query) ->
    delete query.namespace
    delete query.parent
    
    @parentUrl = if store.parent then store.parent else ''
    @ajax(@buildURL(type.typeKey), 'GET', { data: query })

  find: (store, type, id, record) ->
    @parentUrl = if store.parent then store.parent else ''
    actionUrl = if store.action then store.action else ''
    @ajax(@buildURL(type.typeKey, id, record) + '/' + actionUrl, 'GET')

  createRecord: (store, type, record) ->
    data = {}
    serializer = store.serializerFor(type.typeKey)

    serializer.serializeIntoHash(data, type, record, { includeId: true })

    # console.log 'in Create!!', record
    @parentUrl = if record.parent then record.parent else ''

    return @ajax(this.buildURL(type.typeKey, null, record), "POST", { data: data })
    
  buildURL: (type, id, record) ->
    url = []
    host = Ember.get(this, 'host')
    prefix = this.urlPrefix()

    if @parentUrl then url.push(@parentUrl)
    if type then url.push(this.pathForType(type))

    # We might get passed in an array of ids from findMany
    # in which case we don't want to modify the url, as the
    # ids will be passed in through a query param
    if(id && !Ember.isArray(id)) then url.push(encodeURIComponent(id))

    if prefix then url.unshift(prefix)

    url = url.join('/')
    if(!host && url) then url = '/' + url

    return url

`export default ApplicationAdapter`