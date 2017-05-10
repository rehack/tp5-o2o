<?php
namespace app\admin\controller;
use think\Controller;
class Category extends Controller
{

    private $obj;
    public function _initialize(){
        $this->obj=model('Category');
    }

    public function index()
    {
        $parentId=input('get.parent_id',0,'intval');
        $categorys=$this->obj->getFirstCategorys($parentId);
        return $this->fetch('',['categorys'=>$categorys]);
    }

    public function add(){
        $categorys=$this->obj->getNomalFirstCategory();
        return $this->fetch('',[
            'categorys'=>$categorys,
        ]);
    }

    public function save(){
        if(request()->isPost()){
            $data=input('post.');
            // $data['status']=10;
            $validate = validate('Category');
            if($validate->check($data)){
                // dump($data);

                // 把数据提交给model层
                $res=$this->obj->add($data);
                if($res){
                    $this->success('新增成功');
                }else{
                    $this->error('新增失败');
                }

            }else{
                // return $validate->getError();
                return $this->error($validate->getError());
            }
        }


    }
}
