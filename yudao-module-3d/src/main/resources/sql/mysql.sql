-- 3D 模型主表
CREATE TABLE `threed_model` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(255) NOT NULL COMMENT '模型名称',
  `description` text COMMENT '模型简介',
  `category_id` bigint NOT NULL DEFAULT '0' COMMENT '分类编号',
  `cover_url` varchar(500) DEFAULT NULL COMMENT '封面图',
  `user_id` bigint NOT NULL COMMENT '发布者用户编号',
  `download_count` int NOT NULL DEFAULT '0' COMMENT '下载次数',
  `view_count` int NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `like_count` int NOT NULL DEFAULT '0' COMMENT '点赞次数',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态（0:草稿 1:审核中 2:已发布 3:下架）',
  `creator` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='3D 模型表';

-- 3D 模型文件表
CREATE TABLE `threed_model_file` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `model_id` bigint NOT NULL COMMENT '模型编号',
  `name` varchar(255) NOT NULL COMMENT '文件名',
  `url` varchar(500) NOT NULL COMMENT '文件 URL',
  `size` bigint NOT NULL COMMENT '文件大小（字节）',
  `format` varchar(20) NOT NULL COMMENT '文件格式 (STL, OBJ, etc)',
  `creator` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `idx_model_id` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='3D 模型文件表';

-- 3D 模型评论表
CREATE TABLE `threed_model_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `model_id` bigint NOT NULL COMMENT '模型编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `content` varchar(500) NOT NULL COMMENT '评论内容',
  `reply_id` bigint DEFAULT NULL COMMENT '回复评论编号',
  `like_count` int NOT NULL DEFAULT '0' COMMENT '点赞次数',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态（0:待审核 1:审核通过 2:审核不通过）',
  `creator` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `idx_model_id` (`model_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='3D 模型评论表';

-- 3D 用户积分记录表
CREATE TABLE `threed_user_point_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `point` int NOT NULL COMMENT '变动积分（正数增加，负数减少）',
  `title` varchar(100) NOT NULL COMMENT '变动标题',
  `description` varchar(255) DEFAULT NULL COMMENT '变动描述',
  `biz_id` bigint DEFAULT NULL COMMENT '业务编号',
  `biz_type` varchar(50) DEFAULT NULL COMMENT '业务类型',
  `creator` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='3D 用户积分记录表';
