<div class="accounts form">
<?php echo $form->create('Account', array('action'=>'register'));?>
<fieldset>
<legend><?php printf(__('新用户%s', true), __('注册', true)); ?></legend>
<?php
echo $form->input('login', array(
'after' => $form->error(
'username_unique', 
'用户名已经存在，请更换其他名称。'
),
'label'=>'登录Email'
)
);
echo $form->input('hashed_password', array( 
'type' => 'password', 
'after' => $form->error( 
'password_too_short', 
'密码长度至少六位。'
),
'label'=>'登录密码'
) 
);
echo $form->input('password_confirm', array( 
'type' => 'password', 
'after' => $form->error( 
'repeatpass', 
'输入密码不匹配，请重新输入。'
),
'label'=>'密码确认'
) 
);
echo $form->input('nicename', array('label'=>'账户名称'));
?>
</fieldset>
</div>
<?php echo $form->end(__('注册', true));?>