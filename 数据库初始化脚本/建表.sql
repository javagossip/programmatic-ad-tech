
<<<<<<< HEAD

=======
>>>>>>> db4f7c075073ee0b0af35d9fcfa3a5e50102a82f
CREATE TABLE `ad_position` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '广告位名称',
  `flow_uuid` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '流量源uuid',
  `app_id` int(11) DEFAULT NULL COMMENT 'appid',
  `create_type` int(11) DEFAULT NULL COMMENT '创建类型( 1 广告平台创建 2 同步创建)',
  `template_id` int(11) DEFAULT NULL COMMENT '模版id',
  `out_template_id` int(11) DEFAULT NULL COMMENT '同步外部爱卡模板id(无用)',
  `type` int(11) DEFAULT NULL COMMENT '广告位类型',
  `sell_type` int(11) DEFAULT NULL COMMENT '售卖类型(无用)',
  `terminal` int(11) DEFAULT NULL COMMENT '终端类型',
  `flow_position_id` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '流量源广告位id',
  `uuid` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '广告位uuid',
  `status` int(11) DEFAULT NULL COMMENT '状态 0:无效 1:有效',
  `channel` int(11) DEFAULT NULL COMMENT '频道(无用)',
  `sub_Channel` int(11) DEFAULT NULL COMMENT '子频道(无用)',
  `car_level` int(11) DEFAULT NULL COMMENT '车级别(无用)',
  `car_series` int(11) DEFAULT NULL COMMENT '车系(无用)',
  `area_level` int(11) DEFAULT NULL COMMENT '地域等级(无用)',
  `area` int(11) DEFAULT NULL COMMENT '城市(无用)',
  `price_range` int(11) DEFAULT NULL COMMENT '价格区间(无用)',
  `forecast_exposure` bigint(20) DEFAULT NULL COMMENT '预估曝光(无用)',
  `forecast_click` bigint(20) DEFAULT NULL COMMENT '预估点击(无用)',
  `min_sell_day` int(11) DEFAULT NULL COMMENT '最小售卖天数(无用)',
  `update_user` int(11) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '最后更改时间',
  `aika_template_id` int(11) DEFAULT NULL COMMENT '爱卡模版id',
  `comment` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='广告位表';



# Dump of table ad_position_price
# ------------------------------------------------------------

CREATE TABLE `ad_position_price` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `position_id` int(11) unsigned DEFAULT NULL COMMENT '广告位id',
  `terminal` int(11) unsigned DEFAULT NULL COMMENT '终端类型',
  `industry` int(11) unsigned DEFAULT NULL COMMENT '行业类型',
  `area_level` int(11) DEFAULT NULL COMMENT '地域等级',
  `sell_type` int(11) DEFAULT NULL COMMENT '售卖计费类型',
  `price` double DEFAULT NULL COMMENT '底价（单位：分）',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `update_user` int(11) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告位底价';



# Dump of table advertiser_dsp
# ------------------------------------------------------------

CREATE TABLE `advertiser_dsp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '广告主名称',
  `flow_consumer_id` int(11) DEFAULT NULL COMMENT '广告平台id（dsp）',
  `dsp_advertiser_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '广告主在爱卡的唯一标识',
  `status` int(11) DEFAULT NULL COMMENT '状态  1:有效 0:无效',
  `examines_status` int(11) DEFAULT NULL COMMENT '审核状态',
  `examines_user` int(11) DEFAULT NULL COMMENT '审核人id',
  `examines_time` datetime DEFAULT NULL COMMENT '审核时间',
  `examines_remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '审核备注',
  `businesslicense` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '营业执照',
  `qualifications` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '其他资质',
  `industry_type` int(11) DEFAULT NULL COMMENT '行业id（字典表中）',
  `linkman` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '联系人',
  `tel` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '联系电话',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '联系地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='第三方平台广告主表';



# Dump of table adx_relation
# ------------------------------------------------------------

CREATE TABLE `adx_relation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `obj_id` int(11) DEFAULT NULL COMMENT '审核对象id',
  `obj_type` int(11) DEFAULT NULL COMMENT '审核对象的类型(创意6 或者 客户1)',
  `adx_type` int(11) DEFAULT NULL,
  `adx_upid` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '媒体upid',
  `adx_crid` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '媒体crid',
  `adx_url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '物料地址',
  `audit_state` int(11) DEFAULT NULL COMMENT '审核状态',
  `audit_comments` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '审核备注',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `industry` int(11) DEFAULT NULL COMMENT '行业',
  PRIMARY KEY (`id`),
  KEY `index_objid` (`obj_id`),
  KEY `index_objtype` (`obj_type`),
  KEY `index_adx` (`adx_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='广告平台系统提审表';



# Dump of table agent_price
# ------------------------------------------------------------

CREATE TABLE `agent_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `aid` int(11) DEFAULT NULL COMMENT '代理商id',
  `mid` int(11) DEFAULT NULL COMMENT '媒体id',
  `pid` int(11) DEFAULT NULL COMMENT '广告位id',
  `industryid` int(11) DEFAULT NULL COMMENT '行业id',
  `price` int(11) DEFAULT NULL COMMENT '价格',
  `status` int(11) DEFAULT '1' COMMENT '状态',
  `update_user` int(11) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `sys_flag` int(11) DEFAULT NULL COMMENT '是否系统配置',
  `os` int(11) DEFAULT NULL COMMENT '操作系统',
  `area_level` int(11) DEFAULT NULL COMMENT '地域级别',
  `profit_margin` double DEFAULT NULL COMMENT '利润率',
  `pay_type` int(11) DEFAULT NULL COMMENT '扣费方式',
  PRIMARY KEY (`id`),
  KEY `index_aid` (`aid`),
  KEY `index_mid` (`mid`),
  KEY `index_pid` (`pid`),
  KEY `index_indsid` (`industryid`),
  KEY `index_os` (`os`),
  KEY `index_sys` (`sys_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='代理商低价表';



# Dump of table agent_recharge
# ------------------------------------------------------------

