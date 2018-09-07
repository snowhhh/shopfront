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
<link rel="stylesheet" href="../css/f 0ont.css">
<link rel="stylesheet" href="../css/xadmin.css">
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="../lib/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript" src="../js/xadmin.js"></script>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a href="">首页</a> <a href="">演示</a>
			<a> <cite>导航元素</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="javascript:location.replace(location.href);" title="刷新"> <i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
	<div class="x-body">
		<div class="layui-row">

			<form class="layui-form layui-col-md12 x-so layui-form-pane">
				<blockquote class="layui-elem-quote">
					上级:<label>${requestScope.path}</label>
					
				</blockquote>
				 
				<label><a href="type_list?parentid=${requestScope.myparentid}">${requestScope.parentname}</a></lable>
				<input class="layui-input" placeholder="分类名"
					name="name">
					<input class="layui-hide" 
					name="parentid" value="${requestScope.parentid}">
				<button class="layui-btn" lay-submit="" lay-filter="sreach" >
					<i class="layui-icon"></i>增加
				</button>
				</form>
	<!-- 		<button class="layui-btn" style="float: right;" href="type_list?parentid="+${requestScope.id}>
					<i class="layui-icon">&#xe65c;</i>返回上级
				</button>	  -->	
		</div>
		<span class="x-right" style="line-height: 40px">共有数据：${requestScope.list.size()} 条</span>
		</xblock>
		<table class="layui-table layui-form">
			<thead>
				<tr>

					<th>栏目名</th>
					<th width="220">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.list}" var="r">
					<tr>
						<td>${r.name}</td>
						<td class="td-manage"><a href="type_list?parentid=${r.id}" title=""> <i class="layui-icon">&#xe601;</i>
						</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a title="编辑" onclick="x_admin_show('编辑','edit?id='+${r.id},'400','200')"
							href="javascript:;"> <i class="layui-icon">&#xe642;</i>
						</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a title="删除" onclick="member_del(this,${r.id})"
							href="javascript:;"> <i class="layui-icon">&#xe640;</i>
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<style type="text/css">
</style>
	<script>
      layui.use(['form'], function(){
        form = layui.form;
        form.on('submit(sreach)',function(data){
        	$.post("insert",data.field,function(res){ 
        	});	
        });
      });

      function fresh() {
      	location.href="type_list";
      }
      

      /*用户-删除*/

      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(){
              //发异步删除数据
              location.href="delete?id="+id;
              layer.msg('已删除!',{icon:1,time:500}); 
          });
      }
      


    </script>
	<script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();</script>
</body>

</html>