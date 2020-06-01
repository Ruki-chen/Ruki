<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	
<!--   <link rel="stylesheet" href="${ctx}/css/roomset/roomset.css" type="text/css"></link> -->
  <link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.css" type="text/css"></link>
  <link href="${ctx}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">  <!-- start 响应式布局要添加的 -->
  <script src="${ctx}/bootstrap/js/jquery-3.1.1.min.js"></script>
  <script src="${ctx}/bootstrap/js/bootstrap.js"></script>
  <script type="text/javascript" src="${ctx}/javaScript/passenger.js"></script>
   
   <style>
   
   .container{
     margin-top: 10px;
   }
   
   .theadone{
     background-color: #CCFF99;
    }
   
   
   .labelroomnumber{
      position: relative;
      font-size: 17px;
      float: left;
      margin-top: 15px;
    }
    
    .marginrightone{
      margin-right: 33px;
    }
    
    .marginrighttwo{
      margin-right: 16.5px;
    }
    
    .marginrightthree{
      margin-right: 43px;
    }
    
   .textone{
    margin-top:12px;
    }
    
    .inputone{
    width:54.2%;
    }
    
    .inputtwo{
      width:46.8%;
    }
    
    .inputthree{
      width:46.8%;
    }
    
    .cboone{
      margin-top:10px;
      height: 27px;
    }
    
    .margin-top-one{
      margin-top: -10px;
    }
    
    .margin-top-two{
      margin-top: -20px;
    }
  
    .textwidth{
      width: 138px;
    }
    
    .radiusone{
     margin-left: -4px;
    }
    
     @media(min-width:731px) and (max-width:767px){
      .inputthree{
      width: 50.5%;
    }
    }
    
    @media(min-width:550px) and (max-width:730px){
      .inputtwo{
      width: 46.2%;
    }
        .inputthree{
      width: 49.2%;
    }
    }
    
    
     @media(min-width:431px) and (max-width:550px){
      .inputtwo{
      width: 43.2%;
    }
      .inputthree{
      width: 47.5%;
    }
    }
    
    @media(min-width:366px) and (max-width:430px){
      .inputtwo{
      width: 40.2%;
    }
      .inputthree{
      width: 46%;
    }
    }
    
     @media(min-width:285px) and (max-width:366px){
      .inputtwo{
      width: 37.2%;
    }
      .inputthree{
      width: 44%;
    }
    }
    
     @media(min-width:237px) and (max-width:285px){
      .inputtwo{
      width: 30%;
    }
      .inputthree{
      width: 40%;
    }
    }
    .span12{
      width:95%;
    }
    .yansered{
      color:red;
    }
    
     .explainlog{
           width:98%;
             font-weight:bold;
             color:red;
            text-indent:25px         
   }	
  
  </style>
  
  </head>
  
 
  <body background="<%=request.getContextPath()%>/img/xuhua.jpg" > 
  <div class="container" style="height:1000px;overflow-x:auto;">
  
    <div class="span11" style=" border: solid; border-color: #DDDDDD;">
    <div class="span9 margin-top-one">
      <div class="row-fluid">
        <h3 style="text-align: center;">用户新增</h3>
        
      </div>
    </div>
    
    <form action="${ctx}/Passenger/add.do" method="post" onsubmit="return verify()" enctype="multipart/form-data">
    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12">
	      <div class="row-fluid">
		     <div class="span3">
		        <label>用户名：</label>
		        <input id="passenger_userName_ID" name="userName" type="text" style="width:97%;height:27px;float:left;" value="${user.userName}" >
		        <div id="divOne" style="float:right;">
			         <label class="yansered" style="margin-top:7px;">*</label>
			    </div> 
		      </div>
		     <div class="span3">
		        <label>密码：</label>
		        <input id="passenger_passWord_ID" name="passWord" type="text" style="width:100%;height:27px;" value="${user.passWord}"> 
		     </div>
		     <div class="span3">
		        <label>手机号码：</label>
		        <input id="passenger_phoneNumber_ID" name="phoneNumber" type="text" style="width:100%;height:27px;" value="${user.phoneNumber}"> 
		     </div>
		       <div class="span3">
		        <label>用户类型：</label>
		         <select name="userType" style="width:100%;height:27px;">
			         <option value="user">用户</option>
                     <option value="Admin">管理员</option>
		          </select>
		     </div>
		  </div>
	    </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	  
		      <div class="span12">
	     <div class="row-fluid">
		     <div class="span3">
		        <label>电子邮件：</label>
		      <input id="passenger_mail_ID" name="mail" type="text" style="width:100%;height:27px;" value="${user.mail}" > 	      
		      </div>
		      <div class="span3">
		            <input id="passenger_photoPath_ID"  type="hidden" name="photoPath" type="text" style="width:97%;height:27px;float:left;" value="${user.photoPath}" >
		        <label>上传照片：</label>
		        <input id="passenger_up1_photoPath_ID" name="pictureFile" type="file" style="width:100%;height:27px;" value="${user.photoPath}"  > 
		      </div>
		  </div>
		        
		      </div>
		      
		   <div class="span12">
		        <label id="explain" class="explainlog">${TIPS}</label>
		      </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    
	
		  <div class="span6" style="text-align:center;">
		      <div class="row-fluid">
			      <div class="span12" style="margin-top: 10px;margin-bottom: 8px;">
				   	 <button class="btn btn-primary" type="submit">
				   	 <li class="icon-check icon-white"></li>保存</button>
				  </div> 
				 
			  </div>
	      </div>
      </form>
      
      
      <div class="span4" style="text-align:center;">
      <div class="row-fluid">
		   <div class="span4"  style="margin-top: 10px;margin-bottom: 8px;"> 
		   	 <button class="btn btn-warning" type="button" onclick="deletefunction()">
		   	  <li class="icon-remove icon-white"></li>取消</button>
		   </div>
	     </div>
      </div>
       
    </div>
  
 
 
 
 
 <script type="text/javascript">
 
   
      function deletefunction(){
	    parent.document.getElementById('Mainid').src='${ctx}/Passenger/tolist.do';
	  }
   
 </script>
   
  </body>
</html>
