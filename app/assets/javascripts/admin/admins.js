$(document).ready(function () {
  $(".required").append("<span class='required-start'>&nbsp;*</span>");

  $("#birthday-datepicker").on("click", function(){
    $(this).datepicker({
        format: "dd/mm/yyyy",
        todayHighlight: true
      }).datepicker("show");
  });

  $("#submit-save-admin").on("click", function(){
    $("#new_admin, #edit_admin").trigger("submit");
  });

  $("#new_admin, #edit_admin").on("submit", function(e) {
    e.preventDefault ();
    var actionURL = $(this).attr("action");

    $.ajax({
      url: actionURL,
      method: "POST",
      dataType: "json",
      data: new FormData(this),
      processData: false,
      contentType: false,
      success: function(response) {
        $("#confirm-modal").modal("hide");
        $.saiyanAjax(response);
      }
    });
  });
});
