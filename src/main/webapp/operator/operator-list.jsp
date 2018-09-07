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
<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="../css/font.css">
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


			

			<form class="layui-form layui-col-md12 x-so" action="operator-list">

				
				<input name="txt" placeholder="请输入姓名" class="layui-input">
				<button class="layui-btn" type="submit">
					<i class="layui-icon">&#xe615;</i>
				</button>
			</form>
		</div>
		<xblock>
	
		<button class="layui-btn" onclick="x_admin_show('添加用户','add','600','530')">
			<i class="layui-icon"></i>添加
		</button>
		<span class="x-right" style="line-height: 40px">共有数据：${requestScope.list.size()}
			条</span> </xblock>
		<table class="layui-table">
			<thead>
				<tr>

				
					<th>用户名</th>
					<th>姓名</th>
					<th>性别</th>
					<th>电话</th>
					<th>权限</th>		
					<th>备注</th>
					<th>状态</th>
					<th>操作</th>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.list}" var="r">
					<tr>
					
				
						<td>${r.nike}</td>
						<td>${r.name}</td>
						<td>${r.sex_Name}</td>
						<td>${r.tel}</td>
						<td>${r.power_Name}</td>						
						<td>${r.comments}</td>						
						<c:if test="${r.status==0}">
						<td class="td-status"><span
							class="layui-btn layui-btn-normal layui-btn-mini">${r.status_Name}</span>
						</td>
						</c:if>
						<c:if test="${r.status==1 }">
						<td class="td-status"><span
							class="layui-btn layui-btn-normal layui-btn-disabled">${r.status_Name}</span>
						</td>
						</c:if>
						
						
						<td class="td-manage"><a onclick="member_stop(this,${r.id})"
							href="javascript:;" title="${r.status}"> <i
								class="layui-icon">&#xe601;</i>
						</a> <a title="编辑" onclick="x_admin_show('编辑','edit?id='+${r.id},'600','530')"
							href="javascript:;"> <i class="layui-icon">&#xe642;</i>
						</a> <a title="删除" onclick="member_del(this,${r.id})"
							href="javascript:;"> <i class="layui-icon">&#xe640;</i>
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="layui-box layui-laypage layui-laypage-default">
			<span class="layui-laypage-skip">
				<button type="button" class="layui-laypage-btn"
					onclick="location.href='operator-list?pageno=${requestScope.search.prev}'">上一页</button>
				<button type="button" class="layui-laypage-btn"
					onclick="location.href='operator-list?pageno=${requestScope.search.next}'">下一页</button>
			</span>
		</div>

	</div>
	<script>

    function delall(){
    	
    		
    		if(confirm("确认删除")){
    			var ids=[];
    			$(".layui-form-checkbox").each(function(){
    				if( $(this).prop("checked")){
    					ids.push($(this).attr("myid"));
    				}
    			});	
    					if(ids.length==0){
    		    			alert("请选择行");
    		    			return ;
    		    		}
    					location.href="deleteall?ids="+ids; 				
    				}
    				
    				}
    				
 
    
    
    
    
  
    function fresh() {
    	location.href="operator-list";
    }
      layui.use('laydate', function(){
        var laydate = layui.laydate;
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
      });

       /*用户-停用*/
      function member_stop(obj, id) {
			layer.confirm('确认要改变吗？', function(index) {
				//发异步把用户状态进行更改
				if ($(obj).attr('title') == '0') {
					$.ajax({
						url : "supdate",
						type : "post",
						data : {
							"status" : "1",
							"id" : id
						},
						success : function(data) {
							if (data.status > 0) {
								$(obj).attr('title', '1')
								$(obj).find('i').html('&#xe62f;');
								$(obj).parents("tr").find(".td-status").find(
										'span').addClass('layui-btn-disabled')
										.html('离职');
								layer.msg('已停用!', {
									icon : 5,
									time : 1000
								});
							}
						}
					})
				} else {
					$.ajax({
						url : "supdate",
						type : "post",
						data : {
							"status" : "0",
							"id" : id
						},
						success : function(data) {
							if (data.status > 0) {
								$(obj).attr('title', '0')
								$(obj).find('i').html('&#xe601;');
								$(obj).parents("tr").find(".td-status").find(
										'span').removeClass(
										'layui-btn-disabled').html('正常');
								layer.msg('已启用!', {
									icon : 5,
									time : 1000
								});
							}
						}
					})
				}

			});
		}

      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(){
              //发异步删除数据
              location.href="delete?id="+id;
              layer.msg('已删除!',{icon:1,time:500});
          });
      }
      



      function delAll (argument) {

          var data = String(tableCheck.getData());
    if(data==""){
    	alert("请选择行");
		return ;
    }
    else{
          layer.confirm('确认要删除吗？'+data,function(index){
              //捉到所有被选中的，发异步进行删除 
              layer.msg('删除成功', {icon: 1});
          	location.href="deleteall?ids="+data;
          });}
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