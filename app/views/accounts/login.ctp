<fieldset>
<legend><?php printf(__('用户%s', true), __('登录', true)); ?></legend>
<?php $session->flash('auth');?>
<?php echo $form->create('Account', array('action' => 'login')); ?>
<?php
echo $form->input('login', array(
'after' => $form->error(
'username_unexist', 
'用户名不存在。'
),
'label'=>'登录Email'
)
);
echo $form->input('hashed_password', array( 
'type' => 'password', 
'after' => $form->error( 
'password_error', 
'密码错误。'
),
'label'=>'登录密码'
)
);
?>
</fieldset>

<?php echo $form->end('登录');?>
<?php echo $html->link('立即注册', array('action' => 'register')); ?>