-- 创建数据库（如果不存在）
CREATE DATABASE IF NOT EXISTS ai_3d;

-- 使用数据库
USE ai_3d;

-- 对话会话表
CREATE TABLE IF NOT EXISTS `chat_session` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
    `userId` BIGINT NOT NULL COMMENT '用户ID',
    `sessionName` VARCHAR(128) NOT NULL COMMENT '会话名称',
    `createTime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updateTime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `isDelete` TINYINT NOT NULL DEFAULT 0 COMMENT '是否删除(0-未删, 1-已删)',
    PRIMARY KEY (`id`),
    INDEX `idx_userId` (`userId`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = '对话会话表';

-- 对话消息表
CREATE TABLE IF NOT EXISTS `chat_message` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
    `sessionId` BIGINT NOT NULL COMMENT '会话ID',
    `role` VARCHAR(32) NOT NULL COMMENT '角色(user/assistant)',
    `content` TEXT NOT NULL COMMENT '消息内容',
    `createTime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updateTime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `isDelete` TINYINT NOT NULL DEFAULT 0 COMMENT '是否删除(0-未删, 1-已删)',
    PRIMARY KEY (`id`),
    INDEX `idx_sessionId` (`sessionId`),
    INDEX `idx_createTime` (`createTime`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = '对话消息表';