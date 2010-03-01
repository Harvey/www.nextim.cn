<?php
	//获取请求页面名称
	$url = $_GET['url'];
	$pieces = explode('/', $url);
	$action = $pieces[count($pieces)-1];
	if ($action == "")
	{
		$action = "home";
	}

	$home		= '<li id="home">' . $html->link('首页', '../home') . '</li>';
	$products	= '<li id="products">' . $html->link('产品', '../products') . '</li>';
	$service	= '<li id="service">' . $html->link('服务', '../service') . '</li>';
	$technology	= '<li id="technology">' . $html->link('技术', '../technology') . '</li>';
	$download	= '<li id="download">' . $html->link('下载', '../download') . '</li>';
	$purchase	= '<li id="purchase">' . $html->link('购买', '../purchase') . '</li>';
	$company	= '<li id="company">' . $html->link('公司', '../company') . '</li>';
	$product_uc = '<li id="products">' . $html->link('产品', '../products') . '</li>';
	
	if (isset(${$action}))
	{
		//修改请求页面导航栏状态
		$pieces = explode('<li', ${$action});
		${$action} = '<li class="current"' . $pieces[1];
	}
	
	//显示导航栏
	echo '<div class="grid_9">';
	//导航登陆|注册
	include("LogInOut.php");
	echo '<div class="clearfix"></div>'; 
	echo '<ul id="navi">';
		echo $home;
		if($action == "product_uc"){
			echo $product_uc;
		}else{
			echo $products;
		}
		echo $service;
		echo $technology;
		echo $download;
		echo $purchase;
		echo $company;
	echo '</ul>'; 
	echo '</div>'; 
?>