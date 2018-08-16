/**
 * 动态添加路径导航
 */
function addNavTitle(aTitle,bTitle) {
    var navTitle = $('#nav_title', window.parent.document);
    navTitle.children("li").not(":first").remove();
    navTitle.append("<li>"+aTitle+"</li>").append("<li class='active'>"+bTitle+"</li>");
}
/**
 * 异步错误处理
 * @param xhr
 * @param textStatus
 * @param errorThrown
 */
function ajaxErrorHandler(xhr, textStatus, errorThrown) {
    // session失效
    if (xhr.status === 401) {
        toUrl("/login");
    } else if (xhr.status === 500) {
        toastr.error("HTTP Status: 500 服务器内部错误", "提示信息");
    } else {
        toastr.error("HTTP Status: " + xhr.status, "提示信息");
    }
}

formatDate = function (v, format) {
    if (!v) return "";
    var d = v;
    if (typeof v === 'string') {
        if (v.indexOf("/Date(") > -1)
            d = new Date(parseInt(v.replace("/Date(", "").replace(")/", ""), 10));
        else
            d = new Date(Date.parse(v.replace(/-/g, "/").replace("T", " ").split(".")[0]));//.split(".")[0] 用来处理出现毫秒的情况，截取掉.xxx，否则会出错
    }
    var o = {
        "M+": d.getMonth() + 1,
        "d+": d.getDate(),
        "h+": d.getHours(),
        "m+": d.getMinutes(),
        "s+": d.getSeconds(),
        "q+": Math.floor((d.getMonth() + 3) / 3),
        "S": d.getMilliseconds()
    };
    if (/(y+)/.test(format)) {
        format = format.replace(RegExp.$1, (d.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
        }
    }
    return format;
}

function today() {
    var dd = new Date();
    return formatDate(dd, 'yyyy-MM-dd');
}

function countDay(dayCount) {
    var dd = new Date();
    dd.setDate(dd.getDate()+dayCount);//获取AddDayCount天后的日期
    var y = dd.getFullYear();
    var m = (dd.getMonth()+1)<10?"0"+(dd.getMonth()+1):(dd.getMonth()+1);//获取当前月份的日期，不足10补0
    var d = dd.getDate()<10?"0"+dd.getDate():dd.getDate();//获取当前几号，不足10补0
    return y+"-"+m+"-"+d;
}

isNullOrEmpty = function (obj) {
    if ((typeof (obj) == "string" && obj == "") || obj == null || obj == undefined) {
        return true;
    } else {
        return false;
    }
}

isNotNullOrEmpty = function (obj) {
    if ((typeof (obj) == "string" && obj == "") || obj == null || obj == undefined) {
        return false;
    } else {
        return true;
    }
}

function reload() {
    location.reload();
    return false;
}
function toUrl(href) {
    window.location.href = href;
}
function dialogAlert(content, type) {
    var msgType = {
        success:1,
        error:2,
        warn:3,
        info:7
    };
    if(isNullOrEmpty(type)){
        type='info';
    }
    layer.alert(content, {
        icon: msgType[type],
        title: "系统提示",
        anim: -1,
        btnAlign: 'c',
        isOutAnim: false
    });
}

dialogMsg = function(msg, type) {
    var msgType = {
        success:1,
        error:2,
        warn:3,
        info:7
    };
    if(isNullOrEmpty(type)){
        type='info';
    }
    layer.msg(msg, {
        icon: msgType[type],
        time: 2000
    });
}

function dialogClose() {
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.close(index);
}

function dialogLoading(flag) {
    if(flag){
        layer.load(0, {
            shade: [0.1,'#fff'],
            time: 2000
        });
    }else{
        layer.closeAll('loading');//关闭加载层
    }
}
function operationCompleted(data) {
    toastr.success(data.message, "提示信息");
    layer.closeAll();
    reload();
}
function bootboxConfirm(message, callback) {
    bootbox.confirm({
        title: "提示信息",
        message: message,
        buttons: {
            confirm: {
                label: '确&nbsp;&nbsp;认',
                className: 'btn-success'
            },
            cancel: {
                label: '取&nbsp;&nbsp;消',
                className: 'btn-danger'
            }
        },
        backdrop: true,
        callback: callback
    });
}

$.fn.bootstrapTableEx = function(opt){
    var defaults = {
        url: '',
        dataField: "rows",
        method: 'post',
        dataType: 'json',
        selectItemName: 'id',
        clickToSelect: true,    //是否启用点击选中行
        pagination: true,       //是否显示分页
        striped: true,          //是否显示行间隔色
        smartDisplay: false,
        pageSize: 10,
        pageList: [5, 10, 20, 30, 40, 50],
        paginationLoop: false,
        sidePagination: 'server',
        queryParamsType : null,
        columns: []
    };
    var option = $.extend({}, defaults, opt);
    if(!option.pagination){
        option.responseHandler = function(res) {
            return res.rows;
        }
    }
    $(this).bootstrapTable(option);
}
