BEGIN;
ALTER TABLE `microsite_configuration_micrositehistory` DROP FOREIGN KEY `microsite_configurati_site_id_6977a04d3625a533_fk_django_site_id`;
ALTER TABLE `microsite_configuration_micrositehistory` ADD CONSTRAINT `microsite_configurati_site_id_6977a04d3625a533_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);
COMMIT;

BEGIN;
ALTER TABLE `milestones_coursemilestone` ALTER COLUMN `milestone_id` DROP DEFAULT;
ALTER TABLE `milestones_coursemilestone` ALTER COLUMN `milestone_relationship_type_id` DROP DEFAULT;
ALTER TABLE `milestones_coursecontentmilestone` ALTER COLUMN `milestone_id` DROP DEFAULT;
ALTER TABLE `milestones_coursecontentmilestone` ALTER COLUMN `milestone_relationship_type_id` DROP DEFAULT;
COMMIT;

/*BEGIN;
--CREATE TABLE `milestones_coursecontentmilestone` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `course_id` varchar(255) NOT NULL, `content_id` varchar(255) NOT NULL, `active` bool NOT NULL);
--CREATE TABLE `milestones_coursemilestone` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `course_id` varchar(255) NOT NULL, `active` bool NOT NULL);
--CREATE TABLE `milestones_milestone` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `namespace` varchar(255) NOT NULL, `name` varchar(255) NOT NULL, `display_name` varchar(255) NOT NULL, `description` longtext NOT NULL, `active` bool NOT NULL);
--CREATE TABLE `milestones_milestonerelationshiptype` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `name` varchar(25) NOT NULL UNIQUE, `description` longtext NOT NULL, `active` bool NOT NULL);
--CREATE TABLE `milestones_usermilestone` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `user_id` integer NOT NULL, `source` longtext NOT NULL, `collected` datetime(6) NULL, `active` bool NOT NULL, `milestone_id` integer NOT NULL);
--ALTER TABLE `milestones_milestone` ADD CONSTRAINT `milestones_milestone_namespace_460a2f6943016c0b_uniq` UNIQUE (`namespace`, `name`);
--ALTER TABLE `milestones_coursemilestone` ADD COLUMN `milestone_id` integer NOT NULL;

--ALTER TABLE `milestones_coursemilestone` ADD COLUMN `milestone_relationship_type_id` integer NOT NULL;

--ALTER TABLE `milestones_coursecontentmilestone` ADD COLUMN `milestone_id` integer NOT NULL;

--ALTER TABLE `milestones_coursecontentmilestone` ADD COLUMN `milestone_relationship_type_id` integer NOT NULL;

--ALTER TABLE `milestones_usermilestone` ADD CONSTRAINT `milestones_usermilestone_user_id_10206aa452468351_uniq` UNIQUE (`user_id`, `milestone_id`);
--ALTER TABLE `milestones_coursemilestone` ADD CONSTRAINT `milestones_coursemilestone_course_id_5a06e10579eab3b7_uniq` UNIQUE (`course_id`, `milestone_id`);
--ALTER TABLE `milestones_coursecontentmilestone` ADD CONSTRAINT `milestones_coursecontentmileston_course_id_68d1457cd52d6dff_uniq` UNIQUE (`course_id`, `content_id`, `milestone_id`);
--CREATE INDEX `milestones_coursecontentmilestone_ea134da7` ON `milestones_coursecontentmilestone` (`course_id`);
--CREATE INDEX `milestones_coursecontentmilestone_e14f02ad` ON `milestones_coursecontentmilestone` (`content_id`);
--CREATE INDEX `milestones_coursemilestone_ea134da7` ON `milestones_coursemilestone` (`course_id`);
--CREATE INDEX `milestones_milestone_89801e9e` ON `milestones_milestone` (`namespace`);
--CREATE INDEX `milestones_milestone_b068931c` ON `milestones_milestone` (`name`);
--ALTER TABLE `milestones_usermilestone` ADD CONSTRAINT `milesto_milestone_id_4fe38e3e9994f15c_fk_milestones_milestone_id` FOREIGN KEY (`milestone_id`) REFERENCES `milestones_milestone` (`id`);
--CREATE INDEX `milestones_usermilestone_e8701ad4` ON `milestones_usermilestone` (`user_id`);
--CREATE INDEX `milestones_coursemilestone_dbb5cd1e` ON `milestones_coursemilestone` (`milestone_id`);
--ALTER TABLE `milestones_coursemilestone` ADD CONSTRAINT `milesto_milestone_id_284153799c54d7d8_fk_milestones_milestone_id` FOREIGN KEY (`milestone_id`) REFERENCES `milestones_milestone` (`id`);
--CREATE INDEX `milestones_coursemilestone_db6866e3` ON `milestones_coursemilestone` (`milestone_relationship_type_id`);
--ALTER TABLE `milestones_coursemilestone` ADD CONSTRAINT `D69536d0d313008147c5daf5341090e1` FOREIGN KEY (`milestone_relationship_type_id`) REFERENCES `milestones_milestonerelationshiptype` (`id`);
--CREATE INDEX `milestones_coursecontentmilestone_dbb5cd1e` ON `milestones_coursecontentmilestone` (`milestone_id`);
--ALTER TABLE `milestones_coursecontentmilestone` ADD CONSTRAINT `milesto_milestone_id_73b6eddde5b205a8_fk_milestones_milestone_id` FOREIGN KEY (`milestone_id`) REFERENCES `milestones_milestone` (`id`);
--CREATE INDEX `milestones_coursecontentmilestone_db6866e3` ON `milestones_coursecontentmilestone` (`milestone_relationship_type_id`);
--ALTER TABLE `milestones_coursecontentmilestone` ADD CONSTRAINT `D84e404851bc6d6b9fe0d60955e8729c` FOREIGN KEY (`milestone_relationship_type_id`) REFERENCES `milestones_milestonerelationshiptype` (`id`);
COMMIT;*/

/*BEGIN;
--
-- MIGRATION NOW PERFORMS OPERATION THAT CANNOT BE WRITTEN AS SQL:
-- Raw Python operation
--
COMMIT;*/
BEGIN;
/*ALTER TABLE `milestones_coursecontentmilestone` ADD COLUMN `requirements` varchar(255) NULL;*/
ALTER TABLE `milestones_coursecontentmilestone` ALTER COLUMN `requirements` DROP DEFAULT;

COMMIT;
/*
BEGIN;
CREATE INDEX `milestones_coursecontentmilestone_active_39b5c645fa33bfee_uniq` ON `milestones_coursecontentmilestone` (`active`);
CREATE INDEX `milestones_coursemilestone_active_5c3a925f8cc4bde2_uniq` ON `milestones_coursemilestone` (`active`);
CREATE INDEX `milestones_milestone_active_1182ba3c09d42c35_uniq` ON `milestones_milestone` (`active`);
CREATE INDEX `milestones_usermilestone_active_1827f467fe87a8ea_uniq` ON `milestones_usermilestone` (`active`);
COMMIT;
*/

BEGIN;
ALTER TABLE `oauth2_accesstoken` DROP FOREIGN KEY `oauth2_accesstoken_user_id_7a865c7085722378_fk_auth_user_id`;
ALTER TABLE `oauth2_accesstoken` ADD CONSTRAINT `oauth2_accesstoken_user_id_7a865c7085722378_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `oauth2_grant` DROP FOREIGN KEY `oauth2_grant_user_id_3de96a461bb76819_fk_auth_user_id`;
ALTER TABLE `oauth2_grant` ADD CONSTRAINT `oauth2_grant_user_id_3de96a461bb76819_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `oauth2_refreshtoken` DROP FOREIGN KEY `oauth2_refreshtoken_user_id_acecf94460b787c_fk_auth_user_id`;
ALTER TABLE `oauth2_refreshtoken` ADD CONSTRAINT `oauth2_refreshtoken_user_id_acecf94460b787c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

COMMIT;
BEGIN;
/*ALTER TABLE `oauth2_client` ADD COLUMN `logout_uri` varchar(200) NULL;*/
ALTER TABLE `oauth2_client` ALTER COLUMN `logout_uri` DROP DEFAULT;

COMMIT;
/*
BEGIN;
CREATE TABLE `oauth2_provider_application` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `client_id` varchar(100) NOT NULL UNIQUE, `redirect_uris` longtext NOT NULL, `client_type` varchar(32) NOT NULL, `authorization_grant_type` varchar(32) NOT NULL, `client_secret` varchar(255) NOT NULL, `name` varchar(255) NOT NULL, `user_id` integer NOT NULL);
CREATE TABLE `oauth2_provider_accesstoken` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `token` varchar(255) NOT NULL, `expires` datetime(6) NOT NULL, `scope` longtext NOT NULL, `application_id` integer NOT NULL, `user_id` integer NOT NULL);
CREATE TABLE `oauth2_provider_grant` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `code` varchar(255) NOT NULL, `expires` datetime(6) NOT NULL, `redirect_uri` varchar(255) NOT NULL, `scope` longtext NOT NULL, `application_id` integer NOT NULL, `user_id` integer NOT NULL);
CREATE TABLE `oauth2_provider_refreshtoken` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `token` varchar(255) NOT NULL, `access_token_id` integer NOT NULL UNIQUE, `application_id` integer NOT NULL, `user_id` integer NOT NULL);
ALTER TABLE `oauth2_provider_application` ADD CONSTRAINT `oauth2_provider_applica_user_id_7fa13387c260b798_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `oauth2_provider_application_9d667c2b` ON `oauth2_provider_application` (`client_secret`);
ALTER TABLE `oauth2_provider_accesstoken` ADD CONSTRAINT `D5ac3019ee1c474fd85718b015e3d3a1` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`);
ALTER TABLE `oauth2_provider_accesstoken` ADD CONSTRAINT `oauth2_provider_accesst_user_id_5e2f004fdebea22d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `oauth2_provider_accesstoken_94a08da1` ON `oauth2_provider_accesstoken` (`token`);
ALTER TABLE `oauth2_provider_grant` ADD CONSTRAINT `D6b2a4f1402d4f338b690c38b795830a` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`);
ALTER TABLE `oauth2_provider_grant` ADD CONSTRAINT `oauth2_provider_grant_user_id_3111344894d452da_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `oauth2_provider_grant_c1336794` ON `oauth2_provider_grant` (`code`);
ALTER TABLE `oauth2_provider_refreshtoken` ADD CONSTRAINT `b58d9cb3b93afb36b11b7741bf1bcc1a` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`);
ALTER TABLE `oauth2_provider_refreshtoken` ADD CONSTRAINT `d3e264ceec355cabed6ff9976fc42a06` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`);
ALTER TABLE `oauth2_provider_refreshtoken` ADD CONSTRAINT `oauth2_provider_refresh_user_id_3f695b639cfbc9a3_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `oauth2_provider_refreshtoken_94a08da1` ON `oauth2_provider_refreshtoken` (`token`);
COMMIT;
*/

BEGIN;
/*ALTER TABLE `oauth2_provider_application` ADD COLUMN `skip_authorization` bool DEFAULT 0 NOT NULL;*/
ALTER TABLE `oauth2_provider_application` ALTER COLUMN `skip_authorization` DROP DEFAULT;
ALTER TABLE `oauth2_provider_application` DROP FOREIGN KEY `oauth2_provider_applica_user_id_7fa13387c260b798_fk_auth_user_id`;
ALTER TABLE `oauth2_provider_application` ADD CONSTRAINT `oauth2_provider_applica_user_id_7fa13387c260b798_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `oauth2_provider_accesstoken` DROP FOREIGN KEY `oauth2_provider_accesst_user_id_5e2f004fdebea22d_fk_auth_user_id`;
ALTER TABLE `oauth2_provider_accesstoken` MODIFY `user_id` integer NULL;
ALTER TABLE `oauth2_provider_accesstoken` ADD CONSTRAINT `oauth2_provider_accesst_user_id_5e2f004fdebea22d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*
BEGIN;
CREATE TABLE `organizations_organization` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `name` varchar(255) NOT NULL, `short_name` varchar(255) NOT NULL, `description` longtext NOT NULL, `logo` varchar(255) NULL, `active` bool NOT NULL);
CREATE TABLE `organizations_organizationcourse` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `course_id` varchar(255) NOT NULL, `active` bool NOT NULL, `organization_id` integer NOT NULL);
ALTER TABLE `organizations_organizationcourse` ADD CONSTRAINT `organizations_organizationcourse_course_id_3f0149776c0495ff_uniq` UNIQUE (`course_id`, `organization_id`);
CREATE INDEX `organizations_organization_b068931c` ON `organizations_organization` (`name`);
CREATE INDEX `organizations_organization_4698bac7` ON `organizations_organization` (`short_name`);
ALTER TABLE `organizations_organizationcourse` ADD CONSTRAINT `a7b04b16eba98e518fbe21d390bd8e3e` FOREIGN KEY (`organization_id`) REFERENCES `organizations_organization` (`id`);
CREATE INDEX `organizations_organizationcourse_ea134da7` ON `organizations_organizationcourse` (`course_id`);
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `programs_programsapiconfig` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `change_date` datetime(6) NOT NULL, `enabled` bool NOT NULL, `internal_service_url` varchar(200) NOT NULL, `public_service_url` varchar(200) NOT NULL, `api_version_number` integer NOT NULL, `enable_student_dashboard` bool NULL, `changed_by_id` integer NULL);
ALTER TABLE `programs_programsapiconfig` ADD CONSTRAINT `programs_programsa_changed_by_id_b7c3b49d5c0dcd3_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`);
COMMIT;
*/

BEGIN;
/*ALTER TABLE `programs_programsapiconfig` ADD COLUMN `cache_ttl` integer UNSIGNED DEFAULT 0 NOT NULL;*/
ALTER TABLE `programs_programsapiconfig` ALTER COLUMN `cache_ttl` DROP DEFAULT;
COMMIT;

BEGIN;
/*ALTER TABLE `programs_programsapiconfig` ADD COLUMN `authoring_app_css_path` varchar(255) DEFAULT  NOT NULL;*/
ALTER TABLE `programs_programsapiconfig` ALTER COLUMN `authoring_app_css_path` DROP DEFAULT;
/*ALTER TABLE `programs_programsapiconfig` ADD COLUMN `authoring_app_js_path` varchar(255) DEFAULT  NOT NULL;*/
ALTER TABLE `programs_programsapiconfig` ALTER COLUMN `authoring_app_js_path` DROP DEFAULT;
/*ALTER TABLE `programs_programsapiconfig` ADD COLUMN `enable_studio_tab` bool DEFAULT 0 NOT NULL;*/
ALTER TABLE `programs_programsapiconfig` ALTER COLUMN `enable_studio_tab` DROP DEFAULT;
ALTER TABLE `programs_programsapiconfig` ALTER COLUMN `enable_student_dashboard` SET DEFAULT 0;
UPDATE `programs_programsapiconfig` SET `enable_student_dashboard` = 0 WHERE `enable_student_dashboard` IS NULL;
ALTER TABLE `programs_programsapiconfig` MODIFY `enable_student_dashboard` bool NOT NULL;
ALTER TABLE `programs_programsapiconfig` ALTER COLUMN `enable_student_dashboard` DROP DEFAULT;
COMMIT;

BEGIN;
/*ALTER TABLE `programs_programsapiconfig` ADD COLUMN `enable_certification` bool DEFAULT 0 NOT NULL;*/
ALTER TABLE `programs_programsapiconfig` ALTER COLUMN `enable_certification` DROP DEFAULT;

COMMIT;
BEGIN;
/*ALTER TABLE `programs_programsapiconfig` ADD COLUMN `max_retries` integer UNSIGNED DEFAULT 11 NOT NULL;*/
ALTER TABLE `programs_programsapiconfig` ALTER COLUMN `max_retries` DROP DEFAULT;

COMMIT;
BEGIN;
/*ALTER TABLE `programs_programsapiconfig` ADD COLUMN `xseries_ad_enabled` bool DEFAULT 0 NOT NULL;*/
ALTER TABLE `programs_programsapiconfig` ALTER COLUMN `xseries_ad_enabled` DROP DEFAULT;
COMMIT;

/*
BEGIN;
ALTER TABLE `programs_programsapiconfig` ADD COLUMN `program_listing_enabled` bool DEFAULT 0 NOT NULL;
ALTER TABLE `programs_programsapiconfig` ALTER COLUMN `program_listing_enabled` DROP DEFAULT;
COMMIT;
*/

BEGIN;
/*ALTER TABLE `programs_programsapiconfig` ADD COLUMN `program_details_enabled` bool DEFAULT 0 NOT NULL;*/
ALTER TABLE `programs_programsapiconfig` ALTER COLUMN `program_details_enabled` DROP DEFAULT;
COMMIT;

