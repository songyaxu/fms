<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>档案详情-档案管理系统</title>
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
						<h2 class="title">档案-${doc.title}</h2>
						<p class="title-description">
							档案的基本信息。
						</p>
					</header>
					<hr>
				</section>
				<form id= "uploadForm">
				<div class="form-group-col-2">
					<div class="form-label">档案标题：</div>
					<div class="form-cont">
						<input type="text" class="form-control form-boxed" id="title" name="title" value="${doc.title }" readonly="readonly">
					</div>
				</div>
				<div class="form-group-col-2">
					<div class="form-label">档案描述：</div>
					<div class="form-cont">
						<input type="text"  class="form-control form-boxed" style="width:300px;" id="content" name="content" value="${doc.content }" readonly="readonly">
					</div>
				</div>
				<div class="form-group-col-2">
					<div class="form-label">档案备注：</div>
					<div class="form-cont">
						<input type="text"  class="form-control form-boxed" id="remark" name="remark" value="${doc.remark }" readonly="readonly">
					</div>		
				</div>
				<div class="form-group-col-2">
					<div class="form-label">文件级别：</div>
					<div class="form-cont">
						<input type="text" class="form-control form-boxed" id="remark" name="remark" value="${doc.crypticClassStr }" readonly="readonly">
					</div>	
				</div>
				<div class="form-group-col-2">
					<div class="form-label">从：</div>
					<div class="form-cont">
						<input type="text"  class="form-control form-boxed"  value="${doc.fromStr }" readonly="readonly">
					</div>		
				</div>
				<div class="form-group-col-2">
					<div class="form-label">到：</div>
					<div class="form-cont">
						<input type="text"  class="form-control form-boxed"  value="${doc.toListStr }" readonly="readonly">
					</div>		
				</div>
				<div class="form-group-col-2">
					<div class="form-label">签发时间：</div>
					<div class="form-cont">
						<input type="text"  class="form-control form-boxed"  value="${doc.dateTime }" readonly="readonly">
					</div>		
				</div>
				<div class="form-group-col-2">
					<div class="form-label">使用范围：</div>
					<div class="form-cont">
						<textarea class="form-control form-boxed" id="applyScope" name="applyScope" readonly="readonly">${doc.applyScope }</textarea>
					</div>
				</div>
				<div class="form-group-col-2">
					<div class="form-label">文件号：</div>
					<div class="form-cont">
						<input type="text"  class="form-control form-boxed" id="fileNo" name="fileNo" value="${doc.fileNo }" readonly="readonly">
					</div>
				</div>
				<div class="form-group-col-2">
					<div class="form-label">文件口令：</div>
					<div class="form-cont">
						<input type="text" class="form-control form-boxed" id="filePassword" name="filePassword" value="${doc.filePassword }" readonly="readonly">
					</div>
				</div>
				<div class="form-group-col-2">
					<div class="form-label"></div>
					<div class="form-cont">
						<input type="button" class="btn btn-info" value="文件下载" onclick="downloadDoc(${doc.serial})"/>
						<c:if test="${ res eq 0}">
							<input type="button" class="btn btn-info" value="转发" onclick="transferDoc(${doc.serial})"/>
						</c:if>
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
		function downloadDoc(id) {  	
			$.get("${pageContext.request.contextPath}/doc/check/"+id,
	    		    function(data){
	        		if(data.code==1){
	        			window.location = "${pageContext.request.contextPath}/doc/download/"+id;
	        		}
	        		else{
	        	        layer.msg(data.message, {icon: 5});
	        		}
	    	    });
		}
		function transferDoc(id) {
	        window.location = "${pageContext.request.contextPath}/doc/transferinit/"+id;
		}
	</script>  
</body>
</html>
