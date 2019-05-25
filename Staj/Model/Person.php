<?php
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use Faker\Factory;

class Person
{
  private static $count = 0;
  public $email, $name, $surname, $password;

  function __construct($name, $surname)
  {
    $faker = Faker\Factory::create();
    $this->email = $faker->email;
    $this->name = $name;
    $this->surname = $surname;
    $this->password = $faker->password;
  }

  function to_s(){
    return "Adı: ". $this->name . " | " . "Soyadı: " .  $this->surname . " | " . "E-postası : ".  $this->email . " | " . "Parolası : " .  $this->password;
  }

  function save()
  {
    $reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReaderForFile("users.xlsx");
    $reader->setReadDataOnly(true);
    $spreadsheet = $reader->load("users.xlsx");

    $sheet = $spreadsheet->getActiveSheet();

    $sheet->setCellValue('A'.(++self::$count), $this->name);
    $sheet->setCellValue('B'.self::$count, $this->surname);
    $sheet->setCellValue('C'.self::$count, $this->email);
    $sheet->setCellValue('D'.self::$count, $this->password);

    $writer = \PhpOffice\PhpSpreadsheet\IOFactory::createWriter($spreadsheet, "Xlsx");
    $writer->save('users.xlsx');
  }
}
?>
