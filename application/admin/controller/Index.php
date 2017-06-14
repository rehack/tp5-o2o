<?php
namespace app\admin\controller;
use think\Controller;
use \PHPMailer;
class Index extends Controller
{
    public function index()
    {
        return $this->fetch();
    }

    public function welcome(){
        return "welcome!";
    }

    public function map(){
        // print_r(\Map::getLngLat('四川广元元坝'));die
        return \Map::staticimage('石井铺乡');
    }

    public function testmail(){
        $mail=new PHPMailer;
        dump($mail);
    }

    public function sendmail(){
        $mail=new PHPMailer();
        $body="<h1>这是一封测试邮件^_^！</h1>";
        //设置smtp参数
        $mail->IsSMTP();
        $mail->SMTPDebug = 3;
        $mail->Host = "smtp.163.com";
        $mail->Port = 25;
        $mail->SMTPAuth = true;                               // Enable SMTP authentication
        $mail->Username = 'zb3040@163.com';                 // SMTP username
        $mail->Password = 'bo198874'; //授权码，不是邮箱密码
        $mail->setFrom('zb3040@163.com', 'Rehack');
        $mail->addAddress('565195693@qq.com', 'bo'); //邮件要发送的地址
        $mail->Subject = 'Here is the subject'; //邮件标题
        $mail->AltBody=$body;
        // $mail->WordWrap=50; // set word wrap
        $mail->MsgHTML($body);//邮件正文
        // $mail->Body    = 'This is the HTML message body <b>in bold!</b>';
        // $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

        if(!$mail->send()) {
            echo 'Message could not be sent. <br>';
            echo 'Mailer Error: ' . $mail->ErrorInfo;
        } else {
            echo 'Message has been sent';
        }
    }
}
