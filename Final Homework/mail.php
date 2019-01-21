<?php
    $to = 'samurai.hanso@gmail.com';
    $firstname = $_POST["fname"];
    $email= $_POST["email"];
    $text= $_POST["message"];

    $headers = 'Swift Restaurant Feedback' . "\r\n";
    $headers .= "From: " . $email . "\r\n"; // Sender's E-mail

    $message ='<table style="width:100%">
        <tr>
            <td>'.$firstname.'</td>
        </tr>
        <tr><td>Email: '.$email.'</td></tr>
        <tr><td>Text: '.$text.'</td></tr>
        
    </table>';

    if (mail($to, $email, $message, $headers))
    {
        echo 'The message has been sent.';
        echo "<script>window.location='index.php';</script>";
    }else{
        echo 'failed';
    }

?>
