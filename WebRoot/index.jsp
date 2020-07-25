<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-cn" >
<head>
<meta charset="utf-8" />
<meta HTTP-EQUIV="pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<meta HTTP-EQUIV="expires" CONTENT="0">
<meta name="apple-touch-fullscreen" content="yes" />
<meta name="format-detection" content="telephone=no" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0 user-scalable=no" media="screen" />
<meta name="keywords" content="free mobile website templates, free mobile website template, free iphone template, free android template, free high end touch mobile templates, free high end touch mobile template" />
<meta name="description" content="Get free mobile website templates for Iphone , Android and High end touch mobile devices" />
<title>自动问答系统</title>
<style type="text/css">
	body{background:url(images/yuyin_bg.png) no-repeat;background-size:100%;}
	@media all and (min-width: 640px) {
	    body,html,.wenwen-footer,.speak_window{width:640px!important;margin:-10 auto}
	    .speak_window,.wenwen-footer{left:50%!important;margin-left:-320px}
	}
	input,button{outline:none;}
	.wenwen-footer{width:100%;position:fixed;bottom:-5px;left:0;background:#fff;padding:3%;border-top:solid 1px #ddd;box-sizing:border-box;}
	.wenwen_btn,.wenwen_help{width:15%;text-align:center;}
	.wenwen_btn img,.wenwen_help img{height:40px;}
	.wenwen_text{height:40px;border-radius:5px;border:solid 1px #636162;box-sizing:border-box;width:66%;text-align:center;overflow:hidden;margin-left:2%;}
	.circle-button{padding:0 5px;}
	.wenwen_text .circle-button{font-size:14px;color:#666;line-height:38px;}
	.write_box{background:#fff;width:100%;height:40px;line-height:40px;display:none;}
	.write_box input{height:40px;padding:0 5px;line-height:40px;width:100%;box-sizing:border-box;border:0;}
	.wenwen_help button{width:95%;background:#42929d;color:#fff;border-radius:5px;border:0;height:40px;display:none;}
	#wenwen{height:100%;}
	.speak_window{overflow-y:scroll;height:100%;width:100%;position:fixed;top:0;left:0;}
	.speak_box{margin-bottom:70px;padding:10px;}
	.question,.answer{margin-bottom:1rem;}
	.question{text-align:right;}
	.question>div{display:inline-block;}
	.left{float:left;}
	.right{float:right;}
	.clear{clear:both;}
	.heard_img{height:60px;width:60px;border-radius:5px;overflow:hidden;background:#ddd;}
	.heard_img img{width:100%;height:100%}
	.question_text,.answer_text{box-sizing:border-box;position:relative;display:table-cell;min-height:60px;}
	.question_text{padding-right:20px;}
	.answer_text{padding-left:20px;}
	.question_text p,.answer_text p{border-radius:10px;padding:.5rem;margin:0;font-size:14px;line-height:28px;box-sizing:border-box;vertical-align:middle;display:table-cell;height:60px;word-wrap:break-word;}
	.answer_text p{background:#fff;}
	.question_text p{background:#42929d;color:#fff;text-align:left;}
	.question_text i,.answer_text i{width:0;height:0;border-top:5px solid transparent;border-bottom:5px solid transparent;position:absolute;top:25px;}
	.answer_text i{border-right:10px solid #fff;left:10px;}
	.question_text i{border-left:10px solid #42929d;right:10px;}
	.answer_text p a{color:#42929d;display:inline-block;}
	audio{display:none;}
	.saying{position:fixed;bottom:30%;left:50%;width:120px;margin-left:-60px;display:none;}
	.saying img{width:100%;}
	.write_list{position:absolute;left:0;width:100%;background:#fff;border-top:solid 1px #ddd;padding:5px;line-height:30px;}
</style>
</head>
<body>
<div class="speak_window">
	<div class="speak_box">
		<div class="answer">
			<div class="heard_img left"><img src="images/dglvyou1.jpg"></div>
			<div class="answer_text">
				<p>Hey，你可以向我提问或者聊天哦！</p>
				<i></i>
			</div>
		</div>
	</div>
</div>


<div class="wenwen-footer">
	<div class="wenwen_btn left" onClick="to_write()"><img src="images/jp_btn.png"></div>
	<div class="wenwen_text left">
	    <div class="write_box">
	        <input type="text" class="left"  name="qu" onKeyUp="keyup()" placeholder="比如：中国首都在哪？" />
	    </div>  
	    <div class="circle-button" id="a">
	          按住说话
	    </div>
	    <h3 id="iat_result" style="display: none"></h3>
	    <div id="canvas_wrapper" style="display:none">
            <canvas id="volume" height="4"></canvas>
        </div>
	</div>
	
	<div class="wenwen_help right">
	    <a href="http://www.tuling123.com/experience/exp_virtual_robot.jhtml?nav=exp">
	        <img src="images/help_btn.png">
	    </a>
	    <button onClick="up_say()" class="right" id="send_btn">发送</button>
	</div>
	
	<div style="opacity:0;" class="clear"></div>
</div>

<script>
        onerror=function(a,b,c){
            alert(a+b+c);
        }
    </script>
	<script type="text/javascript" src='./js/fingerprint2.min.js'></script>
	<script type="text/javascript" src="./js/iat.all.js"></script>
	<script type="text/javascript" src="./js/demo.js"></script>
	
    <script type="text/javascript" src="./js/fingerprint.js"></script>
    <script type="text/javascript" src="./js/tts.min.js"></script>
    <script type="text/javascript" src="./js/tts_demo.js"></script>
    
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
//语音转文字
function to_write(){
	    $('.wenwen_btn img').attr('src','images/yy_btn.png');
	    $('.wenwen_btn').attr('onclick','to_say()');
	    $('.write_box,.wenwen_help button').show();
	    $('.circle-button,.wenwen_help a').hide();
	    $('.write_box input').focus();
	    for_bottom();
	}

	function to_say(){
		$('.write_list').remove();
	    $('.wenwen_btn img').attr('src','images/jp_btn.png');
	    $('.wenwen_btn').attr('onclick','to_write()');
	    $('.write_box,.wenwen_help button').hide();
	    $('.circle-button,.wenwen_help a').show();
	}
//发送按钮
	function up_say(voiceText){
	
	    var text,str;
	    text=(voiceText===undefined)?$('.write_box input').val():voiceText,
	
		$('.write_list').remove();
	    str  = '<div class="question">';
	    str += '<div class="heard_img right"><img src="images/dglvyou.jpg"/></div>';
	    str += '<div class="question_text clear"><p>'+text+'</p><i></i>';
	    str += '</div></div>';

	    if(text == ''){
	        alert('请输入提问！');
	        $('.write_box input').focus();
	    }else{
	        $('.speak_box').append(str);
	        $('.write_box input').val('');
	        $('.write_box input').focus();
	        autoWidth();
	        for_bottom();
	        
	        
	        
	        /* 最后编辑于 2017年4月23日 22:17:04 */
	        
	         $.ajax({
                url: "Qa",
                data: {
                	question:text,
                  
                },
                dataType: 'json',
                type: 'get',
                success: function (resp) {

         
                	var ans  = '<div class="answer"><div class="heard_img left"><img src="images/dglvyou1.jpg"/></div>';
 	            	ans += '<div class="answer_text"><p>'+resp.text+'</p><i></i>';
 	        		ans += '</div></div>';
 	        		
 	        		play(resp.text, 'vixyun');
 	        		
 	        		$('.speak_box').append(ans);
 					for_bottom();
                    
                }
	         });
	         
	    }
	}
//输入文字预显示
	function keyup(){
		var footer_height = $('.wenwen-footer').outerHeight(),
			text = $('.write_box input').val(),
			str = '<div class="write_list">'+text+'</div>';
		if (text == '' || text == undefined){
			$('.write_list').remove();
		}else{
			$('.wenwen-footer').append(str);
			$('.write_list').css('bottom',footer_height);
		}
	}
	
	
//语音按住说话
	var wen = document.getElementById("a");
	function _touch_start(event){
        event.preventDefault();
        $('.wenwen_text').css('background','#c1c1c1');
        $('.wenwen_text span').css('color','#fff');
    }

    function _touch_end(event){
        event.preventDefault();
        $('.wenwen_text').css('background','#fff');
        $('.wenwen_text .circle-button').css('color','#666');    
        
        var text = $("#iat_result").text(),
            str  = '<div class="question">';
	        str += '<div class="heard_img right"><img src="images/dglvyou.jpg"/></div>';
	        str += '<div class="question_text clear"><p>'+text+'</p><i></i>';
	        str += '</div></div>';
		$('.speak_box').append(str);
		for_bottom();
        
        setTimeout(function(){
        	var ans  = '<div class="answer"><div class="heard_img left"><img src="images/dglvyou1.jpg"/></div>';
	        	ans += '<div class="answer_text"><p>我不知道你在说什么?</p><i></i>';
	    		ans += '</div></div>';
	    	$('.speak_box').append(ans);
			for_bottom();
        },1000);       
    }

    wen.addEventListener("touchstart", _touch_start, false);
    wen.addEventListener("touchend", _touch_end, false);
    
    function for_bottom(){
		var speak_height = $('.speak_box').height();
		$('.speak_box,.speak_window').animate({scrollTop:speak_height},500);
	}
	
	function autoWidth(){
		$('.question_text').css('max-width',$('.question').width()-60);
	}
	autoWidth();
</script>
</body>
</html>

