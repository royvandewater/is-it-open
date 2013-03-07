class window.EditGangplankView extends Backbone.View
  template: JST['templates/gangplank/edit']

  initialize: =>
    @model.on 'change', @render

  events:
    'blur  .open-until': 'onBlur'
    'click .update': 'onClickUpdate'
    'click .close-gp': 'onClickCloseGP'

  context: =>
    open_until: moment @model.get 'open_until'

  render: =>
    @$el.html @template @context()

  onBlur: ($event) =>
    time   = moment @$('input.open-until').val(), 'HH:mm'
    datetime = moment().hour(time.hour()).minutes(time.minutes()).seconds(0)

    @model.set open_until: datetime.format()

  onClickCloseGP: ($event) =>
    $event.preventDefault()
    @model.save {open_until: null}, error: => @model.fetch() # 204 is firing error

  onClickUpdate: ($event) =>
    $event.preventDefault()
    @model.save {}, error: => @model.fetch() # 204 is firing error
