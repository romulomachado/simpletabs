(function() {
  $(function() {
    var hashTabs;
    hashTabs = function() {
      return {
        _element: '',
        element: function(element) {
          return this._element = element;
        },
        updateTab: function(updateHash) {
          if (updateHash == null) {
            updateHash = true;
          }
          this.updateTabLink();
          this.updateTabContainer();
          $('body').scrollTop(0);
          if (updateHash) {
            return this.updateURLHash();
          }
        },
        updateTabLink: function() {
          return this._element.parent().addClass('is-active').siblings('.is-active').removeClass('is-active');
        },
        updateTabContainer: function() {
          var content, dataTab;
          dataTab = this._element.data('tab');
          content = $('[data-content=\'' + dataTab + '\']');
          $('[data-content]').not('[data-content="' + dataTab + '"]').removeClass('is-active');
          return content.each(function() {
            return $(this).addClass('is-active');
          });
        },
        updateURLHash: function() {
          return window.location.hash = this._element.data('tab');
        },
        responsiveTab: function() {
          var elements, list;
          list = this._element.parent().parent();
          elements = $(list).find('li');
          return elements.each(function(i) {
            var content, dataTab;
            dataTab = $('[data-tab]')[i].attributes['data-tab'].nodeValue;
            content = $('[data-content=\'' + dataTab + '\']')[0];
            return $(this).addClass('large__screen').clone().removeClass('large__screen').addClass('small__screen').insertBefore(content);
          });
        }
      };
    };
    if ($('[data-tab]').length) {
      $(window).on('load', function() {
        var hash, tabs, updateHash;
        if (window.location.hash !== '') {
          hash = window.location.hash.replace('#', '');
          tabs = new hashTabs();
          tabs.element($('[data-tab=\'' + hash + '\']'));
          tabs.responsiveTab();
          return tabs.updateTab();
        } else {
          tabs = new hashTabs();
          tabs.element($('[data-tab]').first());
          tabs.responsiveTab();
          return tabs.updateTab(updateHash = false);
        }
      });
      $(window).on('hashchange', function() {
        var hash, tabs;
        hash = window.location.hash.replace('#', '');
        tabs = new hashTabs();
        tabs.element($('[data-tab=\'' + hash + '\']'));
        return tabs.updateTab();
      });
      return $('[data-tab]').on('click', function(e) {
        var tabs;
        tabs = new hashTabs();
        tabs.element($(this));
        tabs.updateTab();
        return e.preventDefault();
      });
    }
  });
}.call(this));
