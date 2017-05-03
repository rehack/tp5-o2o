<?php
namespace app\admin\validate;
use think\Validate;

class Category extends Validate{
    protected $rule=[
        ['name','require|max:10','分类名不能为空|分类名不能超过10个字符'],
        ['parent_id','require|number','分类栏目必选|分类栏目必须是数字'],
    ];
}
