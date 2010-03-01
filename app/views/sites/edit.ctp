<div class="sites form">
<?php echo $form->create('Site');?>
	<fieldset>
 		<legend><?php printf(__('Edit %s', true), __('Site', true)); ?></legend>
	<?php
		echo $form->hidden('id');
		echo $form->hidden('account_id');
		echo $form->input('domain');
		echo $form->input('name');
		echo $form->input('description');
	?>
	</fieldset>
<?php echo $form->end(__('Submit', true));?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Delete', true), array('action' => 'delete', $form->value('Site.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $form->value('Site.id'))); ?></li>
		<li><?php echo $html->link(sprintf(__('List %s', true), __('Sites', true)), array('action' => 'index'));?></li>
		<li><?php echo $html->link(sprintf(__('List %s', true), __('Accounts', true)), array('controller' => 'accounts', 'action' => 'index')); ?> </li>
		<li><?php echo $html->link(sprintf(__('New %s', true), __('Account', true)), array('controller' => 'accounts', 'action' => 'add')); ?> </li>
	</ul>
</div>
