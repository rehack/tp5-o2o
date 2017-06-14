<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

/**
 * [doCurl 封装curl]
 * @param  [type]  $url  [description]
 * @param  integer $type [0 get,1 post]
 * @param  array   $data [description]
 * @return [type]        [description]
 */
function doCurl($url,$type=0,$data=[]){
    // 初始化
    $ch=curl_init();

    // 设置选项
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_HEADER, 0);

    if($type==1){
        // post
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
    }

    // 执行并获取内容
    $output=curl_exec($ch);
    // 释放curl句柄
    curl_close($ch);
    return $output;
}