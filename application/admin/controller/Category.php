<?php
namespace app\admin\controller;
use think\Controller;
class Category extends Controller
{
    public function index()
    {
        return $this->fetch();
    }

    public function add(){
        return $this->fetch();
    }

    public function save(){
        if(request()->isPost()){
            $data=input('post.');
            $validate = validate('Category');
            if($validate->check($data)){
                dump($data);

            }else{
                // return $validate->getError();
                return $this->error($validate->getError());
            }
        }
    }
}
