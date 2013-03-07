class window.EditGangplankView extends Backbone.View
  template: JST['templates/gangplank/edit']

  initialize: =>
    @model.on 'change', @render

  render: =>
    @$el.html @template @model.toJSON()

