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
  <link rel="stylesheet" href="${ctx}/css/page.css" type="text/css"></link>
  <link href="${ctx}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">  <!-- start 响应式布局要添加的 -->
  <script src="${ctx}/bootstrap/js/jquery-3.1.1.min.js"></script>
  <script src="${ctx}/bootstrap/js/bootstrap.js"></script>
  <script type="text/javascript" src="${ctx}/js/page.js"></script>
   <style>
   
   .container{
     margin-top: 10px;
   }
   
    .labelroomnumber{
      position: relative;
      font-size: 17px;
      float: left;
      margin-top: 15px;
    }
    
    .textone{
    margin-top:12px;
    }
    
    .rightOne{
    margin-right: 50px;
    font-size:16px;
    }
    
    .table th,.table td{
       text-align: center; 
    }
    
    .theadone{
     background-color: #CCFF99;
    }
    
    .dgvone{
      margin-top: 12px;
    }
    
    .roomnumberwidth{
      width:70%;
    }
      .explainlog{
           width:98%;
             font-weight:bold;
             color:red;
            text-indent:500px         
   }
   
   .wrap{
     text-align:center;
     width: 60px; 
     height: 50px;
     white-space: nowrap; 
    text-overflow: ellipsis; 
     overflow: hidden; 
     vertical-align:middle
}	

.center{
    text-align:center;
    vertical-align:middle;
}
  
  </style>
  
 </head>
  
 
  <body background="<%=request.getContextPath()%>/img/xuhua.jpg">
  <div class="container" >
       <div class="span12">
		      <input id="Tips" class="explainlog" type="text" style="width:100%;height:27px;" style="display:none" value="${AdminTipe}"  readonly="readonly"> 
	  </div>
	  <br>
    <div class="span5">
	    <div class="row-fluid">
		    <label class="labelroomnumber">歌手名字：</label>
		    <form action="${ctx}/Singer/tolist.do" method="post" style="float: left;">
			   <input id="txtnameid" name="txtname" class="textone roomnumberwidth" style="border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;" type="text" placeholder="请输入歌手名字" value="${txtname}">
			   <div class="input-append">  
			      <button type="submit" class="btn-success textone" style="margin-left:-4px;height:26px;"><li class="icon-search icon-white"></li>搜索</button>
			   </div>
		    </form>
	    </div>
    </div>
    <div class="span6">
      <div class="row-fluid">
       <div class="span3">
         <button class="btn btn-info btn-small textone" type="button" onclick="addfunction()"><li class="icon-plus icon-white"></li>新增</button>
       </div>
       <div class="span3">
         <button class="btn btn-warning btn-small textone" type="button" onclick="updatefunction()"><li class="icon-pencil icon-white"></li>修改</button>
       </div>
       <div class="span3">
         <button class="btn btn-danger btn-small textone" type="button" onclick="deletefunction()"><li class="icon-remove icon-white"></li>删除</button>
       </div>
       <div class="span3">
         <label class="labelroomnumber">统计用户数：${list.total}</label>
       </div>
      </div>
    </div>
    <br>
    <div class="dgvone">
       <table class="table table-condensed table-bordered table-striped" id="tableid"  style="table-layout: fixed;" >
	      <thead class="theadone">
	        <tr>
	          <th class="wrap" style="text-align:center;vertical-align:middle;">选择</th>
	          <th class="wrap" style="text-align:center;vertical-align:middle;">歌手名字</th>
	          <th class="wrap" style="text-align:center;vertical-align:middle;">性别</th>
	          <th class="wrap" style="text-align:center;vertical-align:middle;">歌手介绍</th>
	          <th class="wrap" style="text-align:center;vertical-align:middle;">歌手照片</th>
	          <th class="wrap" style="text-align:center;vertical-align:middle;">首字母</th>
	          <th class="wrap" style="text-align:center;vertical-align:middle;">国家</th>
	          <th class="wrap" style="text-align:center;vertical-align:middle;">派别</th>
	          <th class="wrap" style="text-align:center;vertical-align:middle;">是否流行</th>
	        </tr>
	      </thead>
	      <tbody id="tbody">
	        <c:forEach items="${list.result}" var="item">
		        <tr>
		          <td  class="wrap" style="text-align:center;vertical-align:middle;"><input type="checkbox" name="id" value="${item.id}"></td>
		          <td class="wrap" style="text-align:center;vertical-align:middle;">${item.singerName}</td>
		          <td class="wrap" style="text-align:center;vertical-align:middle;">${item.sex}</td>
		          <td class="wrap" style="text-align:center;vertical-align:middle;">${item.introduce}</td>
		          <td class="wrap" style="text-align:center;vertical-align:middle;"><img class="wrap" src="<%=request.getContextPath()%>${item.photoPath}" /></td>
		          <td class="wrap" style="text-align:center;vertical-align:middle;">${item.initials}</td>
		          <td class="wrap" style="text-align:center;vertical-align:middle;">${item.country}</td>
		          <td class="wrap" style="text-align:center;vertical-align:middle;">${item.schools}</td>
		          <td class="wrap" style="text-align:center;vertical-align:middle;">${item.isPopular}</td>
		        </tr>
	        </c:forEach>
	      </tbody>
	    </table>
    </div>

    

    <div class="span11">
      <div class="row-fluid">
        <div class="tcdPageCode" style="text-align:center;"></div>
      </div>
    </div>
  </div>
  
 
 
 
 
 <script type="text/javascript">
 $(document).ready(function () {
	  $('#Tips').show().delay(500).fadeOut();
		
	})
	
   function addfunction(){
     parent.document.getElementById('Mainid').src='${ctx}/Singer/toadd.do';
   }
   
   function updatefunction(){
   var chk_value=[];
  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
  	});
  	if(chk_value!=""){
		if(chk_value.toString().indexOf(",")>0){
		   alert("修改只能选择一条");
		}else{
		   parent.document.getElementById("Mainid").src='${ctx}/Singer/toupdate.do?id='+chk_value;
		}
	}else{
	  alert("请选择一条数据进行修改");
	}
  }
  
   function deletefunction(){
   var chk_value=[];
  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
  	});
  	if(chk_value!=""){
  	var flag=window.confirm("注意：您确定要永久删除该信息吗?");
     if(flag){
  	  parent.document.getElementById("Mainid").src='${ctx}/Singer/delete.do?id='+chk_value;
  	}
  	}else{
	  alert("请选择一条或多条数据进行删除");
	}
	
  }
  
  
  
  
   
   
   
  /* 分页要用的 */
  $(".tcdPageCode").createPage({
     pageCount:${list.totalPage},
     current:${list.currentPage},
     backFn:function(p){
     var txtname=document.getElementById("txtnameid").value;
     location.href="${ctx}/Singer/tolist.do?currentPage="+p+"&txtname="+txtname;
     }
   });
  
 </script>
   
  </body>
</html>
