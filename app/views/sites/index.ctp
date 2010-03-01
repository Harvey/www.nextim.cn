<?php
        echo $form->create('Site', array('action' => 'index'));
        echo $form->input('domain', array( 'label' => 'Domain'));
        echo $form->button('Search', array('type'=>'submit'));
        echo $form->end();
?>

<?php
        echo $form->create('Site', array('action' => 'index'));
        echo $form->input('account', array( 'label' => 'Account'));
        echo $form->button('Search', array('type'=>'submit'));
        echo $form->end();
?>

<div class="sites index">
<h2><?php __('Sites');?></h2>
<p>
<?php
echo $paginator->counter(array(
'format' => __('Page %page% of %pages%, showing %current% records out of %count% total, starting on record %start%, ending on %end%', true)
));
?></p>
<table cellpadding="0" cellspacing="0">
<tr>
	<th><?php echo $paginator->sort('id');?></th>
	<th><?php echo $paginator->sort('domain');?></th>
	<th><?php echo $paginator->sort('apikey');?></th>
	<th><?php echo $paginator->sort('name');?></th>
	<th><?php echo $paginator->sort('account_id');?></th>
	<th><?php echo $paginator->sort('status');?></th>
	<th><?php echo $paginator->sort('maxusers');?></th>
	<th><?php echo $paginator->sort('expired_at');?></th>
	<th><?php echo $paginator->sort('created_at');?></th>
	<th><?php echo $paginator->sort('updated_at');?></th>
	<th><?php echo $paginator->sort('description');?></th>
	<th class="actions"><?php __('Actions');?></th>
</tr>
<?php
$i = 0;
foreach ($sites as $site):
	$class = null;
	if ($i++ % 2 == 0) {
		$class = ' class="altrow"';
	}
?>
	<tr<?php echo $class;?>>
		<td>
			<?php echo $site['Site']['id']; ?>
		</td>
		<td>
			<?php echo $site['Site']['domain']; ?>
		</td>
		<td>
			<?php echo $site['Site']['apikey']; ?>
		</td>
		<td>
			<?php echo $site['Site']['name']; ?>
		</td>
		<td>
			<?php echo $html->link($site['Site']['account_id'], array('controller' => 'accounts', 'action' => 'view', $site['Site']['account_id'])); ?>
		</td>
		<td>
			<?php echo $site['Site']['status']; ?>
		</td>
		<td>
			<?php echo $site['Site']['maxusers']; ?>
		</td>
		<td>
			<?php echo $site['Site']['expired_at']; ?>
		</td>
		<td>
			<?php echo $site['Site']['created_at']; ?>
		</td>
		<td>
			<?php echo $site['Site']['updated_at']; ?>
		</td>
		<td>
			<?php echo $site['Site']['description']; ?>
		</td>
		<td class="actions">
			<?php echo $html->link(__('View', true), array('action' => 'view', $site['Site']['id'])); ?>
			<?php echo $html->link(__('Edit', true), array('action' => 'edit', $site['Site']['id'])); ?>
			<?php echo $html->link(__('Delete', true), array('action' => 'delete', $site['Site']['id'], $site['Site']['account_id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $site['Site']['id'])); ?>
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
		<li><?php echo $html->link(sprintf(__('New %s', true), __('Site', true)), array('action' => 'add')); ?></li>
	</ul>
</div>
