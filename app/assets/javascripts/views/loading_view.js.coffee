class window.LoadingView extends Backbone.View
  template: JST['templates/loading']
  render: =>
    @$el.html @template()
