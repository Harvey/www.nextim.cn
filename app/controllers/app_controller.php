<?php
class AppController extends Controller{
	var $helpers = array('Html','Javascript');
	var $components = array('Acl', 'Auth');
	
	function beforeFilter(){
		$this->Auth->authorize = 'actions';
		$this->Auth->actionPath = 'controllers/';
		$this->Auth->allow('*');
	}
	
	function buildAcl(){
		$aro =& $this->Acl->Aro;
		$aro->create();
		$aro->save(array(
							'model'=>'Account',
							'foreign_key'=>null,
							'parent_id'=>null,
							'alias'=>'admin'
						)
		);
	
		$aro->create();
		$aro->save(array(
							'model'=>'Account',
							'foreign_key'=>null,
							'parent_id'=>null,
							'alias'=>'user'
						)
		);
		
		$aco =& $this->Acl->Aco;
		$aco->create();
		$aco->save(array(
							'model'=>'Account',
							'foreign_key'=>null,
							'parent_id'=>null,
							'alias'=>'account'
						)
		);
		
		$aco->create();
		$aco->save(array(
							'model'=>'Site',
							'foreign_key'=>null,
							'parent_id'=>null,
							'alias'=>'site'
						)
		);
		
		$this->Acl->allow('admin', 'account', '*');
		$this->Acl->allow('admin', 'site', '*');
		$this->Acl->allow('user', 'site', array('create', 'read'));
	}
}
?>