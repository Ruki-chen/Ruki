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
   
   .wrap{
     text-align:center;
    width: 60px; 
     white-space: nowrap; 
    text-overflow: ellipsis; 
     overflow: hidden; 
     vertical-align:middle
}	
  
  </style>
  
  </head>
  
 
  <body background="<%=request.getContextPath()%>/img/xuhua.jpg" > 
  <div class="container" style="height:1000px;overflow-x:auto;">
  
    <div class="span11" style=" border: solid; border-color: #DDDDDD;">
    <div class="span9 margin-top-one">
      <div class="row-fluid">
        <h3 style="text-align: center;">歌手修改</h3>
        
      </div>
    </div>
    
    <form action="${ctx}/Singer/update.do" method="post" onsubmit="return verifySinger()" enctype="multipart/form-data">
    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12">
	      <div class="row-fluid">
		     <div class="span3">
		       <input id="singer_singerId_ID"  type="hidden" name="id" type="text" style="width:97%;height:27px;float:left;" value="${list.id}" >
		        <label>歌手名字：</label>
		        <input id="singer_singerName_ID" name="singerName" type="text" style="width:97%;height:27px;float:left;" value="${list.singerName}" >
		        <div id="divOne" style="float:right;">
			         <label class="yansered" style="margin-top:7px;">*</label>
			    </div> 
		      </div>
		     <div class="span3">
		        <label>首字母：</label>
		        <input id="singer_initials_ID" name="initials" type="text" style="width:100%;height:27px;" value="${list.initials}"> 
		     </div>
		     <div class="span3">
		        <label>介绍：</label>
		        <input id="singer_introduce_ID" name="introduce" type="text" style="width:100%;height:27px;" value="${list.introduce}"> 
		     </div>
		       <div class="span3">
		       <input type="hidden" id ="testsex" value="${list.sex}"/>
		        <label>性别：</label>
		         <select name="sex" style="width:100%;height:27px;" value="${list.sex}"  id="singer_sex_ID">
			         <option value="男">男</option>
                     <option value="女">女</option>
		          </select>
		     </div>
		  </div>
	    </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	   <div class="span12">
	      <div class="row-fluid">
		     <div class="span3">
		     <input type="hidden" id ="testcountry" value="${list.country}"/>
		        <label>地区：</label>
		         <select name="country" style="width:100%;height:27px;" value="${list.country}" id="singer_country_ID">
			         <option value="华语">华语</option>
                     <option value="欧美">欧美</option>
                     <option value="日本">日本</option>
                     <option value="韩国">韩国</option>
		          </select>
		      </div>
		     <div class="span3">
		      <input type="hidden" id ="testschools" value="${list.schools}"/>
		        <label>派别：</label>
		         <select name="schools" style="width:100%;height:27px;" value="${list.schools}" id="singer_schools_ID">
			         <option value="流行">流行</option>
                     <option value="民谣">民谣</option>
                     <option value="古典">古典</option>
                     <option value="爵士">爵士</option>
                     <option value="电子">电子</option>
                     <option value="摇滚">摇滚</option>
		          </select>
		     </div>
		       <div class="span3">
		       <input type="hidden" id ="testisPopular" value="${list.isPopular}"/>
		        <label>是否流行：</label>
		         <select name="isPopular" style="width:100%;height:27px;" value="${list.isPopular}"  id="singer_isPopular_ID">
			         <option value="是">是</option>
                     <option value="否">否</option>
		          </select>
		     </div>
		     <div class="span3">
		     <input id="singer_singerPhoto_ID"  type="hidden" name="photoPath" type="text" style="width:97%;height:27px;float:left;" value="${list.photoPath}" >
		        <label>上传照片：</label>
		        <input id="singer_picture_update_ID" name="pictureFile" type="file" style="width:100%;height:27px;" value="${list.photoPath}"  > 
		        <img class="wrap" src="<%=request.getContextPath()%>${list.photoPath}" />
		     </div>
		  </div>
	    </div>
	   
		      
		
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    
	
		   <div class="span6" style="text-align:center;">
		      <div class="row-fluid">
			      <div class="span12" style="margin-top: 10px;margin-bottom: 8px;">
				   	 <button class="btn btn-primary" type="submit">
				   	 <li class="icon-check icon-white"></li>修改</button>
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
     var testsex = document.getElementById('testsex').value;
     var testcountry = document.getElementById('testcountry').value;
     var testschools = document.getElementById('testschools').value;
     var testisPopular = document.getElementById('testisPopular').value;
    
	 $("#singer_sex_ID  option[value="+testsex+"]").attr('selected',true);//selector_sex这个值要和html里的id值一致
	 $("#singer_country_ID  option[value="+testcountry+"]").attr('selected',true);
	 $("#singer_schools_ID  option[value="+testschools+"]").attr('selected',true);
	 $("#singer_isPopular_ID  option[value="+testisPopular+"]").attr('selected',true);
	
   
      function deletefunction(){
	    parent.document.getElementById('Mainid').src='${ctx}/Singer/tolist.do';
	  }
   
 </script>
   
  </body>
</html>