$.SaveForm = function(options) {
	var defaults = {
		url : "",
		param : {},
		type : "post",
		dataType : "json",
		contentType : 'application/json',
		success : null,
		close : true
	};
	var options = $.extend(defaults, options);
	dialogLoading(true);
	window.setTimeout(function() {
		$.ajax({
			url : options.url,
			data : JSON.stringify(options.param),
			type : options.type,
			dataType : options.dataType,
			contentType : options.contentType,
			success : function(data) {
				if (data.code == '500') {
					dialogAlert(data.msg, 'error');
				} else if (data.code == '0') {
					options.success(data);
					dialogMsg(data.msg, 'success');
					if (options.close == true) {
						dialogClose();
					}
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
