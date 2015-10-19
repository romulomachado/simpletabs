$ ->
  hashTabs = ->
    _element: ""

    element: (element) ->
      this._element = element

    updateTab: ->
      this.updateTabLink()
      this.updateTabContainer()
      $('body').scrollTop(0)

    updateTabLink: ->
      this._element.parent().addClass('is-active').siblings('.is-active').removeClass('is-active')

    updateTabContainer: ->
      dataTab = this._element.data('tab')
      contentTab = $("[data-content='" + dataTab + "']")
      $('[data-content]').not(contentTab).removeClass('is-active')
      contentTab.each ->
        $(this).addClass('is-active')

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
        tabs.updateTab()

    $(window).on 'hashchange', ->
      hash = window.location.hash.replace("#", "")
      tabs = new hashTabs()
      tabs.element $("[data-tab='"+hash+"']")
      tabs.updateTab()

    $('[data-tab]').on 'click', (e) ->
      tabs = new hashTabs()
      tabs.element $(this)
      tabs.updateURLHash()
      e.preventDefault()
