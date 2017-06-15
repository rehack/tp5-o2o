
/*页面 全屏-添加*/
function o2o_edit(title,url){
    var index = layer.open({
        type: 2,
        title: title,
        content: url
    });
    layer.full(index);
}

/*添加或者编辑缩小的屏幕*/
function o2o_s_edit(title,url,w,h){
    layer_show(title,url,w,h);
}
/*-删除*/
function o2o_del(url){

    layer.confirm('确认要删除吗？',function(index){
        window.location.href=url;
    });
}

// 公用排序方法
$('.listorder input').blur(function(){
    var id=$(this).data('id');
    var listorder=$(this).val();
    // console.log(id+'--'+listorder)
    var postDate={
        'id':id,
        'listorder':listorder
    }
    var url=SOCPE.listorder_url;

    $.ajax({
        url: url,
        type: 'POST',
        dataType: 'json',
        data: postDate,
    })
    .done(function(result) {
        if(result.code==1){
            location.href=result.data;//刷新页面，让排序效果生效
        }else{
            alert(result.msg);
        }
    })
    .fail(function() {
        console.log("error");
    });

})

// 城市二级联动
$(".cityId").change(function(){
    city_id=$(this).val();
    // 发送请求
    url=SCOPE.city_url;
    // alert(url)
    postData={'id':city_id};
    $.ajax({
        url: url,
        type: 'POST',
        dataType: 'json',
        data: postData,
    })
    .done(function(result) {
        if(result.status==1){
            // 将数据填充到html
            data=result.data;
            html_temp='';

            $(data).each(function(i){
                html_temp+=`<option value="${this.id}">${this.name}</option>`;
            });
            $('.se_city_id').html(html_temp);
        }else if(result.status==0){
            alert(result.message);
            return;
        }
    })
    .fail(function() {
        console.log("error");
    });


})
