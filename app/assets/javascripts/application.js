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
//= require materialize
//= require lightgallery
//= require perfect-scrollbar
//= require Chart.bundle
//= require chartkick
//= require_tree .
$(document).on('turbolinks:load', function () {
      $('.modal').modal();
      $('.modal-trigger').on('click', function () {
            $('.modal').modal('open');
      })

})

$(window).on("load", function () { setTimeout(function () { $("body").addClass("loaded") }, 200) }); $(function () { "use strict"; var window_width = $(window).width(); var openIndex; $(".nav-collapsible .navbar-toggler").click(function () { getCollapseIndex(); if ($("#left-sidebar-nav").hasClass("nav-expanded") && !$("#left-sidebar-nav").hasClass("nav-lock")) { $("#left-sidebar-nav").toggleClass("nav-expanded"); $("#main").toggleClass("main-full") } else { $("#left-sidebar-nav").toggleClass("nav-expanded nav-collapsed"); $("#main").toggleClass("main-full") } if ($(this).children().text() == "radio_button_unchecked") { $(this).children().text("radio_button_checked"); $("#left-sidebar-nav").addClass("nav-lock"); $(".header-search-wrapper").addClass("sideNav-lock") } else { $(this).children().text("radio_button_unchecked"); $("#left-sidebar-nav").removeClass("nav-lock"); $(".header-search-wrapper").removeClass("sideNav-lock") } setTimeout(function () { if (openIndex != null) { if ($("#left-sidebar-nav").hasClass("nav-collapsed")) { $(".collapsible").collapsible("close", openIndex) } } }, 100) }); $("#left-sidebar-nav.nav-collapsible").mouseenter(function () { getCollapseIndex(); if (!$(this).hasClass("nav-lock")) { $(this).addClass("nav-expanded").removeClass("nav-collapsed"); setTimeout(function () { $(".collapsible").collapsible("open", openIndex) }, 100) } }); $("#left-sidebar-nav.nav-collapsible").mouseleave(function () { getCollapseIndex(); if (!$(this).hasClass("nav-lock")) { $(this).addClass("nav-collapsed").removeClass("nav-expanded"); setTimeout(function () { $(".collapsible").collapsible("close", openIndex) }, 100) } }); function getCollapseIndex() { $("#slide-out > li > ul > li > a.collapsible-header").each(function (index) { if ($(this).parent().hasClass("active")) { openIndex = index } }) } $(".header-search-input").focus(function () { $(this).parent("div").addClass("header-search-wrapper-focus") }).blur(function () { $(this).parent("div").removeClass("header-search-wrapper-focus") }); $("#task-card input:checkbox").each(function () { checkbox_check(this) }); $("#task-card input:checkbox").change(function () { checkbox_check(this) }); function checkbox_check(el) { if (!$(el).is(":checked")) { $(el).next().css("text-decoration", "none") } else { $(el).next().css("text-decoration", "line-through") } } if ($("#tabs-swipe-demo").length) { $("#tabs-swipe-demo").tabs({ swipeable: true }) } $("select").material_select(); var indeterminateCheckbox = document.getElementById("indeterminate-checkbox"); if (indeterminateCheckbox !== null) indeterminateCheckbox.indeterminate = true; $(".slider").slider({ full_width: true }); $(".dropdown-button, .translation-button, .dropdown-menu").dropdown({ inDuration: 300, outDuration: 225, constrainWidth: false, hover: true, gutter: 0, belowOrigin: true, alignment: "left", stopPropagation: false }); $(".notification-button, .profile-button, .dropdown-settings").dropdown({ inDuration: 300, outDuration: 225, constrainWidth: false, hover: true, gutter: 0, belowOrigin: true, alignment: "right", stopPropagation: false }); $(".tab-demo").show().tabs(); $(".tab-demo-active").show().tabs(); $(".parallax").parallax(); $(".scrollspy").scrollSpy(); $(".tooltipped").tooltip({ delay: 50 }); $(".sidebar-collapse").sideNav({ edge: "left" }); $(".menu-sidebar-collapse").sideNav({ menuWidth: 240, edge: "left", menuOut: false }); $(".chat-collapse").sideNav({ menuWidth: 300, edge: "right" }); $(".datepicker").pickadate({ selectMonths: true, selectYears: 15 }); $("select").not(".disabled").material_select(); var leftnav = $(".page-topbar").height(); var leftnavHeight = window.innerHeight - leftnav; if (!$("#slide-out.leftside-navigation").hasClass("native-scroll")) { $(".leftside-navigation").perfectScrollbar({ suppressScrollX: true }) } var righttnav = $("#chat-out").height(); $(".rightside-navigation").perfectScrollbar({ suppressScrollX: true }); function toggleFullScreen() { if (document.fullScreenElement && document.fullScreenElement !== null || !document.mozFullScreen && !document.webkitIsFullScreen) { if (document.documentElement.requestFullScreen) { document.documentElement.requestFullScreen() } else if (document.documentElement.mozRequestFullScreen) { document.documentElement.mozRequestFullScreen() } else if (document.documentElement.webkitRequestFullScreen) { document.documentElement.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT) } } else { if (document.cancelFullScreen) { document.cancelFullScreen() } else if (document.mozCancelFullScreen) { document.mozCancelFullScreen() } else if (document.webkitCancelFullScreen) { document.webkitCancelFullScreen() } } } $(".toggle-fullscreen").click(function () { toggleFullScreen() }); if ($("nav").length) { $(".toc-wrapper").pushpin({ top: $("nav").height() }) } else if ($("#index-banner").length) { $(".toc-wrapper").pushpin({ top: $("#index-banner").height() }) } else { $(".toc-wrapper").pushpin({ top: 0 }) } var toggleFlowTextButton = $("#flow-toggle"); toggleFlowTextButton.click(function () { $("#flow-text-demo").children("p").each(function () { $(this).toggleClass("flow-text") }) }); $("#card-alert .close").click(function () { $(this).closest("#card-alert").fadeOut("slow") }); var toggleContainersButton = $("#container-toggle-button"); toggleContainersButton.click(function () { $("body .browser-window .container, .had-container").each(function () { $(this).toggleClass("had-container"); $(this).toggleClass("container"); if ($(this).hasClass("container")) { toggleContainersButton.text("Turn off Containers") } else { toggleContainersButton.text("Turn on Containers") } }) }); function is_touch_device() { try { document.createEvent("TouchEvent"); return true } catch (e) { return false } } if (is_touch_device()) { $("#nav-mobile").css({ overflow: "auto" }) } });

