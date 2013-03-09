class window.NavbarView extends Backbone.View
  template: JST['templates/navbar/show']

  initialize: =>
    @model.on 'change', @render

  events:
    'click .edit a': 'onClick'
    'click .show a': 'onClick'

  render: =>
    @$el.html @template @model.toJSON()
    @delegateEvents()
    @$el

  onClick: ($event) =>
    $event.preventDefault()

    url = $($event.currentTarget).attr('href')
    Backbone.history.navigate url, trigger: true
