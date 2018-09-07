<%@ page language="java" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>欢迎页面-X-admin2.0</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/xadmin.css">
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript" src="js/xadmin.js"></script>
</head>

<body>
	<div class="x-body">
		

		<form >


		<div class="layui-form-item">
			<label for="username" class="layui-form-label"> <span
				class="x-red">*</span>原密码
			</label>
			<div class="layui-input-inline">
				<input type="password" id="pass" name="nike" 
					 autocomplete="off"  class="layui-input">
			</div>
			
		</div>
		<div class="layui-form-item">
			<label for="phone" class="layui-form-label"> <span
				class="x-red">*</span>新密码
			</label>
			<div class="layui-input-inline">
				<input type="password"  name="name" autocomplete="off" id="newpass" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label for="phone" class="layui-form-label"> <span
				class="x-red">*</span>再次输入
			</label>
			<div class="layui-input-inline">
				<input type="password"  name="tel"
					autocomplete="off" class="layui-input" id="newpass2">
			</div>
		</div>
		<div class="layui-form-item">
			<label for="L_repass" class="layui-form-label"> </label>
			<button class="layui-btn" type="button" id="pedit" passs="${olist.password}" myid="${olist.id}">修改</button>
		</div>
		</form>
	</div>
	<script>
	
		$("#pedit").on("click",function(){
			var pass=$("#pedit").attr("passs");
			var myid=$("#pedit").attr("myid");
			var newpass=$("#newpass").val();
			if($("#pass").val()==pass){
				if($("#newpass").val()==$("#newpass2").val()){
					$.post("editpass",{password:newpass,id:myid},function(json){
						alert(json.text);
						var index = parent.layer.getFrameIndex(window.name);
						parent.layer.close(index);
					});
				}else{
					alert("两次输入密码不一致");
				}
			}else{
				alert("原密码错误");
			}
			
			
		});
		
		
		
		
		layui.use([ 'form', 'layer' ], function() {
			$ = layui.jquery;
			var form = layui.form, layer = layui.layer;

			//自定义验证规则
			form.verify({
				nikename : function(value) {
					if (value.length < 5) {
						return '昵称至少得5个字符啊';
					}
				},
				pass : [ /(.+){6,12}$/, '密码必须6到12位' ],
				repass : function(value) {
					if ($('#L_pass').val() != $('#L_repass').val()) {
						return '两次密码不一致';
					}
				}
			});
		});
	</script>
	<script>
		var _hmt = _hmt || [];
		(function() {
			var hm = document.createElement("script");
			hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
			var s = document.getElementsByTagName("script")[0];
			s.parentNode.insertBefore(hm, s);
		})();
	</script>
</body>

</html>