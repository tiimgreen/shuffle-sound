function removeFields(link) {
  $(link).prev("input[type=hidden]").val("true");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}

$(document).ajaxSuccess(function(e, data, status, xhr) {
  var result = JSON.parse(data.responseText);
  $(".track-points.id-" + result.id).html(result.points);
});

$("#track-sorting").change(function() {
  alert(this.val());
});

// window.location.href
