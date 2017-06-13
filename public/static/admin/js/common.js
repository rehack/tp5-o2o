
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
