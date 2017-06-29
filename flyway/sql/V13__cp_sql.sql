CREATE TABLE `cp_credits` (
  `account_id` int(11) unsigned NOT NULL,
  `balance` int(11) unsigned NOT NULL default '0',
  `last_donation_date` datetime default NULL,
  `last_donation_amount` float unsigned default NULL,
  PRIMARY KEY  (`account_id`)
) ENGINE=MyISAM COMMENT='Donation credits balance for a given account.';

CREATE TABLE IF NOT EXISTS `cp_emailchange` (
  `id` int(11) NOT NULL auto_increment,
  `code` varchar(32) NOT NULL,
  `account_id` int(10) NOT NULL,
  `old_email` varchar(39) NOT NULL,
  `new_email` varchar(39) NOT NULL,
  `request_date` datetime NOT NULL,
  `request_ip` varchar(15) NOT NULL,
  `change_date` datetime default NULL,
  `change_ip` varchar(15) default NULL,
  `change_done` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM;

CREATE TABLE `cp_loginprefs` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `account_id` int(11) unsigned NOT NULL,
  `name` varchar(80) NOT NULL,
  `value` varchar(255) default NULL,
  `create_date` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM COMMENT='Account preferences';

CREATE TABLE `cp_pwchange` (
  `id` int(11) NOT NULL auto_increment,
  `account_id` int(10) NOT NULL,
  `old_password` varchar(32) NOT NULL,
  `new_password` varchar(32) default NULL,
  `change_date` datetime NOT NULL,
  `change_ip` varchar(15) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM;

CREATE TABLE `cp_resetpass` (
  `id` int(11) NOT NULL auto_increment,
  `code` varchar(32) NOT NULL,
  `account_id` int(10) NOT NULL,
  `old_password` varchar(32) NOT NULL,
  `new_password` varchar(32) default NULL,
  `request_date` datetime NOT NULL,
  `request_ip` varchar(15) NOT NULL,
  `reset_date` datetime default NULL,
  `reset_ip` varchar(15) default NULL,
  `reset_done` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS `cp_tasklist` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `author` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `priority` int(1) NOT NULL DEFAULT '0',
  `assigned` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `cp_taskliststaff` (
  `account_id` int(7) NOT NULL,
  `account_name` varchar(32) NOT NULL,
  `preferred_name` varchar(32) NOT NULL,
  `emailalerts` int(1) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `cp_trusted` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `account_id` int(11) unsigned NOT NULL,
  `email` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `delete_date` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM ;

CREATE TABLE `cp_charprefs` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `account_id` int(11) unsigned NOT NULL,
  `char_id` int(11) unsigned NOT NULL,
  `name` varchar(80) NOT NULL,
  `value` varchar(255) default NULL,
  `create_date` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM COMMENT='Character preferences.';

CREATE TABLE `cp_itemshop` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `nameid` int(11) unsigned NOT NULL default '0',
  `quantity` int(11) unsigned NOT NULL default '0',
  `cost` int(11) unsigned NOT NULL,
  `info` text,
  `create_date` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM COMMENT='Item shop';