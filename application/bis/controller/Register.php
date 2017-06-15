<?php
namespace app\bis\controller;
use think\Controller;
class Register extends Controller
{
    public function index(){
        // 获取一级城市的数据 parrent_id为0的
        $citys=model('City')->getNormalCitysByParentId();
        // dump($citys);
        return $this->fetch('',[
            'citys'=>$citys,
        ]);
    }
}