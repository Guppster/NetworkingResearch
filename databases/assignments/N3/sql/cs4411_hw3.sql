grant all on cs4411_hw3.* to cs4411_hw3@localhost identified by 'student';

DROP DATABASE IF EXISTS cs4411_hw3;
CREATE DATABASE cs4411_hw3;

USE cs4411_hw3;

DROP TABLE IF EXISTS `users`;
SET character_set_client = utf8;
CREATE TABLE `users` (
  `userID` int unsigned NOT NULL auto_increment,
  `email` varchar(100) NOT NULL default '',
  `password` varchar(32) NOT NULL default '',
  `name` varchar(100) NOT NULL default '',
  `city` varchar(100) NOT NULL default '',
  `countryID` char(2) NOT NULL DEFAULT '',
  KEY (`userID`),
  PRIMARY KEY  (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



#################################################
# Special Note:
# active:
# 	NO  - Don't show the country
# 	YES - Do show the country
#

DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `countryID` char(2) NOT NULL DEFAULT '',
  `country` varchar(200) DEFAULT NULL,
  `active` enum('YES','NO') NOT NULL DEFAULT 'YES',
  PRIMARY KEY (`countryID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


LOCK TABLES `countries` WRITE;
INSERT INTO `countries` VALUES ('AF','Afghanistan','NO'),('AL','Albania','YES'),('DZ','Algeria','YES'),('AD','Andorra','YES'),('AO','Angola','YES'),('AI','Anguilla','YES'),('AR','Argentina','YES'),('AM','Armenia','YES'),('AW','Aruba','YES'),('AU','Australia','YES'),('AT','Austria','YES'),('AZ','Azerbaijan','YES'),('BS','Bahamas','YES'),('BH','Bahrain','YES'),('BD','Bangladesh','YES'),('BB','Barbados','YES'),('BY','Belarus','YES'),('BE','Belgium','YES'),('BZ','Belize','YES'),('BJ','Benin','YES'),('BM','Bermuda','YES'),('BT','Bhutan','YES'),('BO','Bolivia','YES'),('BA','Bosnia-Herzegovina','NO'),('BW','Botswana','YES'),('BR','Brazil','YES'),('BN','Brunei Darussalam','YES'),('BG','Bulgaria','YES'),('BI','Burundi','NO'),('KH','Cambodia','YES'),('CM','Cameroon','YES'),('CA','Canada','YES'),('CV','Cape Verde','NO'),('KY','Cayman Islands','NO'),('CF','Central African Republic','NO'),('TD','Chad','YES'),('CL','Chile','YES'),('CN','China','YES'),('CO','Colombia','YES'),('KM','Comoros','NO'),('CK','Cook Islands','NO'),('CR','Costa Rica','YES'),('HR','Croatia','YES'),('CU','Cuba','NO'),('CY','Cyprus','YES'),('CZ','Czech Republic','YES'),('DK','Denmark','YES'),('DJ','Djibouti','NO'),('DM','Dominica','NO'),('DO','Dominican Republic','NO'),('TP','East Timor','NO'),('EC','Ecuador','YES'),('EG','Egypt','YES'),('SV','El Salvador','NO'),('GQ','Equatorial Guinea','NO'),('ER','Eritrea','NO'),('EE','Estonia','YES'),('ET','Ethiopia','YES'),('FO','Faroe Islands','NO'),('FJ','Fiji','YES'),('FI','Finland','YES'),('FR','France','YES'),('GF','French Guiana','NO'),('PF','French Polynesia','NO'),('GA','Gabon','YES'),('GM','Gambia','YES'),('GE','Georgia, Republic of','YES'),('DE','Germany','YES'),('GH','Ghana','YES'),('GI','Gibraltar','NO'),('GB','Great Britain','YES'),('GR','Greece','YES'),('GD','Grenada','YES'),('GP','Guadeloupe','YES'),('GT','Guatemala','YES'),('GN','Guinea','YES'),('GW','Guinea-Bissau','YES'),('GY','Guyana','NO'),('HT','Haiti','YES'),('HN','Honduras','YES'),('HK','Hong Kong','YES'),('HU','Hungary','YES'),('IS','Iceland','YES'),('IN','India','YES'),('ID','Indonesia','YES'),('IR','Iran','NO'),('IQ','Iraq','YES'),('IE','Ireland','YES'),('IL','Israel','YES'),('IT','Italy','YES'),('JM','Jamaica','YES'),('JP','Japan','YES'),('JO','Jordan','YES'),('KZ','Kazakhstan','YES'),('KE','Kenya','YES'),('KI','Kiribati','YES'),('KW','Kuwait','YES'),('KG','Kyrgyzstan','YES'),('LA','Laos','YES'),('LV','Latvia','YES'),('LB','Lebanon','YES'),('LS','Lesotho','YES'),('LR','Liberia','YES'),('LI','Liechtenstein','YES'),('LT','Lithuania','YES'),('LU','Luxembourg','YES'),('MO','Macau','YES'),('MK','Macedonia, Republic of','YES'),('MG','Madagascar','YES'),('MW','Malawi','YES'),('MY','Malaysia','YES'),('MV','Maldives','YES'),('ML','Mali','YES'),('MT','Malta','YES'),('MQ','Martinique','YES'),('MR','Mauritania','YES'),('MU','Mauritius','YES'),('YT','Mayotte','NO'),('MX','Mexico','YES'),('MD','Moldova','YES'),('MC','Monaco','NO'),('MN','Mongolia','YES'),('MA','Morocco','YES'),('MZ','Mozambique','YES'),('NA','Namibia','YES'),('NR','Nauru','YES'),('NP','Nepal','YES'),('NL','Netherlands','YES'),('AN','Netherlands Antilles','YES'),('NC','New Caledonia','YES'),('NZ','New Zealand','YES'),('NI','Nicaragua','YES'),('NE','Niger','YES'),('NG','Nigeria','YES'),('NO','Norway','YES'),('OM','Oman','YES'),('PK','Pakistan','YES'),('PA','Panama','YES'),('PG','Papua New Guinea','YES'),('PY','Paraguay','YES'),('PE','Peru','YES'),('PH','Philippines','YES'),('PL','Poland','YES'),('PT','Portugal','YES'),('QA','Qatar','YES'),('RO','Romania','YES'),('RU','Russia','YES'),('RW','Rwanda','YES'),('SM','San Marino','YES'),('SA','Saudi Arabia','YES'),('SN','Senegal','YES'),('SC','Seychelles','YES'),('SL','Sierra Leone','YES'),('SG','Singapore','YES'),('SK','Slovak Republic','YES'),('SI','Slovenia','YES'),('SB','Solomon Islands','YES'),('SO','Somalia','NO'),('ZA','South Africa','YES'),('ES','Spain','YES'),('LK','Sri Lanka','YES'),('SD','Sudan','YES'),('SZ','Swaziland','YES'),('SE','Sweden','YES'),('CH','Switzerland','YES'),('SY','Syrian Arab Republic','YES'),('TW','Taiwan','YES'),('TJ','Tajikistan','YES'),('TZ','Tanzania','YES'),('TH','Thailand','YES'),('TG','Togo','YES'),('TT','Trinidad and Tobago','NO'),('TN','Tunisia','YES'),('TR','Turkey','YES'),('TM','Turkmenistan','YES'),('UG','Uganda','YES'),('UA','Ukraine','YES'),('AE','United Arab Emirates','YES'),('US','United States','YES'),('UY','Uruguay','NO'),('UZ','Uzbekistan','YES'),('VU','Vanuatu','YES'),('VA','Vatican City','YES'),('VE','Venezuela','YES'),('VN','Vietnam','YES'),('WS','Western Samoa','YES'),('YE','Yemen','YES'),('ZM','Zambia','YES'),('ZW','Zimbabwe','YES');
UNLOCK TABLES;
