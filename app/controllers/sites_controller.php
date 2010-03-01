<?php
class SitesController extends AppController {
	var $name = 'Sites';
	//var $components = Array('Acl', 'Auth');
	var $helpers = array('Html', 'Form');
	
	function beforeFilter(){
		$this->Auth->allowedActions = array('*');
	}
	
	function view(){
		$this->Site->recursive = 0;
		$this->set('sites', $this->paginate('Site', Array('account_id' => $_SESSION['Auth']['Account']['id'])));
	}
	
	function register(){
		if($this->data){
			if(!preg_match('/[\.][a-zA-Z]{2,4}/', $this->data['Site']['domain'])){
					$this->Session->setFlash("请使用合法域名！");
					$this->redirect('/sites/register');
					exit();
			}
			if($this->Site->findByDomain($this->data['Site']['domain']) > 0){
				$this->Session->setFlash("该域名已经注册，请更换一个！");
				$this->redirect('/sites/register');
				exit();
			}
			$this->Site->create();
			$this->data['Site']['apikey'] = String::uuid();
			$this->Site->save($this->data);
				//$result = $this->Site->findByDomain($this->data['Site']['domain']);
				//$parent = $this->Acl->Aco->findByAlias('site');
				//$this->Acl->Aco->create(array(
				//								'alias' => $this->data['Site']['domain'],
				//								'model' => 'Site',
				//								'foreign_key' => $result['Site']['id'],
				//								'parent_id' => $parent['Aco']['id']
				//							)
				//						);
				//$this->Acl->Aco->save();

				//$this->Acl->allow($_SESSION['Auth']['Account']['id'], $this->data['Site']['domain'], '*');
			$this->redirect('/sites/view');
			//}else{
			//	$this->Session->setFlash("注册时发生错误，请重试！");
			//	$this->redirect('/sites/register');
			//}
		}
	}
	function index($id = null) {
		$this->Site->recursive = 0;
		if( $_SESSION['Auth']["Account"]['role'] !== 'admin')
		{
			$this->Session->setFlash(__('您没有访问的权限。', true));
			$this->set('sites', $this->paginate('Site', Array('Site.id' => -1)));
		}
		else if ($this->data['Site']['domain'] != '')
		{
			$this->set('sites', $this->paginate('Site', Array('Site.domain like' => '%'.$this->data['Site']['domain'].'%')));
		}
		else if ($this->data['Site']['account'] != '')
		{
			$this->set('sites', $this->paginate('Site', Array('Site.account_id' => $this->data['Site']['account'])));
		}
		else if ($id)
		{
			$this->set('sites', $this->paginate('Site', Array('Site.account_id' => $id)));
		}
		else
		{
			$this->set('sites', $this->paginate());
		}
	}
	function edit($id = null) {

		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid site', true));
			$this->redirect(array('action' => 'MySites'));
		}
		/* test acl */
		if( $_SESSION['Auth']["Account"]['role'] !== 'admin')
		{
			$this->Session->setFlash(__('您没有修改该站点的权限。', true));
			$this->redirect(array('action' => 'MySites'));
		}
		else
		{
			if (!empty($this->data)) {
				$this->Site->save($this->data);
				$this->Session->setFlash(__('站点修改成功', true));
				$this->redirect(array('action' => 'index', $this->data['Site']['account_id']));
				//if ($this->Site->save($this->data)) {
				//	$this->Session->setFlash(__('站点修改成功', true));
				//	$this->redirect(array('action' => 'view'));
				//} else {
				//	$this->Session->setFlash(__('注册时发生错误，请重试', true));
				//}
			}
			if (empty($this->data)) {
				$this->data = $this->Site->read(null, $id);
			}
			$accounts = $this->Site->Account->find('list');
			$this->set(compact('accounts'));	
		}
	}
	function delete($id = null, $user = null) {
		if( $_SESSION['Auth']["Account"]['role'] !== 'admin')
		{
			$this->Session->setFlash(__('您没有修改该站点的权限。', true));
			$this->redirect(array('action' => 'index'));
		}
		else
		{
				if (!$id) {
					$this->Session->setFlash(__('无效站点，该站点可能已经被删除', true));
					$this->redirect(array('action'=>'index'));
				}
				$this->Site->delete($id, true);
					
					/*$aco = $this->Acl->Aco->findByAlias($id);
					if( !empty($aco) )
					{
						//$this->Acl->Aco->delete($aco['Aco']['id']);
					}*/
					
				$this->Session->setFlash(__('成功删除站点', true));
				$this->redirect(array('action'=>'index',$user));
			
				//$this->Session->setFlash(__('删除站点失败', true));
				//$this->redirect(array('action' => 'index'));
		}
	}
}
?>
