class window.EditGangplankView extends Backbone.View
  template: JST['templates/gangplank/edit']

  initialize: =>
    @model.on 'change', @render

  events:
    'change .open-until': 'onChange'
    'click .update':      'onClickUpdate'
    'click .close-gp':    'onClickCloseGP'

  render: =>
    @$el.html @template @model.toJSON()
    @$el.prepend (new LoadingView).render() if @loading
    @$el

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
