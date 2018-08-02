//路径导航
$(function () {
    var nav_title = $('#nav_title', window.parent.document);
    console.log(nav_title);
    $("#nav_title li").not(":first").remove();
});
