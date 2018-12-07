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
						<h2 class="title">查看文件</h2>
						<p class="title-description">
							查看文件仅能查看本部门的文件
						</p>
					</header>
					<hr>
				</section>
				<div class="form-group-col-2">
					<div class="form-cont">
						<label>签发人(ID)：</label>
						<input type="text"  class="form-control" style="width:10%" id="sendId" name="sendId"  value="${ docParam.sendId}">
						<label>签发时间：</label>
						<input type="text"  class="form-control" style="width:10%" id="date"  value="${ docParam.datetime}">
						<label>从：</label>
						<select style="width:auto;" id="from" name="from">
							<option value="0">-</option>
							<option value="1">学院党总支</option>
							<option value="2">教工一支部</option>
							<option value="3">教工二支部</option>
							<option value="4">研究生支部</option>
							<option value="5">本科生支部</option>
						</select>
						<label>到：</label>
						<select style="width:auto;" id="to" name="to">
							<option value="0">-</option>
							<option value="1">学院党总支</option>
							<option value="2">教工一支部</option>
							<option value="3">教工二支部</option>
							<option value="4">研究生支部</option>
							<option value="5">本科生支部</option>
						</select>
						<label>关键字：</label>
						<input type="text"  class="form-control" style="width:20%" id="keyWord" value="${ docParam.keyWord}">
						<input type="button" class="btn btn-primary-outline" value="搜索" onclick="search()" style="float: right;"/>
					</div>
				</div>
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
								<a title="转发" onclick="javascript:transferDoc(${item.serial});">转发</a>
								<a title="下载附件" onclick="javascript:downloadDoc(${item.serial});">下载附件</a>
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
	$(function(){
		$("#to").val(${docParam.to});
		$("#from").val(${docParam.from});
	})
	$(".pagination").createPage({
	    pageCount: ${docParam.page.totalPage},
	    current: ${docParam.page.currentPage},
	    backFn:function(p){
	    	setTimeout(function () {
	    		var to = $("#to").val();
	    		var from = $("#from").val();
	    		var sendId=$("#sendId").val();
	    		var date = $("#date").val();
	    		var keyWord=$("#keyWord").val();
                window.location = "${pageContext.request.contextPath}/doc/list/"+p+
                	"?to="+to+
                	"&from="+from+
                	"&sendId="+sendId+
                	"&datetime="+date+
                	"&keyWord="+keyWord;
            }, 1);
	    }
	});
	laydate.render({
		  elem: '#date'
		  ,format: 'yyyy-MM-dd'
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
            window.location = "${pageContext.request.contextPath}/doc/detail/"+id;
        }, 1);
	}
	function transferDoc(id) {
        window.location = "${pageContext.request.contextPath}/doc/transferinit/"+id;
	}
	function search(){
		var to = $("#to").val();
		var from = $("#from").val();
		var sendId=$("#sendId").val();
		var date = $("#date").val();
		var keyWord=$("#keyWord").val();
		window.location = "${pageContext.request.contextPath}/doc/list/"+0+
							"?to="+to+
					    	"&from="+from+
					    	"&sendId="+sendId+
					    	"&datetime="+date+
					    	"&keyWord="+keyWord;
	}
</script>
</body>
</html>
