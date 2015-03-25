import Ember from 'ember';

export function calendarHeader() {

  var openTag = '<div class="week">';
  var closeTag = '</div>';
  var shortFormat = 'D';
  var longFormat = 'MMM D';
  var element = '';
  var startWeek = moment().weekday(-7);

  function buildElement (week) {
    var monday = moment(week).add(1, 'days');
    var friday = moment(week).add(5, 'days');
    var dateString = formatDates(monday, friday);
    return(openTag + dateString + closeTag);
  }

  function formatDates(firstDate, secondDate) {
    var formattedDates = firstDate.format(longFormat) + ' - ';

    if (moment(firstDate).month() === moment(secondDate).month()) {
      return formattedDates + secondDate.format(shortFormat);
    } else {
      return formattedDates + secondDate.format(longFormat);
    }
  }

  for (var i = 1; i < 6; i++) {
    startWeek = startWeek.add(7, 'days');
    element += buildElement(startWeek);
  }

  return(new Ember.Handlebars.SafeString(element));
}

export default Ember.Handlebars.makeBoundHelper(calendarHeader);