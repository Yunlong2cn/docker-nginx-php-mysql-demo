<?php
	echo 'Hello world' . PHP_EOL;
	$link = mysqli_connect('192.168.99.100', 'root', '', 'test', '3308');
	var_dump($link);
	// phpinfo();
?>