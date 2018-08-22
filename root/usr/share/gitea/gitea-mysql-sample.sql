-- Server version	5.5.56-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `repo_id` bigint(20) DEFAULT NULL,
  `mode` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_access_s` (`user_id`,`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `access_token`
--

DROP TABLE IF EXISTS `access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sha1` varchar(40) DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_access_token_sha1` (`sha1`),
  KEY `IDX_access_token_created_unix` (`created_unix`),
  KEY `IDX_access_token_updated_unix` (`updated_unix`),
  KEY `IDX_access_token_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `action`
--

DROP TABLE IF EXISTS `action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `op_type` int(11) DEFAULT NULL,
  `act_user_id` bigint(20) DEFAULT NULL,
  `repo_id` bigint(20) DEFAULT NULL,
  `comment_id` bigint(20) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `ref_name` varchar(255) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `content` text,
  `created_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_action_is_private` (`is_private`),
  KEY `IDX_action_created_unix` (`created_unix`),
  KEY `IDX_action_user_id` (`user_id`),
  KEY `IDX_action_act_user_id` (`act_user_id`),
  KEY `IDX_action_repo_id` (`repo_id`),
  KEY `IDX_action_comment_id` (`comment_id`),
  KEY `IDX_action_is_deleted` (`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(40) DEFAULT NULL,
  `issue_id` bigint(20) DEFAULT NULL,
  `release_id` bigint(20) DEFAULT NULL,
  `comment_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `download_count` bigint(20) DEFAULT '0',
  `created_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_attachment_uuid` (`uuid`),
  KEY `IDX_attachment_issue_id` (`issue_id`),
  KEY `IDX_attachment_release_id` (`release_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collaboration`
--

DROP TABLE IF EXISTS `collaboration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collaboration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `mode` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_collaboration_s` (`repo_id`,`user_id`),
  KEY `IDX_collaboration_repo_id` (`repo_id`),
  KEY `IDX_collaboration_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `poster_id` bigint(20) DEFAULT NULL,
  `issue_id` bigint(20) DEFAULT NULL,
  `label_id` bigint(20) DEFAULT NULL,
  `old_milestone_id` bigint(20) DEFAULT NULL,
  `milestone_id` bigint(20) DEFAULT NULL,
  `old_assignee_id` bigint(20) DEFAULT NULL,
  `assignee_id` bigint(20) DEFAULT NULL,
  `old_title` varchar(255) DEFAULT NULL,
  `new_title` varchar(255) DEFAULT NULL,
  `commit_id` bigint(20) DEFAULT NULL,
  `line` bigint(20) DEFAULT NULL,
  `content` text,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  `commit_sha` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_comment_poster_id` (`poster_id`),
  KEY `IDX_comment_issue_id` (`issue_id`),
  KEY `IDX_comment_created_unix` (`created_unix`),
  KEY `IDX_comment_updated_unix` (`updated_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commit_status`
--

DROP TABLE IF EXISTS `commit_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commit_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `index` bigint(20) DEFAULT NULL,
  `repo_id` bigint(20) DEFAULT NULL,
  `state` varchar(7) NOT NULL,
  `sha` varchar(64) NOT NULL,
  `target_url` text,
  `description` text,
  `context` text,
  `creator_id` bigint(20) DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_commit_status_repo_sha_index` (`index`,`repo_id`,`sha`),
  KEY `IDX_commit_status_created_unix` (`created_unix`),
  KEY `IDX_commit_status_updated_unix` (`updated_unix`),
  KEY `IDX_commit_status_index` (`index`),
  KEY `IDX_commit_status_repo_id` (`repo_id`),
  KEY `IDX_commit_status_sha` (`sha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deleted_branch`
--

DROP TABLE IF EXISTS `deleted_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deleted_branch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `commit` varchar(255) NOT NULL,
  `deleted_by_id` bigint(20) DEFAULT NULL,
  `deleted_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_deleted_branch_s` (`repo_id`,`name`,`commit`),
  KEY `IDX_deleted_branch_repo_id` (`repo_id`),
  KEY `IDX_deleted_branch_deleted_by_id` (`deleted_by_id`),
  KEY `IDX_deleted_branch_deleted_unix` (`deleted_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deploy_key`
--

DROP TABLE IF EXISTS `deploy_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deploy_key` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key_id` bigint(20) DEFAULT NULL,
  `repo_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `fingerprint` varchar(255) DEFAULT NULL,
  `mode` int(11) NOT NULL DEFAULT '1',
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_deploy_key_s` (`key_id`,`repo_id`),
  KEY `IDX_deploy_key_key_id` (`key_id`),
  KEY `IDX_deploy_key_repo_id` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_address`
--

DROP TABLE IF EXISTS `email_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `is_activated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_email_address_email` (`email`),
  KEY `IDX_email_address_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `external_login_user`
--

DROP TABLE IF EXISTS `external_login_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_login_user` (
  `external_id` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `login_source_id` bigint(20) NOT NULL,
  PRIMARY KEY (`external_id`,`login_source_id`),
  KEY `IDX_external_login_user_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `follow_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_follow_follow` (`user_id`,`follow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gpg_key`
--

DROP TABLE IF EXISTS `gpg_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpg_key` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner_id` bigint(20) NOT NULL,
  `key_id` char(16) NOT NULL,
  `primary_key_id` char(16) DEFAULT NULL,
  `content` text NOT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `expired_unix` bigint(20) DEFAULT NULL,
  `added_unix` bigint(20) DEFAULT NULL,
  `emails` text,
  `can_sign` tinyint(1) DEFAULT NULL,
  `can_encrypt_comms` tinyint(1) DEFAULT NULL,
  `can_encrypt_storage` tinyint(1) DEFAULT NULL,
  `can_certify` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_gpg_key_owner_id` (`owner_id`),
  KEY `IDX_gpg_key_key_id` (`key_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hook_task`
--

DROP TABLE IF EXISTS `hook_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hook_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `hook_id` bigint(20) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `url` text,
  `payload_content` text,
  `content_type` int(11) DEFAULT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  `is_ssl` tinyint(1) DEFAULT NULL,
  `is_delivered` tinyint(1) DEFAULT NULL,
  `delivered` bigint(20) DEFAULT NULL,
  `is_succeed` tinyint(1) DEFAULT NULL,
  `request_content` text,
  `response_content` text,
  PRIMARY KEY (`id`),
  KEY `IDX_hook_task_repo_id` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue`
--

DROP TABLE IF EXISTS `issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `index` bigint(20) DEFAULT NULL,
  `poster_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `milestone_id` bigint(20) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `assignee_id` bigint(20) DEFAULT NULL,
  `is_closed` tinyint(1) DEFAULT NULL,
  `is_pull` tinyint(1) DEFAULT NULL,
  `num_comments` int(11) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `deadline_unix` bigint(20) DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  `closed_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_issue_repo_index` (`repo_id`,`index`),
  KEY `IDX_issue_updated_unix` (`updated_unix`),
  KEY `IDX_issue_closed_unix` (`closed_unix`),
  KEY `IDX_issue_repo_id` (`repo_id`),
  KEY `IDX_issue_poster_id` (`poster_id`),
  KEY `IDX_issue_milestone_id` (`milestone_id`),
  KEY `IDX_issue_assignee_id` (`assignee_id`),
  KEY `IDX_issue_is_pull` (`is_pull`),
  KEY `IDX_issue_deadline_unix` (`deadline_unix`),
  KEY `IDX_issue_is_closed` (`is_closed`),
  KEY `IDX_issue_created_unix` (`created_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_label`
--

DROP TABLE IF EXISTS `issue_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_label` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `issue_id` bigint(20) DEFAULT NULL,
  `label_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_issue_label_s` (`issue_id`,`label_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_user`
--

DROP TABLE IF EXISTS `issue_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `issue_id` bigint(20) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `is_assigned` tinyint(1) DEFAULT NULL,
  `is_mentioned` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_issue_user_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_watch`
--

DROP TABLE IF EXISTS `issue_watch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_watch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `issue_id` bigint(20) NOT NULL,
  `is_watching` tinyint(1) NOT NULL,
  `created_unix` bigint(20) NOT NULL,
  `updated_unix` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_issue_watch_watch` (`user_id`,`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `label`
--

DROP TABLE IF EXISTS `label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `num_issues` int(11) DEFAULT NULL,
  `num_closed_issues` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_label_repo_id` (`repo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lfs_lock`
--

DROP TABLE IF EXISTS `lfs_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lfs_lock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) NOT NULL,
  `owner_id` bigint(20) NOT NULL,
  `path` text,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_lfs_lock_repo_id` (`repo_id`),
  KEY `IDX_lfs_lock_owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lfs_meta_object`
--

DROP TABLE IF EXISTS `lfs_meta_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lfs_meta_object` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `oid` varchar(255) NOT NULL,
  `size` bigint(20) NOT NULL,
  `repository_id` bigint(20) NOT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_lfs_meta_object_s` (`oid`,`repository_id`),
  KEY `IDX_lfs_meta_object_oid` (`oid`),
  KEY `IDX_lfs_meta_object_repository_id` (`repository_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login_source`
--

DROP TABLE IF EXISTS `login_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_source` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_actived` tinyint(1) NOT NULL DEFAULT '0',
  `is_sync_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `cfg` text,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_login_source_name` (`name`),
  KEY `IDX_login_source_is_actived` (`is_actived`),
  KEY `IDX_login_source_is_sync_enabled` (`is_sync_enabled`),
  KEY `IDX_login_source_created_unix` (`created_unix`),
  KEY `IDX_login_source_updated_unix` (`updated_unix`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `milestone`
--

DROP TABLE IF EXISTS `milestone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestone` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `is_closed` tinyint(1) DEFAULT NULL,
  `num_issues` int(11) DEFAULT NULL,
  `num_closed_issues` int(11) DEFAULT NULL,
  `completeness` int(11) DEFAULT NULL,
  `deadline_unix` bigint(20) DEFAULT NULL,
  `closed_date_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_milestone_repo_id` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mirror`
--

DROP TABLE IF EXISTS `mirror`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirror` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `interval` bigint(20) DEFAULT NULL,
  `enable_prune` tinyint(1) NOT NULL DEFAULT '1',
  `updated_unix` bigint(20) DEFAULT NULL,
  `next_update_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_mirror_repo_id` (`repo_id`),
  KEY `IDX_mirror_updated_unix` (`updated_unix`),
  KEY `IDX_mirror_next_update_unix` (`next_update_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `description` text,
  `created_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_notice_created_unix` (`created_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `repo_id` bigint(20) NOT NULL,
  `status` smallint(6) NOT NULL,
  `source` smallint(6) NOT NULL,
  `issue_id` bigint(20) NOT NULL,
  `commit_id` varchar(255) DEFAULT NULL,
  `updated_by` bigint(20) NOT NULL,
  `created_unix` bigint(20) NOT NULL,
  `updated_unix` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_notification_status` (`status`),
  KEY `IDX_notification_commit_id` (`commit_id`),
  KEY `IDX_notification_created_unix` (`created_unix`),
  KEY `IDX_notification_updated_by` (`updated_by`),
  KEY `IDX_notification_updated_unix` (`updated_unix`),
  KEY `IDX_notification_user_id` (`user_id`),
  KEY `IDX_notification_repo_id` (`repo_id`),
  KEY `IDX_notification_source` (`source`),
  KEY `IDX_notification_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `org_user`
--

DROP TABLE IF EXISTS `org_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_org_user_s` (`uid`,`org_id`),
  KEY `IDX_org_user_uid` (`uid`),
  KEY `IDX_org_user_org_id` (`org_id`),
  KEY `IDX_org_user_is_public` (`is_public`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `protected_branch`
--

DROP TABLE IF EXISTS `protected_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protected_branch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `can_push` tinyint(1) NOT NULL DEFAULT '0',
  `enable_whitelist` tinyint(1) DEFAULT NULL,
  `whitelist_user_i_ds` text,
  `whitelist_team_i_ds` text,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_protected_branch_s` (`repo_id`,`branch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `public_key`
--

DROP TABLE IF EXISTS `public_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_key` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `mode` int(11) NOT NULL DEFAULT '2',
  `type` int(11) NOT NULL DEFAULT '1',
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_public_key_owner_id` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pull_request`
--

DROP TABLE IF EXISTS `pull_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pull_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `issue_id` bigint(20) DEFAULT NULL,
  `index` bigint(20) DEFAULT NULL,
  `head_repo_id` bigint(20) DEFAULT NULL,
  `base_repo_id` bigint(20) DEFAULT NULL,
  `head_user_name` varchar(255) DEFAULT NULL,
  `head_branch` varchar(255) DEFAULT NULL,
  `base_branch` varchar(255) DEFAULT NULL,
  `merge_base` varchar(40) DEFAULT NULL,
  `has_merged` tinyint(1) DEFAULT NULL,
  `merged_commit_id` varchar(40) DEFAULT NULL,
  `merger_id` bigint(20) DEFAULT NULL,
  `merged_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_pull_request_has_merged` (`has_merged`),
  KEY `IDX_pull_request_merger_id` (`merger_id`),
  KEY `IDX_pull_request_merged_unix` (`merged_unix`),
  KEY `IDX_pull_request_issue_id` (`issue_id`),
  KEY `IDX_pull_request_head_repo_id` (`head_repo_id`),
  KEY `IDX_pull_request_base_repo_id` (`base_repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reaction`
--

DROP TABLE IF EXISTS `reaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `issue_id` bigint(20) NOT NULL,
  `comment_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_reaction_s` (`type`,`issue_id`,`comment_id`,`user_id`),
  KEY `IDX_reaction_issue_id` (`issue_id`),
  KEY `IDX_reaction_comment_id` (`comment_id`),
  KEY `IDX_reaction_user_id` (`user_id`),
  KEY `IDX_reaction_created_unix` (`created_unix`),
  KEY `IDX_reaction_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `release`
--

DROP TABLE IF EXISTS `release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `release` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `publisher_id` bigint(20) DEFAULT NULL,
  `tag_name` varchar(255) DEFAULT NULL,
  `lower_tag_name` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `sha1` varchar(40) DEFAULT NULL,
  `num_commits` bigint(20) DEFAULT NULL,
  `note` text,
  `is_draft` tinyint(1) NOT NULL DEFAULT '0',
  `is_prerelease` tinyint(1) NOT NULL DEFAULT '0',
  `is_tag` tinyint(1) NOT NULL DEFAULT '0',
  `created_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_release_n` (`repo_id`,`tag_name`),
  KEY `IDX_release_created_unix` (`created_unix`),
  KEY `IDX_release_repo_id` (`repo_id`),
  KEY `IDX_release_publisher_id` (`publisher_id`),
  KEY `IDX_release_tag_name` (`tag_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `repo_indexer_status`
--

DROP TABLE IF EXISTS `repo_indexer_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repo_indexer_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `commit_sha` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_repo_indexer_status_repo_id` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `repo_redirect`
--

DROP TABLE IF EXISTS `repo_redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repo_redirect` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner_id` bigint(20) DEFAULT NULL,
  `lower_name` varchar(255) NOT NULL,
  `redirect_repo_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_repo_redirect_s` (`owner_id`,`lower_name`),
  KEY `IDX_repo_redirect_lower_name` (`lower_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `repo_unit`
--

DROP TABLE IF EXISTS `repo_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repo_unit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `config` text,
  `created_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_repo_unit_s` (`repo_id`,`type`),
  KEY `IDX_repo_unit_created_unix` (`created_unix`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `repository`
--

DROP TABLE IF EXISTS `repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner_id` bigint(20) DEFAULT NULL,
  `lower_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `default_branch` varchar(255) DEFAULT NULL,
  `num_watches` int(11) DEFAULT NULL,
  `num_stars` int(11) DEFAULT NULL,
  `num_forks` int(11) DEFAULT NULL,
  `num_issues` int(11) DEFAULT NULL,
  `num_closed_issues` int(11) DEFAULT NULL,
  `num_pulls` int(11) DEFAULT NULL,
  `num_closed_pulls` int(11) DEFAULT NULL,
  `num_milestones` int(11) NOT NULL DEFAULT '0',
  `num_closed_milestones` int(11) NOT NULL DEFAULT '0',
  `is_private` tinyint(1) DEFAULT NULL,
  `is_bare` tinyint(1) DEFAULT NULL,
  `is_mirror` tinyint(1) DEFAULT NULL,
  `is_fork` tinyint(1) NOT NULL DEFAULT '0',
  `fork_id` bigint(20) DEFAULT NULL,
  `size` bigint(20) NOT NULL DEFAULT '0',
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_repository_s` (`owner_id`,`lower_name`),
  KEY `IDX_repository_name` (`name`),
  KEY `IDX_repository_is_private` (`is_private`),
  KEY `IDX_repository_is_bare` (`is_bare`),
  KEY `IDX_repository_created_unix` (`created_unix`),
  KEY `IDX_repository_updated_unix` (`updated_unix`),
  KEY `IDX_repository_lower_name` (`lower_name`),
  KEY `IDX_repository_is_mirror` (`is_mirror`),
  KEY `IDX_repository_is_fork` (`is_fork`),
  KEY `IDX_repository_fork_id` (`fork_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `star`
--

DROP TABLE IF EXISTS `star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `star` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `repo_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_star_s` (`uid`,`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stopwatch`
--

DROP TABLE IF EXISTS `stopwatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stopwatch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `issue_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_stopwatch_issue_id` (`issue_id`),
  KEY `IDX_stopwatch_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) DEFAULT NULL,
  `lower_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `authorize` int(11) DEFAULT NULL,
  `num_repos` int(11) DEFAULT NULL,
  `num_members` int(11) DEFAULT NULL,
  `unit_types` text,
  PRIMARY KEY (`id`),
  KEY `IDX_team_org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `team_repo`
--

DROP TABLE IF EXISTS `team_repo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_repo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) DEFAULT NULL,
  `team_id` bigint(20) DEFAULT NULL,
  `repo_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_team_repo_s` (`team_id`,`repo_id`),
  KEY `IDX_team_repo_org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `team_user`
--

DROP TABLE IF EXISTS `team_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) DEFAULT NULL,
  `team_id` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_team_user_s` (`team_id`,`uid`),
  KEY `IDX_team_user_org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tracked_time`
--

DROP TABLE IF EXISTS `tracked_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracked_time` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `issue_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_tracked_time_issue_id` (`issue_id`),
  KEY `IDX_tracked_time_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `two_factor`
--

DROP TABLE IF EXISTS `two_factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `two_factor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `scratch_token` varchar(255) DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_two_factor_uid` (`uid`),
  KEY `IDX_two_factor_created_unix` (`created_unix`),
  KEY `IDX_two_factor_updated_unix` (`updated_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `upload`
--

DROP TABLE IF EXISTS `upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(40) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_upload_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lower_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `keep_email_private` tinyint(1) DEFAULT NULL,
  `passwd` varchar(255) NOT NULL,
  `login_type` int(11) DEFAULT NULL,
  `login_source` bigint(20) NOT NULL DEFAULT '0',
  `login_name` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `rands` varchar(10) DEFAULT NULL,
  `salt` varchar(10) DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  `last_login_unix` bigint(20) DEFAULT NULL,
  `last_repo_visibility` tinyint(1) DEFAULT NULL,
  `max_repo_creation` int(11) NOT NULL DEFAULT '-1',
  `is_active` tinyint(1) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `allow_git_hook` tinyint(1) DEFAULT NULL,
  `allow_import_local` tinyint(1) DEFAULT NULL,
  `allow_create_organization` tinyint(1) DEFAULT '1',
  `prohibit_login` tinyint(1) NOT NULL DEFAULT '0',
  `avatar` varchar(2048) NOT NULL,
  `avatar_email` varchar(255) NOT NULL,
  `use_custom_avatar` tinyint(1) DEFAULT NULL,
  `num_followers` int(11) DEFAULT NULL,
  `num_following` int(11) NOT NULL DEFAULT '0',
  `num_stars` int(11) DEFAULT NULL,
  `num_repos` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `num_teams` int(11) DEFAULT NULL,
  `num_members` int(11) DEFAULT NULL,
  `diff_view_style` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_user_lower_name` (`lower_name`),
  UNIQUE KEY `UQE_user_name` (`name`),
  KEY `IDX_user_last_login_unix` (`last_login_unix`),
  KEY `IDX_user_is_active` (`is_active`),
  KEY `IDX_user_created_unix` (`created_unix`),
  KEY `IDX_user_updated_unix` (`updated_unix`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_open_id`
--

DROP TABLE IF EXISTS `user_open_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_open_id` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `show` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_user_open_id_uri` (`uri`),
  KEY `IDX_user_open_id_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- write data for table `version`
-- version of this schema
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES (1,58);
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watch`
--

DROP TABLE IF EXISTS `watch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `repo_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_watch_watch` (`user_id`,`repo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webhook`
--

DROP TABLE IF EXISTS `webhook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webhook` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `url` text,
  `content_type` int(11) DEFAULT NULL,
  `secret` text,
  `events` text,
  `is_ssl` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `hook_task_type` int(11) DEFAULT NULL,
  `meta` text,
  `last_status` int(11) DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_webhook_updated_unix` (`updated_unix`),
  KEY `IDX_webhook_repo_id` (`repo_id`),
  KEY `IDX_webhook_org_id` (`org_id`),
  KEY `IDX_webhook_is_active` (`is_active`),
  KEY `IDX_webhook_created_unix` (`created_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
