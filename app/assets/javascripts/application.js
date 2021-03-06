// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require jasny-bootstrap
//= require html5shiv
//= require respond.min
//= require jquery.dataTables
//= require dataTables.bootstrap
//= require bootstrap-datepicker
//= require bootstrap-timepicker.min
//= require d3
//= require highcharts
//= require_tree .


$(document).ready( function () {
    $(".btn").tooltip({
    	placement : 'bottom',
    	container: 'body'
    });
    $(".inboxPop").tooltip({
    	placement : 'bottom',
    	container: 'body'
    });
});

function myFunction() {
    var x = document.getElementById("order_package_id").value;
    document.getElementById("getPrice").value = x;
}

$(document).ready( function () {
	$('#payment_payment_date').datepicker({
	    format: 'dd/mm/yyyy',
	    todayBtn: "linked",
	    weekStart: 1,
	    todayHighlight: true,
	    autoclose: true
	});
	$('#payment_payment_time').timepicker({
		minuteStep: 5,
		showInputs: false,
		disableFocus: true
	});
});

$(document).ready( function () {
	$('#voucher_voucher_date').datepicker({
	    format: 'dd/mm/yyyy',
	    todayBtn: "linked",
	    weekStart: 1,
	    todayHighlight: true,
	    autoclose: true
	});
});

$(document).ready( function () {
	$('#item_date_received').datepicker({
	    format: 'dd/mm/yyyy',
	    todayBtn: "linked",
	    weekStart: 1,
	    todayHighlight: true,
	    autoclose: true
	});
});