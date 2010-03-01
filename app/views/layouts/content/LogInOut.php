<?php
echo '<div id="topNavi"><span></span>';
if(isset($_SESSION['Auth']['Account']))
{
	echo $html->link('注销',
		array('controller'=>'accounts', 'action'=>'logout'),
		array('class'=>'white'));
	echo ' | ';
	echo $html->link('管理',
		array('controller'=>'accounts', 'action'=>'view'),
		array('class'=>'white'));
}
else
{
	echo $html->link('登录', 
		array('controller'=>'accounts', 'action'=>'login'),
		array('class'=>'white'));
	echo ' | ';
	echo $html->link('注册', 
		array('controller'=>'accounts', 'action'=>'register'),
		array('class'=>'white'));
}
echo '</div>';
?>