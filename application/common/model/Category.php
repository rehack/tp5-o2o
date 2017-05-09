<?php
namespace app\common\model;
use think\Model;

class Category extends Model{
    protected $autoWriteTimestamp=true;//开启自动写入时间戳

    public function add($data){
        $data['status']=1;
        // $data['create_time']=time();
        return $this->save($data);
    }

    // 获取一级栏目
    public function getNomalFirstCategory(){
        $data=[
            'status'=>1,
            'parent_id'=>0
        ];

        $order=[
            'id'=>'desc'
        ];

        return $this->where($data)
            ->order($order)
            ->select();
    }

    public function getFirstCategory(){

    }
}
