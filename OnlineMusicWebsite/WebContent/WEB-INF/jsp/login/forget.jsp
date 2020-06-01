
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>欢迎登录303在线音乐网站</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.css" type="text/css"></link>
  <link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap-responsive.css"></link>
  <script type="text/javascript" src="${ctx}/bootstrap/js/jquery-1.7.2.js"></script>
  <script src="${ctx}/bootstrap/js/jquery-3.1.1.min.js"></script>
  <script type="text/javascript" src="${ctx}/bootstrap/js/bootstrap.js"></script>
   <script type="text/javascript" src="${ctx}/javaScript/login.js"></script>
  </head>
<style>
  .change{
  width:100%; 
  height:100%; 
  FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#FFF,endColorStr=#D1BBFF); /*IE*/ 
  background:-moz-linear-gradient(top,#FFF,#D1BBFF);/*火狐*/ 
  background:-webkit-gradient(linear, 0% 39.1%, 0% 100%,from(#FFF), to(#D1BBFF));/*谷歌*/ 
  }
   .explainlog{
           width:98%;
             font-weight:bold;
             color:red;
            text-indent:25px         
   }	
</style>
  
  <body>
  
  <div class="container change">
  
  <div class="modal" id="login">
      <div class="modal-header">
        <h4>找回密码</h4>
      </div>
      <div class="modal-body">
       <form id="form3" class="form-horizontal" action="${ctx}/Login/toreset.do" method="post">
            <div class="control-group">
              <label class="control-label">电子邮箱</label>
              <div class="controls">
                <input id="forget_mial_ID" type="text" placeholder="请输入账号绑定的邮箱" onfocus="disappearTips(1)">
              </div>
            </div>
            
             <div>
               <span class="explainlog" style="display:none" id="forget_verify_mial_ID"></span>
            </div>
             <div class="control-group">
              <label class="control-label">验证码</label>
              <div class="controls">
                <input id="forget_verify_ID" type="text" onfocus="disappearTips(1)">    
               <a onclick="sendVerifyCode()">发送验证码</a>
              </div>
            </div>
            </form>
      </div>
        <div class="modal-footer">
      	<button type="button" onclick="submitVerifyCode()" class="btn btn-primary">提交</button>
      	<a href="${ctx}/Login/tologin.do" >返回登陆</a>
      </div>
      <div class="modal-footer">
          <span id="forget_explain_ID" class="explainlog"  style="display:none"></span>
      </div>
      
  </div>
  
</div>
  <script type="text/javascript">
  function sendVerifyCode() {
	    var forgetMial = $('#forget_mial_ID').val();
	    localStorage.setItem('forgetMial',forgetMial); 
		if(verifyEmail(forgetMial)) {
			   $.ajax({                                                      
			          cache:false,                                            
			          type: "POST",                                           
			          url: '${ctx}/Login/sendVerifyCode.do',     
			          data:"mial="+forgetMial,                       
			          async:false,                                         
			          success: function (result) {                          
			        	  if(!result) {
			        		  $('#forget_explain_ID').text("该邮箱没有注册过，请确认是否为该邮箱！");
			        		   $('#forget_explain_ID').show();  
			        		   return;
			        	  }
			        	  $('#forget_explain_ID').text("验证码已发，请确认！"); 
			        	  $('#forget_explain_ID').show();  
			          },
			          error: function(data) {      }
			      });
		}
	}

  function submitVerifyCode() {
	  var verifyCode = $('#forget_verify_ID').val();
			   $.ajax({                                                      
			          cache:false,                                            
			          type: "POST",                                          
			          url: '${ctx}/Login/submitVerifyCode.do',      
			          data:"verifyCode="+verifyCode,                         
			          async:false,                                         
			          success: function (result) {                         
			        	  if(!result) {
			        		  $('#forget_explain_ID').text("验证码错误，请确认是否为该验证码！");
			        		   $('#forget_explain_ID').show();  
			        		   return;
			        	  }
			        	  $('#form3').submit();
			          },
			          error: function(data) {      }
			      });
		
	  
  }
  </script>
   
  </body>
</html>
