<?php
class Site extends AppModel {
	var $name = 'Site';
	var $validate = array(
							'domain' => array('无效的URL地址' => 'url'),
							'name' => array('此字段不能为空' => 'notEmpty'),
							'description' => array('此字段不能为空' => 'notEmpty')
						);
	
	var $belongsTo = array(
		'Account' => array(
			'className' => 'Account',
			'foreignKey' => 'account_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);
	
	var $hasMany = array(
		'Aco' => array(
			'className' => 'Aco',
			'foreignKey' => 'foreign_key',
			'dependent'=> true
		)
	);
	
	function beforeValidate(){
		if(!$this->id){
			if($this->find(array('Site.domain' => $this->data['Site']['domain'])) > 0){
				$this->invalidate('sitename_unique'); 
				return false;
			}
			return true; 
		}
	}
}
?>