/*
BEGIN;
CREATE TABLE `django_redirect` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `site_id` integer NOT NULL, `old_path` varchar(200) NOT NULL, `new_path` varchar(200) NOT NULL, UNIQUE (`site_id`, `old_path`));
ALTER TABLE `django_redirect` ADD CONSTRAINT `django_redirect_site_id_121a4403f653e524_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);
CREATE INDEX `django_redirect_91a0b591` ON `django_redirect` (`old_path`);
COMMIT;
*/
/*
BEGIN;
CREATE TABLE `self_paced_selfpacedconfiguration` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `change_date` datetime(6) NOT NULL, `enabled` bool NOT NULL, `enable_course_home_improvements` bool NOT NULL, `changed_by_id` integer NULL);
ALTER TABLE `self_paced_selfpacedconfiguration` ADD CONSTRAINT `self_paced_selfpa_changed_by_id_62c0bd4c6725fd15_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`);
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `django_session` (`session_key` varchar(40) NOT NULL PRIMARY KEY, `session_data` longtext NOT NULL, `expire_date` datetime(6) NOT NULL);
CREATE INDEX `django_session_de54fa62` ON `django_session` (`expire_date`);
COMMIT;
*/


BEGIN;
ALTER TABLE `student_languageproficiency` ALTER COLUMN `user_profile_id` DROP DEFAULT;
COMMIT;
/*
BEGIN;
CREATE TABLE `student_anonymoususerid` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `anonymous_user_id` varchar(32) NOT NULL UNIQUE, `course_id` varchar(255) NOT NULL, `user_id` integer NOT NULL);
CREATE TABLE `student_courseaccessrole` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `org` varchar(64) NOT NULL, `course_id` varchar(255) NOT NULL, `role` varchar(64) NOT NULL, `user_id` integer NOT NULL);
CREATE TABLE `student_courseenrollment` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `course_id` varchar(255) NOT NULL, `created` datetime(6) NULL, `is_active` bool NOT NULL, `mode` varchar(100) NOT NULL, `user_id` integer NOT NULL);
CREATE TABLE `student_courseenrollmentallowed` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `email` varchar(255) NOT NULL, `course_id` varchar(255) NOT NULL, `auto_enroll` bool NOT NULL, `created` datetime(6) NULL);
CREATE TABLE `student_courseenrollmentattribute` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `namespace` varchar(255) NOT NULL, `name` varchar(255) NOT NULL, `value` varchar(255) NOT NULL, `enrollment_id` integer NOT NULL);
CREATE TABLE `student_dashboardconfiguration` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `change_date` datetime(6) NOT NULL, `enabled` bool NOT NULL, `recent_enrollment_time_delta` integer UNSIGNED NOT NULL, `changed_by_id` integer NULL);
CREATE TABLE `student_enrollmentrefundconfiguration` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `change_date` datetime(6) NOT NULL, `enabled` bool NOT NULL, `refund_window_microseconds` bigint NOT NULL, `changed_by_id` integer NULL);
CREATE TABLE `student_entranceexamconfiguration` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `course_id` varchar(255) NOT NULL, `created` datetime(6) NULL, `updated` datetime(6) NOT NULL, `skip_entrance_exam` bool NOT NULL, `user_id` integer NOT NULL);
CREATE TABLE `student_historicalcourseenrollment` (`id` integer NOT NULL, `course_id` varchar(255) NOT NULL, `created` datetime(6) NULL, `is_active` bool NOT NULL, `mode` varchar(100) NOT NULL, `history_id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `history_date` datetime(6) NOT NULL, `history_type` varchar(1) NOT NULL, `history_user_id` integer NULL, `user_id` integer NULL);
CREATE TABLE `student_languageproficiency` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `code` varchar(16) NOT NULL);
CREATE TABLE `student_linkedinaddtoprofileconfiguration` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `change_date` datetime(6) NOT NULL, `enabled` bool NOT NULL, `company_identifier` longtext NOT NULL, `dashboard_tracking_code` longtext NOT NULL, `trk_partner_name` varchar(10) NOT NULL, `changed_by_id` integer NULL);
CREATE TABLE `student_loginfailures` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `failure_count` integer NOT NULL, `lockout_until` datetime(6) NULL, `user_id` integer NOT NULL);
CREATE TABLE `student_manualenrollmentaudit` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `enrolled_email` varchar(255) NOT NULL, `time_stamp` datetime(6) NULL, `state_transition` varchar(255) NOT NULL, `reason` longtext NULL, `enrolled_by_id` integer NULL, `enrollment_id` integer NULL);
CREATE TABLE `student_passwordhistory` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `password` varchar(128) NOT NULL, `time_set` datetime(6) NOT NULL, `user_id` integer NOT NULL);
CREATE TABLE `student_pendingemailchange` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `new_email` varchar(255) NOT NULL, `activation_key` varchar(32) NOT NULL UNIQUE, `user_id` integer NOT NULL UNIQUE);
CREATE TABLE `student_pendingnamechange` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `new_name` varchar(255) NOT NULL, `rationale` varchar(1024) NOT NULL, `user_id` integer NOT NULL UNIQUE);
CREATE TABLE `auth_registration` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `activation_key` varchar(32) NOT NULL UNIQUE, `user_id` integer NOT NULL UNIQUE);
CREATE TABLE `auth_userprofile` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `name` varchar(255) NOT NULL, `meta` longtext NOT NULL, `courseware` varchar(255) NOT NULL, `language` varchar(255) NOT NULL, `location` varchar(255) NOT NULL, `year_of_birth` integer NULL, `gender` varchar(6) NULL, `level_of_education` varchar(6) NULL, `mailing_address` longtext NULL, `city` longtext NULL, `country` varchar(2) NULL, `goals` longtext NULL, `allow_certificate` bool NOT NULL, `bio` varchar(3000) NULL, `profile_image_uploaded_at` datetime(6) NULL, `user_id` integer NOT NULL UNIQUE);
CREATE TABLE `student_usersignupsource` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `site` varchar(255) NOT NULL, `user_id` integer NOT NULL);
CREATE TABLE `student_userstanding` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `account_status` varchar(31) NOT NULL, `standing_last_changed_at` datetime(6) NOT NULL, `changed_by_id` integer NOT NULL, `user_id` integer NOT NULL UNIQUE);
CREATE TABLE `student_usertestgroup` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `name` varchar(32) NOT NULL, `description` longtext NOT NULL);
CREATE TABLE `student_usertestgroup_users` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `usertestgroup_id` integer NOT NULL, `user_id` integer NOT NULL, UNIQUE (`usertestgroup_id`, `user_id`));
ALTER TABLE `student_languageproficiency` ADD COLUMN `user_profile_id` integer NOT NULL;

ALTER TABLE `student_courseenrollmentallowed` ADD CONSTRAINT `student_courseenrollmentallowed_email_6f3eafd4a6c58591_uniq` UNIQUE (`email`, `course_id`);
ALTER TABLE `student_languageproficiency` ADD CONSTRAINT `student_languageproficiency_code_68e76171684c62e5_uniq` UNIQUE (`code`, `user_profile_id`);
ALTER TABLE `student_entranceexamconfiguration` ADD CONSTRAINT `student_entranceexamconfiguration_user_id_714c2ef6a88504f0_uniq` UNIQUE (`user_id`, `course_id`);
ALTER TABLE `student_courseenrollment` ADD CONSTRAINT `student_courseenrollment_user_id_2d2a572f07dd8e37_uniq` UNIQUE (`user_id`, `course_id`);
ALTER TABLE `student_courseaccessrole` ADD CONSTRAINT `student_courseaccessrole_user_id_3203176c4f474414_uniq` UNIQUE (`user_id`, `org`, `course_id`, `role`);
ALTER TABLE `student_anonymoususerid` ADD CONSTRAINT `student_anonymoususerid_user_id_1a18af72cf6b95f7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `student_anonymoususerid_ea134da7` ON `student_anonymoususerid` (`course_id`);
ALTER TABLE `student_courseaccessrole` ADD CONSTRAINT `student_courseaccessrol_user_id_5e0f68b978ad0792_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `student_courseaccessrole_5a445d71` ON `student_courseaccessrole` (`org`);
CREATE INDEX `student_courseaccessrole_ea134da7` ON `student_courseaccessrole` (`course_id`);
CREATE INDEX `student_courseaccessrole_29a7e964` ON `student_courseaccessrole` (`role`);
ALTER TABLE `student_courseenrollment` ADD CONSTRAINT `student_courseenrollmen_user_id_15beaaebc8333ce4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `student_courseenrollment_ea134da7` ON `student_courseenrollment` (`course_id`);
CREATE INDEX `student_courseenrollment_e2fa5388` ON `student_courseenrollment` (`created`);
CREATE INDEX `student_courseenrollmentallowed_0c83f57c` ON `student_courseenrollmentallowed` (`email`);
CREATE INDEX `student_courseenrollmentallowed_ea134da7` ON `student_courseenrollmentallowed` (`course_id`);
CREATE INDEX `student_courseenrollmentallowed_e2fa5388` ON `student_courseenrollmentallowed` (`created`);
ALTER TABLE `student_courseenrollmentattribute` ADD CONSTRAINT `stu_enrollment_id_674188e6fcb084c_fk_student_courseenrollment_id` FOREIGN KEY (`enrollment_id`) REFERENCES `student_courseenrollment` (`id`);
ALTER TABLE `student_dashboardconfiguration` ADD CONSTRAINT `student_dashboard_changed_by_id_4db1e1194c4ae32c_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `student_enrollmentrefundconfiguration` ADD CONSTRAINT `student_enrollmen_changed_by_id_59c187ac05e64a11_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `student_entranceexamconfiguration` ADD CONSTRAINT `student_entranceexamcon_user_id_530195af5babe0dd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `student_entranceexamconfiguration_ea134da7` ON `student_entranceexamconfiguration` (`course_id`);
CREATE INDEX `student_entranceexamconfiguration_e2fa5388` ON `student_entranceexamconfiguration` (`created`);
CREATE INDEX `student_entranceexamconfiguration_0f81d52e` ON `student_entranceexamconfiguration` (`updated`);
ALTER TABLE `student_historicalcourseenrollment` ADD CONSTRAINT `student_histori_history_user_id_49fd2870709a6441_fk_auth_user_id` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `student_historicalcourseenrollment_b80bb774` ON `student_historicalcourseenrollment` (`id`);
CREATE INDEX `student_historicalcourseenrollment_ea134da7` ON `student_historicalcourseenrollment` (`course_id`);
CREATE INDEX `student_historicalcourseenrollment_e2fa5388` ON `student_historicalcourseenrollment` (`created`);
ALTER TABLE `student_linkedinaddtoprofileconfiguration` ADD CONSTRAINT `student_linkedina_changed_by_id_226a4de3af0f3296_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `student_loginfailures` ADD CONSTRAINT `student_loginfailures_user_id_3daac39f3118bac4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `student_manualenrollmentaudit` ADD CONSTRAINT `student_manualenr_enrolled_by_id_729cecdc9f746e2_fk_auth_user_id` FOREIGN KEY (`enrolled_by_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `student_manualenrollmentaudit` ADD CONSTRAINT `st_enrollment_id_60349e74284df0d6_fk_student_courseenrollment_id` FOREIGN KEY (`enrollment_id`) REFERENCES `student_courseenrollment` (`id`);
CREATE INDEX `student_manualenrollmentaudit_ce9e7289` ON `student_manualenrollmentaudit` (`enrolled_email`);
ALTER TABLE `student_passwordhistory` ADD CONSTRAINT `student_passwordhistory_user_id_21328c8c512d6c0d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `student_pendingemailchange` ADD CONSTRAINT `student_pendingemailcha_user_id_566caccc3f3c3966_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `student_pendingemailchange_a4a65cd1` ON `student_pendingemailchange` (`new_email`);
ALTER TABLE `student_pendingnamechange` ADD CONSTRAINT `student_pendingnamechan_user_id_6c3c9d77fc5898a6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `auth_registration` ADD CONSTRAINT `auth_registration_user_id_734af68780d0cf34_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `auth_userprofile` ADD CONSTRAINT `auth_userprofile_user_id_4c194f9b5650ad70_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `auth_userprofile_b068931c` ON `auth_userprofile` (`name`);
CREATE INDEX `auth_userprofile_8512ae7d` ON `auth_userprofile` (`language`);
CREATE INDEX `auth_userprofile_d5189de0` ON `auth_userprofile` (`location`);
CREATE INDEX `auth_userprofile_8939d49d` ON `auth_userprofile` (`year_of_birth`);
CREATE INDEX `auth_userprofile_cc90f191` ON `auth_userprofile` (`gender`);
CREATE INDEX `auth_userprofile_a895faa8` ON `auth_userprofile` (`level_of_education`);
ALTER TABLE `student_usersignupsource` ADD CONSTRAINT `student_usersignupsourc_user_id_4db69fdecf32119f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `student_usersignupsource_98defd6e` ON `student_usersignupsource` (`site`);
ALTER TABLE `student_userstanding` ADD CONSTRAINT `student_userstand_changed_by_id_23784b83f2849aff_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `student_userstanding` ADD CONSTRAINT `student_userstanding_user_id_6bb90abaaa05d42e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `student_usertestgroup_b068931c` ON `student_usertestgroup` (`name`);
ALTER TABLE `student_usertestgroup_users` ADD CONSTRAINT `st_usertestgroup_id_3d634741f1dd4e4f_fk_student_usertestgroup_id` FOREIGN KEY (`usertestgroup_id`) REFERENCES `student_usertestgroup` (`id`);
ALTER TABLE `student_usertestgroup_users` ADD CONSTRAINT `student_usertestgroup_u_user_id_26c886de60cceacb_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `student_languageproficiency_06037614` ON `student_languageproficiency` (`user_profile_id`);
ALTER TABLE `student_languageproficiency` ADD CONSTRAINT `student__user_profile_id_283edb437b102619_fk_auth_userprofile_id` FOREIGN KEY (`user_profile_id`) REFERENCES `auth_userprofile` (`id`);
COMMIT;
*/

BEGIN;
ALTER TABLE `assessment_studenttrainingworkflowitem` ALTER COLUMN `training_example_id` DROP DEFAULT;
ALTER TABLE `assessment_studenttrainingworkflowitem` ALTER COLUMN `workflow_id` DROP DEFAULT;
ALTER TABLE `assessment_criterion` ALTER COLUMN `rubric_id` DROP DEFAULT;
ALTER TABLE `assessment_assessmentpart` ALTER COLUMN `criterion_id` DROP DEFAULT;
ALTER TABLE `assessment_assessmentpart` ALTER COLUMN `option_id` DROP DEFAULT;
ALTER TABLE `assessment_assessment` ALTER COLUMN `rubric_id` DROP DEFAULT;
ALTER TABLE `assessment_aigradingworkflow` ALTER COLUMN `rubric_id` DROP DEFAULT;
ALTER TABLE `assessment_aiclassifierset` ALTER COLUMN `rubric_id` DROP DEFAULT;
ALTER TABLE `assessment_aiclassifier` ALTER COLUMN `classifier_set_id` DROP DEFAULT;
ALTER TABLE `assessment_aiclassifier` ALTER COLUMN `criterion_id` DROP DEFAULT;
COMMIT;

