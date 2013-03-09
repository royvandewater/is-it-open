class window.EditGangplankView extends Backbone.View
  template: JST['templates/gangplank/edit']

  initialize: =>
    @loading = false
    @model.on 'change', @render

  events:
    'change .open-until': 'onChange'
    'click .update': 'onClickUpdate'
    'click .close-gp': 'onClickCloseGP'

  context: =>
    open_until: moment @model.get 'open_until'
    loading: @loading

  render: =>
    @$el.html @template @context()

  onChange: ($event) =>
    time   = moment @$('input.open-until').val(), 'HH:mm'
    datetime = moment().hour(time.hour()).minutes(time.minutes()).seconds(0)

    @model.set {open_until: datetime.format()}, silent: true

  onClickCloseGP: =>
    @model.set {open_until: null}, silent: true
    @onClickUpdate arguments...

  onClickUpdate: ($event) =>
    $event.preventDefault()
    @loading = true
    @render()
    @model.save {}, success: =>
      @model.fetch success: => Backbone.history.navigate '/', trigger: true
