<?php
namespace app\admin\controller;
use think\Controller;
class Category extends Controller
{

    private $obj;
    public function _initialize(){
        $this->obj=model('Category');
    }

    public function index($id=0)
    {
        if(intval($id)<0){
            $this->error('参数不合法！');
        }
        // $parentId=input('get.id',0,'intval');
        $categorys=$this->obj->getFirstCategorys($id);
        // dump($categorys);die;
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
            if($validate->scene('add')->check($data)){ //数据验证成功
                // dump($data);
                //
                if(!empty($data['id'])){//如果传来的数据有id，说明要执行更新操作，否则执行添加操作
                    return $this->update($data);
                }else{
                    // 把数据提交给model层
                    $res=$this->obj->add($data);
                    if($res){
                        $this->success('新增成功');
                    }else{
                        $this->error('新增失败');
                    }
                }

            }else{
                // return $validate->getError();
                return $this->error($validate->getError());
            }
        }else{
            $this->error('请求失败！');//非post
        }

    }

    // 编辑
    public function edit($id){
        if(intval($id)<1){
            $this->error('参数不合法！');
        }
        $category=$this->obj->get($id);
        // dump($category);die();

        $categorys=$this->obj->getNomalFirstCategory();
        return $this->fetch('',[
            'categorys'=>$categorys,
            'category'=>$category,
        ]);
    }

    // 更新
    public function update($data){
        $res=$this->obj->save($data,['id',intval($data['id'])]);
        if($res){
            $this->success('更新成功');
        }else{
            $this->error('更新失败');
        }
    }

    // 排序
    public function listorder(){
        if(request()->isPost()){
            $data=input('post.');
            $res=$this->obj->save($data,['id',intval($data['id'])]);
            if($res){
                $this->result($_SERVER['HTTP_REFERER'],1,'排序成功');
            }else{
                $this->result($_SERVER['HTTP_REFERER'],0,'排序失败');
            }
        }
    }


    // 修改状态
    public function status(){
        $data=input('param.');
        // dump($data);
        $data['status']=$data['status']=='正常'?0:1;
        // dump($data['status']);die;
        $validate = validate('Category');
        if(!$validate->scene('status')->check($data)){
            $this->error($validate->getError());
        }

        $res=$this->obj->save(['status'=>$data['status']],['id'=>$data['id']]);
        if($res){
            $this->success('状态更新成功');
        }else{
            $this->error('状态更新失败');
        }
    }
}
