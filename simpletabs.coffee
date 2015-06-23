$ ->
  hashTabs = ->
    _element: ""

    element: (element) ->
      this._element = element

    updateTab: (updateHash=true)->
      this.updateTabLink()
      this.updateTabContainer()
      if updateHash
        this.updateURLHash()

    updateTabLink: ->
      this._element.parent().addClass('is-active').siblings('.is-active').removeClass('is-active')

    updateTabContainer: ->
      dataTab = this._element.data('tab')
      $("[data-content='" + dataTab + "']").addClass('is-active').show().siblings().removeClass('is-active').hide()

    updateURLHash: ->
      window.location.hash = this._element.data('tab')

  if $('[data-tab]').length
    $(window).on 'load', ->
      if window.location.hash != ""
        hash = window.location.hash.replace("#", "")
        tabs = new hashTabs()
        tabs.element $("[data-tab='"+hash+"']")
        tabs.updateTab()
      else
        tabs = new hashTabs()
        tabs.element $("[data-tab]").first()
        tabs.updateTab(updateHash=false)

    $(window).on 'hashchange', ->
      hash = window.location.hash.replace("#", "")
      tabs = new hashTabs()
      tabs.element $("[data-tab='"+hash+"']")
      tabs.updateTab()

    $('[data-tab]').on 'click', (e) ->
      tabs = new hashTabs()
      tabs.element $(this)
      tabs.updateTab()
      e.preventDefault()
