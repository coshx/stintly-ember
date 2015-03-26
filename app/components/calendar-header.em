class CalendarHeader extends Ember.Component

  didInsertElement: ->
    console.log('here i am')
###
  startWeek: moment().weekday(-7)
  weeks: []
  element: ""
  shortFormat: 'D'
  longFormat: 'MMM D'

  initialWeeks: ->
    for i in [0..6] by 1
      @startWeek = @startWeek.add(7, 'days');
      monday = moment(@startWeek).add(1, 'days');
      friday = moment(@startWeek).add(5, 'days');
      weeks.push @formatDates(monday, friday)
    console.log("in component")
    #@renderElement()

  #renderElement: ->
  #  @buildElement()
  #  $('#weeks').append(element)

  buildElement: ->
    for week in @weeks
      element += '<div class="week">' + week + '</div>'


  formatDates: (startDate, endDate) ->
    formattedDates = firstDate.format(@longFormat) + ' - '
    if (moment(firstDate).month() == moment(secondDate).month())
      formattedDates += secondDate.format(@shortFormat)
    else
      formattedDates += secondDate.format(longFormat)
    formattedDates


###
`export default CalendarHeader`
