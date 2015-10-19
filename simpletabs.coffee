$ ->
  hashTabs = ->
    _element: ""

    element: (element) ->
      this._element = element

    updateTab: (updateHash=true)->
      this.updateTabLink()
      this.updateTabContainer()
      $('body').scrollTop(0)
      if updateHash
        this.updateURLHash()

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

    responsiveTab: ->
      list = this._element.parent().parent();
      elements = $(list).find('li')
      elements.each (i) ->
        dataTab = $('[data-tab]')[i].attributes['data-tab'].nodeValue
        content = $('[data-content=\'' + dataTab + '\']')[0]
        $(this).addClass('large__screen').clone().removeClass('large__screen').addClass('small__screen').insertBefore(content)

  if $('[data-tab]').length
    $(window).on 'load', ->
      if window.location.hash != ""
        hash = window.location.hash.replace("#", "")
        tabs = new hashTabs()
        tabs.element $("[data-tab='"+hash+"']")
        tabs.responsiveTab()
        tabs.updateTab()
      else
        tabs = new hashTabs()
        tabs.element $("[data-tab]").first()
        tabs.responsiveTab()
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
