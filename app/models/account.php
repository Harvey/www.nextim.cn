<?php
class Account extends AppModel {
	var $name = 'Account';
	var $validate = array(
							'login' => array(
								'无效的Email地址。' => 'email',
							),
							'display_name' => array(
								'此字段不能为空。' => 'notEmpty',
							)
					);

	var $hasMany = array(
						'Site' => array(
									'className' => 'Site',
									'foreignKey' => 'account_id',
									'dependent'=> true
								)
						);

	function beforeValidate(){
		if(!$this->id){
			if($this->find(array('Account.login' => $this->data['Account']['login'])) > 0){
				$this->invalidate('username_unique'); 
				return false;
			}
			return true; 
		}
	}
}
?>