// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require datatables
//= require lightgallery
//= require perfect-scrollbar
//= require Chart.bundle
//= require chartkick
//= require social-share-button
//= require_tree .
//= require materialize
$(document).on('turbolinks:load', function () {
      $('.modal').modal();
      $('.modal-trigger').on('click', function () {
            $('.modal').modal('open');
      })

})

$(window).on("load", function () { setTimeout(function () { $("body").addClass("loaded") }, 200) }); $(function () { "use strict"; var window_width = $(window).width(); var openIndex; $(".nav-collapsible .navbar-toggler").click(function () { getCollapseIndex(); if ($("#left-sidebar-nav").hasClass("nav-expanded") && !$("#left-sidebar-nav").hasClass("nav-lock")) { $("#left-sidebar-nav").toggleClass("nav-expanded"); $("#main").toggleClass("main-full") } else { $("#left-sidebar-nav").toggleClass("nav-expanded nav-collapsed"); $("#main").toggleClass("main-full") } if ($(this).children().text() == "radio_button_unchecked") { $(this).children().text("radio_button_checked"); $("#left-sidebar-nav").addClass("nav-lock"); $(".header-search-wrapper").addClass("sideNav-lock") } else { $(this).children().text("radio_button_unchecked"); $("#left-sidebar-nav").removeClass("nav-lock"); $(".header-search-wrapper").removeClass("sideNav-lock") } setTimeout(function () { if (openIndex != null) { if ($("#left-sidebar-nav").hasClass("nav-collapsed")) { $(".collapsible").collapsible("close", openIndex) } } }, 100) }); $("#left-sidebar-nav.nav-collapsible").mouseenter(function () { getCollapseIndex(); if (!$(this).hasClass("nav-lock")) { $(this).addClass("nav-expanded").removeClass("nav-collapsed"); setTimeout(function () { $(".collapsible").collapsible("open", openIndex) }, 100) } }); $("#left-sidebar-nav.nav-collapsible").mouseleave(function () { getCollapseIndex(); if (!$(this).hasClass("nav-lock")) { $(this).addClass("nav-collapsed").removeClass("nav-expanded"); setTimeout(function () { $(".collapsible").collapsible("close", openIndex) }, 100) } }); function getCollapseIndex() { $("#slide-out > li > ul > li > a.collapsible-header").each(function (index) { if ($(this).parent().hasClass("active")) { openIndex = index } }) } $(".header-search-input").focus(function () { $(this).parent("div").addClass("header-search-wrapper-focus") }).blur(function () { $(this).parent("div").removeClass("header-search-wrapper-focus") }); $("#task-card input:checkbox").each(function () { checkbox_check(this) }); $("#task-card input:checkbox").change(function () { checkbox_check(this) }); function checkbox_check(el) { if (!$(el).is(":checked")) { $(el).next().css("text-decoration", "none") } else { $(el).next().css("text-decoration", "line-through") } } if ($("#tabs-swipe-demo").length) { $("#tabs-swipe-demo").tabs({ swipeable: true }) } $("select").material_select(); var indeterminateCheckbox = document.getElementById("indeterminate-checkbox"); if (indeterminateCheckbox !== null) indeterminateCheckbox.indeterminate = true; $(".slider").slider({ full_width: true }); $(".dropdown-button, .translation-button, .dropdown-menu").dropdown({ inDuration: 300, outDuration: 225, constrainWidth: false, hover: true, gutter: 0, belowOrigin: true, alignment: "left", stopPropagation: false }); $(".notification-button, .profile-button, .dropdown-settings").dropdown({ inDuration: 300, outDuration: 225, constrainWidth: false, hover: true, gutter: 0, belowOrigin: true, alignment: "right", stopPropagation: false }); $(".tab-demo").show().tabs(); $(".tab-demo-active").show().tabs(); $(".parallax").parallax(); $(".scrollspy").scrollSpy(); $(".tooltipped").tooltip({ delay: 50 }); $(".sidebar-collapse").sideNav({ edge: "left" }); $(".menu-sidebar-collapse").sideNav({ menuWidth: 240, edge: "left", menuOut: false }); $(".chat-collapse").sideNav({ menuWidth: 300, edge: "right" }); $(".datepicker").pickadate({ selectMonths: true, selectYears: 15 }); $("select").not(".disabled").material_select(); var leftnav = $(".page-topbar").height(); var leftnavHeight = window.innerHeight - leftnav; if (!$("#slide-out.leftside-navigation").hasClass("native-scroll")) { $(".leftside-navigation").perfectScrollbar({ suppressScrollX: true }) } var righttnav = $("#chat-out").height(); $(".rightside-navigation").perfectScrollbar({ suppressScrollX: true }); function toggleFullScreen() { if (document.fullScreenElement && document.fullScreenElement !== null || !document.mozFullScreen && !document.webkitIsFullScreen) { if (document.documentElement.requestFullScreen) { document.documentElement.requestFullScreen() } else if (document.documentElement.mozRequestFullScreen) { document.documentElement.mozRequestFullScreen() } else if (document.documentElement.webkitRequestFullScreen) { document.documentElement.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT) } } else { if (document.cancelFullScreen) { document.cancelFullScreen() } else if (document.mozCancelFullScreen) { document.mozCancelFullScreen() } else if (document.webkitCancelFullScreen) { document.webkitCancelFullScreen() } } } $(".toggle-fullscreen").click(function () { toggleFullScreen() }); if ($("nav").length) { $(".toc-wrapper").pushpin({ top: $("nav").height() }) } else if ($("#index-banner").length) { $(".toc-wrapper").pushpin({ top: $("#index-banner").height() }) } else { $(".toc-wrapper").pushpin({ top: 0 }) } var toggleFlowTextButton = $("#flow-toggle"); toggleFlowTextButton.click(function () { $("#flow-text-demo").children("p").each(function () { $(this).toggleClass("flow-text") }) }); $("#card-alert .close").click(function () { $(this).closest("#card-alert").fadeOut("slow") }); var toggleContainersButton = $("#container-toggle-button"); toggleContainersButton.click(function () { $("body .browser-window .container, .had-container").each(function () { $(this).toggleClass("had-container"); $(this).toggleClass("container"); if ($(this).hasClass("container")) { toggleContainersButton.text("Turn off Containers") } else { toggleContainersButton.text("Turn on Containers") } }) }); function is_touch_device() { try { document.createEvent("TouchEvent"); return true } catch (e) { return false } } if (is_touch_device()) { $("#nav-mobile").css({ overflow: "auto" }) } });

