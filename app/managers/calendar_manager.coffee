class CalendarManager extends Ember.Object
  startWeek: moment().weekday(-7)
  weeks: []
  shortFormat: 'D'
  longFormat: 'MMM D'

  init: ->
    @_super()
    for i in [0..6] by 1
      @startWeek = @startWeek.add(7, 'days');
      monday = moment(@startWeek).add(1, 'days');
      friday = moment(@startWeek).add(5, 'days');
      weeks.push @formatDates(monday, friday)


  formatDates: (startDate, endDate) ->
    formattedDates = firstDate.format(@longFormat) + ' - '
    if (moment(firstDate).month() == moment(secondDate).month())
      formattedDates += secondDate.format(@shortFormat)
    else
      formattedDates += secondDate.format(longFormat)
    formattedDates

  setProxy: ->
    #@weekStartDatesProxy = Ember.ArrayProxy.create(content: Ember.A(@weekStartDates))

`export default CalendarManager`
