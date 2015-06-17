<?php


$wgGroupPermissions['*']['edit'] = false;


$wgGroupPermissions['*']['read'] = false;

$wgGroupPermissions['*']['createaccount'] = false;

$wgRawHtml = true;
$wgExternalLinkTarget= true;
$wgCapitalLinks = false;



$wgLocaltimezone = 'Asia/Shanghai';
$wgCheckFileExtensions = false;
$wgEnableUploads = true;
$wgUploadSizeWarning = false;
$wgUploadDirectory = '/data/images';
$wgUploadPath = '/images';

# DeleteHistory
$wgGroupPermissions['sysop']['DeleteHistory'] = true;
require_once("$IP/extensions/DeleteHistory/DeleteHistory.php");

$wgArticlePath = "/$1";
