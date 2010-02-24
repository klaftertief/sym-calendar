
-- *** STRUCTURE: `tbl_authors` ***
DROP TABLE IF EXISTS `tbl_authors`;
CREATE TABLE `tbl_authors` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `username` varchar(20) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `password` varchar(32) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `first_name` varchar(100) character set utf8 collate utf8_unicode_ci default NULL,
  `last_name` varchar(100) character set utf8 collate utf8_unicode_ci default NULL,
  `email` varchar(255) character set utf8 collate utf8_unicode_ci default NULL,
  `last_seen` datetime default '0000-00-00 00:00:00',
  `user_type` enum('author','developer') character set utf8 collate utf8_unicode_ci NOT NULL default 'author',
  `primary` enum('yes','no') character set utf8 collate utf8_unicode_ci NOT NULL default 'no',
  `default_section` int(11) NOT NULL default '0',
  `auth_token_active` enum('yes','no') character set utf8 collate utf8_unicode_ci NOT NULL default 'no',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- *** STRUCTURE: `tbl_cache` ***
DROP TABLE IF EXISTS `tbl_cache`;
CREATE TABLE `tbl_cache` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `hash` varchar(32) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `creation` int(14) NOT NULL default '0',
  `expiry` int(14) unsigned default NULL,
  `data` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `creation` (`creation`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- *** STRUCTURE: `tbl_entries` ***
DROP TABLE IF EXISTS `tbl_entries`;
CREATE TABLE `tbl_entries` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `section_id` int(11) unsigned NOT NULL default '0',
  `author_id` int(11) unsigned NOT NULL default '0',
  `creation_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `creation_date_gmt` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  KEY `section_id` (`section_id`),
  KEY `author_id` (`author_id`),
  KEY `creation_date` (`creation_date`),
  KEY `creation_date_gmt` (`creation_date_gmt`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- *** STRUCTURE: `tbl_extensions` ***
DROP TABLE IF EXISTS `tbl_extensions`;
CREATE TABLE `tbl_extensions` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `status` enum('enabled','disabled') character set utf8 collate utf8_unicode_ci NOT NULL default 'enabled',
  `version` double unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- *** STRUCTURE: `tbl_extensions_delegates` ***
DROP TABLE IF EXISTS `tbl_extensions_delegates`;
CREATE TABLE `tbl_extensions_delegates` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `extension_id` int(11) NOT NULL default '0',
  `page` varchar(100) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `delegate` varchar(100) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `callback` varchar(100) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `extension_id` (`extension_id`),
  KEY `page` (`page`),
  KEY `delegate` (`delegate`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- *** STRUCTURE: `tbl_fields` ***
DROP TABLE IF EXISTS `tbl_fields`;
CREATE TABLE `tbl_fields` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `label` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `element_name` varchar(50) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `type` varchar(32) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `parent_section` int(11) NOT NULL default '0',
  `required` enum('yes','no') character set utf8 collate utf8_unicode_ci NOT NULL default 'yes',
  `sortorder` int(11) NOT NULL default '1',
  `location` enum('main','sidebar') character set utf8 collate utf8_unicode_ci NOT NULL default 'main',
  `show_column` enum('yes','no') character set utf8 collate utf8_unicode_ci NOT NULL default 'no',
  PRIMARY KEY  (`id`),
  KEY `index` (`element_name`,`type`,`parent_section`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- *** STRUCTURE: `tbl_fields_author` ***
DROP TABLE IF EXISTS `tbl_fields_author`;
CREATE TABLE `tbl_fields_author` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL default '0',
  `allow_author_change` enum('yes','no') character set utf8 collate utf8_unicode_ci NOT NULL default 'yes',
  `allow_multiple_selection` enum('yes','no') character set utf8 collate utf8_unicode_ci NOT NULL default 'no',
  `default_to_current_user` enum('yes','no') NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** STRUCTURE: `tbl_fields_checkbox` ***
DROP TABLE IF EXISTS `tbl_fields_checkbox`;
CREATE TABLE `tbl_fields_checkbox` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL default '0',
  `default_state` enum('on','off') collate utf8_unicode_ci NOT NULL default 'on',
  `description` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** STRUCTURE: `tbl_fields_date` ***
DROP TABLE IF EXISTS `tbl_fields_date`;
CREATE TABLE `tbl_fields_date` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL default '0',
  `pre_populate` enum('yes','no') character set utf8 collate utf8_unicode_ci NOT NULL default 'no',
  `calendar` enum('yes','no') character set utf8 collate utf8_unicode_ci NOT NULL default 'no',
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** STRUCTURE: `tbl_fields_input` ***
DROP TABLE IF EXISTS `tbl_fields_input`;
CREATE TABLE `tbl_fields_input` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL default '0',
  `validator` varchar(100) character set utf8 collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- *** STRUCTURE: `tbl_fields_number` ***
DROP TABLE IF EXISTS `tbl_fields_number`;
CREATE TABLE `tbl_fields_number` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** STRUCTURE: `tbl_fields_sectionlink` ***
DROP TABLE IF EXISTS `tbl_fields_sectionlink`;
CREATE TABLE `tbl_fields_sectionlink` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL default '0',
  `section_association_list` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- *** STRUCTURE: `tbl_fields_select` ***
DROP TABLE IF EXISTS `tbl_fields_select`;
CREATE TABLE `tbl_fields_select` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL default '0',
  `allow_multiple_selection` enum('yes','no') character set utf8 collate utf8_unicode_ci NOT NULL default 'no',
  `static_options` text character set utf8 collate utf8_unicode_ci,
  `dynamic_options` int(11) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** STRUCTURE: `tbl_fields_selectbox_link` ***
DROP TABLE IF EXISTS `tbl_fields_selectbox_link`;
CREATE TABLE `tbl_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') NOT NULL default 'no',
  `related_field_id` varchar(255) NOT NULL,
  `limit` int(4) unsigned NOT NULL default '20',
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** STRUCTURE: `tbl_fields_taglist` ***
DROP TABLE IF EXISTS `tbl_fields_taglist`;
CREATE TABLE `tbl_fields_taglist` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL default '0',
  `validator` varchar(100) character set utf8 collate utf8_unicode_ci default NULL,
  `pre_populate_source` varchar(15) character set utf8 collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** STRUCTURE: `tbl_fields_textarea` ***
DROP TABLE IF EXISTS `tbl_fields_textarea`;
CREATE TABLE `tbl_fields_textarea` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL default '0',
  `formatter` varchar(100) character set utf8 collate utf8_unicode_ci default NULL,
  `size` int(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- *** STRUCTURE: `tbl_fields_upload` ***
DROP TABLE IF EXISTS `tbl_fields_upload`;
CREATE TABLE `tbl_fields_upload` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL default '0',
  `destination` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `validator` varchar(50) character set utf8 collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** STRUCTURE: `tbl_forgotpass` ***
DROP TABLE IF EXISTS `tbl_forgotpass`;
CREATE TABLE `tbl_forgotpass` (
  `author_id` int(11) NOT NULL default '0',
  `token` varchar(6) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `expiry` varchar(25) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** STRUCTURE: `tbl_pages` ***
DROP TABLE IF EXISTS `tbl_pages`;
CREATE TABLE `tbl_pages` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `parent` int(11) default NULL,
  `title` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `handle` varchar(255) character set utf8 collate utf8_unicode_ci default NULL,
  `path` varchar(255) character set utf8 collate utf8_unicode_ci default NULL,
  `params` varchar(255) character set utf8 collate utf8_unicode_ci default NULL,
  `data_sources` text character set utf8 collate utf8_unicode_ci,
  `events` text character set utf8 collate utf8_unicode_ci,
  `sortorder` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- *** STRUCTURE: `tbl_pages_types` ***
DROP TABLE IF EXISTS `tbl_pages_types`;
CREATE TABLE `tbl_pages_types` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `page_id` int(11) unsigned NOT NULL default '0',
  `type` varchar(50) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `page_id` (`page_id`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- *** STRUCTURE: `tbl_sections` ***
DROP TABLE IF EXISTS `tbl_sections`;
CREATE TABLE `tbl_sections` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `handle` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `sortorder` int(11) NOT NULL default '0',
  `entry_order` varchar(7) character set utf8 collate utf8_unicode_ci default NULL,
  `entry_order_direction` enum('asc','desc') character set utf8 collate utf8_unicode_ci default 'asc',
  `hidden` enum('yes','no') character set utf8 collate utf8_unicode_ci NOT NULL default 'no',
  `navigation_group` varchar(50) NOT NULL default 'Content',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `handle` (`handle`),
  KEY `navigation_group` (`navigation_group`),
  KEY `navigation_group_2` (`navigation_group`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- *** STRUCTURE: `tbl_sections_association` ***
DROP TABLE IF EXISTS `tbl_sections_association`;
CREATE TABLE `tbl_sections_association` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `parent_section_id` int(11) unsigned NOT NULL default '0',
  `parent_section_field_id` int(11) unsigned default NULL,
  `child_section_id` int(11) unsigned NOT NULL default '0',
  `child_section_field_id` int(11) unsigned NOT NULL default '0',
  `cascading_deletion` enum('yes','no') character set utf8 collate utf8_unicode_ci NOT NULL default 'no',
  PRIMARY KEY  (`id`),
  KEY `parent_section_id` (`parent_section_id`,`child_section_id`,`child_section_field_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;