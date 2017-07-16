/**
 *
 * @authors Rehack (565195693@qq.com)
 * @date    2017-06-17 22:10:03
 * @version $Id$
 */
// 初始化Web Uploader
// var upload_url=SCOPE.upload_url;
var uploader = WebUploader.create({

    // 选完文件后，是否自动上传。
    auto: false,

    // 文件接收服务端。
    server: urls.upload_url,

    // 选择文件的按钮。可选。
    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
    pick: '#file_upload',

    // 只允许选择图片文件。
    accept: {
        title: 'Images',
        extensions: 'gif,jpg,jpeg,bmp,png',
        mimeTypes: 'image/*'
    }
});


// 当有文件添加进来的时候
uploader.on( 'fileQueued', function( file ) {
    alert(1)
    var $li = $(
            '<div id="' + file.id + '" class="file-item thumbnail">' +
                '<img>' +
                '<div class="info">' + file.name + '</div>' +
            '</div>'
            ),
        $img = $li.find('img');


    // $list为容器jQuery实例
    $list.append( $li );

    // 创建缩略图
    // 如果为非图片文件，可以不用调用此方法。
    // thumbnailWidth x thumbnailHeight 为 100 x 100
    uploader.makeThumb( file, function( error, src ) {
        if ( error ) {
            $img.replaceWith('<span>不能预览</span>');
            return;
        }

        $img.attr( 'src', src );
    }, thumbnailWidth, thumbnailHeight );
});
