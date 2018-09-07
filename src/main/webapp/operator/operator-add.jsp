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
<link rel="stylesheet" href="../css/font.css">
<link rel="stylesheet" href="../css/xadmin.css">
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="../lib/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript" src="../js/xadmin.js"></script>
</head>

<body>
	<div class="x-body">



		<c:if test="${requestScope.info==null}">
			<form class="layui-form" action="insert" method="post">
		</c:if>
		<c:if test="${requestScope.info!=null}">
			<form class="layui-form" action="update" method="post">
				<input type="hidden" name="id" value="${requestScope.info.id}">
		</c:if>
		

		


		<div class="layui-form-item">
			<label for="username" class="layui-form-label"> <span
				class="x-red">*</span>用户名
			</label>
			<div class="layui-input-inline">
				<input type="text" id="nike" name="nike" required=""
					lay-verify="required" autocomplete="off" class="layui-input"
					value="${requestScope.info.nike}">
			</div>
			<div class="layui-form-mid layui-word-aux">
				<span class="x-red">*</span>将会成为您唯一的登入名
			</div>
		</div>
		<div class="layui-form-item">
			<label for="phone" class="layui-form-label"> <span
				class="x-red">*</span>姓名
			</label>
			<div class="layui-input-inline">
				<input type="text" id="name" name="name" autocomplete="off"
					class="layui-input" value="${requestScope.info.name}">
			</div>
		</div>


		<div class="layui-form-item">
			<label for="phone" class="layui-form-label"> <span
				class="x-red">*</span>手机
			</label>
			<div class="layui-input-inline">
				<input type="text" id="tel" name="tel" lay-verify="phone"
					autocomplete="off" class="layui-input"
					value="${requestScope.info.tel}">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label"> <span class="x-red">*</span>性别
			</label>
			<div class="layui-input-inline">
				<select name="sex" class="inputselect">
					<c:forEach items="${requestScope.sexs}" var="r" varStatus="v">
						<c:if test="${requestScope.info.sex!=v.index}">
							<option value="${v.index}">${r}</option>
						</c:if>
						<c:if test="${requestScope.info.sex==v.index}">
							<option selected="selected" value="${v.index}">${r}</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label"> <span class="x-red">*</span>权限：
			</label>
			<div class="layui-input-inline">
				<select name="power">
					<c:forEach items="${requestScope.powers}" var="r" varStatus="v">

						<c:if test="${requestScope.info.power!=v.index}">
							<option value="${v.index}">${r}</option>
						</c:if>
						<c:if test="${requestScope.info.power==v.index}">
							<option selected="selected" value="${v.index}">${r}</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
		</div>
		<c:if test="${requestScope.info==null}">
			<div class="layui-form-item">
				<label for="L_pass" class="layui-form-label"> <span
					class="x-red">*</span>密码
				</label>
				<div class="layui-input-inline">
					<input type="password" id="L_pass" name="password"
						lay-verify="pass" autocomplete="off" class="layui-input"
						value="123456">
				</div>
				<div class="layui-form-mid layui-word-aux">6到16个字符（默认为123456）</div>
			</div>
		</c:if>
		<c:if test="${requestScope.info!=null}">
			<div class="layui-form-item" style="display: none">
				<label for="L_pass" class="layui-form-label"> <span
					class="x-red">*</span>密码
				</label>
				<div class="layui-input-inline">
					<input type="password" id="L_pass" name="password"
						lay-verify="pass" autocomplete="off" class="layui-input"
						value="${requestScope.info.password}">
				</div>
				<div class="layui-form-mid layui-word-aux">6到16个字符（默认为123456）</div>
			</div>
		</c:if>

		<div class="layui-form-item">
			<label for="phone" class="layui-form-label"> <span
				class="x-red">*</span>备注
			</label>
			<div class="layui-input-inline">
				<input type="text" id="phone" name="comments" autocomplete="off"
					class="layui-input" value="${requestScope.info.comments}">
			</div>
		</div>

		<div class="layui-form-item">
			<label for="L_repass" class="layui-form-label"> </label>
			<button class="layui-btn" type="button" onclick="save()">保存</button>
		</div>
		</form>
	</div>
	<script>
		function save() {
			$.post($(".layui-form").attr("action"), $(".layui-form")
					.serialize(), function(json) {
				if (json.status > 0) {
				
					parent.fresh();
					var index = parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);

				} else {
					alert(json.text);
				}
			}, "json");
		}
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

			//监听提交
			form.on('submit(add)', function(data) {
				console.log(data);
				//发异步，把数据提交给php
				layer.alert("增加成功", {
					icon : 6
				}, function() {

					// 获得frame索引
					var index = parent.layer.getFrameIndex(window.name);
					//关闭当前frame
					parent.layer.close(index);
				});
				return false;
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