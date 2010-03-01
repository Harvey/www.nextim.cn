<div class="sites index">
<fieldset>
<legend><?php printf(__('站点信息', true)); ?></legend>
<table cellpadding="0" cellspacing="0">
<tr>
<th><?php echo $paginator->sort('站点域名');?></th>
<th><?php echo $paginator->sort('站长ID');?></th>
<th><?php echo $paginator->sort('API KEY');?></th>
<th><?php echo $paginator->sort('站点名称');?></th>
<th><?php echo $paginator->sort('激活状态');?></th>
<th><?php echo $paginator->sort('注册时间');?></th>
<th><?php echo $paginator->sort('更新时间');?></th>
<th><?php echo $paginator->sort('到期时间');?></th>
</tr>
<?php
$i = 0;
foreach ($sites as $site):
$class = null;
if ($i++ % 2 == 0) {
	$class = 'class="altrow"';
}
?>
<tr<?php echo $class;?>>
<td>
<?php echo $html->link($site['Site']['domain'], array('controller'=>'sites', 'action'=>'detail', $site['Site']['domain'])); ?>
</td>
<td>
<?php echo $site['Site']['account_id']; ?>
</td>
<td>
<?php echo $site['Site']['apikey']; ?>
</td>
<td>
<?php echo $site['Site']['name']; ?>
</td>
<td>
<?php echo ($site['Site']['status'] == 'active')?'已激活':'未激活'; ?>
</td>
<td>
<?php echo $site['Site']['created']; ?>
</td>
<td>
<?php echo $site['Site']['updated']; ?>
</td>
<td>
<?php echo $site['Site']['expired_at']; ?>
</td>
</tr>
<?php endforeach; ?>
</table>
</div>
<p>
<?php
echo $paginator->counter(array(
'format' => __('第 %page% 页 / %pages% 页, 当前显示 %current% 项记录, 总记录 %count% 项', true)
));
?>
</p>
<div class="paging">
<?php echo $paginator->prev('<< '.__('前一页', true), array(), null, array('class'=>'disabled'));?>
| 	<?php echo $paginator->numbers();?>
<?php echo $paginator->next(__('后一页', true).' >>', array(), null, array('class' => 'disabled'));?>
</div>
</fieldset>
<div class="actions">
<ul>
<li><?php echo $html->link(sprintf(__('注册%s', true), __('站点', true)), array('controller'=>'sites', 'action' => 'register')); ?></li>
<li><?php echo $html->link(sprintf(__('账户%s', true), __('信息', true)), array('controller'=>'accounts', 'action' => 'view')); ?></li>
</ul>
</div>