$(function () {
	//点击菜单增加激活属性
    $("ul.treeview-menu li").click(function () {
        $("ul.treeview-menu li").removeClass("active");
        $(this).addClass("active");
    });
	// iframe自适应
    $(window).on('resize', function() {
        var $content = $('.content');
        $content.height($(this).height() - 182);
        $content.find('iframe').each(function() {
            $(this).height($content.height());
        });
    }).resize();
});
