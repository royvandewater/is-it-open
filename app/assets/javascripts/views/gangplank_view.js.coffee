class window.GangplankView extends Backbone.View
  template: JST['templates/gangplank/show']

  initialize: =>
    @model.on 'change', @render

  render: =>
    @$el.html @template @model.toJSON()

