<div class="accounts index">
<fieldset>
<legend><?php printf(__('账户信息', true)); ?></legend>
<table cellpadding="0" cellspacing="0">
<tr>
<th><?php echo $paginator->sort('用户ID');?></th>
<th><?php echo $paginator->sort('登录邮箱');?></th>
<th><?php echo $paginator->sort('用户身份');?></th>
<th><?php echo $paginator->sort('创建时间');?></th>
<th><?php echo $paginator->sort('更新时间');?></th>
<th><?php echo $paginator->sort('显示名称');?></th>
<th class="actions"><?php __('账户操作');?></th>
</tr>
<?php
$i = 0;
foreach ($accounts as $account):
$class = null;
if ($i++ % 2 == 0) {
	$class = 'class="altrow"';
}
?>
<tr<?php echo $class;?>>
<td>
<?php echo $html->link($account['Account']['id'], array('controller' => 'Sites', 'action' => 'index', $account['Account']['id'])); ?>
<td>
<?php echo $account['Account']['login']; ?>
</td>
<td>
<?php echo ($account['Account']['role'] == 'user')?'普通用户':'管理员'; ?>
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
<?php echo $html->link(__('编辑', true), array('action' => 'edit', $account['Account']['id'])); ?>
<?php if($account['Account']['role'] == 'admin')echo $html->link(__('删除', true), array('action' => 'delete', $account['Account']['id']), null, sprintf(__('确定删除 # %s 吗?', true), $account['Account']['id'])); ?>
<?php echo $html->link(__('查看', true), array('controller'=>'sites', 'action' => 'index', $account['Account']['id'])); ?>
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
<li><?php echo $html->link(sprintf(__('新注册%s', true), __('站点', true)), array('controller'=>'sites','action' => 'register')); ?></li>
<li><?php echo $html->link(sprintf(__('已注册%s', true), __('站点', true)), array('controller'=>'sites','action' => 'view')); ?></li>
</ul>
</div>
