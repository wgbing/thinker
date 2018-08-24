/**
 * 表单操作通用JS
 */
//表单保存
$.SaveForm = function(options) {
	var defaults = {
		url : "",
        data : {},
		type : "post",
		dataType : "json",
		success : null,
		close : true
	};
	var options = $.extend(defaults, options);
	dialogLoading(true);
	window.setTimeout(function() {
		$.ajax({
			url : options.url,
			data : options.data,
			type : options.type,
			dataType : options.dataType,
			success : function(data) {
				if(data.success){
                    options.success(data);
                    dialogMsg(data.message, 'success');
                    if (options.close == true) {
                        dialogClose();
                    }
				}else {
                    dialogAlert(data.message, 'error');
				}
			},
			error : ajaxErrorHandler,
			beforeSend : function() {
				dialogLoading(true);
			},
			complete : function() {
				dialogLoading(false);
			}
		});
	}, 500);
}

//带确认提醒的表单保存
$.ConfirmForm = function(options) {
    var defaults = {
        msg : "确认要提交吗？",
        url : "",
        param : {},
        type : "post",
        dataType : "json",
        success : null,
        close : true
    };
    var options = $.extend(defaults, options);
    bootboxConfirm(options.msg, function() {
        $.SaveForm(options);
    });
}