$(function () {
	//点击菜单增加激活属性
    $("ul.treeview-menu li").click(function () {
        $("ul.treeview-menu li").removeClass("active");
        $(this).addClass("active");
    });
	// iframe自适应
    $(window).on('resize', function() {
        var $content = $('.content');
        var mainHeaderHeight = $("#mainHeader").outerHeight(true);
        var pageHeaderHeight = $("#pageHeader").outerHeight(true);
        var mainFooterHeight =$("#mainFooter").outerHeight(true);
        var contentOutHeight = $content.outerHeight(true)-$content.height();
        $content.height($(this).height() - (mainHeaderHeight+pageHeaderHeight+mainFooterHeight+contentOutHeight));
        $content.find('iframe').each(function() {
            $(this).height($content.height());
        });
    }).resize();

});
