-- Init user (admin/admin@123)
INSERT INTO `thinker`.`sys_user` (`id`, `create_time`, `deleted`, `email`, `enable`, `last_login_ip`, `last_login_time`, `login_name`, `mobile`, `password`, `real_name`, `remark`, `sex`, `sort_no`, `type`, `update_time`, `leader_id`, `organization_id`) VALUES ('5', '2018-07-13 09:40:57', b'0', NULL, b'1', '127.0.0.1', '2018-07-30 08:39:30', 'admin', '17719930423', '$2a$10$g9OYHLwkB.FZNHtZ2wJpEu5E/KDVtSCaRuzJlxqr6QtF/qxqCEK2O', '管理员', NULL, '1', '1', '1', '2018-07-13 09:42:33', NULL, '1');
--Init organization
INSERT INTO `thinker`.`sys_organization` (`id`, `create_time`, `deleted`, `enable`, `remark`, `short_name`, `sort_no`, `type`, `update_time`, `parent_id`, `org_name`) VALUES ('1', '2018-07-25 17:27:26', b'0', b'1', NULL, '中国', '1', '1', '2018-07-25 17:29:53', NULL, '中华人民共和国');
INSERT INTO `thinker`.`sys_organization` (`id`, `create_time`, `deleted`, `enable`, `remark`, `short_name`, `sort_no`, `type`, `update_time`, `parent_id`, `org_name`) VALUES ('2', '2018-07-25 17:31:18', b'0', b'1', NULL, '河南', '1', '2', '2018-07-25 17:31:47', '1', '河南');
INSERT INTO `thinker`.`sys_organization` (`id`, `create_time`, `deleted`, `enable`, `remark`, `short_name`, `sort_no`, `type`, `update_time`, `parent_id`, `org_name`) VALUES ('3', '2018-07-25 17:31:18', b'0', b'1', NULL, '湖南', '2', '2', '2018-07-25 17:31:47', '1', '湖南');
INSERT INTO `thinker`.`sys_organization` (`id`, `create_time`, `deleted`, `enable`, `remark`, `short_name`, `sort_no`, `type`, `update_time`, `parent_id`, `org_name`) VALUES ('4', '2018-07-25 17:31:18', b'0', b'1', NULL, '上海', '3', '2', '2018-07-25 17:31:47', '1', '上海');
INSERT INTO `thinker`.`sys_organization` (`id`, `create_time`, `deleted`, `enable`, `remark`, `short_name`, `sort_no`, `type`, `update_time`, `parent_id`, `org_name`) VALUES ('5', '2018-07-25 17:31:18', b'0', b'1', NULL, '郑州', '1', '3', '2018-07-25 17:31:47', '2', '郑州');
INSERT INTO `thinker`.`sys_organization` (`id`, `create_time`, `deleted`, `enable`, `remark`, `short_name`, `sort_no`, `type`, `update_time`, `parent_id`, `org_name`) VALUES ('6', '2018-07-25 17:31:18', b'0', b'1', NULL, '许昌', '2', '3', '2018-07-25 17:31:47', '2', '许昌');

-- Init Role

-- Init User_Role

-- Init Permission

-- SYSTEM
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(1, '系统管理', '系统管理', 'system', 'system', 1,  1, 1, NULL, NULL, 1);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(2, '管理员设置', '管理员设置', 'admin_list', '/admin/list', 2,  1, 1, 1, '系统管理', 1);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(3, '角色管理', '角色管理', 'role_list', '/role/list', 2,  1, 1, 1, '系统管理', 2);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(4, '数据字典', '数据字典', 'config_list', '/config/list', 2,  1, 1, 1, '系统管理', 3);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(5, '部门管理', '部门管理', 'organization_list', '/organization/list', 2,  1, 1, 1, '系统管理', 4);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(6, '通知公告-查看', '通知公告-查看', 'notice_view', '', 2,  1, 1, 1, '系统管理', 5);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(7, '通知公告-操作', '通知公告-操作', 'notice_operate', '', 2,  1, 1, 1, '系统管理', 6);

