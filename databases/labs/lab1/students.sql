DROP TABLE IF EXISTS `students`;
SET character_set_client = utf8;

CREATE TABLE `students` (
  `studentID` int unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `major` varchar(50) NOT NULL default '',
  `grade` tinyint NOT NULL default '0',
  PRIMARY KEY  (`studentID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO `students` (`studentID`, `name`, `major`, `grade`) VALUES
(1, 'Michael', 'CS', 95),
(10146, 'Dennis', 'PHYS', 75),
(10147, 'Boris', 'MATH', 89),
(10148, 'Judy', 'CS', 0);

