<%@ page language="java" pageEncoding="utf-8"  isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../js/xadmin.js"></script>
    
    
    <script type="text/javascript" charset="utf-8" src="../uediter/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../uediter/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="../uediter/lang/zh-cn/zh-cn.js"></script>
    
    
    
    
    <link rel="stylesheet" href="../lib/layui/css/edit.css">
<script type="text/javascript" src="../fileupload/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="../fileupload/css/font-awesome.min.css">
<script type="text/javascript" src="../fileupload/js/piclist.js"></script>
    
    
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
    <c:if test="${requestScope.info==null}">
			<form class="layui-form" action="insert" method="post">
		</c:if>
		<c:if test="${requestScope.info!=null}">
			<form class="layui-form" action="update" method="post">
				<input type="hidden" name="id" value="${requestScope.info.id}">
		</c:if>
 
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>商品名
              </label>
              <div class="layui-input-inline">
                  <input type="text"  name="fullname" autocomplete="on" class="layui-input" value="${requestScope.info.fullname}">
              </div>
         
              <label for="username" class="layui-form-label" >
                  <span class="x-red">*</span>原价格
              </label>
              <div class="layui-input-inline">
                  <input type="text"  name="price" autocomplete="on" class="layui-input" value="${requestScope.info.price}">
              </div>
          
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>现价格
              </label>
              <div class="layui-input-inline">
                  <input type="text"  name="nowprice" autocomplete="on" class="layui-input" value="${requestScope.info.nowprice}">
              </div>
          </div>
         
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>活动
              </label>
              <div class="layui-input-inline">
                  <input type="text"  name="activity" autocomplete="on" class="layui-input" value="${requestScope.info.activity}">
              </div>
         
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>提示信息
              </label>
              <div class="layui-input-inline">
                  <input type="text"  name="tip" autocomplete="on" class="layui-input" value="${requestScope.info.tip}">
              </div>
          
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>促销信息
              </label>
              <div class="layui-input-inline">
                  <input type="text"  name="sale" autocomplete="on" class="layui-input" value="${requestScope.info.sale}">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>商品类型
              </label>
              <div class="layui-input-inline">
                 
           <select name="type_id" class="inputselect" >
				<c:forEach items="${requestScope.typerow}" var="r" >
				<c:if test="${requestScope.info.type_id!=r.id}">
					<option value="${r.id}">${r.name}</option>
				</c:if>
					<c:if test="${requestScope.info.type_id==r.id}">
					<option selected="selected" value="${r.id}">${r.name}</option>
				</c:if>
			</c:forEach>
			</select>
              </div>
      
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>优先级
              </label>
              <div class="layui-input-inline">
                  <select name="priority" class="inputselect">
					<c:forEach items="${requestScope.prioritys}" var="r" varStatus="v">
						<c:if test="${requestScope.info.priority!=v.index}">
							<option value="${v.index}">${r}</option>
						</c:if>
						<c:if test="${requestScope.info.priority==v.index}">
							<option selected="selected" value="${v.index}">${r}</option>
						</c:if>
					</c:forEach>
				</select>
              </div>
        
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>状态
              </label>
              <div class="layui-input-inline">
                 <select name="status" class="inputselect">
					<c:forEach items="${requestScope.statuss}" var="r" varStatus="v">
						<c:if test="${requestScope.info.status!=v.index}">
							<option value="${v.index}">${r}</option>
						</c:if>
						<c:if test="${requestScope.info.status==v.index}">
							<option selected="selected" value="${v.index}">${r}</option>
						</c:if>
					</c:forEach>
				</select>
              </div>
          </div>
           
          
          <span class="inputspan"> 
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>图片
              </label>
              <div class="picList" name="pics"  width="300"  height="200+" rows="2" cols="5" >
				<c:forEach items="${requestScope.info.piclist}" var="p">
				<item url="${p}" >
				</c:forEach>
			</div>
			</span>
          </div>

          
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>详情
              </label>
              <div class="layui-input-inline">
             
               <script id="editor" type="text/plain" style="width:700px;height:400px;" name="info">${requestScope.info.info}</script>
 
              <!--  
                 <textarea  name="info" style="height: 160px;width: 700px">
                  </textarea>  --> 
              </div>
          </div>
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>备注
              </label>
              <div class="layui-input-inline">
                  <textarea   name="comments"  style="height: 160px;width: 700px" >
                  ${requestScope.info.comments}
                  </textarea>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button  class="layui-btn" type="button" onclick="save()">
                  保存
              </button>
          </div>
      </form>
    </div>
    <script>
    var ue = UE.getEditor('editor');

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
    </script>
    <script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();</script>
  </body>

</html>