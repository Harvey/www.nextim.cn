<?php
/* SVN FILE: $Id$ */
/**
 * Short description for file.
 *
 * In this file, you set up routes to your controllers and their actions.
 * Routes are very important mechanism that allows you to freely connect
 * different urls to chosen controllers and their actions (functions).
 *
 * PHP versions 4 and 5
 *
 * CakePHP(tm) :  Rapid Development Framework (http://www.cakephp.org)
 * Copyright 2005-2008, Cake Software Foundation, Inc. (http://www.cakefoundation.org)
 *
 * Licensed under The MIT License
 * Redistributions of files must retain the above copyright notice.
 *
 * @filesource
 * @copyright     Copyright 2005-2008, Cake Software Foundation, Inc. (http://www.cakefoundation.org)
 * @link          http://www.cakefoundation.org/projects/info/cakephp CakePHP(tm) Project
 * @package       cake
 * @subpackage    cake.app.config
 * @since         CakePHP(tm) v 0.2.9
 * @version       $Revision$
 * @modifiedby    $LastChangedBy$
 * @lastmodified  $Date$
 * @license       http://www.opensource.org/licenses/mit-license.php The MIT License
 */
/**
 * Here, we are connecting '/' (base path) to controller called 'Pages',
 * its action called 'display', and we pass a param to select the view file
 * to use (in this case, /app/views/pages/home.ctp)...
 */
	Router::connect('/', array('controller' => 'pages', 'action' => 'display', 'home'));
/**
 * ...and connect the rest of 'Pages' controller's urls.
 */
	Router::connect('/home', array('controller' => 'pages', 'action' => 'display', 'home'));
	Router::connect('/products', array('controller' => 'pages', 'action' => 'display', 'products'));
	Router::connect('/product_uc', array('controller' => 'pages', 'action' => 'display', 'product_uc'));
	Router::connect('/technology', array('controller' => 'pages', 'action' => 'display', 'technology'));
	Router::connect('/service', array('controller' => 'pages', 'action' => 'display', 'service'));
	Router::connect('/download', array('controller' => 'pages', 'action' => 'display', 'download'));
	Router::connect('/purchase', array('controller' => 'pages', 'action' => 'display', 'purchase'));
	Router::connect('/company', array('controller' => 'pages', 'action' => 'display', 'company'));
?>