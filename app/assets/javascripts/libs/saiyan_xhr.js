$.ajaxSetup({
  beforeSend: function(xhr) {
    xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
  }
});

(function($) {
  $.resetFormError = function() {
    $(".has-error").removeClass("has-error");
    $(".custom-error").removeClass("custom-error");
    $("a[data-toggle='tab']").removeClass("error-tab");
    $(".help-block").addClass("hide");
  }

  $.saiyanAjax = function(response, extraErrorElements, autoNestedForm) {

    if (!response.status) {
      $(".has-error").removeClass("has-error");
      $("a[data-toggle='tab']").removeClass("error-tab");
      $(".help-block").remove();
      extraErrorElements = extraErrorElements || {};
      autoNestedForm = autoNestedForm || false
      var errorMessages = JSON.parse(response.errors);
      $.each(errorMessages, function(key, value) {
        var $inputElement = $("[name$='[" + key + "]']").not("[name*='_attributes']");
        if (value == null) return;
        addErrorToInput($inputElement, value[0]);
      });

      $.each(extraErrorElements, function(key, selector) {
        if (errorMessages[key]) {
          $(selector).removeClass("hide").text(errorMessages[key][0]);
        } else {
          $(selector).addClass("hide");
        }
      });

      if (response.nested_errors) {
        var nestedErrorMessages = JSON.parse(response.nested_errors);
        $.each(nestedErrorMessages, function(modelNested, values) {
          if (autoNestedForm) {
            $(".nested-fields").each(function(key, inputElement){
              if (values[key]){
                $.each(values[key], function(field, errors){
                  var $inputElement = $(inputElement).find("input[name*=" + field + "]");
                  addErrorToInput($inputElement, errors[0]);
                });
              }
            });
          } else {
            $.each(values, function(key, errors) {
              $.each(errors, function(field, error) {
                var $inputElement = $("[name$='[" + modelNested +'_attributes]['+ key + '][' + field + "]']");
                addErrorToInput($inputElement, error[0]);
              });
            });
          }
        });
      }
    } else {
      $(location).attr("href", response.redirect_path);
    }
  };

  function addErrorToInput($inputElement, errorMessage) {
    $inputElement.closest(".form-group").addClass("has-error");

    if ($inputElement.closest(".input-group").length) {
      $inputElement = $inputElement.closest(".input-group");
    }

    if ($inputElement.closest('.tab-pane').length) {
      var $tabPane = $inputElement.closest('.tab-pane');
      var $aTagTab = $('a[href="#' + $tabPane.attr('id') + '"]');
      $aTagTab.addClass('error-tab');

      if ($aTagTab.parent().closest('.tab-pane').length) {
        var $parentPane = $aTagTab.parent().closest('.tab-pane');
        var $aTagParentTab = $('a[href="#' + $parentPane.attr('id') + '"]');
        $aTagParentTab.addClass('error-tab');
      }
    }

    if ($inputElement.closest('td').length) {
      var $tdElement = $inputElement.closest('td')
      var $thTable = $tdElement.closest('table').find('th').eq($tdElement.index());
      $thTable.addClass("has-error");
    }

    if ($inputElement.hasClass("select2-hidden-accessible")) {
      $inputElement = $inputElement.closest(".form-group").find(".select2.select2-container");
    }

    $("<span class='help-block'>" + errorMessage + "</span>").insertAfter($inputElement);
  }
}(jQuery));
