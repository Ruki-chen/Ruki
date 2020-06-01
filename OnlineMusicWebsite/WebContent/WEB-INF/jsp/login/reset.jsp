
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
        <h4>重置密码</h4>
      </div>
      <div class="modal-body">
       <form id="form4" class="form-horizontal" action="${ctx}/Login/tologin.do" method="post">
            <div class="control-group">
              <label class="control-label">电子邮箱</label>
              <div class="controls">
                <a id="reset_mial_ID" ></a>
              </div>
            </div>
             <div class="control-group">
              <label class="control-label">新密码</label>
              <div class="controls">
                <input id="reset_new_passWord_ID" type="text" onfocus="disappearTips(2)">    
              </div>
            </div>
            
            <div >
               <span class="explainlog" style="display:none" id="reset_verify_passWord_ID"></span>
            </div>
            
             <div class="control-group">
              <label class="control-label">再次确认密码</label>
              <div class="controls">
                <input id="reset_confirm_passWord_ID" type="text" onfocus="disappearTips(2)">    
              </div>
            </div>
            
            <div >
               <span class="explainlog" style="display:none" id="reset_verify_conPassWord_ID"></span>
            </div>
            </form>
      </div>
        <div class="modal-footer">
      	<button type="button" onclick="submitNewPassWord()" class="btn btn-primary">提交</button>
      	<a href="${ctx}/Login/tologin.do" >返回登陆</a>
      </div>
      
      <div class="modal-footer">
          <span id="reset_explain_ID" class="explainlog"  style="display:none"></span>
      </div>
  </div>
  
</div>
<script type="text/javascript">
$(document).ready(function () {
	var forgetMial = localStorage.getItem("forgetMial");
	$('#reset_mial_ID').text(forgetMial);
	
})

function submitNewPassWord() {
	 var forgetMial = localStorage.getItem("forgetMial");
	 var newPassWord = $('#reset_new_passWord_ID').val();
	 var confirmPassWord = $('#reset_confirm_passWord_ID').val();
	  if(verifyResetFrom(newPassWord,confirmPassWord)) {
		  $.ajax({                                                      
	          cache:false,                                            
	          type: "POST",                                          
	          url: '${ctx}/Login/updatePassWord.do',      
	          data:"newPassWord="+newPassWord+"&forgetMial="+forgetMial,                         
	          async:false,                                         
	          success: function (result) {                         
	        	  if(!result) {
	        		  $('#reset_explain_ID').text("该邮箱未注册，请先注册！");
	        		  $('#reset_explain_ID').show();  
	        		   return;
	        	  }
	          //做弹框提示成功，在跳转到登入页面
	        	  //$('#form4').submit();
	              $('#reset_new_passWord_ID').val("");
	              $('#reset_confirm_passWord_ID').val("");
	        	  $('#reset_explain_ID').text("密码修改成功，请返回登入");
        		  $('#reset_explain_ID').show();  
	          },
	          error: function(data) {      }
	      });

	  }
	
}
</script>
  </body>
</html>
