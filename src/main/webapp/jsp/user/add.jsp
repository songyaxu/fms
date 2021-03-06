<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>添加用户-档案管理系统</title>
<meta name="renderer" content="webkit">
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
						<h2 class="title">新增用户</h2>
						<p class="title-description">
							只有学院党总支用户才能创建相关用户。
						</p>
					</header>
					<hr>
				</section>
				<div class="form-group-col-2">
					<div class="form-label">账号：</div>
					<div class="form-cont">
						<input type="text" id="account" placeholder="可使用字符加数字的组合" class="form-control form-boxed">
					</div>
				</div>
				<div class="form-group-col-2">
					<div class="form-label">姓名：</div>
					<div class="form-cont">
						<input type="text" id="name" placeholder="请输入姓名" class="form-control form-boxed">
					</div>
				</div>
				<div class="form-group-col-2">
					<div class="form-label">密码：</div>
					<div class="form-cont">
						<input type="password" id="password" placeholder="不填写默认和账号一致" class="form-control form-boxed">
					</div>
				</div>
				<div class="form-group-col-2">
					<div class="form-label">电子邮箱：</div>
					<div class="form-cont">
						<input type="email" id="email" placeholder="电子邮箱..." class="form-control form-boxed">
					</div>		
				</div>
				<div class="form-group-col-2">
					<div class="form-label">类别：</div>
					<div class="form-cont">
						<select style="width:auto;" id="type">
							<c:if test="${user.typeId eq 1}">
								<option value="1">学院党总支</option>
							</c:if>
							<c:if test="${user.typeId <=2}">
							<option value="2">教工一支部</option>
							</c:if>
							<c:if test="${user.typeId eq 1 or user.typeId eq 3}">
							<option value="3">教工二支部</option>
							</c:if>
							<c:if test="${user.typeId <=4}">
							<option value="4">研究生支部</option>
							</c:if>
							<c:if test="${user.typeId <=3 or user.typeId eq 5}">
							<option value="5">本科生支部</option>
							</c:if>
							<c:if test="${user.typeId eq 6}">
								<option value="6">学校党总支</option>
							</c:if>
						</select>
					</div>	
				</div>
				<div class="form-group-col-2">
					<div class="form-label">管理用户权限：</div>
					<div class="form-cont">
						<label class="radio">
							<input type="radio" value="1" name="power"/>
							<span>有</span>
						</label>
						<label class="radio">
							<input type="radio" name="power"  value="0" checked="checked"/>
							<span>没有权限</span>
						</label>
					</div>
				</div>
				<div class="form-group-col-2">
					<div class="form-label">性别：</div>
					<div class="form-cont">
						<label class="radio">
							<input type="radio" value="1" name="sex"/>
							<span>男士</span>
						</label>
						<label class="radio">
							<input type="radio" value="2" name="sex"/>
							<span>女士</span>
						</label>
					</div>
				</div>
				<div class="form-group-col-2">
					<div class="form-label">政治面貌：</div>
					<div class="form-cont">
						<textarea class="form-control form-boxed" id="content"></textarea>
					</div>
				</div>
				<div class="form-group-col-2">
					<div class="form-label"></div>
					<div class="form-cont">
						<input type="button" class="btn btn-primary" value="提交表单" onclick="save()"/>
						<input type="reset" class="btn btn-info" value="重置" onclick="clr()"/>
					</div>
				</div>
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
function clr(){
	$("#account").val("");
	$("#password").val("");
    $("#name").val("");
    $("#email").val("");
    $("#content").val("");
}
function save(){
	var account=$("#account").val();
	var pwd=$("#password").val();
    var name=$("#name").val();
    var gender=$('input[name=sex]:checked').val();
    var email=$("#email").val();
    var content=$("#content").val();
    var type=$("#type").val();
    var power=$('input[name=power]:checked').val();
    $.post("${pageContext.request.contextPath}/user/save",{ account:account,name:name,gender:gender,email:email,politicsCharacter:content,power:power,typeId:type,password:pwd},
		    function(data){
    		if(data.code=="1"){
    			layer.msg(data.message, {icon: 1});
    		}
    		else{
    	        layer.msg(data.message, {icon: 5});
    		}
	    });
}
</script>
</body>
</html>
