$(document).ready(function() {
    initNavbarToggle();
  });

  $(document).on('turbolinks:load', function() {
    initNavbarToggle();
  });

  function initNavbarToggle() {
    $("#navbar-checkbox").change(function() {
      if (this.checked) {
        console.log('its checked');
        $(".sidebar").addClass("active");
      } else {
        $(".sidebar").removeClass("active");
      }
    });
  }
