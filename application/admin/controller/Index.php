<?php
namespace app\admin\controller;
use think\Controller;
class Index extends Controller
{
    public function index()
    {
        return $this->fetch();
    }

    public function welcome(){
        // print_r(\Map::getLngLat('四川广元元坝'));die;
        // dump(\Map::staticimage(\Map::getLngLat('四川广元元坝')))
        return "welcome <img src='{:url('index/map')}' alt=''>";
    }

    public function map(){
        return \Map::staticimage('四川广元元坝');
    }
}
