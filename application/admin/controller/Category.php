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
        $categorys=model('Category')->getNomalFirstCategory();
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
                $res=model('Category')->add($data);
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
