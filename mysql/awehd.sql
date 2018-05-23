

CREATE TABLE `school` (
  `id` varchar(64) NOT NULL  COMMENT '学校ID',
  `name` varchar(64) NOT NULL COMMENT '学校名称',
  `logo` varchar(512) NOT NULL COMMENT '学校logo',
  `motto` varchar(64) NOT NULL COMMENT '学校校训',
  `intro` timestamp NOT NULL COMMENT '学校简介',
  `province` varchar(32) NOT NULL COMMENT '所属省',
  `city` varchar(32) NOT NULL COMMENT '所属市',
  `address` varchar(64) NOT NULL COMMENT '学校详细地址',
  `create_time` timestamp not null default current_timestamp COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) COMMENT '学校信息表';


CREATE TABLE `organization` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `account` varchar(32) NOT NULL COMMENT '组织账号',
  `name` varchar(64) NOT NULL COMMENT '组织名称',
  `logo` varchar(64) NOT NULL COMMENT '组织logo',
  `brief` varchar(40) DEFAULT NULL COMMENT '一句话简介',
  `intro` varchar(255) DEFAULT NULL COMMENT '组织介绍',
  `type` varchar(16) NOT NULL COMMENT '组织类型',
  `school` varchar(16) NOT NULL COMMENT '所属学校',
  `leader_name` varchar(16)  NOT NULL COMMENT '负责人真实姓名',
  `leader_phone` varchar(16)  NOT NULL COMMENT '负责人手机号码',
  `leader_email` varchar(32)  COMMENT '负责人电子邮箱',  
  `state` tinyint(3) NOT NULL DEFAULT '1' COMMENT '账号状态：默认1已禁用 0正常',
  `auth` tinyint(3) NOT NULL DEFAULT '1' COMMENT '认证状态，默认1未认证，0已认证',
  `create_time` timestamp not null default current_timestamp COMMENT '注册时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) COMMENT '组织方信息表';



CREATE TABLE `user` (
  `id` varchar(32) NOT NULL COMMENT '用户ID',
  `real_name` varchar(32) NOT NULL COMMENT '真实姓名',
  `nick_name` varchar(32)  COMMENT '昵称',
  `icon` varchar(32)  COMMENT '头像',  
  `gender` tinyint(2)  COMMENT '性别，1为男性，0为女性，-1为未知',  
  `brief` varchar(40) DEFAULT NULL COMMENT '一句话简介',
  `phone` varchar(16) NOT NULL COMMENT '绑定手机号码',
  `emial` varchar(32) COMMENT '绑定邮箱',
  `open_id` varchar(64) NOT NULL COMMENT '绑定微信openid',
  `state` tinyint(3) NOT NULL DEFAULT '0' COMMENT '账号状态,默认0正常，1禁用',
  `type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '默认1普通用户',
  `create_time` timestamp NOT NULL DEFAULT current_timestamp COMMENT '注册时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) COMMENT '用户信息表';


CREATE TABLE `student` (
  `id` varchar(32) NOT NULL COMMENT '用户ID',
  `real_name` varchar(32) NOT NULL COMMENT '学生姓名',
  `school` varchar(32)  COMMENT '所属学校',
  `department` varchar(32)  COMMENT '所属学院/系',  
  `sno` varchar(40) DEFAULT NULL COMMENT '学生学号',
  `start_date` date NOT NULL COMMENT '入学年月',
  `study_length` varchar(32) COMMENT '学制',
  `valid` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否有效，默认0有效，1无效',  
  `create_time` timestamp NOT NULL DEFAULT current_timestamp COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) COMMENT '认证学生信息表';

CREATE TABLE `activity` (
  `id` varchar(64) NOT NULL  COMMENT '活动ID',
  `name` varchar(64) NOT NULL COMMENT '活动名称',
  `poster` varchar(512) NOT NULL COMMENT '活动海报',
  `start_time` timestamp NOT NULL COMMENT '活动开始时间',
  `end_time` timestamp NOT NULL COMMENT '活动结束时间',
  `province` varchar(32) NOT NULL COMMENT '活动省级地址',
  `city` varchar(32) NOT NULL COMMENT '活动市级地址',
  `county` varchar(32) NOT NULL COMMENT '活动县/区级地址，待用',
  `address` varchar(64) NOT NULL COMMENT '活动详细地址',
  `matter` varchar(100)  COMMENT '活动摘要',
  `detail` varchar(250)  COMMENT '活动详情',
  `number` int(10) NOT NULL COMMENT '活动人数',
  `criteria` varchar(250)  COMMENT '报名条件',
  `type` varchar(20)  COMMENT '活动类型',
  `tag` varchar(20)  COMMENT '活动标签，多个以#分离',
  `group_chat` varchar(250)  COMMENT '活动群聊，活动组织方设置的报名成功微信群二维码或QQ群二维码地址，用户报名成功才可见',  
  `organization_id` int(10) NOT NULL COMMENT '发布方id',
  `organization_name` varchar(20) NOT NULL COMMENT '发布方名称',
  
  `visible` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否可见，默认0对所有人可见，1仅管理员可见',
  `state` tinyint(3) NOT NULL DEFAULT '1' COMMENT '活动状态，默认1接受报名，2报名结束，3已取消，4已开始，0已结束',
  `create_time` timestamp not null default current_timestamp COMMENT '发布时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) COMMENT '活动信息表';

CREATE TABLE entry (
  `id` varchar(32) NOT NULL COMMENT '报名id',
  `user_id` varchar(32) NOT NULL COMMENT '用户id',
  `activity_id` varchar(32)  COMMENT '活动id',
  `state` tinyint(3) NOT NULL DEFAULT '1' COMMENT '报名状态，默认1，1待审核，2已取消，3未通过，4已通过，0已完成。',
  `valid` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否有效，默认0有效，1无效',  
  `create_time` timestamp NOT NULL DEFAULT current_timestamp COMMENT '报名时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)

)COMMENT '活动报名信息表';

CREATE TABLE entry_alter (
  `id` varchar(32) NOT NULL COMMENT '变更id',
  `entry_id` varchar(32) NOT NULL COMMENT '报名id',
  `activity_id` varchar(32)  COMMENT '活动id',
  `state` tinyint(3) NOT NULL DEFAULT '0' COMMENT '变更后状态，1待审核，2已取消，3未通过，4已通过，0已完成。',
  `create_time` timestamp NOT NULL DEFAULT current_timestamp COMMENT '变更时间',
  `operator` varchar(32) NOT NULL COMMENT '操作人',
  PRIMARY KEY (`id`)

)COMMENT '报名状态变更表';



CREATE TABLE `banner` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `visible` int(1) DEFAULT '0' COMMENT '默认0:代表展示，1:代表不显示',
  `ord` int(1) DEFAULT NULL COMMENT '排序，值越小越在前面，待用',
  `url` varchar(255) DEFAULT NULL COMMENT '跳转地址',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `create_time` timestamp NOT NULL DEFAULT current_timestamp COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '首页滑动图片表';