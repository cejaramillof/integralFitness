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
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/extras/dataTables.responsive
//= require materialize
//= require_tree .

$(document).on("turbolinks:before-visit turbolinks:before-cache", function() {
    var t, e;
    if ((t = document.querySelector("#slide-out")) && (e = M.Sidenav.getInstance(t)),e)
        return e.isOpen && e.close(),
        e.destroy()
});

$(document).on("turbolinks:load", function() {  
    M.Modal._count = 0;
    $('.select-two').select2({
        language: {
            noResults: function (params) {
                return "No existe.";
            }
        }
    });
    $('.modal').modal();
    $('.tooltipped').tooltip();
    $('.sidenav').sidenav();
    M.updateTextFields();
    mobiscroll.settings = {
        lang: 'es',             // Specify language like: lang: 'pl' or omit setting to use default
        theme: 'ios'            // Specify theme like: theme: 'ios' or omit setting to use default
    };
    // Mobiscroll Select initialization
    $('.scroll-bubble').mobiscroll().select({
        display: 'bubble'   // Specify display mode like: display: 'bottom' or omit setting to use default
    });
    $('.tabs').tabs();
    $('.datepicker').datepicker({
        firstDay: true,
        format: 'yyyy-mm-dd',
        i18n: {
            months: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
            monthsShort: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"],
            weekdays: ["Domingo","Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"],
            weekdaysShort: ["Dom","Lun", "Mar", "Mie", "Jue", "Vie", "Sab"],
            weekdaysAbbrev: ["D","L", "M", "M", "J", "V", "S"]
        }
    });
});