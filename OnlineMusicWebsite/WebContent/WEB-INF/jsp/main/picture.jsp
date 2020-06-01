
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
  </head>
<style >
  body{
      
    }
 .btn-audio{
   left: 0;
	right: 0;
	top: 0;
	bottom: 0;
       position: absolute;
        margin: 550px auto;
        width: 900px;
        height: 50px;
        background:url(${ctx}/img/蓝色.PNG);
        background-size:cover;
        text-align: center;
    }
    .container {
	position: absolute;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	width:900px;
	height: 400px;
	text-align: center;
	background:rgba(255,255,255,0.6);
}
</style>
 <body >
     <div class="container">
       <h3 id="musicName">一月，银装轻舞-紫竹笛韵</h3>
     <img src="<%=request.getContextPath()%>/img/mian.jpg" id="musicImg">
     <div class="btn">
			<button id="play"  class="btn btn-primary">play</button>
			<button id="pause"  class="btn btn-primary">pause</button>
			<button id="prev"  class="btn btn-primary">prev</button>
			<button id="next"  class="btn btn-primary">next</button>
			<button id="loop"  class="btn btn-primary">loop</button>
		</div>
     </div>
     <div>
      <audio class="btn-audio" id="mp3Btn" controls  ><source src="<%=request.getContextPath()%>/music/好想爱这个世界啊.mp3" type="audio/mpeg" />
     </audio>
    
     </div>
    
 
 <script type="text/javascript">
   
 $(document).ready(function () {
	  var audio = document.getElementById('mp3Btn');
	 // audio.play();
		
	})
   
 </script>
 </body>
</html>
