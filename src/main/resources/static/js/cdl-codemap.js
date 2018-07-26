var CODE_MAP = {
    GENERAL: {
        YES     : [],
        CAN     : [],
        NEED    : [],
        ALLOW   : [],
        EXIST   : [],
        ENABLE  : [],
        STATUS  : [],
        TYPE :[]
    },
    //机构组织
    ORG:{
        TYPE    : []
    }
};

// GENERAL
CODE_MAP.GENERAL.YES[0] = "<span class='label label-warning'>否</span>";
CODE_MAP.GENERAL.YES[1] = "<span class='label label-success'>是</span>";

CODE_MAP.GENERAL.CAN[0] = "<span class='label label-warning'>不可以</span>";
CODE_MAP.GENERAL.CAN[1] = "<span class='label label-success'>可以</span>";

CODE_MAP.GENERAL.NEED[0] = "<span class='label label-warning'>不需要</span>";
CODE_MAP.GENERAL.NEED[1] = "<span class='label label-success'>需要</span>";

CODE_MAP.GENERAL.ALLOW[0] = "<span class='label label-warning'>不允许</span>";
CODE_MAP.GENERAL.ALLOW[1] = "<span class='label label-success'>允许</span>";

CODE_MAP.GENERAL.EXIST[0] = "<span class='label label-warning'>不存在</span>";
CODE_MAP.GENERAL.EXIST[1] = "<span class='label label-success'>存在</span>";

CODE_MAP.GENERAL.ENABLE[0] = "<span class='label label-danger'>禁用</span>";
CODE_MAP.GENERAL.ENABLE[1] = "<span class='label label-success'>启用</span>";

CODE_MAP.GENERAL.STATUS[0] = "<span class='label label-danger'>禁用</span>";
CODE_MAP.GENERAL.STATUS[1] = "<span class='label label-success'>正常</span>";

//ORG
CODE_MAP.ORG.TYPE[1] = "<span class='label label-success'>一级组织</span>";
CODE_MAP.ORG.TYPE[2] = "<span class='label label-success'>二级组织</span>";
CODE_MAP.ORG.TYPE[3] = "<span class='label label-success'>三级组织</span>";





