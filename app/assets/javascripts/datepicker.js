$(function() {
  $('.datepicker').datepicker({
    dateFormat: "dd-mm-yy",
    beforeShowDay: $.datepicker.noWeekends,
    todayHighlight: true
  });
});
