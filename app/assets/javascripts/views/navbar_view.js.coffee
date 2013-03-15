class window.NavbarView extends Backbone.View
  template: JST['templates/navbar/show']

  initialize: =>
    @model.on 'change', @render

  events:
      'click .edit a':   'onClickEdit'
      'click .show a':   'onClickShow'
      'click .source a': 'onClickSource'

  render: =>
    @$el.html @template @model.toJSON()
    @$(".#{@model.get('active')}").addClass 'active'
    @delegateEvents()
    @$el

  onClick: ($event, path: path) =>
    $event.preventDefault()
    Backbone.history.navigate path, trigger: true

  onClickEdit: ($event) =>
    @onClick $event, path: '/edit'

  onClickShow: ($event) =>
    @onClick $event, path: '/'

  onClickSource: ($event) =>
    $event.preventDefault()
    window.location = "http://github.com/royvandewater/is-it-open"
