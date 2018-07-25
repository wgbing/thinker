/**
 * 组织机构js
 */

$(function () {
	initialPage();
	getGrid();
});

function initialPage() {
	$(window).resize(function() {
		TreeGrid.table.resetHeight({height: $(window).height()-100});
	});
}

function getGrid() {
	var colunms = TreeGrid.initColumn();
    var table = new TreeTable(TreeGrid.id, '/sys/org/list?_' + $.now(), colunms);
    table.setExpandColumn(0);
    table.setIdField("id");
    table.setCodeField("id");
    table.setParentCodeField("parentId");
    table.setExpandAll(false);
    table.setHeight($(window).height()-100);
    table.init();
    TreeGrid.table = table;
}

// var vm = new Vue({
// 	el:'#dpLTE',
// 	methods : {
// 		load: function() {
// 			TreeGrid.table.refresh();
// 		},
// 		save: function() {
// 			dialogOpen({
// 				title: '新增机构',
// 				url: 'base/org/add.html?_' + $.now(),
// 				width: '500px',
// 				height: '315px',
// 				yes : function(iframeId) {
// 					top.frames[iframeId].vm.acceptClick();
// 				},
// 			});
// 		},
// 		edit: function() {
// 			var ck = TreeGrid.table.getSelectedRow();
// 			if(checkedRow(ck)){
// 				dialogOpen({
// 					title: '编辑机构',
// 					url: 'base/org/edit.html?_' + $.now(),
// 					width: '500px',
// 					height: '315px',
// 					success: function(iframeId){
// 						top.frames[iframeId].vm.org.orgId = ck[0].id;
// 						top.frames[iframeId].vm.setForm();
// 					},
// 					yes : function(iframeId) {
// 						top.frames[iframeId].vm.acceptClick();
// 					},
// 				});
// 			}
// 		},
// 		remove: function() {
// 			var ck = TreeGrid.table.getSelectedRow(), ids = [];
// 			if(checkedArray(ck)){
// 				$.each(ck, function(idx, item){
// 					ids[idx] = item.id;
// 				});
// 				$.RemoveForm({
// 					url: '../../sys/org/remove?_' + $.now(),
// 			    	param: ids,
// 			    	success: function(data) {
// 			    		vm.load();
// 			    	}
// 				});
// 			}
// 		}
// 	}
// })

var TreeGrid = {
    id: "dataGrid",
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
TreeGrid.initColumn = function () {
    var columns = [
        // {field: 'selectItem', radio: true},
        // {field: 'id', hidden: true},
        {title: '机构名称', field: 'name', align: 'center', valign: 'middle',width:'250px'},
        {title: '机构简称', field: 'shortName', align: 'center', valign: 'middle', width: '200px'},
        {title: '排序号', field: 'sortNo', align: 'center', valign: 'middle', width: '80px'},
        {title: '机构类型', field: 'type', align: 'center', valign: 'middle', width: '100px'},
        {title: '更新时间', field: 'updateTime', align: 'center', valign: 'middle', width: '150px'},
        {title: '备注信息', field: 'remark', align: 'center', valign: 'middle', width: '200px'},
        {title: '状态', field: 'status', align: 'center', valign: 'middle', width: '80px',
            formatter: function(item, index){
                if(item.status === 0){
                    return '<i class="fa fa-toggle-off"></i>';
                }
                if(item.status === 1){
                    return '<i class="fa fa-toggle-on"></i>';
                }
            }
        },
        {title: '操作', align: 'center', valign: 'middle', width: '150px'}]
    return columns;
};