/*
BEGIN;
CREATE TABLE `assessment_aiclassifier` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `classifier_data` varchar(100) NOT NULL);
CREATE TABLE `assessment_aiclassifierset` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created_at` datetime(6) NOT NULL, `algorithm_id` varchar(128) NOT NULL, `course_id` varchar(40) NOT NULL, `item_id` varchar(128) NOT NULL);
CREATE TABLE `assessment_aigradingworkflow` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `uuid` varchar(36) NOT NULL UNIQUE, `course_id` varchar(40) NOT NULL, `item_id` varchar(128) NOT NULL, `scheduled_at` datetime(6) NOT NULL, `completed_at` datetime(6) NULL, `algorithm_id` varchar(128) NOT NULL, `submission_uuid` varchar(128) NOT NULL, `essay_text` longtext NOT NULL, `student_id` varchar(40) NOT NULL);
CREATE TABLE `assessment_aitrainingworkflow` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `uuid` varchar(36) NOT NULL UNIQUE, `course_id` varchar(40) NOT NULL, `item_id` varchar(128) NOT NULL, `scheduled_at` datetime(6) NOT NULL, `completed_at` datetime(6) NULL, `algorithm_id` varchar(128) NOT NULL, `classifier_set_id` integer NULL);
CREATE TABLE `assessment_assessment` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `submission_uuid` varchar(128) NOT NULL, `scored_at` datetime(6) NOT NULL, `scorer_id` varchar(40) NOT NULL, `score_type` varchar(2) NOT NULL, `feedback` longtext NOT NULL);
CREATE TABLE `assessment_assessmentfeedback` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `submission_uuid` varchar(128) NOT NULL UNIQUE, `feedback_text` longtext NOT NULL);
CREATE TABLE `assessment_assessmentfeedback_assessments` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `assessmentfeedback_id` integer NOT NULL, `assessment_id` integer NOT NULL, UNIQUE (`assessmentfeedback_id`, `assessment_id`));
CREATE TABLE `assessment_assessmentfeedbackoption` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `text` varchar(255) NOT NULL UNIQUE);
CREATE TABLE `assessment_assessmentpart` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `feedback` longtext NOT NULL, `assessment_id` integer NOT NULL);
CREATE TABLE `assessment_criterion` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `name` varchar(100) NOT NULL, `label` varchar(100) NOT NULL, `order_num` integer UNSIGNED NOT NULL, `prompt` longtext NOT NULL);
CREATE TABLE `assessment_criterionoption` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `order_num` integer UNSIGNED NOT NULL, `points` integer UNSIGNED NOT NULL, `name` varchar(100) NOT NULL, `label` varchar(100) NOT NULL, `explanation` longtext NOT NULL, `criterion_id` integer NOT NULL);
CREATE TABLE `assessment_peerworkflow` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `student_id` varchar(40) NOT NULL, `item_id` varchar(128) NOT NULL, `course_id` varchar(40) NOT NULL, `submission_uuid` varchar(128) NOT NULL UNIQUE, `created_at` datetime(6) NOT NULL, `completed_at` datetime(6) NULL, `grading_completed_at` datetime(6) NULL, `cancelled_at` datetime(6) NULL);
CREATE TABLE `assessment_peerworkflowitem` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `submission_uuid` varchar(128) NOT NULL, `started_at` datetime(6) NOT NULL, `scored` bool NOT NULL, `assessment_id` integer NULL, `author_id` integer NOT NULL, `scorer_id` integer NOT NULL);
CREATE TABLE `assessment_rubric` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `content_hash` varchar(40) NOT NULL UNIQUE, `structure_hash` varchar(40) NOT NULL);
CREATE TABLE `assessment_studenttrainingworkflow` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `submission_uuid` varchar(128) NOT NULL UNIQUE, `student_id` varchar(40) NOT NULL, `item_id` varchar(128) NOT NULL, `course_id` varchar(40) NOT NULL);
CREATE TABLE `assessment_studenttrainingworkflowitem` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `order_num` integer UNSIGNED NOT NULL, `started_at` datetime(6) NOT NULL, `completed_at` datetime(6) NULL);
CREATE TABLE `assessment_trainingexample` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `raw_answer` longtext NOT NULL, `content_hash` varchar(40) NOT NULL UNIQUE, `rubric_id` integer NOT NULL);
CREATE TABLE `assessment_trainingexample_options_selected` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `trainingexample_id` integer NOT NULL, `criterionoption_id` integer NOT NULL, UNIQUE (`trainingexample_id`, `criterionoption_id`));
ALTER TABLE `assessment_studenttrainingworkflowitem` ADD COLUMN `training_example_id` integer NOT NULL;

ALTER TABLE `assessment_studenttrainingworkflowitem` ADD COLUMN `workflow_id` integer NOT NULL;

ALTER TABLE `assessment_criterion` ADD COLUMN `rubric_id` integer NOT NULL;

ALTER TABLE `assessment_assessmentpart` ADD COLUMN `criterion_id` integer NOT NULL;

ALTER TABLE `assessment_assessmentpart` ADD COLUMN `option_id` integer NULL;

CREATE TABLE `assessment_assessmentfeedback_options` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `assessmentfeedback_id` integer NOT NULL, `assessmentfeedbackoption_id` integer NOT NULL, UNIQUE (`assessmentfeedback_id`, `assessmentfeedbackoption_id`));
ALTER TABLE `assessment_assessment` ADD COLUMN `rubric_id` integer NOT NULL;

CREATE TABLE `assessment_aitrainingworkflow_training_examples` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `aitrainingworkflow_id` integer NOT NULL, `trainingexample_id` integer NOT NULL, UNIQUE (`aitrainingworkflow_id`, `trainingexample_id`));
ALTER TABLE `assessment_aigradingworkflow` ADD COLUMN `assessment_id` integer NULL;
ALTER TABLE `assessment_aigradingworkflow` ADD COLUMN `classifier_set_id` integer NULL;
ALTER TABLE `assessment_aigradingworkflow` ADD COLUMN `rubric_id` integer NOT NULL;

ALTER TABLE `assessment_aiclassifierset` ADD COLUMN `rubric_id` integer NOT NULL;

ALTER TABLE `assessment_aiclassifier` ADD COLUMN `classifier_set_id` integer NOT NULL;

ALTER TABLE `assessment_aiclassifier` ADD COLUMN `criterion_id` integer NOT NULL;

ALTER TABLE `assessment_studenttrainingworkflowitem` ADD CONSTRAINT `assessment_studenttrainingwork_workflow_id_484e930feb86ad74_uniq` UNIQUE (`workflow_id`, `order_num`);
CREATE INDEX `assessment_aiclassifierset_fde81f11` ON `assessment_aiclassifierset` (`created_at`);
CREATE INDEX `assessment_aiclassifierset_65143c91` ON `assessment_aiclassifierset` (`algorithm_id`);
CREATE INDEX `assessment_aiclassifierset_ea134da7` ON `assessment_aiclassifierset` (`course_id`);
CREATE INDEX `assessment_aiclassifierset_82bfda79` ON `assessment_aiclassifierset` (`item_id`);
CREATE INDEX `assessment_aigradingworkflow_ea134da7` ON `assessment_aigradingworkflow` (`course_id`);
CREATE INDEX `assessment_aigradingworkflow_82bfda79` ON `assessment_aigradingworkflow` (`item_id`);
CREATE INDEX `assessment_aigradingworkflow_96e4551c` ON `assessment_aigradingworkflow` (`scheduled_at`);
CREATE INDEX `assessment_aigradingworkflow_4430a679` ON `assessment_aigradingworkflow` (`completed_at`);
CREATE INDEX `assessment_aigradingworkflow_65143c91` ON `assessment_aigradingworkflow` (`algorithm_id`);
CREATE INDEX `assessment_aigradingworkflow_ab5b2b73` ON `assessment_aigradingworkflow` (`submission_uuid`);
CREATE INDEX `assessment_aigradingworkflow_30a811f6` ON `assessment_aigradingworkflow` (`student_id`);
ALTER TABLE `assessment_aitrainingworkflow` ADD CONSTRAINT `fb3b73b224dc39eb386f5d3ec67998b7` FOREIGN KEY (`classifier_set_id`) REFERENCES `assessment_aiclassifierset` (`id`);
CREATE INDEX `assessment_aitrainingworkflow_ea134da7` ON `assessment_aitrainingworkflow` (`course_id`);
CREATE INDEX `assessment_aitrainingworkflow_82bfda79` ON `assessment_aitrainingworkflow` (`item_id`);
CREATE INDEX `assessment_aitrainingworkflow_96e4551c` ON `assessment_aitrainingworkflow` (`scheduled_at`);
CREATE INDEX `assessment_aitrainingworkflow_4430a679` ON `assessment_aitrainingworkflow` (`completed_at`);
CREATE INDEX `assessment_aitrainingworkflow_65143c91` ON `assessment_aitrainingworkflow` (`algorithm_id`);
CREATE INDEX `assessment_assessment_ab5b2b73` ON `assessment_assessment` (`submission_uuid`);
CREATE INDEX `assessment_assessment_ef4c53ff` ON `assessment_assessment` (`scored_at`);
CREATE INDEX `assessment_assessment_7b0042c0` ON `assessment_assessment` (`scorer_id`);
ALTER TABLE `assessment_assessmentfeedback_assessments` ADD CONSTRAINT `D1fc3fa7cd7be79d20561668a95a9fc1` FOREIGN KEY (`assessmentfeedback_id`) REFERENCES `assessment_assessmentfeedback` (`id`);
ALTER TABLE `assessment_assessmentfeedback_assessments` ADD CONSTRAINT `asses_assessment_id_392d354eca2e0c87_fk_assessment_assessment_id` FOREIGN KEY (`assessment_id`) REFERENCES `assessment_assessment` (`id`);
ALTER TABLE `assessment_assessmentpart` ADD CONSTRAINT `asses_assessment_id_1d752290138ce479_fk_assessment_assessment_id` FOREIGN KEY (`assessment_id`) REFERENCES `assessment_assessment` (`id`);
ALTER TABLE `assessment_criterionoption` ADD CONSTRAINT `assessm_criterion_id_4d0f74d959b454af_fk_assessment_criterion_id` FOREIGN KEY (`criterion_id`) REFERENCES `assessment_criterion` (`id`);
CREATE INDEX `assessment_peerworkflow_30a811f6` ON `assessment_peerworkflow` (`student_id`);
CREATE INDEX `assessment_peerworkflow_82bfda79` ON `assessment_peerworkflow` (`item_id`);
CREATE INDEX `assessment_peerworkflow_ea134da7` ON `assessment_peerworkflow` (`course_id`);
CREATE INDEX `assessment_peerworkflow_fde81f11` ON `assessment_peerworkflow` (`created_at`);
CREATE INDEX `assessment_peerworkflow_4430a679` ON `assessment_peerworkflow` (`completed_at`);
CREATE INDEX `assessment_peerworkflow_85d183d8` ON `assessment_peerworkflow` (`grading_completed_at`);
CREATE INDEX `assessment_peerworkflow_740da1db` ON `assessment_peerworkflow` (`cancelled_at`);
ALTER TABLE `assessment_peerworkflowitem` ADD CONSTRAINT `asses_assessment_id_15cadfae90ddcc2a_fk_assessment_assessment_id` FOREIGN KEY (`assessment_id`) REFERENCES `assessment_assessment` (`id`);
ALTER TABLE `assessment_peerworkflowitem` ADD CONSTRAINT `assessm_author_id_1948f89dea6d2b5f_fk_assessment_peerworkflow_id` FOREIGN KEY (`author_id`) REFERENCES `assessment_peerworkflow` (`id`);
ALTER TABLE `assessment_peerworkflowitem` ADD CONSTRAINT `assessm_scorer_id_2d803ee2d52c0e2c_fk_assessment_peerworkflow_id` FOREIGN KEY (`scorer_id`) REFERENCES `assessment_peerworkflow` (`id`);
CREATE INDEX `assessment_peerworkflowitem_ab5b2b73` ON `assessment_peerworkflowitem` (`submission_uuid`);
CREATE INDEX `assessment_peerworkflowitem_ff1ae11b` ON `assessment_peerworkflowitem` (`started_at`);
CREATE INDEX `assessment_rubric_873e9e2d` ON `assessment_rubric` (`structure_hash`);
CREATE INDEX `assessment_studenttrainingworkflow_30a811f6` ON `assessment_studenttrainingworkflow` (`student_id`);
CREATE INDEX `assessment_studenttrainingworkflow_82bfda79` ON `assessment_studenttrainingworkflow` (`item_id`);
CREATE INDEX `assessment_studenttrainingworkflow_ea134da7` ON `assessment_studenttrainingworkflow` (`course_id`);
ALTER TABLE `assessment_trainingexample` ADD CONSTRAINT `assessment_tr_rubric_id_33664d383bafcaaa_fk_assessment_rubric_id` FOREIGN KEY (`rubric_id`) REFERENCES `assessment_rubric` (`id`);
ALTER TABLE `assessment_trainingexample_options_selected` ADD CONSTRAINT `ae406d6687690bb9277287984729cfd8` FOREIGN KEY (`trainingexample_id`) REFERENCES `assessment_trainingexample` (`id`);
ALTER TABLE `assessment_trainingexample_options_selected` ADD CONSTRAINT `D0b4a450eed0c653d223e489254ed8a1` FOREIGN KEY (`criterionoption_id`) REFERENCES `assessment_criterionoption` (`id`);
CREATE INDEX `assessment_studenttrainingworkflowitem_9cc97abc` ON `assessment_studenttrainingworkflowitem` (`training_example_id`);
ALTER TABLE `assessment_studenttrainingworkflowitem` ADD CONSTRAINT `D74ce3e30635de397fef41ac869640c7` FOREIGN KEY (`training_example_id`) REFERENCES `assessment_trainingexample` (`id`);
CREATE INDEX `assessment_studenttrainingworkflowitem_846c77cf` ON `assessment_studenttrainingworkflowitem` (`workflow_id`);
ALTER TABLE `assessment_studenttrainingworkflowitem` ADD CONSTRAINT `f9c080ebc7ad16394edda963ed3f280f` FOREIGN KEY (`workflow_id`) REFERENCES `assessment_studenttrainingworkflow` (`id`);
CREATE INDEX `assessment_criterion_8980b7ae` ON `assessment_criterion` (`rubric_id`);
ALTER TABLE `assessment_criterion` ADD CONSTRAINT `assessment_cr_rubric_id_30b7422eb7f191cd_fk_assessment_rubric_id` FOREIGN KEY (`rubric_id`) REFERENCES `assessment_rubric` (`id`);
CREATE INDEX `assessment_assessmentpart_385b00a3` ON `assessment_assessmentpart` (`criterion_id`);
ALTER TABLE `assessment_assessmentpart` ADD CONSTRAINT `assessm_criterion_id_2061f2359fd292bf_fk_assessment_criterion_id` FOREIGN KEY (`criterion_id`) REFERENCES `assessment_criterion` (`id`);
CREATE INDEX `assessment_assessmentpart_28df3725` ON `assessment_assessmentpart` (`option_id`);
ALTER TABLE `assessment_assessmentpart` ADD CONSTRAINT `asse_option_id_2508a14feeabf4ce_fk_assessment_criterionoption_id` FOREIGN KEY (`option_id`) REFERENCES `assessment_criterionoption` (`id`);
ALTER TABLE `assessment_assessmentfeedback_options` ADD CONSTRAINT `cba12ac98c4a04d67d5edaa2223f4fe5` FOREIGN KEY (`assessmentfeedback_id`) REFERENCES `assessment_assessmentfeedback` (`id`);
ALTER TABLE `assessment_assessmentfeedback_options` ADD CONSTRAINT `cc7028abc88c431df3172c9b2d6422e4` FOREIGN KEY (`assessmentfeedbackoption_id`) REFERENCES `assessment_assessmentfeedbackoption` (`id`);
CREATE INDEX `assessment_assessment_8980b7ae` ON `assessment_assessment` (`rubric_id`);
ALTER TABLE `assessment_assessment` ADD CONSTRAINT `assessment_as_rubric_id_7997f01dcbd05633_fk_assessment_rubric_id` FOREIGN KEY (`rubric_id`) REFERENCES `assessment_rubric` (`id`);
ALTER TABLE `assessment_aitrainingworkflow_training_examples` ADD CONSTRAINT `da55be90caee21d95136e40c53e5c754` FOREIGN KEY (`aitrainingworkflow_id`) REFERENCES `assessment_aitrainingworkflow` (`id`);
ALTER TABLE `assessment_aitrainingworkflow_training_examples` ADD CONSTRAINT `ff4ddecc43bd06c0d85785a61e955133` FOREIGN KEY (`trainingexample_id`) REFERENCES `assessment_trainingexample` (`id`);
CREATE INDEX `assessment_aigradingworkflow_a4079fcf` ON `assessment_aigradingworkflow` (`assessment_id`);
ALTER TABLE `assessment_aigradingworkflow` ADD CONSTRAINT `asses_assessment_id_68b86880a7f62f1c_fk_assessment_assessment_id` FOREIGN KEY (`assessment_id`) REFERENCES `assessment_assessment` (`id`);
CREATE INDEX `assessment_aigradingworkflow_962f069f` ON `assessment_aigradingworkflow` (`classifier_set_id`);
ALTER TABLE `assessment_aigradingworkflow` ADD CONSTRAINT `D4d9bca115376aeb07fd970155499db3` FOREIGN KEY (`classifier_set_id`) REFERENCES `assessment_aiclassifierset` (`id`);
CREATE INDEX `assessment_aigradingworkflow_8980b7ae` ON `assessment_aigradingworkflow` (`rubric_id`);
ALTER TABLE `assessment_aigradingworkflow` ADD CONSTRAINT `assessment_ai_rubric_id_3fc938e9e3ae7b2d_fk_assessment_rubric_id` FOREIGN KEY (`rubric_id`) REFERENCES `assessment_rubric` (`id`);
CREATE INDEX `assessment_aiclassifierset_8980b7ae` ON `assessment_aiclassifierset` (`rubric_id`);
ALTER TABLE `assessment_aiclassifierset` ADD CONSTRAINT `assessment_ai_rubric_id_45488be94ea0aea5_fk_assessment_rubric_id` FOREIGN KEY (`rubric_id`) REFERENCES `assessment_rubric` (`id`);
CREATE INDEX `assessment_aiclassifier_962f069f` ON `assessment_aiclassifier` (`classifier_set_id`);
ALTER TABLE `assessment_aiclassifier` ADD CONSTRAINT `D3bd45d5e3c9cfdc4f3b442119adebe8` FOREIGN KEY (`classifier_set_id`) REFERENCES `assessment_aiclassifierset` (`id`);
CREATE INDEX `assessment_aiclassifier_385b00a3` ON `assessment_aiclassifier` (`criterion_id`);
ALTER TABLE `assessment_aiclassifier` ADD CONSTRAINT `assessm_criterion_id_275db29f2a0e1711_fk_assessment_criterion_id` FOREIGN KEY (`criterion_id`) REFERENCES `assessment_criterion` (`id`);
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `site_configuration_siteconfiguration` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `values` longtext NOT NULL, `site_id` integer NOT NULL UNIQUE);
CREATE TABLE `site_configuration_siteconfigurationhistory` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `values` longtext NOT NULL, `site_id` integer NOT NULL);
ALTER TABLE `site_configuration_siteconfiguration` ADD CONSTRAINT `site_configuration_si_site_id_51c4aa24ab9238cb_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);
ALTER TABLE `site_configuration_siteconfigurationhistory` ADD CONSTRAINT `site_configuration_si_site_id_20c9c1a5f8c3358e_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);
COMMIT;
*/

