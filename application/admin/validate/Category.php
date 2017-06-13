<?php
namespace app\admin\validate;
use think\Validate;

class Category extends Validate{
    protected $rule=[
        ['id','number'],
        ['name','require|max:10','分类名不能为空|分类名不能超过10个字符'],
        ['parent_id','require|number','分类栏目必选|分类栏目必须是数字'],
        ['status','number|in:-1,0,1','状态必须是数字|状态范围不合法'],
        ['listorder','number']
    ];

    // 场景设置
    protected $scene=[
        'add' => ['name','parent_id','id'],//添加功能
        'listorder' => ['id','listorder'],//排序
        'status' => ['id','status']//更新状态
    ];
}