CREATE TABLE `agent_recharge` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) DEFAULT NULL COMMENT '代理商id',
  `create_day` int(11) DEFAULT NULL COMMENT '创建日期',
  `price` bigint(20) DEFAULT NULL COMMENT '金额',
  `type` int(11) DEFAULT NULL COMMENT '类型： 1:充值 2:退款',
  `create_user` int(11) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `comment` varchar(512) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `index_agent_id` (`agent_id`),
  KEY `index_create_day` (`create_day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代理商充值表';



# Dump of table apps
# ------------------------------------------------------------

CREATE TABLE `apps` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `app_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'app名称',
  `app_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'app id/包名/站点名称',
  `dow_url` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '下载页',
  `site_url` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '站点url',
  `apk_url` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '包地址',
  `medias` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '所属第三方聚合媒体',
  `platform` int(11) DEFAULT NULL COMMENT '操作系统 2安卓/1ios/3pc',
  `price` int(11) DEFAULT NULL COMMENT '价格',
  `flow_num` int(11) DEFAULT NULL COMMENT '流量',
  `type` int(11) DEFAULT NULL COMMENT 'app分类',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `audit_status` int(11) DEFAULT NULL COMMENT '审核状态',
  `audit_opinion` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '审核意见',
  `audit_user` int(11) DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `pay_discount` double DEFAULT NULL COMMENT '分成系数',
  `status` int(11) NOT NULL COMMENT '状态',
  `ad_pos_ids` varchar(10000) COLLATE utf8_bin DEFAULT NULL COMMENT '广告位id串儿',
  `app_status` int(11) DEFAULT NULL COMMENT '删除状态',
  `app_downurl` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT 'app上传路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='联盟媒体app';



# Dump of table area
# ------------------------------------------------------------

CREATE TABLE `area` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `area_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '地区名称',
  `area_code` int(11) DEFAULT NULL COMMENT '地区码',
  `superior_area` int(11) DEFAULT NULL COMMENT '上级地区',
  `type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '状态 1:有效 0:无效',
  `is_city_level` int(11) DEFAULT NULL COMMENT '是否为页面城市属性：1:是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='地域表';



# Dump of table area_group
# ------------------------------------------------------------

CREATE TABLE `area_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '地区分组名称',
  `area_ids` text COLLATE utf8_bin COMMENT '地区id',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `group_type` int(11) DEFAULT NULL COMMENT '分组类别  1:城市等级 2:地域等级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='地域组';



# Dump of table auth_group
# ------------------------------------------------------------

CREATE TABLE `auth_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `platform` int(11) DEFAULT '1' COMMENT '平台',
  `create_user` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户组';



# Dump of table auths
# ------------------------------------------------------------

CREATE TABLE `auths` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '权限名',
  `path` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '路径',
  `pid` int(11) DEFAULT NULL COMMENT '父级ID',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `platform` int(11) DEFAULT NULL COMMENT '平台',
  `is_menu` int(11) DEFAULT NULL COMMENT '是否菜单',
  `orders` int(11) DEFAULT NULL COMMENT '显示顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单权限';



# Dump of table company
# ------------------------------------------------------------

CREATE TABLE `company` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `out_cid` int(11) DEFAULT NULL COMMENT '同步的爱卡客户id',
  `short_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '简称',
  `full_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '全称',
  `type` int(11) DEFAULT NULL COMMENT '公司类型',
  `ag_type` int(11) DEFAULT NULL COMMENT '代理商类型',
  `link_man` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '联系人',
  `phone` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '联系方式',
  `businesslicense` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '营业执照',
  `qualifications` text COLLATE utf8_bin COMMENT '其他资质',
  `remark` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `balance_status` int(11) DEFAULT NULL COMMENT '余额状态',
  `web_url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '公司网站',
  `aid` int(11) DEFAULT NULL COMMENT '代理商ID',
  `readonly` int(11) DEFAULT NULL COMMENT '只读',
  `uuid` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT 'UUID',
  `industry_type` int(11) DEFAULT NULL COMMENT '行业类型',
  `audit_user` int(11) DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `audit_status` int(11) DEFAULT NULL COMMENT '审核状态',
  `audit_comment` text COLLATE utf8_bin COMMENT '审核备注',
  `create_user` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `bid_discount` double DEFAULT '1' COMMENT '竞价系数',
  `pay_discount` double DEFAULT '1' COMMENT '扣费系数',
  `profit_margin` double DEFAULT '0' COMMENT '利润率',
  `address` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '地址',
  `is_delete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='代理商/客户';



# Dump of table dictionary
# ------------------------------------------------------------

CREATE TABLE `dictionary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dic_value` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '字典值',
  `dic_key` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '字典健值',
  `dic_group` int(11) DEFAULT NULL COMMENT '字典组id',
  `dic_type` int(11) DEFAULT NULL COMMENT '字典类型',
  `enum_value` int(11) DEFAULT NULL COMMENT '字典枚举值',
  `status` int(11) DEFAULT NULL COMMENT '状态  0:无效 1:有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table dmp_data_definition
# ------------------------------------------------------------

CREATE TABLE `dmp_data_definition` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `did` int(11) DEFAULT NULL COMMENT '数据集',
  `col` int(11) DEFAULT NULL COMMENT '列',
  `col_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '列名',
  `col_type` int(11) DEFAULT NULL COMMENT '列类型',
  `is_key` int(11) DEFAULT NULL COMMENT '是否主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='DMP数据集定义';



# Dump of table dmp_datas
# ------------------------------------------------------------

CREATE TABLE `dmp_datas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `sid` int(11) DEFAULT NULL COMMENT '数据源',
  `delimiter` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '分隔符',
  `del_id` int(11) DEFAULT NULL COMMENT '分隔符',
  `create_user` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='数据集';



# Dump of table dmp_datasource
# ------------------------------------------------------------

CREATE TABLE `dmp_datasource` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '数据源名称',
  `type` int(11) DEFAULT NULL COMMENT '供应方',
  `remark` text COLLATE utf8_bin COMMENT '描述',
  `create_user` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `paths` text COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='DMP数据源';



# Dump of table dmp_judge
# ------------------------------------------------------------

CREATE TABLE `dmp_judge` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `did` int(11) DEFAULT NULL COMMENT '数据集',
  `tid` int(11) DEFAULT NULL COMMENT '标签组',
  `status` int(11) DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `relation` int(11) DEFAULT NULL COMMENT '规则关系',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='数据集判定';



# Dump of table dmp_person_rule
# ------------------------------------------------------------

CREATE TABLE `dmp_person_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pkey` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '用户标识',
  `tid` int(11) DEFAULT NULL COMMENT '标签',
  `score` double DEFAULT NULL COMMENT '分值',
  `use_tag` int(11) DEFAULT NULL COMMENT '是否打标签',
  `did` int(11) DEFAULT NULL COMMENT '数据集ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='人群标签';



# Dump of table dmp_persons
# ------------------------------------------------------------

CREATE TABLE `dmp_persons` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '人群名称',
  `remark` text COLLATE utf8_bin COMMENT '描述',
  `did` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '数据集',
  `tags` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '已选标签',
  `relation` int(11) DEFAULT NULL COMMENT '组合关系',
  `status` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL COMMENT '覆盖人数',
  `update_time` datetime DEFAULT NULL,
  `times` int(11) DEFAULT NULL COMMENT '时段',
  `period` int(11) DEFAULT NULL COMMENT '周期',
  `type` int(11) DEFAULT NULL COMMENT '生成方式',
  `create_user` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `compute_status` int(11) DEFAULT NULL COMMENT '计算状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='人群';



# Dump of table dmp_rules
# ------------------------------------------------------------

CREATE TABLE `dmp_rules` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(11) DEFAULT NULL COMMENT '标签',
  `rid` int(11) DEFAULT NULL COMMENT '数据列',
  `operation` int(11) DEFAULT NULL COMMENT '运算符',
  `args` text COLLATE utf8_bin COMMENT '参数',
  `score` double DEFAULT NULL,
  `jid` int(11) DEFAULT NULL COMMENT '判定任务',
  `status` int(11) DEFAULT NULL,
  `sum_op` int(11) DEFAULT NULL COMMENT '累计操作',
  `sum_sc_l` double DEFAULT NULL COMMENT '累计最小分值',
  `create_user` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `relation` int(11) DEFAULT NULL COMMENT '同标签规则关系',
  `sum_sc_b` double DEFAULT NULL COMMENT '累计最大分值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='判定规则';



# Dump of table dmp_tag
# ------------------------------------------------------------

CREATE TABLE `dmp_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '标签名',
  `status` int(11) DEFAULT NULL,
  `tid` int(11) DEFAULT NULL COMMENT '标签租id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='标签';



# Dump of table dmp_tags
# ------------------------------------------------------------

CREATE TABLE `dmp_tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '标签组名称',
  `tags` varchar(1000) COLLATE utf8_bin DEFAULT '' COMMENT '标签',
  `status` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `is_dx` int(11) DEFAULT NULL COMMENT '是否用于定向',
  `dx_key` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '定向字段名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='标签组';



# Dump of table entity
# ------------------------------------------------------------

CREATE TABLE `entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '名称',
  `pid` int(11) NOT NULL COMMENT '投放id',
  `put_type` int(11) DEFAULT NULL COMMENT '投放类型(17 订单投放 18 精确投放 19 抄底投放)',
  `entity_title` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '标题，没用',
  `ad_id` int(11) DEFAULT NULL COMMENT '不用，单元id',
  `entity_desc` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '描述，没用',
  `entity_url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '素材地址(视频)',
  `run_state` int(11) NOT NULL DEFAULT '0' COMMENT '运行状态',
  `entity_state` int(11) NOT NULL DEFAULT '0' COMMENT '创意状态',
  `audit_user` int(11) DEFAULT NULL COMMENT '审核人',
  `audit_comments` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '审核意见',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人，广告主',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `user_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名，原生',
  `thread_title` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '标题，原生',
  `thread_pic1` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图片1，原生',
  `thread_pic2` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图片2，原生',
  `thread_pic3` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图片3，原生',
  `thread_content` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '帖子内容，原生',
  `thread_url_text` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '文字链，原生',
  `recommend_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '推荐文字，原生，没用',
  `recommend_link` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '推荐连接，原生，没用',
  `custom_css` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '自定义css，原生，没用',
  `user_portrait` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '用户头像，原生',
  `pop_window_text` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '弹窗文字，原生',
  `button_text` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '按钮文字，原生',
  `label_title` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '标签文字，原生',
  `label_visible` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '标签是否显示，原生，没用',
  `goods_style` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '广告版本，原生，没用',
  `ext_id` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '第三方ID',
  `ext_ids` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '分时间段第三方ID',
  `entity_type` int(11) DEFAULT NULL COMMENT '创意类型',
  `dataRate` int(11) DEFAULT NULL COMMENT '视频码流',
  `thread_pic4` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `thread_pic5` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `thread_pic6` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `thread_pic7` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `thread_pic8` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `thread_pic9` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `land1` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `land2` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `land3` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `land4` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `land5` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `land6` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `land7` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `land8` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `land9` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_creater` (`create_user`),
  KEY `index_uid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='创意表';



# Dump of table entity_dsp
# ------------------------------------------------------------

CREATE TABLE `entity_dsp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创意名称',
  `consumer_id` int(11) DEFAULT NULL COMMENT '广告平台id',
  `advertiser_id` int(11) DEFAULT NULL COMMENT '广告主id',
  `dsp_advertiser_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '广告平台广告主id',
  `dsp_creative_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '广告平台创意id',
  `position_id` int(11) unsigned zerofill DEFAULT NULL COMMENT '广告位id',
  `landpage` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '落地页',
  `expire_date` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '过期时间',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `examines_status` int(11) DEFAULT NULL COMMENT '审核状态',
  `examines_user` int(11) DEFAULT NULL COMMENT '审核人',
  `examines_time` datetime DEFAULT NULL COMMENT '审核时间',
  `examines_remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '审核备注',
  `entityType` int(11) DEFAULT NULL COMMENT '创意类型',
  `thread_title` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `thread_content` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '内容',
  `user_portrait` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '头像',
  `entityUrl` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `thread_pic1` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图片1',
  `thread_pic2` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图片2',
  `thread_pic3` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图片3',
  `thread_pic4` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `thread_pic5` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `thread_pic6` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `thread_pic7` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `thread_pic8` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `thread_pic9` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `package_name` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '包名',
  `app_id` int(32) DEFAULT NULL COMMENT '应用id（appid）',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='第三方平台创意';



# Dump of table flow_consumer
# ------------------------------------------------------------

CREATE TABLE `flow_consumer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `consumer_name` varchar(255) NOT NULL COMMENT '平台名称',
  `consumer_uuid` varchar(255) DEFAULT NULL COMMENT '平台uuid',
  `consumer_type` int(11) DEFAULT NULL COMMENT '接收流量的平台类型 dsp adx 聚合',
  `rtb_url` varchar(1000) DEFAULT NULL COMMENT 'rtburl',
  `run_state` int(11) DEFAULT NULL COMMENT '运行状态',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人（所属用户）id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `company_name` varchar(1000) DEFAULT NULL COMMENT '公司名称',
  `company_addr` varchar(1000) DEFAULT NULL COMMENT '公司地址',
  `company_linkman` varchar(255) DEFAULT NULL COMMENT '联系人',
  `linkman_tel` varchar(255) DEFAULT NULL COMMENT '联系人联系方式',
  `adpos_id` varchar(1000) DEFAULT NULL COMMENT '广告位id',
  `consumer_state` int(11) DEFAULT NULL COMMENT '广告平台状态',
  `qps` int(11) DEFAULT NULL COMMENT 'qps',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `cookiemappingurl` varchar(1000) DEFAULT NULL COMMENT 'cookiemappingurl',
  `dsp_id` varchar(32) DEFAULT NULL COMMENT 'dspId',
  `token` varchar(32) DEFAULT NULL COMMENT 'token',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_dev_med_uuid` (`consumer_uuid`),
  KEY `index_dev_med_user` (`create_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='开发者-流量下发平台表';



# Dump of table flow_dic
# ------------------------------------------------------------

CREATE TABLE `flow_dic` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_value` varchar(255) DEFAULT NULL COMMENT '字典值',
  `dic_key` varchar(255) DEFAULT NULL COMMENT '字典键值',
  `dic_group` int(11) DEFAULT NULL COMMENT '字典组id',
  `dic_type` int(11) DEFAULT NULL COMMENT '字典类型',
  `enum_value` int(11) DEFAULT NULL COMMENT '字典对应枚举值',
  `status` int(11) DEFAULT '0' COMMENT '状态： 0 无效  1 有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='流量源字典表';



# Dump of table flow_source
# ------------------------------------------------------------

CREATE TABLE `flow_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `media_name` varchar(255) DEFAULT NULL COMMENT '媒体名称',
  `media_type` int(11) DEFAULT NULL COMMENT '媒体类型：ios 、安卓',
  `target_type` int(11) DEFAULT NULL COMMENT '定向类型',
  `media_uuid` varchar(100) DEFAULT NULL COMMENT '媒体唯一标识',
  `media_state` int(11) DEFAULT NULL COMMENT '媒体状态',
  `run_state` int(11) DEFAULT NULL COMMENT '运行状态',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人（所属用户）id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `type` int(11) DEFAULT '1' COMMENT '类型 0 普通adx 1 联盟',
  `join_type` int(11) DEFAULT '1' COMMENT ' api/ sdk',
  `company_name` varchar(1000) DEFAULT NULL COMMENT '公司名称',
  `company_addr` varchar(1000) DEFAULT NULL COMMENT '公司地址',
  `company_linkman` varchar(255) DEFAULT NULL COMMENT '联系人',
  `linkman_tel` varchar(255) DEFAULT NULL COMMENT '联系人联系方式',
  `website_url` varchar(1000) DEFAULT NULL COMMENT '站点url',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_dev_med_uuid` (`media_uuid`),
  KEY `index_dev_med_user` (`create_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='开发者-媒体表';



# Dump of table group_auths
# ------------------------------------------------------------

CREATE TABLE `group_auths` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gid` int(11) DEFAULT NULL COMMENT '权限组ID',
  `aid` int(11) DEFAULT NULL COMMENT '权限ID',
  `status` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table module
# ------------------------------------------------------------

CREATE TABLE `module` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '' COMMENT '组件名称',
  `module_key` varchar(255) DEFAULT NULL COMMENT '组件key',
  `type` int(11) DEFAULT NULL COMMENT '组件类型 1:文字 2:图片 3:视频',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组件';



# Dump of table order_put
# ------------------------------------------------------------

CREATE TABLE `order_put` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `out_id` int(11) DEFAULT NULL COMMENT '对外同步id',
  `ad_id` int(11) DEFAULT NULL COMMENT '投放ID',
  `oid` int(11) DEFAULT NULL COMMENT '订单id',
  `order_base_tab_id` int(11) DEFAULT NULL COMMENT '订单ID(同步)',
  `put_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '广告t投放名称(ad_name)',
  `launch_mode` int(11) DEFAULT NULL COMMENT '投放方式,1,常量直投，2，第三方DSP投放，3，竞价',
  `third_company_id` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '第三方DSP公司',
  `cost_type` int(11) DEFAULT NULL COMMENT '计费方式 CPT CPM CPC(fee_type)',
  `price` decimal(10,0) DEFAULT NULL COMMENT '单价(discount_price)',
  `dx_media` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '流量来源 爱卡网。。。(source_id)',
  `dx_zdlx` int(11) DEFAULT NULL COMMENT '终端类型1、PC；2、WAP；3、app(platform_id)',
  `dx_channel` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '频道id集合 以逗号分隔 1,2,3(channel_id)',
  `place_id` text COLLATE utf8_bin COMMENT '对外一级广告位',
  `ad_position` int(11) DEFAULT NULL COMMENT '广告位id',
  `page_type` int(11) DEFAULT NULL COMMENT '页面类型',
  `dx_ggw_level_id` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '车级别集合 以逗号分隔 1,2,3(level_id)',
  `dx_ggw_series_id` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '车系集合 以逗号分隔 1,2,3(series_id)',
  `dx_ggw_price_tag_id` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '价格标签集合 以逗号分隔 1,2,3(tag_id)',
  `dx_ggw_area_id` text COLLATE utf8_bin COMMENT '地域ID集合 以逗号分隔 1,2,3(area_id)',
  `creative_template_ids` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '创意模版ID列表，（支持多选项）',
  `adBlong_to_id` int(11) DEFAULT NULL COMMENT '广告位归属ID',
  `is_carousel` int(11) DEFAULT NULL COMMENT '是否轮播',
  `publication_adv_id` int(11) DEFAULT NULL COMMENT '刊例广告位ID',
  `begin_time` datetime DEFAULT NULL COMMENT '投放开始日期',
  `end_time` datetime DEFAULT NULL COMMENT '投放结束日期',
  `start_schedule` int(11) DEFAULT NULL COMMENT '投放开始时间点',
  `end_schedule` int(11) DEFAULT NULL COMMENT '投放结束时间点',
  `put_level` int(11) DEFAULT NULL COMMENT '投放优先级',
  `put_weight` int(11) DEFAULT NULL COMMENT '投放权重',
  `pv` bigint(200) DEFAULT '0' COMMENT '单日曝光',
  `pv_kpi` bigint(20) DEFAULT '0' COMMENT '客户曝光量KPI',
  `click` bigint(200) DEFAULT '0' COMMENT '单日点击',
  `click_kpi` bigint(20) DEFAULT '0' COMMENT '客户点击量kpi',
  `cpl_kpi` bigint(20) DEFAULT '0' COMMENT '销售线索kpi',
  `sale_clue` varchar(200) COLLATE utf8_bin DEFAULT '0' COMMENT '单日销售线索',
  `is_frequency` int(11) DEFAULT NULL COMMENT '频控开关(frequency_flag)',
  `frequenc_period` int(11) DEFAULT NULL COMMENT '频控类型 每天 每月(frequency_type)',
  `frequenc_num` int(11) DEFAULT NULL COMMENT '频控次数(frequency)',
  `put_max` int(11) DEFAULT NULL COMMENT '投放上限',
  `delivery_mode` int(11) DEFAULT '0' COMMENT '投放速度 0 加速 1 匀速(speed_type)',
  `dq_rule` int(11) DEFAULT NULL COMMENT 'IP定向类别：1、包含；2、排除(directional_ip_type)',
  `dx_dq` text COLLATE utf8_bin COMMENT 'IP定向数据信息；（json格式数据，便于回显）(directional_ip_info )',
  `dx_pp` text COLLATE utf8_bin COMMENT '定向条件-品牌(directional_brand_info)',
  `dx_jg` text COLLATE utf8_bin COMMENT '定向条件-价格(directional_price_tag_info)',
  `dx_cjb` text COLLATE utf8_bin COMMENT '定向条件-车级别(directional_level_info)',
  `dx_cx` text COLLATE utf8_bin COMMENT '定向条件-车系(directional_series_info)',
  `status` int(11) DEFAULT NULL COMMENT '投放状态 0 待确认 1 待投放 2 投放中 3 暂停 4 投放j结束(status)',
  `directional_flag` int(11) DEFAULT NULL COMMENT '定向条件',
  `create_time` datetime DEFAULT NULL COMMENT '创建/修改时间',
  `flag` int(11) DEFAULT NULL COMMENT '是否高亮展示 1 是 0 否',
  `code_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '代码位名称',
  `time_interval` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '推广时间段',
  `limits` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '日期、时段(每日)',
  `put_state` int(11) DEFAULT '0' COMMENT '投放状态',
  `run_state` int(11) DEFAULT '0' COMMENT '运行状态',
  `land_url` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '落地页',
  `put_limit` int(11) DEFAULT NULL COMMENT '投放限额',
  `limit_state` int(11) DEFAULT NULL COMMENT '限额状态(无用)',
  `reset_faild` int(2) DEFAULT '0' COMMENT '限额重设失败',
  PRIMARY KEY (`id`)
<<<<<<< HEAD
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单投放表';
=======
) ENGINE=InnoDB AUTO_INCREMENT=5000000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单投放表';
>>>>>>> db4f7c075073ee0b0af35d9fcfa3a5e50102a82f



# Dump of table orders
# ------------------------------------------------------------

CREATE TABLE `orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `out_id` int(11) DEFAULT NULL COMMENT '对外表id',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '订单名称',
  `customer_id` int(11) DEFAULT NULL COMMENT '(爱卡)客户id',
  `cust_id` int(11) DEFAULT NULL COMMENT '客户id',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `run_state` int(11) DEFAULT '0' COMMENT '运行状态',
  `orders_state` int(11) DEFAULT '0' COMMENT '订单状态',
  `user_debt_id` int(11) DEFAULT NULL COMMENT '创建人部门id',
  `salesperson_id` int(11) DEFAULT NULL COMMENT '销售人id',
  `sale_debt_id` int(11) DEFAULT NULL COMMENT '销售部门',
  `put_status` int(11) DEFAULT NULL COMMENT '投放状态操作的标识字段 0 启用 1 暂停',
  `flag` int(11) unsigned DEFAULT NULL COMMENT '是否高亮展示 1，是 2，否',
  `start_time` datetime DEFAULT NULL COMMENT '投放开始日期',
  `end_time` datetime DEFAULT NULL COMMENT '投放结束日期',
  PRIMARY KEY (`id`)
<<<<<<< HEAD
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单表';
=======
) ENGINE=InnoDB AUTO_INCREMENT=5000000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单表';
>>>>>>> db4f7c075073ee0b0af35d9fcfa3a5e50102a82f