$(document).ready(function () {
  $(function() {
    $('#dclose').click(function() {
      $(this).parent().slideUp();
    });
  });

  $('.select-dropdown').change(function(){
    alert($(this).val());
  })

});



(function(window, document, undefined) {

      var factory = function($, DataTable) {
        "use strict";
    
        $('.search-toggle').click(function() {
          if ($('.hiddensearch').css('display') == 'none')
            $('.hiddensearch').slideDown();
          else
            $('.hiddensearch').slideUp();
        });
    
        /* Set the defaults for DataTables initialisation */
        $.extend(true, DataTable.defaults, {
          dom: "<'hiddensearch'f'>" +
            "tr" +
            "<'table-footer'lip'>",
          renderer: 'material'
        });
    
        /* Default class modification */
        $.extend(DataTable.ext.classes, {
          sWrapper: "dataTables_wrapper",
          sFilterInput: "form-control input-sm",
          sLengthSelect: "form-control input-sm"
        });
    
        /* Bootstrap paging button renderer */
        DataTable.ext.renderer.pageButton.material = function(settings, host, idx, buttons, page, pages) {
          var api = new DataTable.Api(settings);
          var classes = settings.oClasses;
          var lang = settings.oLanguage.oPaginate;
          var btnDisplay, btnClass, counter = 0;
    
          var attach = function(container, buttons) {
            var i, ien, node, button;
            var clickHandler = function(e) {
              e.preventDefault();
              if (!$(e.currentTarget).hasClass('disabled')) {
                api.page(e.data.action).draw(false);
              }
            };
    
            for (i = 0, ien = buttons.length; i < ien; i++) {
              button = buttons[i];
    
              if ($.isArray(button)) {
                attach(container, button);
              } else {
                btnDisplay = '';
                btnClass = '';
    
                switch (button) {
    
                  case 'first':
                    btnDisplay = lang.sFirst;
                    btnClass = button + (page > 0 ?
                      '' : ' disabled');
                    break;
    
                  case 'previous':
                    btnDisplay = '<i class="material-icons">chevron_left</i>';
                    btnClass = button + (page > 0 ?
                      '' : ' disabled');
                    break;
    
                  case 'next':
                    btnDisplay = '<i class="material-icons">chevron_right</i>';
                    btnClass = button + (page < pages - 1 ?
                      '' : ' disabled');
                    break;
    
                  case 'last':
                    btnDisplay = lang.sLast;
                    btnClass = button + (page < pages - 1 ?
                      '' : ' disabled');
                    break;
    
                }
    
                if (btnDisplay) {
                  node = $('<li>', {
                      'class': classes.sPageButton + ' ' + btnClass,
                      'id': idx === 0 && typeof button === 'string' ?
                        settings.sTableId + '_' + button : null
                    })
                    .append($('<a>', {
                        'href': '#',
                        'aria-controls': settings.sTableId,
                        'data-dt-idx': counter,
                        'tabindex': settings.iTabIndex
                      })
                      .html(btnDisplay)
                    )
                    .appendTo(container);
    
                  settings.oApi._fnBindAction(
                    node, {
                      action: button
                    }, clickHandler
                  );
    
                  counter++;
                }
              }
            }
          };
    
          // IE9 throws an 'unknown error' if document.activeElement is used
          // inside an iframe or frame. 
          var activeEl;
    
          try {
            // Because this approach is destroying and recreating the paging
            // elements, focus is lost on the select button which is bad for
            // accessibility. So we want to restore focus once the draw has
            // completed
            activeEl = $(document.activeElement).data('dt-idx');
          } catch (e) {}
    
          attach(
            $(host).empty().html('<ul class="material-pagination"/>').children('ul'),
            buttons
          );
    
          if (activeEl) {
            $(host).find('[data-dt-idx=' + activeEl + ']').focus();
          }
        };
    
        /*
         * TableTools Bootstrap compatibility
         * Required TableTools 2.1+
         */
        if (DataTable.TableTools) {
          // Set the classes that TableTools uses to something suitable for Bootstrap
          $.extend(true, DataTable.TableTools.classes, {
            "container": "DTTT btn-group",
            "buttons": {
              "normal": "btn btn-default",
              "disabled": "disabled"
            },
            "collection": {
              "container": "DTTT_dropdown dropdown-menu",
              "buttons": {
                "normal": "",
                "disabled": "disabled"
              }
            },
            "print": {
              "info": "DTTT_print_info"
            },
            "select": {
              "row": "active"
            }
          });
    
          // Have the collection use a material compatible drop down
          $.extend(true, DataTable.TableTools.DEFAULTS.oTags, {
            "collection": {
              "container": "ul",
              "button": "li",
              "liner": "a"
            }
          });
        }
    
      }; // /factory
    
      // Define as an AMD module if possible
      if (typeof define === 'function' && define.amd) {
        define(['jquery', 'datatables'], factory);
      } else if (typeof exports === 'object') {
        // Node/CommonJS
        factory(require('jquery'), require('datatables'));
      } else if (jQuery) {
        // Otherwise simply initialise as normal, stopping multiple evaluation
        factory(jQuery, jQuery.fn.dataTable);
      }
    
    })(window, document);
    

  jQuery.extend( jQuery.fn.pickadate.defaults, {
      monthsFull: [ 'Tháng Một', 'Tháng Hai', 'Tháng Ba', 'Tháng Tư', 'Tháng Năm', 'Tháng Sáu', 'Tháng Bảy', 'Tháng Tám', 'Tháng Chín', 'Tháng Mười', 'Tháng Mười Một', 'Tháng Mười Hai' ],
      monthsShort: [ 'Một', 'Hai', 'Ba', 'Tư', 'Năm', 'Sáu', 'Bảy', 'Tám', 'Chín', 'Mưới', 'Mười Một', 'Mười Hai' ],
      weekdaysFull: [ 'Chủ Nhật', 'Thứ Hai', 'Thứ Ba', 'Thứ Tư', 'Thứ Năm', 'Thứ Sáu', 'Thứ Bảy' ],
      weekdaysShort: [ 'C.Nhật', 'T.Hai', 'T.Ba', 'T.Tư', 'T.Năm', 'T.Sáu', 'T.Bảy' ],
      today: 'Hôm Nay',
      clear: 'Xoá',
      firstDay: 1,
      format: "dd/mm/yyyy"
  });
  
  jQuery.extend( jQuery.fn.pickatime.defaults, {
      clear: 'Xoá'
  });

  jQuery.extend( jQuery.fn.pickatime.defaults, {
    donetext: 'OK', // text for done-button
    cleartext: 'Xoá', // text for clear-button
    canceltext: 'Trở về', // Text for cancel-button,
});