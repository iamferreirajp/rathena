CREATE TABLE `cp_v4p_sites` (
  `site_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address` text NOT NULL,
  `points` int(10) unsigned NOT NULL DEFAULT '0',
  `blocking_time` int(10) unsigned NOT NULL DEFAULT '0',
  `banner` blob,
  `banner_url` text,
  `site_name` varchar(50) NOT NULL,
  `banner_file_type` varchar(30) NOT NULL,
  PRIMARY KEY (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `cp_v4p_voters` (
  `account_id` int(10) unsigned NOT NULL,
  `points` int(10) unsigned NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `cp_v4p_votelogs` (
  `rtid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `f_site_id` int(10) unsigned NOT NULL,
  `unblock_time` datetime NOT NULL,
  `account_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(100) DEFAULT '0',
  PRIMARY KEY (`rtid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;