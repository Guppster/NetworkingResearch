<?php
// HAS TO BE IN THE ROOT DIRECTORY OF THE SITE!!!
//define ('HTTPS', $_SERVER['HTTPS'] && ($_SERVER['HTTPS'] != 'off'));
define ('HTTPS', false);
define ('APPLICATION', 'hw3');

@set_time_limit(30); 
@error_reporting(E_ALL);
@ini_set('session.use_cookies',1);
@ini_set('session.use_only_cookies',1);
@ini_set('session.cookie_httponly',1);
@ini_set('session.cookie_secure', HTTPS);
@ini_set('session.name', APPLICATION);
@ini_set('session.use_trans_sid',0);
@ini_set('session.cookie_lifetime',0); // 2 hour session!
@ini_set('session.gc_maxlifetime',7200); // 2 hour session!
@ini_set('default_charset', 'UTF-8');

@mb_internal_encoding('UTF-8');
@mb_http_output('UTF-8');

//session_name(APPLICATION);
if (session_id() == '') { 
    session_start();
}

// So templates can be included
define ('TMPL_DIR', './templates');
define ('MAIN_DIR' , preg_replace('/\/$/', '', __DIR__) );

define('MYSQL_SERVER', 'localhost');
define('MYSQL_DB', 'cs4411_hw3');
define('MYSQL_USER', 'cs4411_hw3');
define('MYSQL_PASSWORD', 'student');

$DB = new mysqli(MYSQL_SERVER, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DB);

$mongo = new MongoDB\Driver\Manager("mongodb://localhost:27017");

// DO NOT touch anything below!
require_once('./includes/utils.inc.php');
require_once('./includes/functions.inc.php');

?>
