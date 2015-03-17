class FlashManager extends Ember.Object
  keep: false
  modalMessages: []
  normalMessages: []

  setModalFlash: (message, type) ->
    @set('modalMessages', [])
    @modalMessages.pushObject({ message: message, type: type })

  setFlash: (message, type) ->
    @set('normalMessages', [])
    @normalMessages.pushObject({ message: message, type: type })

  clearFlash: ->
    @set('normalMessages', [])
    @clearModalFlash()

  clearModalFlash: ->
    @set('modalMessages', [])
  
`export default FlashManager`