# Dump of table package_position
# ------------------------------------------------------------

CREATE TABLE `package_position` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '打包名称',
  `flow_id` int(11) DEFAULT NULL COMMENT '流量源id',
  `forecast_ exposure` int(11) DEFAULT NULL COMMENT '预估曝光',
  `forecast_click` int(11) DEFAULT NULL COMMENT '预估点击',
  `price_rtb` int(11) DEFAULT NULL COMMENT '竞价投放底价',
  `price_other` int(11) DEFAULT NULL COMMENT '非竞价投放底价',
  `position_ids` int(11) DEFAULT NULL COMMENT '广告位id串',
  `update_user` int(11) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='打包广告位';



# Dump of table plan
# ------------------------------------------------------------

CREATE TABLE `plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `adver_id` int(11) DEFAULT NULL COMMENT '客户id',
  `plan_limit` int(11) NOT NULL DEFAULT '0' COMMENT '计划限额',
  `run_state` int(11) NOT NULL DEFAULT '0' COMMENT '运行状态',
  `limit_state` int(11) NOT NULL DEFAULT '0' COMMENT '限额状态',
  `plan_state` int(11) NOT NULL DEFAULT '0' COMMENT '计划状态',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `imp_monitor_url` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '曝光上报地址',
  `clk_monitor_url` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '点击上报地址',
  `create_type` int(11) DEFAULT '0' COMMENT '创建类型(抄底投放关联订单时需要)',
  PRIMARY KEY (`id`),
  KEY `creater_index` (`create_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='计划表';



