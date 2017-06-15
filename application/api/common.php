<?php
// 自定义api返回数据格式
function show($status, $message='', $data=[]){
    return [
        'status'=>$status,
        'message'=>$message,
        'data'=>$data,
    ];
}