$(document).ready(function () {
      $('#loading').hide();
      // //form id
      $('#search')
            .bind('ajax:before', function (evt, data, status, xhr) {
                  //function called on status: 200 (for ex.)
                  $('#restaurants').hide();
                  $('#loading').show();
            })
            .bind('ajax:success', function (evt, data, status, xhr) {
                  //function called on status: 200 (for ex.)
                  $('#loading').hide();
                  $('#restaurants').show();

            })

      
      // $('#coupon-apply').click(function(e){
      //       e.preventDefault();
      //       let total  = $('#total').text();
      //       let newTotal = parseFloat(total.slice(0, total.length-1).replace(/,/g, ''));
      //       let code = $('#code').val();
      //       $.get('/coupons/' + code + '/validate', function(data){
      //             if(data.valid == true){
      //                   $('#code').css('border-color', 'green');
      //                   $('#coupon-apply').attr('disabled', 'disabled');
      //                   $('#coupon-msg').text("Coupon applied").css("color", "green");
      //                   let totalCul = newTotal - ((newTotal* data.amount)/100);
      //                   let format = totalCul.toFixed(0).replace(/(\d)(?=(\d{3})+$)/g, "$1,") + "đ";
      //                   $('#total').html(format);
      //             } else {
      //                   $('#code').css('border-color', 'red');
      //                   $('#coupon-msg').text("Coupon error").css("color", "green");
      //             }     
      //       })      
      // })

});