# Dump of table position_exclude
# ------------------------------------------------------------

CREATE TABLE `position_exclude` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `position_id` int(11) DEFAULT NULL COMMENT '单一广告位id',
  `tongfa_id` int(11) DEFAULT NULL COMMENT '通发id',
  `exclude_position` int(11) DEFAULT NULL COMMENT '互斥的单一广告位',
  `exclude_tongfa` int(11) DEFAULT NULL COMMENT '互斥的通发id',
  `update_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='互斥表';



# Dump of table put
# ------------------------------------------------------------

CREATE TABLE `put` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `put_name` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '投放名称',
  `oid` int(11) DEFAULT NULL COMMENT '订单id(无用)',
  `pid` int(11) DEFAULT NULL COMMENT '计划id',
  `put_type` int(11) DEFAULT NULL COMMENT '投放类型(订单投放  抄底投放 精准投放)',
  `begin_time` datetime DEFAULT NULL COMMENT '投放开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '投放结束时间',
  `cost_type` int(11) DEFAULT NULL COMMENT '计费方式(CPT CPM CPC)',
  `extension_type` int(11) DEFAULT NULL COMMENT '投放类型(网站 ios应用等)',
  `land_url` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '推广链接(落地页)',
  `app_id` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '应用id',
  `pkg_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '应用包名',
  `time_interval` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '推广时间段',
  `dq_rule` int(11) DEFAULT NULL COMMENT '地区判定规则(1 包含 2排除)',
  `pre_dq` text COLLATE utf8_bin COMMENT '定向地区前置保存',
  `dx_xl` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '定向 学历',
  `dx_nl` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '定向 年龄',
  `dx_dq` text COLLATE utf8_bin COMMENT '定向 地区',
  `dx_xb` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '定向 性别',
  `dx_zd` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '定向 ',
  `dx_xw` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '定向 行为',
  `dx_xq` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '定向 兴趣',
  `dx_czxt` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '定向 操作系统',
  `dx_yys` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '定向 运营商',
  `dx_wl` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '定向 网络',
  `dx_llly` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '定向 渠道(流量来源)',
  `dx_zdlx` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '定向 终端类型',
  `dx_sb` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '定向设备',
