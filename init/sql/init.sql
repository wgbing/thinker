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

-- Init Role_Permission
