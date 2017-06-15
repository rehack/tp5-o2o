<?php
/**
 * 百度地图相关业务封装
 *
 */

class Map{
    /**
     * 根据地址来获取经纬度
     * @param  [type] $address [中文地址]
     * @return [type]          [description]
     */
    public static function getLngLat($address){
        /**
         * Geocoding API 地址和经纬度坐标互转
         * http://api.map.baidu.com/geocoder/v2/?callback=renderOption&output=json&address=百度大厦&city=北京市&ak=您的ak
         */

        if(!$address){
            return '';
        }
        $data=[
            'address'=>$address,
            'ak'=>config('map.ak'),
            'output'=>'json'
        ];

        $url=config('map.baidu_map_url').config('map.api_key1').'?'.http_build_query($data);

        // 获取url的内容1.file_get_contents($url) 2.封装curl
        //
        $result=doCurl($url);
        // dump($result);
        return $result;
    }


    /**
     * 根据经纬度获取静态地图图片
     * @param  [type] $center [经纬度坐标： lng<经度>，lat<纬度>]
     * @return [type]         [description]
     */
    public static function staticimage($center){
        /**
         * 静态图API 将经纬度转换成位置图片
         * http://api.map.baidu.com/staticimage/v2?ak=E4805d16520de693a3fe707cdc962045&mcode=666666&center=116.403874,39.914888&width=300&height=200&zoom=11
         */

        if(!$center){
            return '';
        }

        $data=[
            'ak'=>config('map.ak'),
            'width'=>config('map.width'),
            'height'=>config('map.height'),
            'center'=>$center,
            'markers'=>$center,
        ];

        $url=config('map.baidu_map_url').config('map.api_key2').'?'.http_build_query($data);

        //
        $result=doCurl($url);
        // dump($result);
        return $result;
    }
}