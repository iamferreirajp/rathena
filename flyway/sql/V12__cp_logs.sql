CREATE TABLE `cp_createlog` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `account_id` int(11) unsigned NOT NULL,
  `userid` varchar(23) NOT NULL,
  `user_pass` varchar(32) NOT NULL,
  `sex` enum('M','F','S') NOT NULL default 'M',
  `email` varchar(39) NOT NULL,
  `reg_date` datetime NOT NULL,
  `reg_ip` varchar(100) NOT NULL,
  `delete_date` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `name` (`userid`)
) ENGINE=MyISAM ;

CREATE TABLE `cp_banlog` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `account_id` int(11) unsigned NOT NULL,
  `banned_by` int(11) unsigned default NULL,
  `ban_type` tinyint(1) NOT NULL,
  `ban_until` datetime NOT NULL,
  `ban_date` datetime NOT NULL,
  `ban_reason` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM ;

CREATE TABLE `cp_ipbanlog` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `ip_address` varchar(15) NOT NULL,
  `banned_by` int(11) unsigned default NULL,
  `ban_type` tinyint(1) NOT NULL,
  `ban_until` datetime NOT NULL,
  `ban_date` datetime NOT NULL,
  `ban_reason` text NOT NULL,
  PRIMARY KEY  (`id`),
  INDEX (`ip_address`),
  INDEX (`banned_by`)
) ENGINE=MyISAM ;

CREATE TABLE `cp_loginlog` (
  `id` int(11) NOT NULL auto_increment,
  `account_id` int(10) default NULL,
  `username` varchar(23) NOT NULL,
  `password` varchar(32) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `login_date` datetime NOT NULL,
  `error_code` tinyint(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM;

CREATE TABLE `cp_txnlog` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `account_id` int(11) unsigned default '0',
  `server_name` varchar(255) default NULL,
  `credits` int(11) default '0',
  `receiver_email` varchar(60) default NULL,
  `item_name` varchar(100) default NULL,
  `item_number` varchar(10) default NULL,
  `quantity` varchar(6) default NULL,
  `payment_status` varchar(20) default NULL,
  `pending_reason` varchar(20) default NULL,
  `payment_date` varchar(40) default NULL,
  `mc_gross` varchar(20) default NULL,
  `mc_fee` varchar(20) default NULL,
  `tax` varchar(20) default NULL,
  `mc_currency` varchar(3) default NULL,
  `parent_txn_id` varchar(20) default NULL,
  `txn_id` varchar(20) default NULL,
  `txn_type` varchar(20) default NULL,
  `first_name` varchar(30) default NULL,
  `last_name` varchar(40) default NULL,
  `address_street` varchar(50) default NULL,
  `address_city` varchar(30) default NULL,
  `address_state` varchar(30) default NULL,
  `address_zip` varchar(20) default NULL,
  `address_country` varchar(30) default NULL,
  `address_status` varchar(10) default NULL,
  `payer_email` varchar(60) default NULL,
  `payer_status` varchar(10) default NULL,
  `payment_type` varchar(10) default NULL,
  `notify_version` varchar(10) default NULL,
  `verify_sign` varchar(255) default NULL,
  `referrer_id` varchar(10) default NULL,
  `process_date` datetime default NULL,
  `hold_until` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM COMMENT='All PayPal transactions that go through the IPN handler.';

CREATE TABLE `cp_redeemlog` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `nameid` int(11) unsigned NOT NULL default '0',
  `quantity` int(11) unsigned NOT NULL default '0',
  `cost` int(11) unsigned NOT NULL,
  `account_id` int(11) unsigned NOT NULL,
  `char_id` int(11) unsigned default NULL,
  `redeemed` tinyint(1) unsigned NOT NULL,
  `redemption_date` datetime default NULL,
  `purchase_date` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM COMMENT='Log of redeemed donation items.';

CREATE TABLE `cp_xferlog` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `from_account_id` int(10) unsigned NOT NULL,
  `target_account_id` int(10) unsigned NOT NULL,
  `target_char_id` int(11) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `for_free` tinyint(1) unsigned NOT NULL default '0',
  `transfer_date` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM COMMENT='Credit transfer log.';