<<<<<<< HEAD
=======
  `dx_media_type` int(11) DEFAULT NULL COMMENT '定向媒体类型',
>>>>>>> db4f7c075073ee0b0af35d9fcfa3a5e50102a82f
  `dx_media` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '定向 媒体',
  `dx_app` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '定向 app',
  `run_state` int(11) NOT NULL DEFAULT '0' COMMENT '开启状态',
  `put_state` int(11) NOT NULL DEFAULT '0' COMMENT '单元状态',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `price` int(11) DEFAULT NULL COMMENT '单价(价格)',
  `ad_position` int(11) DEFAULT NULL COMMENT '广告位',
  `imp_monitor_url` varchar(1500) COLLATE utf8_bin DEFAULT NULL COMMENT '曝光上报地址',
  `clk_monitor_url` varchar(1500) COLLATE utf8_bin DEFAULT NULL COMMENT '点击上报地址',
  `ext_creative_id` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展参数',
  `put_limit` int(11) DEFAULT NULL COMMENT '每日限额',
  `op_user` int(11) DEFAULT NULL COMMENT '虚拟登录操作人id',
  `op_user_type` int(11) DEFAULT NULL COMMENT '虚拟登录操作人类型',
  `delivery_mode` int(11) DEFAULT '104' COMMENT '投放方式',
  `is_frequency` int(11) DEFAULT '0' COMMENT '是否频次控制',
  `frequenc_period` int(11) DEFAULT NULL COMMENT '频次周期',
  `frequenc_num` int(11) DEFAULT NULL COMMENT '频次',
  `limits` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '限额、时段(每日)',
  `is_optimize` int(11) DEFAULT NULL COMMENT '系统优化',
  `optimize_cpa` int(11) DEFAULT NULL COMMENT '预设cpa',
  `dx_app_type` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '定向app类型',
  `isfilter_device_code` int(2) DEFAULT NULL COMMENT '是否过滤非法设备id：0 不过滤,1 过滤',
  `is_pdb` int(11) DEFAULT NULL COMMENT '是否PDB投放：0 否,1是',
  `deal_id` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'pdb 交易ID',
  `dx_frame` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '定向帧数(贴片展示顺序)',
  `dx_adType` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '1:前贴，2:中贴，3:后贴',
  `o2_url` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT 'o2 url',
  `dx_rq` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '定向人群',
  `is_attribution` int(11) DEFAULT NULL COMMENT '是否归因',
  `attribution_ratio` double DEFAULT NULL COMMENT '归因比例',
  `platform` int(11) DEFAULT NULL COMMENT '平台 (不用)',
  `is_frequency_ip` int(11) DEFAULT '0' COMMENT '是否ip频次控制',
  `frequency_num_ip` int(11) DEFAULT NULL COMMENT '频次',
  `frequency_period_ip` int(11) DEFAULT NULL COMMENT '频次周期',
  `filter_app` int(2) DEFAULT '0' COMMENT '是否过滤定向APP：0 不过滤,1 过滤',
  `versioncode` int(11) DEFAULT NULL COMMENT '版本号',
  `versionname` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '版本名称',
  `size` int(255) DEFAULT NULL COMMENT '包大小（字节）',
  `sign` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '包签名',
  `md5` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '包MD5',
  `minsdklevel` int(16) DEFAULT NULL COMMENT '系统最低版本要求',
  `dx_model` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '定向设备品牌(黑名单)',
  `is_redirect` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '是否重定向',
  `dx_channel` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '定向页面属性-频道',
  `dx_ggw_level_id` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '定向页面属性-车级别集合',
  `dx_ggw_series_id` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '定向页面属性-车系集合',
  `dx_ggw_price_tag_id` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '定向页面属性-价格标签集合',
  `dx_ggw_area_id` text COLLATE utf8_bin COMMENT '定向页面属性-地域ID集合',
  `dx_dmp` text COLLATE utf8_bin COMMENT 'dmp定向',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='精确及抄底投放表';



