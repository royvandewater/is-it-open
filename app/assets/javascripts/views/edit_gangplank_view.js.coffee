class window.EditGangplankView extends Backbone.View
  template: JST['templates/gangplank/edit']

  initialize: =>
    @model.on 'change', @render

  events:
    'change .open-until': 'onChange'
    'click .update': 'onClickUpdate'
    'click .close-gp': 'onClickCloseGP'

  context: =>
    open_until: moment @model.get 'open_until'

  render: =>
    @$el.html @template @context()

  onChange: ($event) =>
    time   = moment @$('input.open-until').val(), 'HH:mm'
    datetime = moment().hour(time.hour()).minutes(time.minutes()).seconds(0)

    @model.set {open_until: datetime.format()}, silent: true

  onClickCloseGP: ($event) =>
    $event.preventDefault()
    @model.save {open_until: null}, success: => @model.fetch()

  onClickUpdate: ($event) =>
    $event.preventDefault()
    @model.save {}, success: => @model.fetch()
