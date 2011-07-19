$(function() {
  $("#tankmen th a, #tankmen .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#tankmen_search input").keyup(function() {
    $.get($("#tankmen_search").attr("action"), $("#tankmen_search").serialize(), null, "script");
    return false;
  });
});