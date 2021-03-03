<?php 

	require './../lib/Database.php';
	require './../helpers/Format.php';

	spl_autoload_register(function ($class) {
      	include './../classes/' . $class . '.php';
  	});