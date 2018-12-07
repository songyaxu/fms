<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>转发文件-档案管理系统</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<link rel="icon" href="${pageContext.request.contextPath}/assets/images/icon/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css" />
<script src="${pageContext.request.contextPath}/assets/javascript/jquery.js"></script>
<script src="${pageContext.request.contextPath}/assets/javascript/plug-ins/customScrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/javascript/plug-ins/echarts.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/javascript/plug-ins/layerUi/layer.js"></script>
<script src="${pageContext.request.contextPath}/assets/editor/ueditor.config.js"></script>
<script src="${pageContext.request.contextPath}/assets/editor/ueditor.all.js"></script>
<script src="${pageContext.request.contextPath}/assets/javascript/plug-ins/pagination.js"></script>
<script src="${pageContext.request.contextPath}/assets/javascript/public.js"></script>
</head>
<body>
<div class="main-wrap">
	<div class="side-nav">
		<div class="side-logo">
			<div class="logo">
				<span class="logo-ico">
					<i class="i-l-1"></i>
					<i class="i-l-2"></i>
					<i class="i-l-3"></i>
				</span>
				<strong>档案管理系统</strong>
			</div>
		</div>
		
				<nav class="side-menu content mCustomScrollbar" data-mcs-theme="minimal-dark">
			<h2>
				<a href="${pageContext.request.contextPath}/user/index" class="InitialPage"><i class="icon-dashboard"></i>数据概况</a>
			</h2>
			<ul>
				<li>
					<dl>
						<dt>
							<i class="icon-columns"></i>用户管理<i class="icon-angle-right"></i>
						</dt>
						<c:if test="${user.power eq 1}">
							<dd>
								<a href="${pageContext.request.contextPath}/user/init">新增</a>
							</dd>
						</c:if>
						<dd>
							<a href="${pageContext.request.contextPath}/user/list/0">查看</a>
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>
							<i class="icon-inbox"></i>档案管理<i class="icon-angle-right"></i>
						</dt>
						<dd>
							<a href="${pageContext.request.contextPath}/doc/init">新增文件</a>
						</dd>
						<dd>
							<a href="${pageContext.request.contextPath}/doc/list/0">查看文件</a>
						</dd>
						<c:if test="${user.typeId eq 1 or user.typeId eq 6}">
							<dd>
								<a href="${pageContext.request.contextPath}/doc/list2/0">审批文件</a>
							</dd>
						</c:if>
					</dl>
				</li>
				
			</ul>
		</nav>
		<footer class="side-footer">© imu.end.cn 版权所有</footer>
	</div>
	<div class="content-wrap">
		<header class="top-hd">
			<div class="hd-lt">
				<a class="icon-reorder"></a>
			</div>
			<div class="hd-rt">
				<ul>
					<li>
						<a><i class="icon-user"></i>${user.userType}:<em>${user.name }</em></a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/user/logout" id="JsSignOut"><i class="icon-signout"></i>安全退出</a>
					</li>
				</ul>
			</div>
		</header>
		<main class="main-cont content mCustomScrollbar">
			<div class="page-wrap">
				<!--开始::内容-->
				<section class="page-hd">
					<header>
						<h2 class="title">转发文件-${temp.title }</h2>
						<p class="title-description">
							文件可以被转发多次，每次转发文件都会留下转发的备注信息。
						</p>
					</header>
					<hr>
				</section>
				<form id= "uploadForm">
				<div class="form-group-col-2">
					<div class="form-label">档案标题：</div>
					<div class="form-cont">
						<input type="text" class="form-control form-boxed" id="title" name="title" value="${temp.title }" readonly="readonly">
					</div>
				</div>
				<div class="form-group-col-2">
					<div class="form-label">上传到：</div>
					<div class="form-cont">
						<c:if test="${user.typeId != 1 and enable.level1!=1}">
							<label class="check-box">
								<input type="checkbox" name="mmm" value="1"/>
								<span>学院党总支</span>
							</label>
						</c:if>
						<c:if test="${user.typeId != 2 and enable.level2!=1 and enable.level6!=1}">
							<label class="check-box">
								<input type="checkbox" name="mmm" value="2"/>
								<span>教工一支部</span>
							</label>
						</c:if>
						<c:if test="${user.typeId != 3 and enable.level3!=1 and enable.level6!=1}">
							<label class="check-box">
								<input type="checkbox" name="mmm" value="3"/>
								<span>教工二支部</span>
							</label>
						</c:if>
						<c:if test="${user.typeId != 4 and enable.level4!=1 and enable.level6!=1}">
							<label class="check-box">
								<input type="checkbox" name="mmm" value="4"/>
								<span>研究生支部</span>
							</label>
						</c:if>
						<c:if test="${user.typeId != 5 and enable.level5!=1 and enable.level6!=1}">
							<label class="check-box">
								<input type="checkbox" name="mmm" value="5"/>
								<span>本科生支部</span>
							</label>
						</c:if>
						<c:if test="${user.typeId != 6 and user.typeId eq 1 and enable.level6!=1}">
							<label class="check-box">
								<input type="checkbox" name="mmm" value="6"/>
								<span>学校党总支</span>
							</label>
						</c:if>
					</div>
				</div>
				<div class="form-group-col-2">
					<div class="form-label">转发备注：</div>
					<div class="form-cont">
						<textarea class="form-control form-boxed" id="remark" name="remark"></textarea>
					</div>
				</div>
				<div class="form-group-col-2">
					<div class="form-label"></div>
					<div class="form-cont">
						<input type="button" class="btn btn-primary" value="转发" onclick="transferDoc(${temp.serial})"/>
						<input type="reset" class="btn btn-info" value="重置" />
					</div>
				</div>
				</form>
				<!--开始::结束-->
			</div>
		</main>
		<footer class="btm-ft">
			<p class="clear">
				<span class="fl">©Copyright 2018 <a href="http://www.imu.edu.cn" title="imu.edu.cn" target="_blank">imu.edu.cn</a></span>
				<span class="fr text-info">
					<em class="uppercase">
						<i class="icon-user"></i>
						author:baixueliang
					</em> | 
					<em class="uppercase"><i class="icon-envelope-alt"></i>
						首页： <a href="${pageContext.request.contextPath}/user/index" target="_blank">首页</a>
					</em>
				</span>
			</p>
		</footer>
	</div>
</div>

<script type="text/javascript">  
		function transferDoc(id) {  
			 var remark=$("#remark").val();
			 var to=$("#to").val();
			 if(remark==="")
			 {
				 layer.msg("备注信息不能为空", {icon: 5});
				 return;
			 }
			 var formData = new FormData($( "#uploadForm" )[0]);  
		     $.ajax({  
		          url: "${pageContext.request.contextPath}/doc/transfer/"+id,  
		          type: 'POST',  
		          data: formData,  
		          async: false,  
		          cache: false,  
		          contentType: false,  
		          processData: false,  
		          success: function (data) {  
		        	  if(data.code==1)
		        	  {
		        		  layer.msg(data.message, {icon: 1});
		        		  clr();
		        	  }
		        	  else{
		        		  layer.msg(data.message, {icon: 5});
		        	  }
		          },  
		          error: function (returndata) {  
		        	  layer.msg(data.message, {icon: 5});
		          }  
		     });
		}
		function clr(){
			$("#remark").val("");
		}
	</script>  
</body>
</html>
