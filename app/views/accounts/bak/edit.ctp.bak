<div class="accounts form">
<?php echo $form->create('Account', array('action'=>'edit'));?>
<fieldset>
<legend><?php printf(__('编辑%s', true), __('账户', true)); ?></legend>
<?php
echo $form->hidden('id');
echo $form->input('password', array( 
'type' => 'password', 
'after' => $form->error( 
'password_too_short', 
'密码长度至少六位。'
),
'label'=>'登录密码'
) 
);
echo $form->input('ConfirmPassword', array( 
'type' => 'password', 
'after' => $form->error( 
'repeatpass', 
'输入密码不匹配，请重新输入。'
),
'label'=>'确认密码'
) 
);
echo $form->input('nicename', array('label'=>'账户名称'));
echo $form->input('display_name', array('label'=>'显示名称'));
?>
</fieldset>
</div>
<?php echo $form->end(__('确认修改', true));?>
<div class="actions">
<ul>
<li><?php echo $html->link(__('删除账户', true), array('action' => 'delete', $form->value('Account.id')), null, sprintf(__('确定删除 # %s 吗?', true), $form->value('Account.id'))); ?></li>
<!--<li><?php echo $html->link(sprintf(__('List %s', true), __('Accounts', true)), array('action' => 'index'));?></li>-->
</ul>
</div>