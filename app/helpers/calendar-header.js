import Ember from 'ember';

export function calendarHeader() {

  var dateFormat = 'MMM D';
  var element = '';
  var startWeek = moment().weekday(-7);

  function buildElement (week) {
    var monday = moment(week).add(1, 'days');
    var friday = moment(week).add(5, 'days');
    var openTag = '<div class="date">';
    var closeTag = '</div>';
    var dateString = monday.format(dateFormat) + ' ' + friday.format(dateFormat);
    return(openTag + dateString + closeTag);
  }

  for (var i = 1; i < 7; i++) {
    startWeek = startWeek.add(7, 'days');
    element += buildElement(startWeek);
  }

  return(new Ember.Handlebars.SafeString(element));
}

export default Ember.Handlebars.makeBoundHelper(calendarHeader);
