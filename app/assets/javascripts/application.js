// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require activestorage
//= require turbolinks
//= require jquery3
//= require jquery_ujs
//= require_tree

//= require now-ui-kit
//= require core/jquery.3.2.1.min
//= require core/popper.min
//= require core/bootstrap.min

//= require plugins/moment.min
//= require plugins/bootstrap-switch
//= require plugins/bootstrap-tagsinput
//= require plugins/bootstrap-selectpicker
//= require plugins/jasny-bootstrap.min
//= require plugins/nouislider.min
//= require plugins/bootstrap-datetimepicker.min

//= require algolia/v3/algoliasearch.min
// Replace with your own values

var client = algoliasearch('NSVTX8CBAT', 'f9eefea91380403c3753cc2f735678ed');
var index = client.initIndex('Asso');
index.search('something', { hitsPerPage: 10, page: 0 })
  .then(function searchDone(content) {
    console.log(content)
  })
  .catch(function searchFailure(err) {
    console.error(err);
  });

  instantsearch.widgets.searchBox({
  container: '#searchbox',
});