-- CLUE
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(10, '线索管理', '线索管理', 'clue', '', 1, 1, 1, NULL, NULL, 2);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(11, '线索页面-超级权限', '线索页面-超级权限', 'clue_su', '', 2, 1, 1, 10, '线索管理', 3);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(12, '线索节点-受理-查看', '线索节点-受理-查看', 'clue_accept_view'      , '', 2, 2, 1, 10, '线索管理', 5);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(13, '线索节点-受理-操作', '线索节点-受理-操作', 'clue_accept_operate'   , '', 2, 2, 1, 10, '线索管理', 6);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(14, '线索节点-谈话-查看', '线索节点-谈话-查看', 'clue_talk_view'        , '', 2, 2, 1, 10, '线索管理', 7);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(15, '线索节点-谈话-操作', '线索节点-谈话-操作', 'clue_talk_operate'     , '', 2, 2, 1, 10, '线索管理', 8);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(16, '线索节点-函询-查看', '线索节点-函询-查看', 'clue_letters_view'     , '', 2, 2, 1, 10, '线索管理', 9);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(17, '线索节点-函询-操作', '线索节点-函询-操作', 'clue_letters_operate'  , '', 2, 2, 1, 10, '线索管理', 10);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(18, '线索节点-初核-查看', '线索节点-初核-查看', 'clue_initcheck_view'   , '', 2, 2, 1, 10, '线索管理', 11);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(19, '线索节点-初核-操作', '线索节点-初核-操作', 'clue_initcheck_operate', '', 2, 2, 1, 10, '线索管理', 12);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(20, '线索节点-立案-查看', '线索节点-立案-查看', 'clue_filecheck_view'   , '', 2, 2, 1, 10, '线索管理', 13);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(21, '线索节点-立案-操作', '线索节点-立案-操作', 'clue_filecheck_operate', '', 2, 2, 1, 10, '线索管理', 14);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(22, '线索节点-审理-查看', '线索节点-审理-查看', 'clue_trial_view'       , '', 2, 2, 1, 10, '线索管理', 15);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(23, '线索节点-审理-操作', '线索节点-审理-操作', 'clue_trial_operate'    , '', 2, 2, 1, 10, '线索管理', 16);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(24, '线索节点-暂存-查看', '线索节点-暂存-查看', 'clue_hold_view'        , '', 2, 2, 1, 10, '线索管理', 17);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(25, '线索节点-暂存-操作', '线索节点-暂存-操作', 'clue_hold_operate'     , '', 2, 2, 1, 10, '线索管理', 18);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(26, '线索节点-结案-查看', '线索节点-结案-查看', 'clue_close_view'       , '', 2, 2, 1, 10, '线索管理', 19);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(27, '线索节点-结案-操作', '线索节点-结案-操作', 'clue_close_operate'    , '', 2, 2, 1, 10, '线索管理', 20);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(28, '线索流转-退回', '线索流转-退回', 'clue_back', '', 2, 2, 1, 10, '线索管理', 21);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(29, '涉案人员-查看',        '涉案人员-查看', 'clue_invperson_view', '', 2, 2, 1, 10, '线索管理', 22);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(30, '涉案人员-普通操作', '涉案人员-普通操作', 'clue_invperson_op1' , '', 2, 2, 1, 10, '线索管理', 23);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(31, '涉案人员-处分操作', '涉案人员-处分决定', 'clue_invperson_op2' , '', 2, 2, 1, 10, '线索管理', 24);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(32, '延长办案-普通查看', '延长办案-普通查看', 'clue_delay_vu1', '', 2, 2, 1, 10, '线索管理', 25);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(33, '延长办案-高级查看', '延长办案-高级查看', 'clue_delay_vu2', '', 2, 2, 1, 10, '线索管理', 26);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(34, '延长办案-普通操作', '延长办案-普通操作', 'clue_delay_op1' , '', 2, 2, 1, 10, '线索管理', 27);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(35, '延长办案-审批操作', '延长办案-审批操作', 'clue_delay_op2' , '', 2, 2, 1, 10, '线索管理', 28);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(36, '上传附件-普通查看', '上传附件-普通查看', 'clue_upfile_vu1'    , '', 2, 2, 1, 10, '线索管理', 29);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(37, '上传附件-高级查看', '上传附件-高级查看', 'clue_upfile_vu2'    , '', 2, 2, 1, 10, '线索管理', 30);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(38, '上传附件-操作',        '上传附件-操作', 'clue_upfile_operate', '', 2, 2, 1, 10, '线索管理', 31);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(39, '流转记录-查看', '流转记录-查看', 'clue_flow_view'     , '', 2, 2, 1, 10, '线索管理', 32);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(40, '左侧导航-线索录入', '左侧导航-线索录入', 'left_clue_entry', '', 2, 1, 1, 10, '线索管理', 1);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(41, '左侧导航-待办已办', '左侧导航-待办已办', 'left_clue_dbyb', '', 2, 1, 1, 10, '线索管理', 2);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(42, '线索页面-节点查询超级权限', '线索页面-节点查询超级权限', 'clue_node_search_su', '', 2, 2, 1, 10, '线索管理', 4);

-- STATISTICS
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(50, '统计查询', '统计查询', 'statistics', '', 1, 1, 1, NULL, NULL, 3);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(51, '左侧导航-线索查询', '左侧导航-线索查询', 'left_s8s_search', '', 2, 1, 1, 50, '统计查询', 1);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(52, '左侧导航-线索统计', '左侧导航-线索统计', 'left_s8s_clues8s', '', 2, 1, 1, 50, '统计查询', 2);
insert into sys_permission (id, name, description, res_key, res_url, level, type, visible, parent_id, parent_name, sort_no) values(53, '线索查询-线索催办', '线索查询-线索催办', 's8s_search_urge', '', 2, 2, 1, 50, '统计查询', 3);


-- Init Role_Permission
