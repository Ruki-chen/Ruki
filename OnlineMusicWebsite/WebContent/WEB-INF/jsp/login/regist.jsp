
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
        <h4>用户注册</h4>
      </div>
      <div class="modal-body">
          <form id="form2" class="form-horizontal" action="${ctx}/Login/regist.do" method="post" enctype="multipart/form-data">
            <div class="control-group">
              <label class="control-label">用户名</label>
              <div class="controls">
                <input name="userName" type="text" value="${user.userName}" id="input_userName_ID">
              </div>
            </div>
            
             <div>
               <span class="explainlog" style="display:none" id="verify_userName_ID"></span>
            </div>
            
             <div class="control-group">
              <label class="control-label">密码</label>
              <div class="controls">
                <input name="passWord" type="password" value="${user.passWord}" id="input_passWord_ID">
              </div>
            </div>
            
             <div >
               <span class="explainlog" style="display:none" id="verify_passWord_ID"></span>
            </div>
            
            <div class="control-group">
              <label class="control-label">手机号码</label>
              <div class="controls">
                <input name="phoneNumber" type="text"  value="${user.phoneNumber}" id="input_phoneNumber_ID">
              </div>
            </div>
            
             <div >
               <span class="explainlog" style="display:none" id="verify_phoneNumber_ID"></span>
            </div>
            
            <div class="control-group">
              <label class="control-label">电子邮箱</label>
              <div class="controls">
                <input name="mail" type="text" value="${user.mail}" id="input_mail_ID">
              </div>
            </div>
            
             <div >
               <span class="explainlog" style="display:none" id="verify_mail_ID"></span>
            </div>
            
            <div class="control-group">
              <label class="control-label">用户类型</label>
              <div class="controls">
               <label>
                       <input name="userType"  type="radio"  value="user">用户
                       <input name="userType"  type="radio" value="Admin">管理员
                </label>
              </div>
            </div>
            
             <div class="control-group">
              <label class="control-label">上传照片</label>
              <div class="controls">
                <input name="pictureFile" type="file" value="${user.pictureFile}" id="input_pictureFile_ID">
              </div>
            </div>
            
             <div >
               <span class="explainlog" style="display:none" id="verify_pictureFile_ID"></span>
            </div>
        
          </form>
      </div>
      <div class="modal-footer">
      	<button type="button" onclick="verifyRegistDate()" class="btn btn-primary">提交</button>
      	<a href="${ctx}/Login/tologin.do" >返回登陆</a>
      </div>
      <div class="modal-footer">
          <label id="explain" class="explainlog">${TIPS}</label>
      </div>
  </div>
  
</div>
  
  
  </body>
</html>
