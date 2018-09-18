CREATE TABLE `upload` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `pathname` varchar(200) default NULL,
  `size` varchar(100) default NULL,
  `note` varchar(255) default NULL,
  `dtime` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8
