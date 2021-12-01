<?php

// https://stackoverflow.com/questions/1065188/in-php-what-is-a-closure-and-why-does-it-use-the-use-identifier
$number = 123;
$number_2 = 123;
$string_out = "abc";
$printer = function($string_in) use (&$number, $number_2)
{
  echo "1st Number " . $number . PHP_EOL;
  $number++;
  echo "2nd Number " . $number_2 . PHP_EOL;
  $number_2++;
  // echo $string_out . PHP_EOL; // undefined
  echo "String in " . $string_in . PHP_EOL;
};
$printer($string_out);
echo "\n1st Number " . $number . PHP_EOL;
echo "2nd Number " . $number_2 . PHP_EOL;
echo "String out " . $string_out . PHP_EOL;

// https://stackoverflow.com/a/43596097
function xrange($min, $max) {
  for ($i = $min; $i <= $max; $i++) {
      yield $i;
  }
}

foreach (xrange(1, 10) as $key => $value) {
  echo "$key => $value", PHP_EOL;
}
