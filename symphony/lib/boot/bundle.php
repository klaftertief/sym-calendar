<?php

	error_reporting(E_ALL ^ E_NOTICE);
	set_magic_quotes_runtime(0);

	header('Expires: Mon, 12 Dec 1982 06:14:00 GMT');
	header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT');
	header('Cache-Control: no-cache, must-revalidate, max-age=0');
	header('Pragma: no-cache');
		
	require_once(DOCROOT . '/symphony/lib/boot/func.utilities.php');	
	require_once(DOCROOT . '/symphony/lib/boot/defines.php');
	require_once(BOOT . '/class.object.php');