BEGIN;
/*ALTER TABLE `site_configuration_siteconfiguration` ADD COLUMN `enabled` bool DEFAULT 0 NOT NULL;*/
ALTER TABLE `site_configuration_siteconfiguration` ALTER COLUMN `enabled` DROP DEFAULT;
/*ALTER TABLE `site_configuration_siteconfigurationhistory` ADD COLUMN `enabled` bool DEFAULT 0 NOT NULL;*/
ALTER TABLE `site_configuration_siteconfigurationhistory` ALTER COLUMN `enabled` DROP DEFAULT;
COMMIT;

/*
BEGIN;
CREATE TABLE `static_replace_assetbaseurlconfig` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `change_date` datetime(6) NOT NULL, `enabled` bool NOT NULL, `base_url` longtext NOT NULL, `changed_by_id` integer NULL);
ALTER TABLE `static_replace_assetbaseurlconfig` ADD CONSTRAINT `static_replace_as_changed_by_id_796c2e5b1bee7027_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`);
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `static_replace_assetexcludedextensionsconfig` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `change_date` datetime(6) NOT NULL, `enabled` bool NOT NULL, `excluded_extensions` longtext NOT NULL, `changed_by_id` integer NULL);
ALTER TABLE `static_replace_assetexcludedextensionsconfig` ADD CONSTRAINT `static_replace_as_changed_by_id_5885827de4f271dc_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`);
COMMIT;
*/

/*
BEGIN;
ALTER TABLE `student_courseenrollment` ALTER COLUMN `mode` SET DEFAULT 'audit';
ALTER TABLE `student_courseenrollment` ALTER COLUMN `mode` DROP DEFAULT;
ALTER TABLE `student_historicalcourseenrollment` ALTER COLUMN `mode` SET DEFAULT 'audit';
ALTER TABLE `student_historicalcourseenrollment` ALTER COLUMN `mode` DROP DEFAULT;
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `student_userattribute` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `name` varchar(255) NOT NULL, `value` varchar(255) NOT NULL, `user_id` integer NOT NULL);
ALTER TABLE `student_userattribute` ADD CONSTRAINT `student_userattribute_user_id_395f02bcb61d19c1_uniq` UNIQUE (`user_id`, `name`);
ALTER TABLE `student_userattribute` ADD CONSTRAINT `student_userattribute_user_id_1d4fc3ed612e93e5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;
*/

/*
BEGIN;
CREATE INDEX `student_userattribute_name_5fd741d8c66ce242_uniq` ON `student_userattribute` (`name`);
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `assessment_staffworkflow` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `scorer_id` varchar(40) NOT NULL, `course_id` varchar(40) NOT NULL, `item_id` varchar(128) NOT NULL, `submission_uuid` varchar(128) NOT NULL UNIQUE, `created_at` datetime(6) NOT NULL, `grading_completed_at` datetime(6) NULL, `grading_started_at` datetime(6) NULL, `cancelled_at` datetime(6) NULL, `assessment` varchar(128) NULL);
CREATE INDEX `assessment_staffworkflow_7b0042c0` ON `assessment_staffworkflow` (`scorer_id`);
CREATE INDEX `assessment_staffworkflow_ea134da7` ON `assessment_staffworkflow` (`course_id`);
CREATE INDEX `assessment_staffworkflow_82bfda79` ON `assessment_staffworkflow` (`item_id`);
CREATE INDEX `assessment_staffworkflow_fde81f11` ON `assessment_staffworkflow` (`created_at`);
CREATE INDEX `assessment_staffworkflow_85d183d8` ON `assessment_staffworkflow` (`grading_completed_at`);
CREATE INDEX `assessment_staffworkflow_0af9deae` ON `assessment_staffworkflow` (`grading_started_at`);
CREATE INDEX `assessment_staffworkflow_740da1db` ON `assessment_staffworkflow` (`cancelled_at`);
CREATE INDEX `assessment_staffworkflow_5096c410` ON `assessment_staffworkflow` (`assessment`);
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `student_logoutviewconfiguration` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `change_date` datetime(6) NOT NULL, `enabled` bool NOT NULL, `changed_by_id` integer NULL);
ALTER TABLE `student_logoutviewconfiguration` ADD CONSTRAINT `student_logoutvie_changed_by_id_71e69e1e508e4fce_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`);
COMMIT;
*/

BEGIN;
ALTER TABLE `submissions_scoresummary` ALTER COLUMN `student_item_id` DROP DEFAULT;
ALTER TABLE `submissions_score` ALTER COLUMN `student_item_id` DROP DEFAULT;
ALTER TABLE `submissions_score` ALTER COLUMN `submission_id` DROP DEFAULT;
COMMIT;

/*
BEGIN;
CREATE TABLE `submissions_score` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `points_earned` integer UNSIGNED NOT NULL, `points_possible` integer UNSIGNED NOT NULL, `created_at` datetime(6) NOT NULL, `reset` bool NOT NULL);
CREATE TABLE `submissions_scoresummary` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `highest_id` integer NOT NULL, `latest_id` integer NOT NULL);
CREATE TABLE `submissions_studentitem` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `student_id` varchar(255) NOT NULL, `course_id` varchar(255) NOT NULL, `item_id` varchar(255) NOT NULL, `item_type` varchar(100) NOT NULL);
CREATE TABLE `submissions_submission` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `uuid` varchar(36) NOT NULL, `attempt_number` integer UNSIGNED NOT NULL, `submitted_at` datetime(6) NOT NULL, `created_at` datetime(6) NOT NULL, `raw_answer` longtext NOT NULL, `student_item_id` integer NOT NULL);
ALTER TABLE `submissions_studentitem` ADD CONSTRAINT `submissions_studentitem_course_id_6a6eccbdec6ffd0b_uniq` UNIQUE (`course_id`, `student_id`, `item_id`);
ALTER TABLE `submissions_scoresummary` ADD COLUMN `student_item_id` integer NOT NULL UNIQUE;

ALTER TABLE `submissions_score` ADD COLUMN `student_item_id` integer NOT NULL;

ALTER TABLE `submissions_score` ADD COLUMN `submission_id` integer NULL;

CREATE INDEX `submissions_score_fde81f11` ON `submissions_score` (`created_at`);
ALTER TABLE `submissions_scoresummary` ADD CONSTRAINT `submissions__highest_id_7fd91b8eb312c175_fk_submissions_score_id` FOREIGN KEY (`highest_id`) REFERENCES `submissions_score` (`id`);
ALTER TABLE `submissions_scoresummary` ADD CONSTRAINT `submissions_s_latest_id_2b352506a35fd569_fk_submissions_score_id` FOREIGN KEY (`latest_id`) REFERENCES `submissions_score` (`id`);
CREATE INDEX `submissions_studentitem_30a811f6` ON `submissions_studentitem` (`student_id`);
CREATE INDEX `submissions_studentitem_ea134da7` ON `submissions_studentitem` (`course_id`);
CREATE INDEX `submissions_studentitem_82bfda79` ON `submissions_studentitem` (`item_id`);
ALTER TABLE `submissions_submission` ADD CONSTRAINT `su_student_item_id_d3801ff833d05b1_fk_submissions_studentitem_id` FOREIGN KEY (`student_item_id`) REFERENCES `submissions_studentitem` (`id`);
CREATE INDEX `submissions_submission_ef7c876f` ON `submissions_submission` (`uuid`);
CREATE INDEX `submissions_submission_22bb6ff9` ON `submissions_submission` (`submitted_at`);
CREATE INDEX `submissions_submission_fde81f11` ON `submissions_submission` (`created_at`);
ALTER TABLE `submissions_scoresummary` ADD CONSTRAINT `s_student_item_id_32fa0a425a149b1b_fk_submissions_studentitem_id` FOREIGN KEY (`student_item_id`) REFERENCES `submissions_studentitem` (`id`);
CREATE INDEX `submissions_score_02d5e83e` ON `submissions_score` (`student_item_id`);
ALTER TABLE `submissions_score` ADD CONSTRAINT `s_student_item_id_7d4d4bb6a7dd0642_fk_submissions_studentitem_id` FOREIGN KEY (`student_item_id`) REFERENCES `submissions_studentitem` (`id`);
CREATE INDEX `submissions_score_1dd9cfcc` ON `submissions_score` (`submission_id`);
ALTER TABLE `submissions_score` ADD CONSTRAINT `subm_submission_id_3fc975fe88442ff7_fk_submissions_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions_submission` (`id`);
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `submissions_scoreannotation` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `annotation_type` varchar(255) NOT NULL, `creator` varchar(255) NOT NULL, `reason` longtext NOT NULL, `score_id` integer NOT NULL);
ALTER TABLE `submissions_scoreannotation` ADD CONSTRAINT `submissions_sc_score_id_7b5ef248552cb857_fk_submissions_score_id` FOREIGN KEY (`score_id`) REFERENCES `submissions_score` (`id`);
CREATE INDEX `submissions_scoreannotation_fd685234` ON `submissions_scoreannotation` (`annotation_type`);
CREATE INDEX `submissions_scoreannotation_ee243325` ON `submissions_scoreannotation` (`creator`);
COMMIT;
*/

BEGIN;
/*ALTER TABLE `submissions_submission` ADD COLUMN `status` varchar(1) DEFAULT 'A' NOT NULL;*/
ALTER TABLE `submissions_submission` ALTER COLUMN `status` DROP DEFAULT;
COMMIT;

/*
BEGIN;
CREATE TABLE `theming_sitetheme` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `theme_dir_name` varchar(255) NOT NULL, `site_id` integer NOT NULL);
ALTER TABLE `theming_sitetheme` ADD CONSTRAINT `theming_sitetheme_site_id_4fccdacaebfeb01f_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `track_trackinglog` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `dtcreated` datetime(6) NOT NULL, `username` varchar(32) NOT NULL, `ip` varchar(32) NOT NULL, `event_source` varchar(32) NOT NULL, `event_type` varchar(512) NOT NULL, `event` longtext NOT NULL, `agent` varchar(256) NOT NULL, `page` varchar(512) NULL, `time` datetime(6) NOT NULL, `host` varchar(64) NOT NULL);
COMMIT;
*/

BEGIN;
ALTER TABLE `auth_permission` MODIFY `name` varchar(255) NOT NULL;
COMMIT;

/*
BEGIN;
CREATE TABLE `user_api_usercoursetag` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `key` varchar(255) NOT NULL, `course_id` varchar(255) NOT NULL, `value` longtext NOT NULL, `user_id` integer NOT NULL);
CREATE TABLE `user_api_userorgtag` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `key` varchar(255) NOT NULL, `org` varchar(255) NOT NULL, `value` longtext NOT NULL, `user_id` integer NOT NULL);
CREATE TABLE `user_api_userpreference` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `key` varchar(255) NOT NULL, `value` longtext NOT NULL, `user_id` integer NOT NULL);
ALTER TABLE `user_api_userpreference` ADD CONSTRAINT `user_api_userpreference_user_id_4e4942d73f760072_uniq` UNIQUE (`user_id`, `key`);
ALTER TABLE `user_api_userorgtag` ADD CONSTRAINT `user_api_userorgtag_user_id_694f9e3322120c6f_uniq` UNIQUE (`user_id`, `org`, `key`);
ALTER TABLE `user_api_usercoursetag` ADD CONSTRAINT `user_api_usercoursetag_user_id_64d9a32c9890f610_uniq` UNIQUE (`user_id`, `course_id`, `key`);
ALTER TABLE `user_api_usercoursetag` ADD CONSTRAINT `user_api_usercoursetag_user_id_2692245bbb861fc2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `user_api_usercoursetag_3c6e0b8a` ON `user_api_usercoursetag` (`key`);
CREATE INDEX `user_api_usercoursetag_ea134da7` ON `user_api_usercoursetag` (`course_id`);
ALTER TABLE `user_api_userorgtag` ADD CONSTRAINT `user_api_userorgtag_user_id_16c7189496b4df00_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `user_api_userorgtag_3c6e0b8a` ON `user_api_userorgtag` (`key`);
CREATE INDEX `user_api_userorgtag_5a445d71` ON `user_api_userorgtag` (`org`);
ALTER TABLE `user_api_userpreference` ADD CONSTRAINT `user_api_userpreference_user_id_41f12e3954b69095_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `user_api_userpreference_3c6e0b8a` ON `user_api_userpreference` (`key`);
COMMIT;
*/

BEGIN;
ALTER TABLE `verify_student_skippedreverification` ALTER COLUMN `checkpoint_id` DROP DEFAULT;
ALTER TABLE `verify_student_skippedreverification` ALTER COLUMN `user_id` DROP DEFAULT;
COMMIT;

