<?php
require 'vendor/autoload.php';

ini_set('error_reporting', 'E_COMPILE_ERROR|E_RECOVERABLE_ERROR');

function autoload_models($className)
{
	$dir 		= __DIR__.'/Model/';
	$classPath 	= $dir.$className.'.php';

	include($classPath);
}
spl_autoload_register('autoload_models');

// main
for ($i=0; $i < 10; $i++) {
  $name     = readline("İsim Giriniz: ");
  $surname  = readline("Soyisim Giriniz: ");
  $person   = new Person($name, $surname);
  $person->save();
  echo "\e[0;30;42mKişi Eklendi : " . $person->to_s() . "\e[0m \n";
}

 ?>
