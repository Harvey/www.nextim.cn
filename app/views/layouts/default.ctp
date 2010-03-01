<!-- Start: header -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" lang="zh-CN">
<head>
	<?php echo $html->charset(); ?>
	<title>
		<?php __('NextIM'); ?>
	</title>
	<?php
		echo $html->meta('keywords','nextim,webim,webim20');
		echo $html->meta('description','nextim,webim,webim20');
		echo $html->css('cake.main');
		echo $html->css('cake.form');
		echo $javascript->link('cake.jquery');
	?>
</head>
<!-- End: header -->
<body>

<div id="wrapper">
<div id="header">
<?php include("content/header.php")?>
</div>

<div class="clearfix"></div>
<div class="container_12">

<?php $session->flash(); ?>
<?php echo $content_for_layout; ?>

<!-- Start: footer -->
	<?php include("content/footer.php")?>
	</body>
</html>
<!-- End: footer -->
