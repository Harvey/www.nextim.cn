<?php
function encrypt($username,$passwd){
   return hash("sha256" , $username . $passwd);
}

echo encrypt("freefis@gmail.com","legolas") . "\n";
echo encrypt("freefis@webim20.cn","1");
?>