/*
BEGIN;
CREATE TABLE `verify_student_historicalverificationdeadline` (`id` integer NOT NULL, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `course_key` varchar(255) NOT NULL, `deadline` datetime(6) NOT NULL, `history_id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `history_date` datetime(6) NOT NULL, `history_type` varchar(1) NOT NULL, `history_user_id` integer NULL);
CREATE TABLE `verify_student_icrvstatusemailsconfiguration` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `change_date` datetime(6) NOT NULL, `enabled` bool NOT NULL, `changed_by_id` integer NULL);
CREATE TABLE `verify_student_incoursereverificationconfiguration` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `change_date` datetime(6) NOT NULL, `enabled` bool NOT NULL, `changed_by_id` integer NULL);
CREATE TABLE `verify_student_skippedreverification` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `course_id` varchar(255) NOT NULL, `created_at` datetime(6) NOT NULL);
CREATE TABLE `verify_student_softwaresecurephotoverification` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `status` varchar(100) NOT NULL, `status_changed` datetime(6) NOT NULL, `name` varchar(255) NOT NULL, `face_image_url` varchar(255) NOT NULL, `photo_id_image_url` varchar(255) NOT NULL, `receipt_id` varchar(255) NOT NULL, `created_at` datetime(6) NOT NULL, `updated_at` datetime(6) NOT NULL, `display` bool NOT NULL, `submitted_at` datetime(6) NULL, `reviewing_service` varchar(255) NOT NULL, `error_msg` longtext NOT NULL, `error_code` varchar(50) NOT NULL, `photo_id_key` longtext NOT NULL, `copy_id_photo_from_id` integer NULL, `reviewing_user_id` integer NULL, `user_id` integer NOT NULL);
CREATE TABLE `verify_student_verificationcheckpoint` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `course_id` varchar(255) NOT NULL, `checkpoint_location` varchar(255) NOT NULL);
CREATE TABLE `verify_student_verificationcheckpoint_photo_verification` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `verificationcheckpoint_id` integer NOT NULL, `softwaresecurephotoverification_id` integer NOT NULL, UNIQUE (`verificationcheckpoint_id`, `softwaresecurephotoverification_id`));
CREATE TABLE `verify_student_verificationdeadline` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `course_key` varchar(255) NOT NULL UNIQUE, `deadline` datetime(6) NOT NULL);
CREATE TABLE `verify_student_verificationstatus` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `status` varchar(32) NOT NULL, `timestamp` datetime(6) NOT NULL, `response` longtext NULL, `error` longtext NULL, `checkpoint_id` integer NOT NULL, `user_id` integer NOT NULL);
ALTER TABLE `verify_student_skippedreverification` ADD COLUMN `checkpoint_id` integer NOT NULL;

ALTER TABLE `verify_student_skippedreverification` ADD COLUMN `user_id` integer NOT NULL;

ALTER TABLE `verify_student_verificationcheckpoint` ADD CONSTRAINT `verify_student_verificationcheck_course_id_2c6a1f5c22b4cc19_uniq` UNIQUE (`course_id`, `checkpoint_location`);
ALTER TABLE `verify_student_skippedreverification` ADD CONSTRAINT `verify_student_skippedreverificati_user_id_1e8af5a5e735aa1a_uniq` UNIQUE (`user_id`, `course_id`);
ALTER TABLE `verify_student_historicalverificationdeadline` ADD CONSTRAINT `verify_student__history_user_id_1e374d24cb7902c2_fk_auth_user_id` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `verify_student_historicalverificationdeadline_b80bb774` ON `verify_student_historicalverificationdeadline` (`id`);
CREATE INDEX `verify_student_historicalverificationdeadline_c8235886` ON `verify_student_historicalverificationdeadline` (`course_key`);
ALTER TABLE `verify_student_icrvstatusemailsconfiguration` ADD CONSTRAINT `verify_student_icr_changed_by_id_52e319582f18ea3_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `verify_student_incoursereverificationconfiguration` ADD CONSTRAINT `verify_student_in_changed_by_id_1f3e3fa462a6ded6_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `verify_student_skippedreverification_ea134da7` ON `verify_student_skippedreverification` (`course_id`);
ALTER TABLE `verify_student_softwaresecurephotoverification` ADD CONSTRAINT `D01dce17b91c9382bd80d4be23a3e0cf` FOREIGN KEY (`copy_id_photo_from_id`) REFERENCES `verify_student_softwaresecurephotoverification` (`id`);
ALTER TABLE `verify_student_softwaresecurephotoverification` ADD CONSTRAINT `verify_studen_reviewing_user_id_727fae1d0bcf8aaf_fk_auth_user_id` FOREIGN KEY (`reviewing_user_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `verify_student_softwaresecurephotoverification` ADD CONSTRAINT `verify_student_software_user_id_61ffab9c12020106_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `verify_student_softwaresecurephotoverification_f6fc3014` ON `verify_student_softwaresecurephotoverification` (`receipt_id`);
CREATE INDEX `verify_student_softwaresecurephotoverification_fde81f11` ON `verify_student_softwaresecurephotoverification` (`created_at`);
CREATE INDEX `verify_student_softwaresecurephotoverification_afd1a1a8` ON `verify_student_softwaresecurephotoverification` (`updated_at`);
CREATE INDEX `verify_student_softwaresecurephotoverification_ebf78b51` ON `verify_student_softwaresecurephotoverification` (`display`);
CREATE INDEX `verify_student_softwaresecurephotoverification_22bb6ff9` ON `verify_student_softwaresecurephotoverification` (`submitted_at`);
CREATE INDEX `verify_student_verificationcheckpoint_ea134da7` ON `verify_student_verificationcheckpoint` (`course_id`);
ALTER TABLE `verify_student_verificationcheckpoint_photo_verification` ADD CONSTRAINT `e4d180f9ca43c3b66693c416a36cfb9d` FOREIGN KEY (`verificationcheckpoint_id`) REFERENCES `verify_student_verificationcheckpoint` (`id`);
ALTER TABLE `verify_student_verificationcheckpoint_photo_verification` ADD CONSTRAINT `c7846aea49a044a1161a4b9b6d70e050` FOREIGN KEY (`softwaresecurephotoverification_id`) REFERENCES `verify_student_softwaresecurephotoverification` (`id`);
ALTER TABLE `verify_student_verificationstatus` ADD CONSTRAINT `D4cefb6d3d71c9b26af2a5ece4c37277` FOREIGN KEY (`checkpoint_id`) REFERENCES `verify_student_verificationcheckpoint` (`id`);
ALTER TABLE `verify_student_verificationstatus` ADD CONSTRAINT `verify_student_verifica_user_id_5c19fcd6dc05f211_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `verify_student_verificationstatus_9acb4454` ON `verify_student_verificationstatus` (`status`);
CREATE INDEX `verify_student_skippedreverification_bef2d98a` ON `verify_student_skippedreverification` (`checkpoint_id`);
ALTER TABLE `verify_student_skippedreverification` ADD CONSTRAINT `D759ffa5ca66ef1a2c8c200f7a21365b` FOREIGN KEY (`checkpoint_id`) REFERENCES `verify_student_verificationcheckpoint` (`id`);
CREATE INDEX `verify_student_skippedreverification_e8701ad4` ON `verify_student_skippedreverification` (`user_id`);
ALTER TABLE `verify_student_skippedreverification` ADD CONSTRAINT `verify_student_skippedr_user_id_6752b392e3d3c501_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;
*/

BEGIN;
/*ALTER TABLE `verify_student_historicalverificationdeadline` ADD COLUMN `deadline_is_explicit` bool DEFAULT 1 NOT NULL;*/
ALTER TABLE `verify_student_historicalverificationdeadline` ALTER COLUMN `deadline_is_explicit` DROP DEFAULT;
/*ALTER TABLE `verify_student_verificationdeadline` ADD COLUMN `deadline_is_explicit` bool DEFAULT 1 NOT NULL;*/
ALTER TABLE `verify_student_verificationdeadline` ALTER COLUMN `deadline_is_explicit` DROP DEFAULT;
COMMIT;

/*
BEGIN;
ALTER TABLE `verify_student_historicalverificationdeadline` ALTER COLUMN `deadline_is_explicit` SET DEFAULT 0;
ALTER TABLE `verify_student_historicalverificationdeadline` ALTER COLUMN `deadline_is_explicit` DROP DEFAULT;
ALTER TABLE `verify_student_verificationdeadline` ALTER COLUMN `deadline_is_explicit` SET DEFAULT 0;
ALTER TABLE `verify_student_verificationdeadline` ALTER COLUMN `deadline_is_explicit` DROP DEFAULT;
COMMIT;
*/

BEGIN;
ALTER TABLE `auth_user` MODIFY `email` varchar(254) NOT NULL;
COMMIT;

/*
BEGIN;
CREATE TABLE `workflow_assessmentworkflow` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `status` varchar(100) NOT NULL, `status_changed` datetime(6) NOT NULL, `submission_uuid` varchar(36) NOT NULL UNIQUE, `uuid` varchar(36) NOT NULL UNIQUE, `course_id` varchar(255) NOT NULL, `item_id` varchar(255) NOT NULL);
CREATE TABLE `workflow_assessmentworkflowcancellation` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `comments` longtext NOT NULL, `cancelled_by_id` varchar(40) NOT NULL, `created_at` datetime(6) NOT NULL, `workflow_id` integer NOT NULL);
CREATE TABLE `workflow_assessmentworkflowstep` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `name` varchar(20) NOT NULL, `submitter_completed_at` datetime(6) NULL, `assessment_completed_at` datetime(6) NULL, `order_num` integer UNSIGNED NOT NULL, `workflow_id` integer NOT NULL);
CREATE INDEX `workflow_assessmentworkflow_ea134da7` ON `workflow_assessmentworkflow` (`course_id`);
CREATE INDEX `workflow_assessmentworkflow_82bfda79` ON `workflow_assessmentworkflow` (`item_id`);
ALTER TABLE `workflow_assessmentworkflowcancellation` ADD CONSTRAINT `w_workflow_id_581d7b320743ff70_fk_workflow_assessmentworkflow_id` FOREIGN KEY (`workflow_id`) REFERENCES `workflow_assessmentworkflow` (`id`);
CREATE INDEX `workflow_assessmentworkflowcancellation_195d4285` ON `workflow_assessmentworkflowcancellation` (`cancelled_by_id`);
CREATE INDEX `workflow_assessmentworkflowcancellation_fde81f11` ON `workflow_assessmentworkflowcancellation` (`created_at`);
ALTER TABLE `workflow_assessmentworkflowstep` ADD CONSTRAINT `w_workflow_id_4939c36cf6220ba3_fk_workflow_assessmentworkflow_id` FOREIGN KEY (`workflow_id`) REFERENCES `workflow_assessmentworkflow` (`id`);
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `xblock_django_xblockdisableconfig` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `change_date` datetime(6) NOT NULL, `enabled` bool NOT NULL, `disabled_blocks` longtext NOT NULL, `changed_by_id` integer NULL);
ALTER TABLE `xblock_django_xblockdisableconfig` ADD CONSTRAINT `xblock_django_xbl_changed_by_id_429bdccb9201831c_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`);
COMMIT;
*/

/*
BEGIN;
ALTER TABLE `xblock_django_xblockdisableconfig` ADD COLUMN `disabled_create_blocks` longtext NOT NULL;
UPDATE `xblock_django_xblockdisableconfig` SET `disabled_create_blocks` = '';
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `xblock_django_xblockconfiguration` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `change_date` datetime(6) NOT NULL, `enabled` bool NOT NULL, `name` varchar(255) NOT NULL, `deprecated` bool NOT NULL, `changed_by_id` integer NULL);
CREATE TABLE `xblock_django_xblockstudioconfiguration` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `change_date` datetime(6) NOT NULL, `enabled` bool NOT NULL, `name` varchar(255) NOT NULL, `template` varchar(255) NOT NULL, `support_level` varchar(2) NOT NULL, `changed_by_id` integer NULL);
CREATE TABLE `xblock_django_xblockstudioconfigurationflag` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `change_date` datetime(6) NOT NULL, `enabled` bool NOT NULL, `changed_by_id` integer NULL);
ALTER TABLE `xblock_django_xblockconfiguration` ADD CONSTRAINT `xblock_django_xbl_changed_by_id_61068ae9f50d6490_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `xblock_django_xblockconfiguration_b068931c` ON `xblock_django_xblockconfiguration` (`name`);
ALTER TABLE `xblock_django_xblockstudioconfiguration` ADD CONSTRAINT `xblock_django_xblo_changed_by_id_353d5def0d11370_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `xblock_django_xblockstudioconfiguration_b068931c` ON `xblock_django_xblockstudioconfiguration` (`name`);
ALTER TABLE `xblock_django_xblockstudioconfigurationflag` ADD CONSTRAINT `xblock_django_xbl_changed_by_id_11457ce96bbbfbf6_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`);
COMMIT;
*/

BEGIN;
ALTER TABLE `auth_user` MODIFY `last_login` datetime(6) NULL;
COMMIT;

/*
BEGIN;
CREATE TABLE `django_content_type` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `name` varchar(100) NOT NULL, `app_label` varchar(100) NOT NULL, `model` varchar(100) NOT NULL);
ALTER TABLE `django_content_type` ADD CONSTRAINT `django_content_type_app_label_45f3b1d93ec8c61c_uniq` UNIQUE (`app_label`, `model`);
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `auth_permission` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `name` varchar(50) NOT NULL, `content_type_id` integer NOT NULL, `codename` varchar(100) NOT NULL, UNIQUE (`content_type_id`, `codename`));
CREATE TABLE `auth_group` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `name` varchar(80) NOT NULL UNIQUE);
CREATE TABLE `auth_group_permissions` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `group_id` integer NOT NULL, `permission_id` integer NOT NULL, UNIQUE (`group_id`, `permission_id`));
CREATE TABLE `auth_user` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `password` varchar(128) NOT NULL, `last_login` datetime(6) NOT NULL, `is_superuser` bool NOT NULL, `username` varchar(30) NOT NULL UNIQUE, `first_name` varchar(30) NOT NULL, `last_name` varchar(30) NOT NULL, `email` varchar(75) NOT NULL, `is_staff` bool NOT NULL, `is_active` bool NOT NULL, `date_joined` datetime(6) NOT NULL);
CREATE TABLE `auth_user_groups` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `user_id` integer NOT NULL, `group_id` integer NOT NULL, UNIQUE (`user_id`, `group_id`));
CREATE TABLE `auth_user_user_permissions` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `user_id` integer NOT NULL, `permission_id` integer NOT NULL, UNIQUE (`user_id`, `permission_id`));
ALTER TABLE `auth_permission` ADD CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);
ALTER TABLE `auth_group_permissions` ADD CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);
ALTER TABLE `auth_group_permissions` ADD CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);
ALTER TABLE `auth_user_groups` ADD CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `auth_user_groups` ADD CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);
ALTER TABLE `auth_user_user_permissions` ADD CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `auth_user_user_permissions` ADD CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);
COMMIT;
*/

BEGIN;
ALTER TABLE `bookmarks_bookmark` ALTER COLUMN `xblock_cache_id` DROP DEFAULT;
COMMIT;
/*
BEGIN;
CREATE TABLE `bookmarks_bookmark` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `course_key` varchar(255) NOT NULL, `usage_key` varchar(255) NOT NULL, `path` longtext NOT NULL, `user_id` integer NOT NULL);
CREATE TABLE `bookmarks_xblockcache` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `course_key` varchar(255) NOT NULL, `usage_key` varchar(255) NOT NULL UNIQUE, `display_name` varchar(255) NOT NULL, `paths` longtext NOT NULL);
ALTER TABLE `bookmarks_bookmark` ADD COLUMN `xblock_cache_id` integer NOT NULL;

ALTER TABLE `bookmarks_bookmark` ADD CONSTRAINT `bookmarks_bookmark_user_id_7059f67cddd52c9a_uniq` UNIQUE (`user_id`, `usage_key`);
ALTER TABLE `bookmarks_bookmark` ADD CONSTRAINT `bookmarks_bookmark_user_id_33914fa9accf01cb_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `bookmarks_bookmark_c8235886` ON `bookmarks_bookmark` (`course_key`);
CREATE INDEX `bookmarks_bookmark_4a93f0de` ON `bookmarks_bookmark` (`usage_key`);
CREATE INDEX `bookmarks_xblockcache_c8235886` ON `bookmarks_xblockcache` (`course_key`);
CREATE INDEX `bookmarks_bookmark_d452fbf6` ON `bookmarks_bookmark` (`xblock_cache_id`);
ALTER TABLE `bookmarks_bookmark` ADD CONSTRAINT `boo_xblock_cache_id_22d48842487ba2d2_fk_bookmarks_xblockcache_id` FOREIGN KEY (`xblock_cache_id`) REFERENCES `bookmarks_xblockcache` (`id`);
COMMIT;
*/

BEGIN;
ALTER TABLE `course_groups_coursecohort` ALTER COLUMN `course_user_group_id` DROP DEFAULT;
ALTER TABLE `course_groups_cohortmembership` ALTER COLUMN `course_user_group_id` DROP DEFAULT;
ALTER TABLE `course_groups_cohortmembership` ALTER COLUMN `user_id` DROP DEFAULT;
COMMIT;