# Dump of table put_custom_dx
# ------------------------------------------------------------

CREATE TABLE `put_custom_dx` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `put_id` int(11) DEFAULT NULL COMMENT '投放id',
  `tag_id` int(11) DEFAULT NULL COMMENT '标签组(所用定向id)',
  `tag_value` int(11) DEFAULT NULL COMMENT '标签所选值(定向的值)',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='投放标签定向关联表';



# Dump of table quota_consumer
# ------------------------------------------------------------

CREATE TABLE `quota_consumer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cre_day` int(11) NOT NULL DEFAULT '0',
  `cre_hour` int(11) NOT NULL,
  `ent_id` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `win` int(11) NOT NULL DEFAULT '0',
  `exp` int(11) NOT NULL,
  `clk` int(11) NOT NULL DEFAULT '0',
  `investment` bigint(64) NOT NULL COMMENT '成本',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `req` bigint(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_did` (`bid`),
  KEY `idx_cre_id` (`cre_day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table quota_cust
# ------------------------------------------------------------

CREATE TABLE `quota_cust` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uuid` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '广告主、代理商UUID',
  `type` int(11) NOT NULL DEFAULT '2' COMMENT '类型 广告主2、代理商1',
  `cre_day` int(11) NOT NULL DEFAULT '0' COMMENT '日期',
  `cre_hour` int(11) NOT NULL DEFAULT '0' COMMENT '小时（0-23）',
  `exp` int(11) NOT NULL DEFAULT '0' COMMENT '曝光量',
  `clk` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  `cost` bigint(50) NOT NULL DEFAULT '0' COMMENT '花费',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='代理商/客户数据报表';



# Dump of table quota_did
# ------------------------------------------------------------

CREATE TABLE `quota_did` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fs_id` varchar(11) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '流量源id',
  `cre_id` int(11) NOT NULL DEFAULT '0' COMMENT '创意ID',
  `did` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '设备ID',
  `is_active` int(1) DEFAULT '0' COMMENT '是否激活',
  `clk_time` bigint(16) NOT NULL COMMENT '点击时间',
  `act_time` bigint(16) DEFAULT '0' COMMENT '激活时间',
  `ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'ip',
  `area_code` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '地域码',
  `aid` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '激活来源',
  PRIMARY KEY (`id`),
  KEY `idx_did` (`did`),
  KEY `idx_cre_id` (`cre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='点击激活数据报表';



# Dump of table quota_dsp
# ------------------------------------------------------------

CREATE TABLE `quota_dsp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cre_day` int(11) NOT NULL DEFAULT '0' COMMENT '创建日期',
  `cre_hour` int(11) NOT NULL,
  `ader_id` int(11) NOT NULL COMMENT '广告主ID',
  `ent_id` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `win` int(11) NOT NULL DEFAULT '0',
  `exp` int(11) NOT NULL,
  `clk` int(11) NOT NULL DEFAULT '0',
  `investment` bigint(64) NOT NULL COMMENT '成本',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_did` (`bid`),
  KEY `idx_cre_id` (`cre_day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='第三方平台创意报表';



# Dump of table quota_entity
# ------------------------------------------------------------

CREATE TABLE `quota_entity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ent_id` int(11) NOT NULL DEFAULT '0' COMMENT '创意Id',
  `cre_day` int(11) NOT NULL DEFAULT '0' COMMENT '日期',
  `cre_hour` int(11) NOT NULL DEFAULT '0' COMMENT '小时（0-23）',
  `req` int(11) NOT NULL DEFAULT '0' COMMENT '请求量',
  `exp` int(11) NOT NULL DEFAULT '0' COMMENT '曝光量',
  `clk` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  `act` int(11) NOT NULL DEFAULT '0' COMMENT '激活量',
  `cost` bigint(64) NOT NULL DEFAULT '0' COMMENT '花费(分的千分之一)',
  `investment` bigint(64) NOT NULL DEFAULT '0' COMMENT '成本(分的千分之一)',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `bid` int(11) NOT NULL DEFAULT '0',
  `win` int(11) NOT NULL,
  `agent_cost` bigint(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_entid_creday` (`ent_id`,`cre_day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='创意报表表';



# Dump of table quota_flow
# ------------------------------------------------------------

CREATE TABLE `quota_flow` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `flow_id` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '流量源id',
  `cre_day` int(11) NOT NULL DEFAULT '0' COMMENT '日期',
  `cre_hour` int(11) NOT NULL DEFAULT '0' COMMENT '小时（0-23）',
  `req` int(11) NOT NULL DEFAULT '0' COMMENT '请求量',
  `bid` int(11) NOT NULL DEFAULT '0' COMMENT '填充量',
  `exp` int(11) NOT NULL DEFAULT '0' COMMENT '曝光量',
  `clk` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  `invest` bigint(64) NOT NULL DEFAULT '0' COMMENT '成本',
  `active` int(11) NOT NULL DEFAULT '0' COMMENT '激活',
  PRIMARY KEY (`id`),
  KEY `idx_dev_pos_day` (`flow_id`,`cre_day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='流量源数据报表';



# Dump of table quota_order
# ------------------------------------------------------------

CREATE TABLE `quota_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '计划Id',
  `cre_day` int(11) NOT NULL DEFAULT '0' COMMENT '日期',
  `cre_hour` int(11) NOT NULL DEFAULT '0' COMMENT '小时（0-23）',
  `req` int(11) NOT NULL DEFAULT '0' COMMENT '请求量',
  `exp` int(11) NOT NULL DEFAULT '0' COMMENT '曝光量',
  `clk` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  `cost` bigint(64) NOT NULL DEFAULT '0' COMMENT '花费',
  `investment` bigint(64) NOT NULL DEFAULT '0' COMMENT '成本',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `bid` int(11) NOT NULL,
  `win` int(11) NOT NULL,
  `agent_cost` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_planid_creday` (`order_id`,`cre_day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单记录表';



# Dump of table quota_plan
# ------------------------------------------------------------

CREATE TABLE `quota_plan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `plan_id` int(11) NOT NULL DEFAULT '0' COMMENT '计划Id',
  `cre_day` int(11) NOT NULL DEFAULT '0' COMMENT '日期',
  `cre_hour` int(11) NOT NULL DEFAULT '0' COMMENT '小时（0-23）',
  `req` int(11) NOT NULL DEFAULT '0' COMMENT '请求量',
  `exp` int(11) NOT NULL DEFAULT '0' COMMENT '曝光量',
  `clk` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  `cost` bigint(64) NOT NULL DEFAULT '0' COMMENT '花费',
  `investment` bigint(64) NOT NULL DEFAULT '0' COMMENT '成本',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `bid` int(11) NOT NULL,
  `win` int(11) NOT NULL,
  `agent_cost` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_planid_creday` (`plan_id`,`cre_day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='计划报表表';



# Dump of table quota_platform
# ------------------------------------------------------------

CREATE TABLE `quota_platform` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `platform_id` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '平台id',
  `cre_day` int(11) NOT NULL DEFAULT '0' COMMENT '日期',
  `cre_hour` int(11) NOT NULL DEFAULT '0' COMMENT '小时（0-23）',
  `req` int(11) NOT NULL DEFAULT '0' COMMENT '请求量',
  `bid` int(11) NOT NULL DEFAULT '0' COMMENT '填充量',
  `exp` int(11) NOT NULL DEFAULT '0' COMMENT '曝光量',
  `clk` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  `invest` bigint(64) NOT NULL DEFAULT '0' COMMENT '成本',
  PRIMARY KEY (`id`),
  KEY `idx_dev_pos_day` (`platform_id`,`cre_day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='第三方平台数据报表';



# Dump of table quota_put
# ------------------------------------------------------------

CREATE TABLE `quota_put` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `put_type` int(11) NOT NULL DEFAULT '0' COMMENT '投放类型',
  `put_id` int(11) NOT NULL DEFAULT '0' COMMENT '投放id',
  `cre_day` int(11) NOT NULL DEFAULT '0' COMMENT '日期',
  `cre_hour` int(11) NOT NULL DEFAULT '0' COMMENT '小时（0-23）',
  `req` int(11) NOT NULL DEFAULT '0' COMMENT '请求量',
  `exp` int(11) NOT NULL DEFAULT '0' COMMENT '曝光量',
  `clk` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  `cost` bigint(64) NOT NULL DEFAULT '0' COMMENT '花费',
  `investment` bigint(64) NOT NULL DEFAULT '0',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `bid` int(11) NOT NULL,
  `win` int(11) NOT NULL,
  `agent_cost` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_planid_creday` (`put_id`,`cre_day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='投放报表表';



# Dump of table recharge
# ------------------------------------------------------------

CREATE TABLE `recharge` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `advertiser_id` int(11) DEFAULT NULL COMMENT '广告主id',
  `create_day` int(11) DEFAULT NULL COMMENT '创建日期',
  `price` bigint(20) DEFAULT NULL COMMENT '金额 单位：分',
  `type` int(11) DEFAULT NULL COMMENT '类型： 1:充值 2:退款',
  `create_user` int(11) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `comment` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_advertiserid_createday` (`advertiser_id`,`create_day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='客户充值';



# Dump of table sys_config
# ------------------------------------------------------------

CREATE TABLE `sys_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '配置名称',
  `config_key` varchar(255) NOT NULL COMMENT '配置标识',
  `config_value` varchar(255) NOT NULL COMMENT '配置值',
  `edit_state` int(11) DEFAULT NULL COMMENT '是否可编辑',
  `pub_state` int(11) DEFAULT NULL COMMENT '是否同步pub',
  `status` int(11) NOT NULL COMMENT '配置状态',
  `update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='只用于系统配置项。简单的键值对形式配置。';



# Dump of table sys_crontab
# ------------------------------------------------------------

CREATE TABLE `sys_crontab` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `op_time` datetime DEFAULT NULL COMMENT '操作时间',
  `object_id` int(11) DEFAULT NULL COMMENT '对象id',
  `object_type` int(11) DEFAULT NULL COMMENT '对象类型：推广计划、单元等等',
  `op_type` int(11) DEFAULT NULL COMMENT '操作类型：新增、修改、删除',
  `op_status` int(11) DEFAULT NULL COMMENT '数据状态',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级id',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `object_type` (`object_type`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='同步表';



# Dump of table syslog
# ------------------------------------------------------------

CREATE TABLE `syslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `op_time` datetime DEFAULT NULL COMMENT '操作时间',
  `object_id` int(11) DEFAULT NULL COMMENT '对象id',
  `class_type` varchar(100) DEFAULT NULL COMMENT '对象方法类类型：推广计划、单元等等',
  `op_type` varchar(100) DEFAULT NULL COMMENT '操作类型：新增、修改',
  `object_data` text COMMENT '对象数据',
  `user_type` int(11) DEFAULT '1' COMMENT '用户类型',
  `old_data` text COMMENT '旧数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统日志表';



# Dump of table temp_for_area
# ------------------------------------------------------------

CREATE TABLE `temp_for_area` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '城市名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='临时同步部分地域用';



# Dump of table template
# ------------------------------------------------------------

CREATE TABLE `template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '模版名称',
  `type` int(11) DEFAULT NULL COMMENT '模版类型',
  `create_user` int(11) DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '状态 0：无效 1:有效',
  `aika_template_id` int(11) DEFAULT NULL COMMENT '爱卡模板id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='模版表';



# Dump of table template_module_relation
# ------------------------------------------------------------

CREATE TABLE `template_module_relation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `t_id` int(11) DEFAULT NULL COMMENT '模版id',
  `m_id` int(11) DEFAULT NULL COMMENT '组件id',
  `width` int(11) DEFAULT NULL COMMENT '宽',
  `height` int(11) DEFAULT NULL COMMENT '高',
  `word_limit` int(11) DEFAULT NULL COMMENT '字数限制',
  `duration` int(11) DEFAULT NULL COMMENT '时长',
  `create_user` int(11) DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '状态：1:有效 0:无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='模版组件关系表';



# Dump of table tongfa
# ------------------------------------------------------------

CREATE TABLE `tongfa` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '通发组合名称',
  `min_sell_day` int(11) DEFAULT NULL COMMENT '最小售卖天数',
  `tongfa_ids` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '包含的通发广告位id',
  `update_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table user
# ------------------------------------------------------------

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `real_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `company` int(255) DEFAULT NULL COMMENT '公司',
  `type` int(11) DEFAULT NULL COMMENT '用户类型',
  `phone` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '联系方式',
  `remark` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `uuid` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT 'UUID',
  `create_user` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';



# Dump of table user_auths
# ------------------------------------------------------------

CREATE TABLE `user_auths` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `aid` int(11) DEFAULT NULL COMMENT '权限id',
  `status` int(11) DEFAULT NULL,
  `readonly` int(11) DEFAULT NULL COMMENT '只读',
  `pid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户权限表';



# Dump of table user_grand
# ------------------------------------------------------------

CREATE TABLE `user_grand` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) DEFAULT NULL COMMENT '用户Id',
  `aid` int(11) DEFAULT NULL COMMENT '被代理对象id',
  `type` int(11) DEFAULT NULL COMMENT '被代理对象类型',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_uid` (`uid`),
  KEY `index_aid` (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户授权表';



# Dump of table user_token
# ------------------------------------------------------------

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `token` varchar(100) NOT NULL COMMENT 'uuid',
  `type` int(2) NOT NULL COMMENT '类型',
  `expire_time` bigint(20) DEFAULT NULL COMMENT '过期时间（单位：毫秒）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `state` int(2) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

