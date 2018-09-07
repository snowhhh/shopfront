﻿<%@ page language="java" pageEncoding="utf-8"  isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row">
      
      
     <form action="">
     <select class="layui-hide-sm"  style="display: block;">
     </select>
     </form> 
        <form class="layui-form layui-col-md12 x-so"  action="product-list">
          <input name="txt"  placeholder="请输入商品名" class="layui-input">
          <button class="layui-btn"  type="submit"><i class="layui-icon">&#xe615;</i></button>
        </form>
      </div>
      <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="x_admin_show('添加用户','add')"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：${requestScope.list.size()} 条</span>
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>图片</th>        
            <th>商品名</th>
            <th>商品类型</th>      
            <th>原价格</th>
            <th>现价格</th>
            <th>销量</th>
            <th>优先级</th>
            <th>状态</th>
            <th>操作</th>
        </thead>
        <tbody>
          <c:forEach items="${requestScope.list}" var="r">
		<tr>
		<td>
              <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='${r.id}' ><i class="layui-icon">&#xe605;</i></div>
            </td>
            
            
            <td>
					<c:if test="${r.pic!=null}">
					<img src="${r.pic}" width="60" height="90"/>
					</c:if>
					</td>      		
			<td>${r.fullname}</td>
			<td>${r.tname}</td>		
			<td>${r.price}</td>
			<td>${r.nowprice}</td>
			<td>${r.salecount}</td>
			<td>${r.priority_Name}</td>
			<td>${r.status_Name}</td>				
			<td class="td-manage"> 
              <a title="编辑"  onclick="x_admin_show('编辑','edit?id='+${r.id})" href="javascript:;">
                <i class="layui-icon">&#xe642;</i>
              </a>
              <a title="删除" onclick="member_del(this,${r.id})"  href="javascript:;">
                <i class="layui-icon">&#xe640;</i>
              </a>
            </td>
		</tr>
		</c:forEach>
        </tbody>
      </table>
      
      
      
      <div class="layui-box layui-laypage layui-laypage-default" >
			<span class="layui-laypage-skip">
			<button type="button" class="layui-laypage-btn" onclick="location.href='product-list?pageno=${requestScope.search.prev}'" >上一页</button>
			<button type="button" class="layui-laypage-btn" onclick="location.href='product-list?pageno=${requestScope.search.next}'">下一页</button>
			</span>
				</div>
      
  

    </div>
    <script>

    function delall(){
    	if(confirm("确认删除")){
    		var ids=[];
    			$(".layui-unselect layui-form-checkbox").each(function(){
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
    	location.href="product-list";
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

    
    
      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(){
              //发异步删除数据
              location.href="delete?id="+id;
              layer.msg('已删除!',{icon:1,time:2000});
          });
      }
      



      function delAll (argument) {

          var data = String(tableCheck.getData());
    
          layer.confirm('确认要删除吗？'+data,function(index){
              //捉到所有被选中的，发异步进行删除 
              layer.msg('删除成功', {icon: 1});
          	location.href="deleteall?ids="+data;
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