/*
BEGIN;
CREATE TABLE `course_groups_cohortmembership` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `course_id` varchar(255) NOT NULL);
CREATE TABLE `course_groups_coursecohort` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `assignment_type` varchar(20) NOT NULL);
CREATE TABLE `course_groups_coursecohortssettings` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `is_cohorted` bool NOT NULL, `course_id` varchar(255) NOT NULL UNIQUE, `cohorted_discussions` longtext NULL, `always_cohort_inline_discussions` bool NOT NULL);
CREATE TABLE `course_groups_courseusergroup` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `name` varchar(255) NOT NULL, `course_id` varchar(255) NOT NULL, `group_type` varchar(20) NOT NULL);
CREATE TABLE `course_groups_courseusergroup_users` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `courseusergroup_id` integer NOT NULL, `user_id` integer NOT NULL, UNIQUE (`courseusergroup_id`, `user_id`));
CREATE TABLE `course_groups_courseusergrouppartitiongroup` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `partition_id` integer NOT NULL, `group_id` integer NOT NULL, `created_at` datetime(6) NOT NULL, `updated_at` datetime(6) NOT NULL, `course_user_group_id` integer NOT NULL UNIQUE);
ALTER TABLE `course_groups_coursecohort` ADD COLUMN `course_user_group_id` integer NOT NULL UNIQUE;

ALTER TABLE `course_groups_cohortmembership` ADD COLUMN `course_user_group_id` integer NOT NULL;

ALTER TABLE `course_groups_cohortmembership` ADD COLUMN `user_id` integer NOT NULL;

ALTER TABLE `course_groups_courseusergroup` ADD CONSTRAINT `course_groups_courseusergroup_name_63f7511804c52f38_uniq` UNIQUE (`name`, `course_id`);
ALTER TABLE `course_groups_cohortmembership` ADD CONSTRAINT `course_groups_cohortmembership_user_id_395bddd0389ed7da_uniq` UNIQUE (`user_id`, `course_id`);
CREATE INDEX `course_groups_courseusergroup_ea134da7` ON `course_groups_courseusergroup` (`course_id`);
ALTER TABLE `course_groups_courseusergroup_users` ADD CONSTRAINT `db746f642b1b8232920506afe242fe6b` FOREIGN KEY (`courseusergroup_id`) REFERENCES `course_groups_courseusergroup` (`id`);
ALTER TABLE `course_groups_courseusergroup_users` ADD CONSTRAINT `course_groups_courseuse_user_id_7b26cdeaeb621a93_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `course_groups_courseusergrouppartitiongroup` ADD CONSTRAINT `D1516b3811dd6dd500bfae054d6fdc92` FOREIGN KEY (`course_user_group_id`) REFERENCES `course_groups_courseusergroup` (`id`);
ALTER TABLE `course_groups_coursecohort` ADD CONSTRAINT `D339c347a8fab561c2e92ea09f250df8` FOREIGN KEY (`course_user_group_id`) REFERENCES `course_groups_courseusergroup` (`id`);
CREATE INDEX `course_groups_cohortmembership_6e438ee3` ON `course_groups_cohortmembership` (`course_user_group_id`);
ALTER TABLE `course_groups_cohortmembership` ADD CONSTRAINT `D004e77c965054d46217a8bd48bcaec8` FOREIGN KEY (`course_user_group_id`) REFERENCES `course_groups_courseusergroup` (`id`);
CREATE INDEX `course_groups_cohortmembership_e8701ad4` ON `course_groups_cohortmembership` (`user_id`);
ALTER TABLE `course_groups_cohortmembership` ADD CONSTRAINT `course_groups_cohortmem_user_id_15d408bf736398bf_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `django_admin_log` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `action_time` datetime(6) NOT NULL, `object_id` longtext NULL, `object_repr` varchar(200) NOT NULL, `action_flag` smallint UNSIGNED NOT NULL, `change_message` longtext NOT NULL, `content_type_id` integer NULL, `user_id` integer NOT NULL);
ALTER TABLE `django_admin_log` ADD CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);
ALTER TABLE `django_admin_log` ADD CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `contentserver_courseassetcachettlconfig` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `change_date` datetime(6) NOT NULL, `enabled` bool NOT NULL, `cache_ttl` integer UNSIGNED NOT NULL, `changed_by_id` integer NULL);
ALTER TABLE `contentserver_courseassetcachettlconfig` ADD CONSTRAINT `contentserver_cou_changed_by_id_3b5e5ff6c6df495d_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`);
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `contentserver_cdnuseragentsconfig` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `change_date` datetime(6) NOT NULL, `enabled` bool NOT NULL, `cdn_user_agents` longtext NOT NULL, `changed_by_id` integer NULL);
ALTER TABLE `contentserver_cdnuseragentsconfig` ADD CONSTRAINT `contentserver_cdn_changed_by_id_36fe2b67b2c7f0ba_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`);
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `course_action_state_coursererunstate` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created_time` datetime(6) NOT NULL, `updated_time` datetime(6) NOT NULL, `course_key` varchar(255) NOT NULL, `action` varchar(100) NOT NULL, `state` varchar(50) NOT NULL, `should_display` bool NOT NULL, `message` varchar(1000) NOT NULL, `source_course_key` varchar(255) NOT NULL, `display_name` varchar(255) NOT NULL, `created_user_id` integer NULL, `updated_user_id` integer NULL);
ALTER TABLE `course_action_state_coursererunstate` ADD CONSTRAINT `course_action_state_coursereruns_course_key_cf5da77ed3032d6_uniq` UNIQUE (`course_key`, `action`);
ALTER TABLE `course_action_state_coursererunstate` ADD CONSTRAINT `course_action_s_created_user_id_7f53088ef8dccd0b_fk_auth_user_id` FOREIGN KEY (`created_user_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `course_action_state_coursererunstate` ADD CONSTRAINT `course_action_s_updated_user_id_4fab18012332c9a4_fk_auth_user_id` FOREIGN KEY (`updated_user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `course_action_state_coursererunstate_c8235886` ON `course_action_state_coursererunstate` (`course_key`);
CREATE INDEX `course_action_state_coursererunstate_418c5509` ON `course_action_state_coursererunstate` (`action`);
CREATE INDEX `course_action_state_coursererunstate_a9bd7343` ON `course_action_state_coursererunstate` (`source_course_key`);
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `course_modes_coursemode` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `course_id` varchar(255) NOT NULL, `mode_slug` varchar(100) NOT NULL, `mode_display_name` varchar(255) NOT NULL, `min_price` integer NOT NULL, `currency` varchar(8) NOT NULL, `expiration_datetime` datetime(6) NULL, `expiration_date` date NULL, `suggested_prices` varchar(255) NOT NULL, `description` longtext NULL, `sku` varchar(255) NULL);
CREATE TABLE `course_modes_coursemodesarchive` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `course_id` varchar(255) NOT NULL, `mode_slug` varchar(100) NOT NULL, `mode_display_name` varchar(255) NOT NULL, `min_price` integer NOT NULL, `suggested_prices` varchar(255) NOT NULL, `currency` varchar(8) NOT NULL, `expiration_date` date NULL, `expiration_datetime` datetime(6) NULL);
ALTER TABLE `course_modes_coursemode` ADD CONSTRAINT `course_modes_coursemode_course_id_6fbb1796ace558b4_uniq` UNIQUE (`course_id`, `mode_slug`, `currency`);
CREATE INDEX `course_modes_coursemode_ea134da7` ON `course_modes_coursemode` (`course_id`);
CREATE INDEX `course_modes_coursemodesarchive_ea134da7` ON `course_modes_coursemodesarchive` (`course_id`);
COMMIT;
*/

BEGIN;
/*ALTER TABLE `course_modes_coursemode` ADD COLUMN `expiration_datetime_is_explicit` bool DEFAULT 1 NOT NULL;*/
ALTER TABLE `course_modes_coursemode` ALTER COLUMN `expiration_datetime_is_explicit` DROP DEFAULT;
COMMIT;

BEGIN;
ALTER TABLE `course_modes_coursemode` ALTER COLUMN `expiration_datetime_is_explicit` SET DEFAULT 0;
ALTER TABLE `course_modes_coursemode` ALTER COLUMN `expiration_datetime_is_explicit` DROP DEFAULT;
COMMIT;

/*
BEGIN;
CREATE TABLE `django_site` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `domain` varchar(100) NOT NULL, `name` varchar(50) NOT NULL);
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `course_modes_coursemodeexpirationconfig` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `change_date` datetime(6) NOT NULL, `enabled` bool NOT NULL, `verification_window` bigint NOT NULL, `changed_by_id` integer NULL);
ALTER TABLE `course_modes_coursemodeexpirationconfig` ADD CONSTRAINT `course_modes_cour_changed_by_id_4d31fab2bbe98b89_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`);
COMMIT;
*/

/*
BEGIN;
ALTER TABLE `course_modes_coursemode` ADD COLUMN `bulk_sku` varchar(255) NULL;
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `course_overviews_courseoverview` (`created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `version` integer NOT NULL, `id` varchar(255) NOT NULL PRIMARY KEY, `_location` varchar(255) NOT NULL, `display_name` longtext NULL, `display_number_with_default` longtext NOT NULL, `display_org_with_default` longtext NOT NULL, `start` datetime(6) NULL, `end` datetime(6) NULL, `advertised_start` longtext NULL, `course_image_url` longtext NOT NULL, `facebook_url` longtext NULL, `social_sharing_url` longtext NULL, `end_of_course_survey_url` longtext NULL, `certificates_display_behavior` longtext NULL, `certificates_show_before_end` bool NOT NULL, `cert_html_view_enabled` bool NOT NULL, `has_any_active_web_certificate` bool NOT NULL, `cert_name_short` longtext NOT NULL, `cert_name_long` longtext NOT NULL, `lowest_passing_grade` numeric(5, 2) NULL, `days_early_for_beta` double precision NULL, `mobile_available` bool NOT NULL, `visible_to_staff_only` bool NOT NULL, `_pre_requisite_courses_json` longtext NOT NULL, `enrollment_start` datetime(6) NULL, `enrollment_end` datetime(6) NULL, `enrollment_domain` longtext NULL, `invitation_only` bool NOT NULL, `max_student_enrollments_allowed` integer NULL);
CREATE TABLE `course_overviews_courseoverviewtab` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `tab_id` varchar(50) NOT NULL, `course_overview_id` varchar(255) NOT NULL);
ALTER TABLE `course_overviews_courseoverviewtab` ADD CONSTRAINT `D298658de1d4c8777e046eed658fc94e` FOREIGN KEY (`course_overview_id`) REFERENCES `course_overviews_courseoverview` (`id`);
COMMIT;
*/
BEGIN;
ALTER TABLE `course_overviews_courseoverview` ALTER COLUMN `announcement` DROP DEFAULT;
COMMIT;
/*
BEGIN;
ALTER TABLE `course_overviews_courseoverview` ADD COLUMN `announcement` datetime(6) NULL;

ALTER TABLE `course_overviews_courseoverview` ADD COLUMN `catalog_visibility` longtext NULL;
ALTER TABLE `course_overviews_courseoverview` ADD COLUMN `course_video_url` longtext NULL;
ALTER TABLE `course_overviews_courseoverview` ADD COLUMN `effort` longtext NULL;
ALTER TABLE `course_overviews_courseoverview` ADD COLUMN `short_description` longtext NULL;
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `course_overviews_courseoverviewgeneratedhistory` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `num_courses` integer NULL);
COMMIT;
*/

/*
BEGIN;
ALTER TABLE `course_overviews_courseoverview` ADD COLUMN `org` longtext NOT NULL;
UPDATE `course_overviews_courseoverview` SET `org` = 'outdated_entry';
COMMIT;
*/
/*
BEGIN;
DROP TABLE `course_overviews_courseoverviewgeneratedhistory` CASCADE;
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `course_overviews_courseoverviewimageset` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `small_url` longtext NOT NULL, `large_url` longtext NOT NULL, `course_overview_id` varchar(255) NOT NULL UNIQUE);
ALTER TABLE `course_overviews_courseoverviewimageset` ADD CONSTRAINT `D47baf904f8952eb0e1fafefd558a718` FOREIGN KEY (`course_overview_id`) REFERENCES `course_overviews_courseoverview` (`id`);
COMMIT;
*/

/*
BEGIN;
ALTER TABLE `django_content_type` MODIFY `name` varchar(100) NULL;
--
-- MIGRATION NOW PERFORMS OPERATION THAT CANNOT BE WRITTEN AS SQL:
-- Raw Python operation
--
ALTER TABLE `django_content_type` DROP COLUMN `name` CASCADE;
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `course_overviews_courseoverviewimageconfig` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `change_date` datetime(6) NOT NULL, `enabled` bool NOT NULL, `small_width` integer NOT NULL, `small_height` integer NOT NULL, `large_width` integer NOT NULL, `large_height` integer NOT NULL, `changed_by_id` integer NULL);
ALTER TABLE `course_overviews_courseoverviewimageconfig` ADD CONSTRAINT `course_overviews__changed_by_id_54b19ba1c134af6a_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`);
COMMIT;
*/

/*
BEGIN;
ALTER TABLE `course_overviews_courseoverview` ADD COLUMN `facebook_url` longtext NULL;
COMMIT;
*/
BEGIN;
ALTER TABLE `course_overviews_courseoverview` ALTER COLUMN `self_paced` SET DEFAULT 0;
COMMIT;

/*
BEGIN;
--ALTER TABLE `course_overviews_courseoverview` DROP COLUMN `facebook_url` CASCADE;
ALTER TABLE `course_overviews_courseoverview` ADD COLUMN `self_paced` bool DEFAULT 0 NOT NULL;
ALTER TABLE `course_overviews_courseoverview` ALTER COLUMN `self_paced` DROP DEFAULT;
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `course_structures_coursestructure` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `course_id` varchar(255) NOT NULL UNIQUE, `structure_json` longtext NULL, `discussion_id_map_json` longtext NULL);
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `coursetalk_coursetalkwidgetconfiguration` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `change_date` datetime(6) NOT NULL, `enabled` bool NOT NULL, `platform_key` varchar(50) NOT NULL, `changed_by_id` integer NULL);
ALTER TABLE `coursetalk_coursetalkwidgetconfiguration` ADD CONSTRAINT `coursetalk_course_changed_by_id_18bd24020c1b37d5_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`);
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `credit_creditcourse` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `course_key` varchar(255) NOT NULL UNIQUE, `enabled` bool NOT NULL);
CREATE TABLE `credit_crediteligibility` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `username` varchar(255) NOT NULL, `deadline` datetime(6) NOT NULL, `course_id` integer NOT NULL);
CREATE TABLE `credit_creditprovider` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `provider_id` varchar(255) NOT NULL UNIQUE, `active` bool NOT NULL, `display_name` varchar(255) NOT NULL, `enable_integration` bool NOT NULL, `provider_url` varchar(200) NOT NULL, `provider_status_url` varchar(200) NOT NULL, `provider_description` longtext NOT NULL, `fulfillment_instructions` longtext NULL, `eligibility_email_message` longtext NOT NULL, `receipt_email_message` longtext NOT NULL, `thumbnail_url` varchar(255) NOT NULL);
CREATE TABLE `credit_creditrequest` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `uuid` varchar(32) NOT NULL UNIQUE, `username` varchar(255) NOT NULL, `parameters` longtext NOT NULL, `status` varchar(255) NOT NULL, `course_id` integer NOT NULL, `provider_id` integer NOT NULL);
CREATE TABLE `credit_creditrequirement` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `namespace` varchar(255) NOT NULL, `name` varchar(255) NOT NULL, `display_name` varchar(255) NOT NULL, `order` integer UNSIGNED NOT NULL, `criteria` longtext NOT NULL, `active` bool NOT NULL, `course_id` integer NOT NULL);
CREATE TABLE `credit_creditrequirementstatus` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `username` varchar(255) NOT NULL, `status` varchar(32) NOT NULL, `reason` longtext NOT NULL, `requirement_id` integer NOT NULL);
CREATE TABLE `credit_historicalcreditrequest` (`id` integer NOT NULL, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `uuid` varchar(32) NOT NULL, `username` varchar(255) NOT NULL, `parameters` longtext NOT NULL, `status` varchar(255) NOT NULL, `history_id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `history_date` datetime(6) NOT NULL, `history_type` varchar(1) NOT NULL, `course_id` integer NULL, `history_user_id` integer NULL, `provider_id` integer NULL);
CREATE TABLE `credit_historicalcreditrequirementstatus` (`id` integer NOT NULL, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `username` varchar(255) NOT NULL, `status` varchar(32) NOT NULL, `reason` longtext NOT NULL, `history_id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `history_date` datetime(6) NOT NULL, `history_type` varchar(1) NOT NULL, `history_user_id` integer NULL, `requirement_id` integer NULL);
ALTER TABLE `credit_creditrequirementstatus` ADD CONSTRAINT `credit_creditrequirementstatus_username_67dcb69ebf779e3b_uniq` UNIQUE (`username`, `requirement_id`);
ALTER TABLE `credit_creditrequirement` ADD CONSTRAINT `credit_creditrequirement_namespace_33039c83b3e69b8_uniq` UNIQUE (`namespace`, `name`, `course_id`);
ALTER TABLE `credit_creditrequest` ADD CONSTRAINT `credit_creditrequest_username_4f61c10bb0d67c01_uniq` UNIQUE (`username`, `course_id`, `provider_id`);
ALTER TABLE `credit_crediteligibility` ADD CONSTRAINT `credit_crediteligibility_username_936cb16677e83e_uniq` UNIQUE (`username`, `course_id`);
ALTER TABLE `credit_crediteligibility` ADD CONSTRAINT `credit_cred_course_id_4218adeba258bf8b_fk_credit_creditcourse_id` FOREIGN KEY (`course_id`) REFERENCES `credit_creditcourse` (`id`);
CREATE INDEX `credit_crediteligibility_14c4b06b` ON `credit_crediteligibility` (`username`);
ALTER TABLE `credit_creditrequest` ADD CONSTRAINT `credit_cred_course_id_578c5f1124002bab_fk_credit_creditcourse_id` FOREIGN KEY (`course_id`) REFERENCES `credit_creditcourse` (`id`);
ALTER TABLE `credit_creditrequest` ADD CONSTRAINT `credit_c_provider_id_f2973cc3e38a483_fk_credit_creditprovider_id` FOREIGN KEY (`provider_id`) REFERENCES `credit_creditprovider` (`id`);
CREATE INDEX `credit_creditrequest_14c4b06b` ON `credit_creditrequest` (`username`);
ALTER TABLE `credit_creditrequirement` ADD CONSTRAINT `credit_cred_course_id_1c8fb9ebd295ae19_fk_credit_creditcourse_id` FOREIGN KEY (`course_id`) REFERENCES `credit_creditcourse` (`id`);
ALTER TABLE `credit_creditrequirementstatus` ADD CONSTRAINT `c_requirement_id_3896aa6db214f84a_fk_credit_creditrequirement_id` FOREIGN KEY (`requirement_id`) REFERENCES `credit_creditrequirement` (`id`);
CREATE INDEX `credit_creditrequirementstatus_14c4b06b` ON `credit_creditrequirementstatus` (`username`);
ALTER TABLE `credit_historicalcreditrequest` ADD CONSTRAINT `credit_historic_history_user_id_52a9922f26a69e7e_fk_auth_user_id` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `credit_historicalcreditrequest_b80bb774` ON `credit_historicalcreditrequest` (`id`);
CREATE INDEX `credit_historicalcreditrequest_ef7c876f` ON `credit_historicalcreditrequest` (`uuid`);
CREATE INDEX `credit_historicalcreditrequest_14c4b06b` ON `credit_historicalcreditrequest` (`username`);
ALTER TABLE `credit_historicalcreditrequirementstatus` ADD CONSTRAINT `credit_historic_history_user_id_72b045b9192495cc_fk_auth_user_id` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `credit_historicalcreditrequirementstatus_b80bb774` ON `credit_historicalcreditrequirementstatus` (`id`);
CREATE INDEX `credit_historicalcreditrequirementstatus_14c4b06b` ON `credit_historicalcreditrequirementstatus` (`username`);
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `credit_creditconfig` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `change_date` datetime(6) NOT NULL, `enabled` bool NOT NULL, `cache_ttl` integer UNSIGNED NOT NULL, `changed_by_id` integer NULL);
ALTER TABLE `credit_creditconfig` ADD CONSTRAINT `credit_creditconf_changed_by_id_6270a800475f6694_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`);
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `dark_lang_darklangconfig` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `change_date` datetime(6) NOT NULL, `enabled` bool NOT NULL, `released_languages` longtext NOT NULL, `changed_by_id` integer NULL);
ALTER TABLE `dark_lang_darklangconfig` ADD CONSTRAINT `dark_lang_darklan_changed_by_id_7e1defb1121d58b8_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`);
COMMIT;
*/

