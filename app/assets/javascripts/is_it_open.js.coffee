class window.IsItOpen extends Backbone.Router
  initialize: =>
    @navbar = new Navbar

    navbarView = new NavbarView model: @navbar
    $('.masthead').html navbarView.render()

    @gangplank = new Gangplank
    @gangplank.fetch()

  routes:
    '': 'show'
    'edit': 'edit'

  edit: =>
    @navbar.set active: 'edit'
    @view?.remove()
    @view = new EditGangplankView model: @gangplank
    $('#main').html @view.render()

  show: =>
    @navbar.set active: 'show'
    @view?.remove()
    @view = new GangplankView model: @gangplank
    $('#main').html @view.render()

