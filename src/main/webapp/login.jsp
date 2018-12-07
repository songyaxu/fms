<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>登录-档案管理系统</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name='apple-touch-fullscreen' content='yes'>
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta name="format-detection" content="address=no">
<link rel="icon" href="${pageContext.request.contextPath}/assets/images/icon/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css" />
<script src="${pageContext.request.contextPath}/assets/javascript/jquery.js"></script>
<script src="${pageContext.request.contextPath}/assets/javascript/public.js"></script>
<script src="${pageContext.request.contextPath}/assets/javascript/plug-ins/customScrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/javascript/pages/login.js"></script>
<script src="${pageContext.request.contextPath}/assets/javascript/plug-ins/layerUi/layer.js"></script>
</head>
<body class="login-page">
	<section class="login-contain">
		<header>
			<h1>档案管理系统</h1>
			<p>file management system</p>
		</header>
		<div class="form-content">
			<ul>
				<li>
					<div class="form-group">
						<label class="control-label">账号：</label>
						<input type="text" placeholder="账号" class="form-control form-underlined" id="account"/>
					</div>
				</li>
				<li>
					<div class="form-group">
						<label class="control-label">密码：</label>
						<input type="password" placeholder="密码" class="form-control form-underlined" id="password"/>
					</div>
				</li>
				<li>
					<button class="btn btn-lg btn-block" onclick="login();">立即登录</button>
				</li>
				<li>
					<p class="btm-info">©Copyright 2018 <a href="http://www.imu.edu.cn" target="_blank" title="imu.edu.cn">imu.edu.cn</a></p>
					<address class="btm-info">内蒙古大学</address>
				</li>
			</ul>
		</div>
	</section>
<div class="mask"></div>
<div class="dialog">
	<div class="dialog-hd">
		<strong class="lt-title">标题</strong>
		<a class="rt-operate icon-remove JclosePanel" title="关闭"></a>
	</div>
	<div class="dialog-bd">
		<!--start::-->
		<p>这里是基础弹窗,可以定义文本信息，HTML信息这里是基础弹窗,可以定义文本信息，HTML信息。</p>
		<!--end::-->
	</div>
	<div class="dialog-ft">
		<button class="btn btn-info JyesBtn">确认</button>
		<button class="btn btn-secondary JnoBtn">关闭</button>
	</div>
</div>
<script type="text/javascript">
function login(){
	var account=$("#account").val();
	var password=$("#password").val();
	$.get("${pageContext.request.contextPath}/user/login",{account:account,password:password},
	    function(data){
		if(data.code==1){
			layer.msg(data.message, {
				  icon: 16
				  ,shade: 0.01
				});
            setTimeout(function () {
                window.location = "${pageContext.request.contextPath}/user/index";
            }, 1500);
		}
		else{
			layer.msg(data.message, {icon: 5});
		}
        
    });
}
</script>
</body>
</html>