/*
BEGIN;
--
-- MIGRATION NOW PERFORMS OPERATION THAT CANNOT BE WRITTEN AS SQL:
-- Raw Python operation
--

COMMIT;
*/

/*
BEGIN;
CREATE TABLE `django_comment_client_permission` (`name` varchar(30) NOT NULL PRIMARY KEY);
CREATE TABLE `django_comment_client_role` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `name` varchar(30) NOT NULL, `course_id` varchar(255) NOT NULL);
CREATE TABLE `django_comment_client_role_users` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `role_id` integer NOT NULL, `user_id` integer NOT NULL, UNIQUE (`role_id`, `user_id`));
CREATE TABLE `django_comment_client_permission_roles` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `permission_id` varchar(30) NOT NULL, `role_id` integer NOT NULL, UNIQUE (`permission_id`, `role_id`));
CREATE INDEX `django_comment_client_role_ea134da7` ON `django_comment_client_role` (`course_id`);
ALTER TABLE `django_comment_client_role_users` ADD CONSTRAINT `django_role_id_75cf4005dc1fb11d_fk_django_comment_client_role_id` FOREIGN KEY (`role_id`) REFERENCES `django_comment_client_role` (`id`);
ALTER TABLE `django_comment_client_role_users` ADD CONSTRAINT `django_comment_client_r_user_id_139843e7dcf77368_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `django_comment_client_permission_roles` ADD CONSTRAINT `D4e9a4067c1db9041491363f5e032121` FOREIGN KEY (`permission_id`) REFERENCES `django_comment_client_permission` (`name`);
ALTER TABLE `django_comment_client_permission_roles` ADD CONSTRAINT `django_role_id_558412c96ef7ba87_fk_django_comment_client_role_id` FOREIGN KEY (`role_id`) REFERENCES `django_comment_client_role` (`id`);
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `django_comment_common_forumsconfig` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `change_date` datetime(6) NOT NULL, `enabled` bool NOT NULL, `connection_timeout` double precision NOT NULL, `changed_by_id` integer NULL);
ALTER TABLE `django_comment_common_forumsconfig` ADD CONSTRAINT `django_comment_co_changed_by_id_18a7f46ff6309996_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`);
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `django_openid_auth_association` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `server_url` longtext NOT NULL, `handle` varchar(255) NOT NULL, `secret` longtext NOT NULL, `issued` integer NOT NULL, `lifetime` integer NOT NULL, `assoc_type` longtext NOT NULL);
CREATE TABLE `django_openid_auth_nonce` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `server_url` varchar(2047) NOT NULL, `timestamp` integer NOT NULL, `salt` varchar(40) NOT NULL);
CREATE TABLE `django_openid_auth_useropenid` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `claimed_id` longtext NOT NULL, `display_id` longtext NOT NULL, `user_id` integer NOT NULL);
ALTER TABLE `django_openid_auth_useropenid` ADD CONSTRAINT `django_openid_auth_user_user_id_136119e72782e2cf_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;
*/

BEGIN;
ALTER TABLE `oauth2_accesstoken` ALTER COLUMN `client_id` DROP DEFAULT;
ALTER TABLE `oauth2_accesstoken` ALTER COLUMN `user_id` DROP DEFAULT;
COMMIT;
/*
BEGIN;
CREATE TABLE `oauth2_accesstoken` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `token` varchar(255) NOT NULL, `expires` datetime(6) NOT NULL, `scope` integer NOT NULL);
CREATE TABLE `oauth2_client` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `name` varchar(255) NOT NULL, `url` varchar(200) NOT NULL, `redirect_uri` varchar(200) NOT NULL, `client_id` varchar(255) NOT NULL, `client_secret` varchar(255) NOT NULL, `client_type` integer NOT NULL, `user_id` integer NULL);
CREATE TABLE `oauth2_grant` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `code` varchar(255) NOT NULL, `expires` datetime(6) NOT NULL, `redirect_uri` varchar(255) NOT NULL, `scope` integer NOT NULL, `client_id` integer NOT NULL, `user_id` integer NOT NULL);
CREATE TABLE `oauth2_refreshtoken` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `token` varchar(255) NOT NULL, `expired` bool NOT NULL, `access_token_id` integer NOT NULL UNIQUE, `client_id` integer NOT NULL, `user_id` integer NOT NULL);
ALTER TABLE `oauth2_accesstoken` ADD COLUMN `client_id` integer NOT NULL;

ALTER TABLE `oauth2_accesstoken` ADD COLUMN `user_id` integer NOT NULL;

CREATE INDEX `oauth2_accesstoken_94a08da1` ON `oauth2_accesstoken` (`token`);
ALTER TABLE `oauth2_client` ADD CONSTRAINT `oauth2_client_user_id_2b47284bbd512fe1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `oauth2_grant` ADD CONSTRAINT `oauth2_grant_client_id_fbfc174fbc856af_fk_oauth2_client_id` FOREIGN KEY (`client_id`) REFERENCES `oauth2_client` (`id`);
ALTER TABLE `oauth2_grant` ADD CONSTRAINT `oauth2_grant_user_id_3de96a461bb76819_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `oauth2_refreshtoken` ADD CONSTRAINT `oauth2__access_token_id_f99377d503a000b_fk_oauth2_accesstoken_id` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_accesstoken` (`id`);
ALTER TABLE `oauth2_refreshtoken` ADD CONSTRAINT `oauth2_refreshtok_client_id_2f55036ac9aa614e_fk_oauth2_client_id` FOREIGN KEY (`client_id`) REFERENCES `oauth2_client` (`id`);
ALTER TABLE `oauth2_refreshtoken` ADD CONSTRAINT `oauth2_refreshtoken_user_id_acecf94460b787c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `oauth2_accesstoken_2bfe9d72` ON `oauth2_accesstoken` (`client_id`);
ALTER TABLE `oauth2_accesstoken` ADD CONSTRAINT `oauth2_accesstoke_client_id_20c73b03a7c139a2_fk_oauth2_client_id` FOREIGN KEY (`client_id`) REFERENCES `oauth2_client` (`id`);
CREATE INDEX `oauth2_accesstoken_e8701ad4` ON `oauth2_accesstoken` (`user_id`);
ALTER TABLE `oauth2_accesstoken` ADD CONSTRAINT `oauth2_accesstoken_user_id_7a865c7085722378_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;
*/

/*
BEGIN;
CREATE TABLE `oauth2_provider_trustedclient` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `client_id` integer NOT NULL);
ALTER TABLE `oauth2_provider_trustedclient` ADD CONSTRAINT `oauth2_provider_tr_client_id_bb96ea0be42c00a_fk_oauth2_client_id` FOREIGN KEY (`client_id`) REFERENCES `oauth2_client` (`id`);
COMMIT;
*/

BEGIN;
ALTER TABLE `proctoring_proctoredexamstudentattemptcomment` ALTER COLUMN `review_id` DROP DEFAULT;
COMMIT;

/*
BEGIN;
CREATE TABLE `proctoring_proctoredexam` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `course_id` varchar(255) NOT NULL, `content_id` varchar(255) NOT NULL, `external_id` varchar(255) NULL, `exam_name` longtext NOT NULL, `time_limit_mins` integer NOT NULL, `due_date` datetime(6) NULL, `is_proctored` bool NOT NULL, `is_practice_exam` bool NOT NULL, `is_active` bool NOT NULL);
CREATE TABLE `proctoring_proctoredexamreviewpolicy` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `review_policy` longtext NOT NULL, `proctored_exam_id` integer NOT NULL, `set_by_user_id` integer NOT NULL);
CREATE TABLE `proctoring_proctoredexamreviewpolicyhistory` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `original_id` integer NOT NULL, `review_policy` longtext NOT NULL, `proctored_exam_id` integer NOT NULL, `set_by_user_id` integer NOT NULL);
CREATE TABLE `proctoring_proctoredexamstudentattemptcomment` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `start_time` integer NOT NULL, `stop_time` integer NOT NULL, `duration` integer NOT NULL, `comment` longtext NOT NULL, `status` varchar(255) NOT NULL);
CREATE TABLE `proctoring_proctoredexamsoftwaresecurereview` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `attempt_code` varchar(255) NOT NULL, `review_status` varchar(255) NOT NULL, `raw_data` longtext NOT NULL, `video_url` longtext NOT NULL, `exam_id` integer NULL, `reviewed_by_id` integer NULL, `student_id` integer NULL);
CREATE TABLE `proctoring_proctoredexamsoftwaresecurereviewhistory` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `attempt_code` varchar(255) NOT NULL, `review_status` varchar(255) NOT NULL, `raw_data` longtext NOT NULL, `video_url` longtext NOT NULL, `exam_id` integer NULL, `reviewed_by_id` integer NULL, `student_id` integer NULL);
CREATE TABLE `proctoring_proctoredexamstudentallowance` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `key` varchar(255) NOT NULL, `value` varchar(255) NOT NULL, `proctored_exam_id` integer NOT NULL, `user_id` integer NOT NULL);
CREATE TABLE `proctoring_proctoredexamstudentallowancehistory` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `allowance_id` integer NOT NULL, `key` varchar(255) NOT NULL, `value` varchar(255) NOT NULL, `proctored_exam_id` integer NOT NULL, `user_id` integer NOT NULL);
CREATE TABLE `proctoring_proctoredexamstudentattempt` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `started_at` datetime(6) NULL, `completed_at` datetime(6) NULL, `last_poll_timestamp` datetime(6) NULL, `last_poll_ipaddr` varchar(32) NULL, `attempt_code` varchar(255) NULL, `external_id` varchar(255) NULL, `allowed_time_limit_mins` integer NOT NULL, `status` varchar(64) NOT NULL, `taking_as_proctored` bool NOT NULL, `is_sample_attempt` bool NOT NULL, `student_name` varchar(255) NOT NULL, `review_policy_id` integer NULL, `proctored_exam_id` integer NOT NULL, `user_id` integer NOT NULL);
CREATE TABLE `proctoring_proctoredexamstudentattempthistory` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `attempt_id` integer NULL, `started_at` datetime(6) NULL, `completed_at` datetime(6) NULL, `attempt_code` varchar(255) NULL, `external_id` varchar(255) NULL, `allowed_time_limit_mins` integer NOT NULL, `status` varchar(64) NOT NULL, `taking_as_proctored` bool NOT NULL, `is_sample_attempt` bool NOT NULL, `student_name` varchar(255) NOT NULL, `review_policy_id` integer NULL, `last_poll_timestamp` datetime(6) NULL, `last_poll_ipaddr` varchar(32) NULL, `proctored_exam_id` integer NOT NULL, `user_id` integer NOT NULL);
ALTER TABLE `proctoring_proctoredexamstudentattemptcomment` ADD COLUMN `review_id` integer NOT NULL;

ALTER TABLE `proctoring_proctoredexam` ADD CONSTRAINT `proctoring_proctoredexam_course_id_7d8ab189323890c0_uniq` UNIQUE (`course_id`, `content_id`);
ALTER TABLE `proctoring_proctoredexamstudentattempt` ADD CONSTRAINT `proctoring_proctoredexamstudentatt_user_id_15d13fa8dac316a0_uniq` UNIQUE (`user_id`, `proctored_exam_id`);
ALTER TABLE `proctoring_proctoredexamstudentallowance` ADD CONSTRAINT `proctoring_proctoredexamstudentall_user_id_665ed945152c2f60_uniq` UNIQUE (`user_id`, `proctored_exam_id`, `key`);
CREATE INDEX `proctoring_proctoredexam_ea134da7` ON `proctoring_proctoredexam` (`course_id`);
CREATE INDEX `proctoring_proctoredexam_e14f02ad` ON `proctoring_proctoredexam` (`content_id`);
CREATE INDEX `proctoring_proctoredexam_0e684294` ON `proctoring_proctoredexam` (`external_id`);
ALTER TABLE `proctoring_proctoredexamreviewpolicy` ADD CONSTRAINT `D32bab97500954b362d3f768dd89b6da` FOREIGN KEY (`proctored_exam_id`) REFERENCES `proctoring_proctoredexam` (`id`);
ALTER TABLE `proctoring_proctoredexamreviewpolicy` ADD CONSTRAINT `proctoring_proct_set_by_user_id_75a66580aa44cd84_fk_auth_user_id` FOREIGN KEY (`set_by_user_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `proctoring_proctoredexamreviewpolicyhistory` ADD CONSTRAINT `d9965d8af87bebd0587414ca1ba4826f` FOREIGN KEY (`proctored_exam_id`) REFERENCES `proctoring_proctoredexam` (`id`);
ALTER TABLE `proctoring_proctoredexamreviewpolicyhistory` ADD CONSTRAINT `proctoring_procto_set_by_user_id_31fae610848d90f_fk_auth_user_id` FOREIGN KEY (`set_by_user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `proctoring_proctoredexamreviewpolicyhistory_524b09d0` ON `proctoring_proctoredexamreviewpolicyhistory` (`original_id`);
ALTER TABLE `proctoring_proctoredexamsoftwaresecurereview` ADD CONSTRAINT `proctori_exam_id_635059f5fe2cc392_fk_proctoring_proctoredexam_id` FOREIGN KEY (`exam_id`) REFERENCES `proctoring_proctoredexam` (`id`);
ALTER TABLE `proctoring_proctoredexamsoftwaresecurereview` ADD CONSTRAINT `proctoring_proct_reviewed_by_id_4cff67b7de094f65_fk_auth_user_id` FOREIGN KEY (`reviewed_by_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `proctoring_proctoredexamsoftwaresecurereview` ADD CONSTRAINT `proctoring_proctored_student_id_14c182517b0cbb5b_fk_auth_user_id` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `proctoring_proctoredexamsoftwaresecurereview_b38e5b0e` ON `proctoring_proctoredexamsoftwaresecurereview` (`attempt_code`);
ALTER TABLE `proctoring_proctoredexamsoftwaresecurereviewhistory` ADD CONSTRAINT `proctori_exam_id_73969ae423813477_fk_proctoring_proctoredexam_id` FOREIGN KEY (`exam_id`) REFERENCES `proctoring_proctoredexam` (`id`);
ALTER TABLE `proctoring_proctoredexamsoftwaresecurereviewhistory` ADD CONSTRAINT `proctoring_proct_reviewed_by_id_139568d0bf423998_fk_auth_user_id` FOREIGN KEY (`reviewed_by_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `proctoring_proctoredexamsoftwaresecurereviewhistory` ADD CONSTRAINT `proctoring_proctored_student_id_6922ba3b791462d8_fk_auth_user_id` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `proctoring_proctoredexamsoftwaresecurereviewhistory_b38e5b0e` ON `proctoring_proctoredexamsoftwaresecurereviewhistory` (`attempt_code`);
ALTER TABLE `proctoring_proctoredexamstudentallowance` ADD CONSTRAINT `db55b83a7875e70b3a0ebd1f81a898d8` FOREIGN KEY (`proctored_exam_id`) REFERENCES `proctoring_proctoredexam` (`id`);
ALTER TABLE `proctoring_proctoredexamstudentallowance` ADD CONSTRAINT `proctoring_proctoredexam_user_id_a0a0681d4a01661_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `proctoring_proctoredexamstudentallowancehistory` ADD CONSTRAINT `D169ec97a7fca1dbf6b0bb2929d41ccc` FOREIGN KEY (`proctored_exam_id`) REFERENCES `proctoring_proctoredexam` (`id`);
ALTER TABLE `proctoring_proctoredexamstudentallowancehistory` ADD CONSTRAINT `proctoring_proctoredexa_user_id_68e25e3abb187580_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `proctoring_proctoredexamstudentattempt` ADD CONSTRAINT `D5e0a120c32f715bfe04a0a57f399ec0` FOREIGN KEY (`proctored_exam_id`) REFERENCES `proctoring_proctoredexam` (`id`);
ALTER TABLE `proctoring_proctoredexamstudentattempt` ADD CONSTRAINT `proctoring_proctoredexa_user_id_633fd8f4f65a0cac_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `proctoring_proctoredexamstudentattempt_b38e5b0e` ON `proctoring_proctoredexamstudentattempt` (`attempt_code`);
CREATE INDEX `proctoring_proctoredexamstudentattempt_0e684294` ON `proctoring_proctoredexamstudentattempt` (`external_id`);
ALTER TABLE `proctoring_proctoredexamstudentattempthistory` ADD CONSTRAINT `cbccbfd5c4c427541fdce96e77e6bf6c` FOREIGN KEY (`proctored_exam_id`) REFERENCES `proctoring_proctoredexam` (`id`);
ALTER TABLE `proctoring_proctoredexamstudentattempthistory` ADD CONSTRAINT `proctoring_proctoredexa_user_id_59ce75db7c4fc769_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `proctoring_proctoredexamstudentattempthistory_b38e5b0e` ON `proctoring_proctoredexamstudentattempthistory` (`attempt_code`);
CREATE INDEX `proctoring_proctoredexamstudentattempthistory_0e684294` ON `proctoring_proctoredexamstudentattempthistory` (`external_id`);
CREATE INDEX `proctoring_proctoredexamstudentattemptcomment_5bd2a989` ON `proctoring_proctoredexamstudentattemptcomment` (`review_id`);
ALTER TABLE `proctoring_proctoredexamstudentattemptcomment` ADD CONSTRAINT `D596dd9c7d948d9256c2e29e6194b5e7` FOREIGN KEY (`review_id`) REFERENCES `proctoring_proctoredexamsoftwaresecurereview` (`id`);
COMMIT;
*/

