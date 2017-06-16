<?php
namespace app\bis\controller;
use think\Controller;
// 商户入驻申请
class Register extends Controller
{
    public function index(){
        // 获取一级城市的数据(parrent_id为0的) 分配给前台模板
        $citys=model('City')->getNormalCitysByParentId();
        // dump($citys);

        // 获取一级生活服务分类 返回给前台模板
        $categorys=model('Category')->getNormalCategoryByParentId();
        return $this->fetch('',[
            'citys'=>$citys,
            'categorys'=>$categorys,
        ]);
    }
}