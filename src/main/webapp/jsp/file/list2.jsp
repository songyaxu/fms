<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>档案管理系统</title>
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
<script src="${pageContext.request.contextPath}/assets/laydate/laydate.js"></script>
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
						<h2 class="title">文件审批</h2>
						<p class="title-description">
							只有学院党总支和学校党总支能审批文件。
						</p>
					</header>
					<hr>
				</section>
				<table class="table table-bordered  mb-15">
					<thead>
						<tr>
							<th>#</th>
							<th>档案名称</th>
							<th>档案描述</th>
							<th>保密级别</th>
							<th>从</th>
							<th>到</th>
							<th>文件号</th>
							<th>签发人</th>
							<th>签发时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${docList}" varStatus="status">
						<tr class="cen">
							<td>${status.index+1}</td>
							<td class="lt" style="text-align: center"><a href="${pageContext.request.contextPath}/doc/detail/${item.serial}">${item.title}</a></td>
							<td>${item.content}</td>
							<td>${item.crypticClassStr}</td>
							<td>${item.fromStr}</td>
							<td>${item.toListStr}</td>
							<td>${item.fileNo}</td>
							<td class="lt" style="text-align: center"><a href="${pageContext.request.contextPath}/user/info/${item.signatory}">${item.sendName}</a></td>
							<td>${item.dateTime}</td>
							<td>
								<a title="详情" class="mr-5" onclick="javascript:detail(${item.serial});">详情</a>
								<a title="审核" onclick="javascript:approve(${item.serial},1);">通过</a>
								<a title="审核" onclick="javascript:approve(${item.serial},0);">拒绝</a>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<!--开始::结束-->
				<div class="panel panel-default">
					<div class="panel-bd">
						<div class="pagination"></div>
					</div>
				</div>
				
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
	$(".pagination").createPage({
	    pageCount: ${docParam.page.totalPage},
	    current: ${docParam.page.currentPage},
	    backFn:function(p){
	    	setTimeout(function () {
                window.location = "${pageContext.request.contextPath}/doc/list2/"+p;
            }, 1);
	    }
	});
	function downloadDoc(id){
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
	function detail(id){
		setTimeout(function () {
            window.location = "${pageContext.request.contextPath}/doc/detail/"+id+"?res=1";
        }, 1);
	}
	function approve(id,res){
		$.get("${pageContext.request.contextPath}/doc/approve/"+id+"?res="+res,
    		    function(data){
        		if(data.code==1){
        			layer.msg(data.message, {icon: 1});
        			window.location.reload();
        		}
        		else{
        	        layer.msg(data.message, {icon: 5});
        		}
    	    });
	}
</script>
</body>
</html>
