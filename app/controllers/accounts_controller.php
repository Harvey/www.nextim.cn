<?php
class AccountsController extends AppController {

	var $name = 'Accounts';
	var $components = Array('Auth', 'Acl');
	var $helpers = array('Html', 'Form');
	
	function beforeFilter(){
		Security::setHash('sha256');
		$this->Auth->userModel = 'Account';
		$this->Auth->fields = array('username'=>'login', 'password'=>'hashed_password');
		$this->Auth->allowedActions = array('register');
		$this->Auth->LoginRedirect = array('controller'=>'account', 'action'=>'view');
	}
	
	function register(){
		if ($this->data){
			if($this->data['Account']['login'] == ''){
				$this->Session->setFlash("请填写邮箱！");
				$this->redirect('/accounts/register');
				exit();
			}
			if(!preg_match('/^[^0-9][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$/',
						$this->data['Account']['login'])){
				$this->Session->setFlash("请使用合法邮箱地址！");
				$this->redirect('/accounts/register');
				exit();
			}
			if($this->Account->findByLogin($this->data['Account']['login']) > 0){
				$this->Session->setFlash("该邮箱已经注册，请更换一个！");
				$this->redirect('/accounts/register');
				exit();
			}
			if($this->data['Account']['password_confirm'] == ''){
				$this->Session->setFlash("请填写密码！");
				$this->redirect('/accounts/register');
				exit();
			}
			#print_r($this->data);
			if ($this->data['Account']['hashed_password'] == hash('sha256', $this->data['Account']['login'].$this->data['Account']['password_confirm'])){
				$this->Account->create();
				if($this->Account->save($this->data)){
					$this->Auth->login($this->data);
					$parent = $this->Acl->Aro->findByAlias('user');
					$this->Acl->Aro->create(array(
													'alias' => $this->Auth->user('id'),
													'model' => 'Account',
													'foreign_key' => $this->Auth->user('id'),
													'parent_id' => $parent['Aro']['id']
												)
											);
					$this->Acl->Aro->save();
					$parent = $this->Acl->Aco->findByAlias('account');
					$this->Acl->Aco->create(array(
													'alias' => $this->Auth->user('id'),
													'model' => 'Account',
													'foreign_key' => $this->Auth->user('id'),
													'parent_id' => $parent['Aco']['id']
												)
											);
					$this->Acl->Aco->save();
					$this->Acl->allow($this->Auth->user('id'), $this->Auth->user('id'), '*');					
					$this->redirect('/accounts/view');
				}else{
					$this->Session->setFlash("注册时发生错误，请重试！");
					$this->redirect('/accounts/register');
				}
			}else{
				$this->Session->setFlash("两次输入密码不一致，请重试！");
				$this->redirect('/accounts/register');
			}
		}
	}
	
	function login(){
		
	}
	
	function logout(){
		$this->redirect($this->Auth->logout());
	}
	
	function view($id = null){
		if ($id == null)
		{
			$this->Account->recursive = 0;
			$this->set('accounts', $this->paginate('Account', Array('Account.id' => $this->Auth->user('id'))));
		}
		else
		{
			if($this->Auth->user('role') !== 'admin')
			{
				$this->Session->setFlash(__('您没有该权限。', true));
				$this->Account->recursive = 0;
				$this->set('accounts', $this->paginate('Account', Array('Account.id' => $this->Auth->user('id'))));
			}
			else
			{
				$this->Account->recursive = 0;
				$this->set('accounts', $this->paginate('Account', Array('Account.id' => $id)));
			}
		}
	}
	
	function edit($id = null) {
		
		if ( !$id && empty($this->data) )
		{
			$this->Session->setFlash(__('Invalid site', true));
			$this->redirect(array('action' => 'MyAccount'));
		}
		/* test acl */
		if($this->Auth->user('role') !== 'admin')
		{
			$this->Session->setFlash(__('您没有修改该用户的权限。', true));
			$this->redirect(array('action' => 'view'));
		}
		else
		{
			if (!empty($this->data)) {
				//if(strlen($this->data['Account']['password']) < 6){ 
           // $this->Account->invalidate('password_too_short');
      	//} 
				if(($this->data['Account']['password'] != $this->data['Account']['ConfirmPassword'])){ 
            $this->Account->invalidate('repeatpass');
      	}
			  else
				{
						if ($this->Account->save($this->data)) {
							$this->Session->setFlash(__('修改成功', true));
							$this->redirect(array('action' => 'index'));
						} else {
							$this->Session->setFlash(__('修改账户时发生错误，请重试', true));
						}
				}
				}
				/* the first time get into this fun, we need read old infomation from database */
				if (empty($this->data)) {
					$this->data = $this->Account->read(Array('nicename','display_name'), $id);
				}
		}
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('I无效的账号。', true));
		}
		else if($this->Auth->user('role') !== 'admin')
		{
			$this->Session->setFlash(__('您没有删除该用户的权限。', true));
			$this->redirect(array('action' => 'view'));
		}
		else if($this->Account->delete($id, true)) {
			
			if($id == $this->Session->read('userid'))
			{
				$this->Session->del('userid');	
			}
			
			$this->Session->setFlash(__('删除成功。', true));
		}
		else {
			$this->Session->setFlash(__('删除失败。', true));
		}
		$this->redirect(array('action' => 'index'));
	}
		

	function index($login = null){
		if($this->Auth->user('role') === 'admin')
		{
			if ($login)
			{
				$this->Account->recursive = 0;
	        	        $this->set('accounts', $this->paginate('Account', Array('Account.login' => $login)));
			}
			else if ( $this->data['Account']['login'] != '')
			{
				$this->Account->recursive = 0;
	        	        $this->set('accounts', $this->paginate('Account', Array('Account.login like ' => '%'.$this->data['Account']['login'].'%')));
			}
			else
			{
				$this->set('accounts', $this->paginate());
			}
				
		}
		else
		{
			$this->Session->setFlash(__('您没有该权限。', true));
			$this->redirect(array('action' => 'view'));
		}
	}
}
?>