BEGIN;
/*ALTER TABLE `proctoring_proctoredexamstudentattempt` ADD COLUMN `is_status_acknowledged` bool DEFAULT 0 NOT NULL;*/
ALTER TABLE `proctoring_proctoredexamstudentattempt` ALTER COLUMN `is_status_acknowledged` DROP DEFAULT;
COMMIT;

/*
BEGIN;
ALTER TABLE `proctoring_proctoredexamsoftwaresecurereview` ADD CONSTRAINT `proctoring_proctoredexamsoftw_attempt_code_69b9866a54964afb_uniq` UNIQUE (`attempt_code`);
COMMIT;
*/

BEGIN;
/*ALTER TABLE `proctoring_proctoredexam` ADD COLUMN `hide_after_due` bool DEFAULT 0 NOT NULL;*/
ALTER TABLE `proctoring_proctoredexam` ALTER COLUMN `hide_after_due` DROP DEFAULT;
COMMIT;

BEGIN;
ALTER TABLE `edxval_subtitle` ALTER COLUMN `video_id` DROP DEFAULT;
ALTER TABLE `edxval_encodedvideo` ALTER COLUMN `profile_id` DROP DEFAULT;
ALTER TABLE `edxval_encodedvideo` ALTER COLUMN `video_id` DROP DEFAULT;
ALTER TABLE `edxval_coursevideo` ALTER COLUMN `video_id` DROP DEFAULT;
COMMIT;

/*
BEGIN;
CREATE TABLE `edxval_coursevideo` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `course_id` varchar(255) NOT NULL);
CREATE TABLE `edxval_encodedvideo` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `url` varchar(200) NOT NULL, `file_size` integer UNSIGNED NOT NULL, `bitrate` integer UNSIGNED NOT NULL);
CREATE TABLE `edxval_profile` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `profile_name` varchar(50) NOT NULL UNIQUE);
CREATE TABLE `edxval_subtitle` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `fmt` varchar(20) NOT NULL, `language` varchar(8) NOT NULL, `content` longtext NOT NULL);
CREATE TABLE `edxval_video` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `edx_video_id` varchar(100) NOT NULL UNIQUE, `client_video_id` varchar(255) NOT NULL, `duration` double precision NOT NULL, `status` varchar(255) NOT NULL);
ALTER TABLE `edxval_subtitle` ADD COLUMN `video_id` integer NOT NULL;

ALTER TABLE `edxval_encodedvideo` ADD COLUMN `profile_id` integer NOT NULL;

ALTER TABLE `edxval_encodedvideo` ADD COLUMN `video_id` integer NOT NULL;

ALTER TABLE `edxval_coursevideo` ADD COLUMN `video_id` integer NOT NULL;

ALTER TABLE `edxval_coursevideo` ADD CONSTRAINT `edxval_coursevideo_course_id_42cecee05cff2d8c_uniq` UNIQUE (`course_id`, `video_id`);
CREATE INDEX `edxval_subtitle_76314543` ON `edxval_subtitle` (`fmt`);
CREATE INDEX `edxval_subtitle_8512ae7d` ON `edxval_subtitle` (`language`);
CREATE INDEX `edxval_video_8d63c4f7` ON `edxval_video` (`client_video_id`);
CREATE INDEX `edxval_video_9acb4454` ON `edxval_video` (`status`);
CREATE INDEX `edxval_subtitle_b58b747e` ON `edxval_subtitle` (`video_id`);
ALTER TABLE `edxval_subtitle` ADD CONSTRAINT `edxval_subtitle_video_id_5fabb0e154dda720_fk_edxval_video_id` FOREIGN KEY (`video_id`) REFERENCES `edxval_video` (`id`);
CREATE INDEX `edxval_encodedvideo_83a0eb3f` ON `edxval_encodedvideo` (`profile_id`);
ALTER TABLE `edxval_encodedvideo` ADD CONSTRAINT `edxval_encodedv_profile_id_484a111092acafb3_fk_edxval_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `edxval_profile` (`id`);
CREATE INDEX `edxval_encodedvideo_b58b747e` ON `edxval_encodedvideo` (`video_id`);
ALTER TABLE `edxval_encodedvideo` ADD CONSTRAINT `edxval_encodedvideo_video_id_56934bca09fc3b13_fk_edxval_video_id` FOREIGN KEY (`video_id`) REFERENCES `edxval_video` (`id`);
CREATE INDEX `edxval_coursevideo_b58b747e` ON `edxval_coursevideo` (`video_id`);
ALTER TABLE `edxval_coursevideo` ADD CONSTRAINT `edxval_coursevideo_video_id_68b2969f352edd03_fk_edxval_video_id` FOREIGN KEY (`video_id`) REFERENCES `edxval_video` (`id`);
COMMIT;
*/

/*
BEGIN;
--
-- MIGRATION NOW PERFORMS OPERATION THAT CANNOT BE WRITTEN AS SQL:
-- Raw Python operation
--
COMMIT;
*/
BEGIN;
ALTER TABLE `embargo_countryaccessrule` ALTER COLUMN `restricted_course_id` DROP DEFAULT;
COMMIT;
/*
BEGIN;
CREATE TABLE `embargo_country` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `country` varchar(2) NOT NULL UNIQUE);
CREATE TABLE `embargo_countryaccessrule` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `rule_type` varchar(255) NOT NULL, `country_id` integer NOT NULL);
CREATE TABLE `embargo_courseaccessrulehistory` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `timestamp` datetime(6) NOT NULL, `course_key` varchar(255) NOT NULL, `snapshot` longtext NULL);
CREATE TABLE `embargo_embargoedcourse` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `course_id` varchar(255) NOT NULL UNIQUE, `embargoed` bool NOT NULL);
CREATE TABLE `embargo_embargoedstate` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `change_date` datetime(6) NOT NULL, `enabled` bool NOT NULL, `embargoed_countries` longtext NOT NULL, `changed_by_id` integer NULL);
CREATE TABLE `embargo_ipfilter` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `change_date` datetime(6) NOT NULL, `enabled` bool NOT NULL, `whitelist` longtext NOT NULL, `blacklist` longtext NOT NULL, `changed_by_id` integer NULL);
CREATE TABLE `embargo_restrictedcourse` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `course_key` varchar(255) NOT NULL UNIQUE, `enroll_msg_key` varchar(255) NOT NULL, `access_msg_key` varchar(255) NOT NULL, `disable_access_check` bool NOT NULL);
ALTER TABLE `embargo_countryaccessrule` ADD COLUMN `restricted_course_id` integer NOT NULL;

ALTER TABLE `embargo_countryaccessrule` ADD CONSTRAINT `embargo_countryaccess_restricted_course_id_6f340c36c633cb0a_uniq` UNIQUE (`restricted_course_id`, `country_id`);
ALTER TABLE `embargo_countryaccessrule` ADD CONSTRAINT `embargo_countr_country_id_6244ff9d9c405c6e_fk_embargo_country_id` FOREIGN KEY (`country_id`) REFERENCES `embargo_country` (`id`);
CREATE INDEX `embargo_courseaccessrulehistory_d7e6d55b` ON `embargo_courseaccessrulehistory` (`timestamp`);
CREATE INDEX `embargo_courseaccessrulehistory_c8235886` ON `embargo_courseaccessrulehistory` (`course_key`);
ALTER TABLE `embargo_embargoedstate` ADD CONSTRAINT `embargo_embargoeds_changed_by_id_7e30811d0e5008b_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `embargo_ipfilter` ADD CONSTRAINT `embargo_ipfilter_changed_by_id_5c820bfac889ea81_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `embargo_countryaccessrule_77607676` ON `embargo_countryaccessrule` (`restricted_course_id`);
ALTER TABLE `embargo_countryaccessrule` ADD CONSTRAINT `d140f72cce132ba9230b3ff66d8761ad` FOREIGN KEY (`restricted_course_id`) REFERENCES `embargo_restrictedcourse` (`id`);
COMMIT;
*/
/*
BEGIN;
--
-- MIGRATION NOW PERFORMS OPERATION THAT CANNOT BE WRITTEN AS SQL:
-- Raw Python operation
--

COMMIT;
*/

/*
BEGIN;
CREATE TABLE `external_auth_externalauthmap` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `external_id` varchar(255) NOT NULL, `external_domain` varchar(255) NOT NULL, `external_credentials` longtext NOT NULL, `external_email` varchar(255) NOT NULL, `external_name` varchar(255) NOT NULL, `internal_password` varchar(31) NOT NULL, `dtcreated` datetime(6) NOT NULL, `dtsignup` datetime(6) NULL, `user_id` integer NULL UNIQUE);
ALTER TABLE `external_auth_externalauthmap` ADD CONSTRAINT `external_auth_externalauthmap_external_id_7f035ef8bc4d313e_uniq` UNIQUE (`external_id`, `external_domain`);
ALTER TABLE `external_auth_externalauthmap` ADD CONSTRAINT `external_auth_externala_user_id_644e7779f2d52b9a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `external_auth_externalauthmap_0e684294` ON `external_auth_externalauthmap` (`external_id`);
CREATE INDEX `external_auth_externalauthmap_630a0308` ON `external_auth_externalauthmap` (`external_domain`);
CREATE INDEX `external_auth_externalauthmap_e9425fc5` ON `external_auth_externalauthmap` (`external_email`);
CREATE INDEX `external_auth_externalauthmap_c9555995` ON `external_auth_externalauthmap` (`external_name`);
COMMIT;
*/
BEGIN;
ALTER TABLE `microsite_configuration_historicalmicrositetemplate` ALTER COLUMN `microsite_id` DROP DEFAULT;
ALTER TABLE `microsite_configuration_historicalmicrositeorganizationmapping` ALTER COLUMN `microsite_id` DROP DEFAULT;
COMMIT;
/*
BEGIN;
CREATE TABLE `microsite_configuration_historicalmicrositeorganizationmapping` (`id` integer NOT NULL, `organization` varchar(63) NOT NULL, `history_id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `history_date` datetime(6) NOT NULL, `history_type` varchar(1) NOT NULL, `history_user_id` integer NULL);
CREATE TABLE `microsite_configuration_historicalmicrositetemplate` (`id` integer NOT NULL, `template_uri` varchar(255) NOT NULL, `template` longtext NOT NULL, `history_id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `history_date` datetime(6) NOT NULL, `history_type` varchar(1) NOT NULL, `history_user_id` integer NULL);
CREATE TABLE `microsite_configuration_microsite` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `key` varchar(63) NOT NULL UNIQUE, `values` longtext NOT NULL, `site_id` integer NOT NULL UNIQUE);
CREATE TABLE `microsite_configuration_micrositehistory` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `created` datetime(6) NOT NULL, `modified` datetime(6) NOT NULL, `key` varchar(63) NOT NULL UNIQUE, `values` longtext NOT NULL, `site_id` integer NOT NULL UNIQUE);
CREATE TABLE `microsite_configuration_micrositeorganizationmapping` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `organization` varchar(63) NOT NULL UNIQUE, `microsite_id` integer NOT NULL);
CREATE TABLE `microsite_configuration_micrositetemplate` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `template_uri` varchar(255) NOT NULL, `template` longtext NOT NULL, `microsite_id` integer NOT NULL);
ALTER TABLE `microsite_configuration_historicalmicrositetemplate` ADD COLUMN `microsite_id` integer NULL;

ALTER TABLE `microsite_configuration_historicalmicrositeorganizationmapping` ADD COLUMN `microsite_id` integer NULL;

ALTER TABLE `microsite_configuration_micrositetemplate` ADD CONSTRAINT `microsite_configuration_micros_microsite_id_80b3f3616d2e317_uniq` UNIQUE (`microsite_id`, `template_uri`);
ALTER TABLE `microsite_configuration_historicalmicrositeorganizationmapping` ADD CONSTRAINT `microsite_confi_history_user_id_40846fe04877dd35_fk_auth_user_id` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `microsite_configuration_historicalmicrositeorganizationmappi1219` ON `microsite_configuration_historicalmicrositeorganizationmapping` (`id`);
CREATE INDEX `microsite_configuration_historicalmicrositeorganizationmappi74d9` ON `microsite_configuration_historicalmicrositeorganizationmapping` (`organization`);
ALTER TABLE `microsite_configuration_historicalmicrositetemplate` ADD CONSTRAINT `microsite_confi_history_user_id_53e1b0dcb708d6ef_fk_auth_user_id` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `microsite_configuration_historicalmicrositetemplate_b80bb774` ON `microsite_configuration_historicalmicrositetemplate` (`id`);
CREATE INDEX `microsite_configuration_historicalmicrositetemplate_a8b249ec` ON `microsite_configuration_historicalmicrositetemplate` (`template_uri`);
ALTER TABLE `microsite_configuration_microsite` ADD CONSTRAINT `microsite_configuratio_site_id_3ebe20a76de5aa4_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);
ALTER TABLE `microsite_configuration_micrositehistory` ADD CONSTRAINT `microsite_configurati_site_id_6977a04d3625a533_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);
ALTER TABLE `microsite_configuration_micrositeorganizationmapping` ADD CONSTRAINT `D1c5d7dbbb2cde12ce18b38d46f71ee0` FOREIGN KEY (`microsite_id`) REFERENCES `microsite_configuration_microsite` (`id`);
ALTER TABLE `microsite_configuration_micrositetemplate` ADD CONSTRAINT `D4919cbc5f1414d3de93aa9ec9aa48f3` FOREIGN KEY (`microsite_id`) REFERENCES `microsite_configuration_microsite` (`id`);
CREATE INDEX `microsite_configuration_micrositetemplate_a8b249ec` ON `microsite_configuration_micrositetemplate` (`template_uri`);
CREATE INDEX `microsite_configuration_historicalmicrositetemplate_c9cd58ae` ON `microsite_configuration_historicalmicrositetemplate` (`microsite_id`);
CREATE INDEX `microsite_configuration_historicalmicrositeorganizationmappi5a96` ON `microsite_configuration_historicalmicrositeorganizationmapping` (`microsite_id`);
COMMIT;
*/
