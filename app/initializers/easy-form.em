EasyForm = {
  name: 'configure-ember-easy-forms',
  
  initialize: ->
    Ember.EasyForm.Config.registerTemplate('easyForm/input', Ember.Handlebars.compile(
      '{{#unless view.noLabel}} {{label-field classBinding="view.property" propertyBinding="view.property" textBinding="view.label"}}{{/unless}}
      {{#if view.showError}} {{error-field classBinding=":error view.property" propertyBinding="view.property"}}{{/if}}
      {{partial "easyForm/inputControls"}}'))


    Ember.EasyForm.Config.registerTemplate('easyForm/inputControls', Ember.Handlebars.compile(
      '{{input-field class="" rowsBinding="view.rows" placeholderBinding="view.placeholder" propertyBinding="view.property" inputOptionsBinding="view.inputOptionsValues"}}
      {{#if view.hint}}{{hint-field propertyBinding="view.property" textBinding="view.hint"}}{{/if}}'))

    Ember.EasyForm.Config.registerWrapper "default",
      formClass: "ui form"
      fieldErrorClass: "error"
      errorClass: "error-message"
      hintClass: "help-block"
      labelClass: ""
      inputClass: "field"
}

`export default EasyForm`