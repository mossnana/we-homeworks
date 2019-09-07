<html>
<head>
<title>Ninety Surprise !!!</title>
</head>
<body>
<form action="index.php" method="post">
<label for="number1">Number 1</label>
<input type="text" name="number1" placeholder="Enter number 1" />
<br/>
<label for="number2">Number 2</label>
<input type="text" name="number2" placeholder="Enter number 2" />
<br/>
<button type="submit">Summary</button>
</form>
<?php

function sum($num1, $num2, $option="develop") {
if($option == "test_bool") {
  if($num1+$num2 == 90) {
   return True;    
    } else {
   return False;
   }
} else if($option == "test_result") {
  return $num1+$num2;
} else {
  if($num1+$num2 == 90) {
   echo "Summation of 2 Number is 90";
   return True;    
    } else {
   echo "Summation of 2 Number is not 90";
   return False;
   }
}
}

// Check Number 1 and number 2
if(isset($_POST["number1"]) AND isset($_POST["number2"]) ) {
  $number1 = (int)$_POST["number1"];
$number2 = (int)$_POST["number2"];
  sum($number1, $number2);
} else {
  echo "Please Enter Number 1 and Number 2";
}

?>
</body>
</html>