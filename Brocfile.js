/* global require, module */

var EmberApp = require('ember-cli/lib/broccoli/ember-app');

var app = new EmberApp({
});

// Use `app.import` to add additional libraries to the generated
// output files.
//
// If you need to use different assets in different
// environments, specify an object as the first parameter. That
// object's keys should be the environment name and the values
// should be the asset to use in that environment.
//
// If the library that you are including contains AMD or ES6
// modules that you would like to import into your application
// please specify an object with the list of modules as keys
// along with the exports of each module as its value.

// Semantic UI
app.import('vendor/semantic-ui-sass/javascripts/semantic-ui/dimmer.js')
app.import('vendor/semantic-ui-sass/javascripts/semantic-ui/dropdown.js')
app.import('vendor/semantic-ui-sass/javascripts/semantic-ui/modal.js')
app.import('vendor/semantic-ui-sass/javascripts/semantic-ui/transition.js')

// Semantic UI Icon fonts
app.import('vendor/semantic-ui-sass/fonts/semantic-ui/icons.eot', { destDir: "assets/fonts/semantic-ui" })
app.import('vendor/semantic-ui-sass/fonts/semantic-ui/icons.otf', { destDir: "assets/fonts/semantic-ui" })
app.import('vendor/semantic-ui-sass/fonts/semantic-ui/icons.svg', { destDir: "assets/fonts/semantic-ui" })
app.import('vendor/semantic-ui-sass/fonts/semantic-ui/icons.ttf', { destDir: "assets/fonts/semantic-ui" })
app.import('vendor/semantic-ui-sass/fonts/semantic-ui/icons.woff', { destDir: "assets/fonts/semantic-ui" })

// Ember EasyForm
// app.import('vendor/ember-easyForm.js')

module.exports = app.toTree();
