class window.IsItOpen extends Backbone.Router
  initialize: =>
    @gangplank = new Gangplank
    @gangplank.fetch()

  routes:
    '': 'show'
    'edit': 'edit'

  edit: =>
    @view?.remove()
    @view = new EditGangplankView model: @gangplank
    $('#main').html @view.render()

  show: =>
    @view?.remove()
    @view = new GangplankView model: @gangplank
    $('#main').html @view.render()

