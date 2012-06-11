//= require jquery
//= require jquery_ujs
//= require jquery.uniform.min
//= require datepicker
//= require datepicker.packed
//= require timepicker
//= require custom.min
//= require rails.validations
//= require rails.validations.custom
//= require lang/en
//= require_self


$(function(){
  
  $("input, checkbox, radio, file, textarea, select, button").uniform();
  $("#event_event_date").datepicker();
  $("#event_event_time").timePicker({
            startTime: "08:00",
            show24Hours: false,
            separator: ':',
            step: 15});
            
              
}); 

