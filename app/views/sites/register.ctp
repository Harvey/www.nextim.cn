<div class="sites form">
<?php echo $form->create('Site', array('action'=>'register'));?>
<fieldset>
<legend><?php printf(__('新站点%s', true), __('注册', true)); ?></legend>
<?php
echo $form->input('domain', array(
'after' => $form->error(
'sitename_unique', 
'此域名已经被添加'
),
'label'=>'站点域名'
)
);
echo $form->input('name', array(
'label'=>'站点名称'
)
);
echo $form->input('description', array(
'label'=>'站点描述'
)
);
echo $form->input('account_id', array('type'=>'hidden', 'value'=>$_SESSION['Auth']['Account']['id']));
echo $form->input('apikey', array('type'=>'hidden', 'value'=>''));
echo $form->input('expired_at', array('type'=>'hidden', 'value'=>date("Y-m-d H:i:s", mktime(0, 0, 0, date("m"), date("d"), date("Y")+1))));
?>
</fieldset>
</div>
<?php echo $form->end(__('注册', true));?>