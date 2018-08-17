function orgTree() {
    top.layer.open({
        type: 2,
        title: '所属机构',
        shadeClose: false,//点击弹层外区域关闭
        shade: 0.1,
        maxmin: true, //开启最大化最小化按钮
        area: ['320px', '500px'],
        content: '/sys/role/orgTree',
        btn: ["确定",'关闭'],
        yes: function(index, layero){
            console.log("layero",layero);
            layer.close(index); //如果设定了yes回调，需进行手工关闭
        }
    });
}