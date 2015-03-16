class ClickDropDown extends Ember.Component
  didInsertElement: ->
    this.$().find('.dropdown').dropdown(
      delay: {
        show: 30
        hide: 30
      }
      action: 'select'
    )

`export default ClickDropDown`