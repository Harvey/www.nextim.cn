<?php 
	echo $form->create('Account', array('action' => 'index'));
	echo $form->input('login', array( 'label' => 'Login'));
	echo $form->button('Search', array('type'=>'submit'));
	echo $form->end();
?>


<div class="accounts index">
<h2><?php __('Accounts');?></h2>
<p>
<?php
echo $paginator->counter(array(
'format' => __('Page %page% of %pages%, showing %current% records out of %count% total, starting on record %start%, ending on %end%', true)
));
?></p>
<table cellpadding="0" cellspacing="0">
<tr>
	<th><?php echo $paginator->sort('id');?></th>
	<th><?php echo $paginator->sort('login');?></th>
	<th><?php echo $paginator->sort('status');?></th>
	<th><?php echo $paginator->sort('role');?></th>
	<th><?php echo $paginator->sort('created');?></th>
	<th><?php echo $paginator->sort('updated');?></th>
	<th><?php echo $paginator->sort('displayName');?></th>
	<th class="actions"><?php __('Actions');?></th>
</tr>
<?php
$i = 0;
foreach ($accounts as $account):
	$class = null;
	if ($i++ % 2 == 0) {
		$class = ' class="altrow"';
	}
?>
	<tr<?php echo $class;?>>
		<td>
			<?php echo $html->link($account['Account']['id'], array('controller' => 'Sites', 'action' => 'index', $account['Account']['id'])); ?>
		</td>
		<td>
			<?php echo $html->link($account['Account']['login'], array('controller' => 'Sites', 'action' => 'index', $account['Account']['id'])); ?>
		</td>
		<td>
			<?php echo $account['Account']['status']; ?>
		</td>
		<td>
			<?php echo $account['Account']['role']; ?>
		</td>
		<td>
			<?php echo $account['Account']['created']; ?>
		</td>
		<td>
			<?php echo $account['Account']['updated']; ?>
		</td>
		<td>
			<?php echo $account['Account']['nicename']; ?>
		</td>
		<td class="actions">
			<?php echo $html->link(__('Edit', true), array('action' => 'edit', $account['Account']['id'])); ?>
			<?php echo $html->link(__('Delete', true), array('action' => 'delete', $account['Account']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $account['Account']['id'])); ?>
		</td>
	</tr>
<?php endforeach; ?>
</table>
</div>
<div class="paging">
	<?php echo $paginator->prev('<< '.__('previous', true), array(), null, array('class'=>'disabled'));?>
 | 	<?php echo $paginator->numbers();?>
	<?php echo $paginator->next(__('next', true).' >>', array(), null, array('class' => 'disabled'));?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(sprintf(__('New %s', true), __('Account', true)), array('action' => 'register')); ?></li>
	</ul>
</div>
