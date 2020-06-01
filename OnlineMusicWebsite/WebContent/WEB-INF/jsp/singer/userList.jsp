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
    
  
    
    .theadone{
     background-color: #FFF0F5;
     text-align:left;
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
 
     width: 30px; 
     height: 20px;
    
}	

.center{
    width: 1000px; 
      visibility:hidden;
}
   .change{
  width:100%; 
  height:100%; 
   background:url(${ctx}/img/黑色.PNG)
  }
  
  .singer{
	border:2px solid #a1a1a1;
	padding:5px 30px;
	height: 170px;
	width:130px;
	border-radius:30px;
	text-indent:center;
}
  </style>
  
  </head>
  
 
  <body background=""> 
  <div class="container">
  
    <div class="span11" style=" border: solid; border-color:  #FFF0F5;width:100%;margin-top:20px">
  
    <form action="${ctx}/Singer/userList.do" method="post" onsubmit="" id="form1">
    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
		      <div class="span3">
		         <input id="txtnameid" name="singerName"  style="width:150px;height:27px;" type="text" placeholder="请输入歌手名字" value="${singerName}">
		         <input id="userList_country_id" name="country"  style="display:none" type="text" placeholder="请输入歌手名字" >
		         <input id="userList_schools_id" name="schools"  style="display:none" type="text" placeholder="请输入歌手名字" >
		         <input id="userList_isPopular_id" name="isPopular"  style="display:none" type="text" placeholder="请输入歌手名字" >
		          <input id="userList_sex_id" name="sex"  style="display:none" type="text" placeholder="请输入歌手名字" >
		         <button class="btn btn-primary" type="submit">
				   	 <li class="icon-check icon-white"></li>搜索</button>	 	
		     </div>
      </form>
      <br>
      <div>
        <span style="margin-left:30px;">国家：</span>   
          <c:forEach items="${countryList}" var="item" varStatus="status">
        <span id="country_${status.index+1}" onclick="selectCountry(${status.index+1},${countryListSize})" style="margin-left:100px;">${item.attributeName}</span>
        </c:forEach>
        </div>
        <div>
        <span style="margin-left:30px;">流派：</span>  
         <c:forEach items="${schoolsList}" var="item" varStatus="status">
         <span id="schools_${status.index+1}" onclick="selectSchools(${status.index+1},${schoolsListSize})"   style="margin-left:100px;">${item.attributeName}</span>
           </c:forEach>
        </div>
         <div>
         <span style="margin-left:30px;">流行：</span>  
         <c:forEach items="${isPopularList}" var="item" varStatus="status">
         <span id="isPopular_${status.index+1}" onclick="selectIsPopular(${status.index+1},${isPopularListSize})" style="margin-left:110px;">${item.attributeName}</span>
           </c:forEach>
        </div>
           <div>
         <span style="margin-left:30px;">性别：</span>  
         <c:forEach items="${sexList}" var="item" varStatus="status">
         <span id="sex_${status.index+1}" onclick="selectSex(${status.index+1},${sexListSize})" style="margin-left:110px;">${item.attributeName}</span>
           </c:forEach>
        </div>
    </div>
      <br>
    
      
      
      
      
      
      <a id="textkaka" href="#lvke" style="display:none" data-toggle="modal" class="btn btn-info btn-small" onclick="getMusicList()"><li class="icon-plus icon-white"></li>播放列表</a>
      
<div class="modal fade" id="lvke" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
				播放列表
				</h4>
			</div>
			<div class="modal-body">
				<table class="table table-striped" id="tableid">
	      <thead class="theadone">
	        <tr>
	          <th style="display:none">行号</th>
	          <th style="display:none">歌名</th>
	          <th style="display:none">歌手</th>
	          <th style="display:none">歌曲路径</th>
	          <th style="display:none">功能</th>
	        </tr>
	      </thead>
	      <tbody id="tbody">
	      </tbody>
	    </table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" >关闭
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
    
    <div class="center">
    <span style="width: 100px; "> 筛选结果</span>
    </div>
       
     <div>
     <c:forEach items="${list}" var="item" varStatus="status">
     <div class="singer" style="float:left;margin-left:20px;margin-top:20px">
             <img onclick="checkSinger(${status.index+1})" id="singerPhotoPath_${status.index+1}" src="<%=request.getContextPath()%>${item.photoPath}"  style="height: 150px;width:140px;" title="${item.singerName}"> 
              <a id="singerName_${status.index+1}"  style="margin-left:20px;"  >${item.singerName}</a>
              <input id="id_${status.index+1}" type="text"  style="display:none"   value="${item.id}"> 
    </div>
         </c:forEach>
    </div>
  
  </div>
 
 
 
 <script type="text/javascript">
 $(document).ready(function () {
	//  $('#Tips').show().delay(500).fadeOut();
	  parent.hidePrev2AndNext2();//前台所有页面都要这个代码
	  var countryNumber =  localStorage.getItem('countryNumber');
	  var countryListSize =  localStorage.getItem('countryListSize');
	  changeColor(countryNumber,countryListSize,"country_");
	  var schoolsNumber =  localStorage.getItem('schoolsNumber');
	  var schoolsListSize =  localStorage.getItem('schoolsListSize');
	  changeColor(schoolsNumber,schoolsListSize,"schools_");
	  var isPopularNumber =  localStorage.getItem('isPopularNumber');
	  var isPopularListSize =  localStorage.getItem('isPopularListSize');
	  changeColor(isPopularNumber,isPopularListSize,"isPopular_");
	  var sexNumber =  localStorage.getItem('sexNumber');
	  var sexListSize =  localStorage.getItem('sexListSize');
	  changeColor(sexNumber,sexListSize,"sex_");
	  
	})
	
function changeColor(t,ListSize,flag) {
	 for(var i=1;i<=ListSize;i++) {
		 var schools = document.getElementById(flag+i);
		 if(i!=t) {	
		     schools.style.color = "block";
		 } else {
			 schools.style.color = "blue";
		 }
		 
	 }
	 
 }
 function selectCountry(t,countryListSize) {
	 var flag = "country_";
	 changeColor(t,countryListSize,flag);
	 localStorage.setItem('countryNumber',t);
	 localStorage.setItem('countryListSize',countryListSize);
     var country = $('#country_'+t).text() === "全部" ? "" : $('#country_'+t).text();
     var sexNumber =  localStorage.getItem('sexNumber');
     var schoolsNumber =  localStorage.getItem('schoolsNumber');
     var isPopularNumber =  localStorage.getItem('isPopularNumber');
     var sex = sexNumber ==null ? "" :$('#sex_'+sexNumber).text() === "全部" ? "" : $('#sex_'+sexNumber).text() ;
     var schools = schoolsNumber==null ? "" :$('#schools_'+schoolsNumber).text() === "全部" ? "" : $('#schools_'+schoolsNumber).text();
     var isPopular = isPopularNumber ==null ? "" :$('#isPopular_'+isPopularNumber).text() === "全部" ? "" : $('#isPopular_'+isPopularNumber).text();
     $('#userList_sex_id').val(sex);
     $('#userList_country_id').val(country);
     $('#userList_schools_id').val(schools);
     $('#userList_isPopular_id').val(isPopular);
     $('#form1').submit();
}	
 
 function selectSchools(t,schoolsListSize) {
	 var flag = "schools_";
	 changeColor(t,schoolsListSize,flag);
	 localStorage.setItem('schoolsNumber',t);
	 localStorage.setItem('schoolsListSize',schoolsListSize);
     var schools = $('#schools_'+t).text() === "全部" ? "" : $('#schools_'+t).text();
     var sexNumber =  localStorage.getItem('sexNumber');
     var countryNumber =  localStorage.getItem('countryNumber');
     var isPopularNumber =  localStorage.getItem('isPopularNumber');
     var sex = sexNumber ==null ? "" :$('#sex_'+sexNumber).text() === "全部" ? "" : $('#sex_'+sexNumber).text() ;
     var country = countryNumber==null ? "" :$('#country_'+countryNumber).text() === "全部" ? "" : $('#country_'+countryNumber).text();
     var isPopular = isPopularNumber ==null ? "" :$('#isPopular_'+isPopularNumber).text() === "全部" ? "" : $('#isPopular_'+isPopularNumber).text();
     $('#userList_sex_id').val(sex);
     $('#userList_country_id').val(country);
     $('#userList_schools_id').val(schools);
     $('#userList_isPopular_id').val(isPopular);
     $('#form1').submit();
 }
 
 function selectIsPopular(t,isPopularListSize) {
	 var flag = "isPopular_";
	 changeColor(t,isPopularListSize,flag);
	 localStorage.setItem('isPopularNumber',t);
	 localStorage.setItem('isPopularListSize',isPopularListSize);
     var isPopular = $('#isPopular_'+t).text()  === "全部" ? "" : $('#isPopular_'+t).text();
     var sexNumber =  localStorage.getItem('sexNumber');
     var countryNumber =  localStorage.getItem('countryNumber');
     var schoolsNumber =  localStorage.getItem('schoolsNumber');
     var sex = sexNumber ==null ? "" :$('#sex_'+sexNumber).text() === "全部" ? "" : $('#sex_'+sexNumber).text() ;
     var country = countryNumber==null ? "" :$('#country_'+countryNumber).text() === "全部" ? "" : $('#country_'+countryNumber).text();
     var schools = schoolsNumber ==null ? "" :$('#schools_'+schoolsNumber).text() === "全部" ? "" : $('#schools_'+schoolsNumber).text();
     $('#userList_sex_id').val(sex);
     $('#userList_country_id').val(country);
     $('#userList_schools_id').val(schools);
     $('#userList_isPopular_id').val(isPopular);
     $('#form1').submit();
 }
 
 function selectSex(t, sexListSize) {
	 var flag = "sex_";
	 changeColor(t,sexListSize,flag);
	 localStorage.setItem('sexNumber',t);
	 localStorage.setItem('sexListSize',sexListSize);
     var sex = $('#sex_'+t).text()  === "全部" ? "" : $('#sex_'+t).text();
     var isPopularNumber =  localStorage.getItem('isPopularNumber');
     var countryNumber =  localStorage.getItem('countryNumber');
     var schoolsNumber =  localStorage.getItem('schoolsNumber');
     var isPopular = isPopularNumber ==null ? "" :$('#isPopular_'+isPopularNumber).text() === "全部" ? "" : $('#isPopular_'+isPopularNumber).text();
     var country = countryNumber==null ? "" :$('#country_'+countryNumber).text() === "全部" ? "" : $('#country_'+countryNumber).text();
     var schools = schoolsNumber ==null ? "" :$('#schools_'+schoolsNumber).text() === "全部" ? "" : $('#schools_'+schoolsNumber).text();
     $('#userList_sex_id').val(sex);
     $('#userList_country_id').val(country);
     $('#userList_schools_id').val(schools);
     $('#userList_isPopular_id').val(isPopular);
     $('#form1').submit();
 }
 
 function  checkSinger(t) {
	  var id = $('#id_'+t).val();
	  parent.document.getElementById('Mainid').src = '${ctx}/Singer/checkSinger.do?id='+id;//没有返回值，用这种方法
}
 
 
 function saveCurrentPlaySongList(songPath) {
	 $.ajax({                                                      
         cache:false,                                            
         type: "POST",                                          
         url: '${ctx}/SongList/saveCurrentPlaySongList.do',      
         data:"songPath="+songPath,                         
         async:false,                                         
         success: function (result) {                         
         },
         error: function(data) {      }
     }); 
	 
 }
 function getMusicList(){
	 var strs= new Array();
	strs =parent.returnMusicArry();
	var tbody = document.getElementById("tbody");
	var i=0;
	 $("#tbody").empty();
	var photopath ='${ctx}/img/deletemusic.jpg';
	 $.ajax({                                                      
          cache:false,                                            
          type: "POST",                                          
          url: '${ctx}/Song/getSongListBySongPathList.do',      
          data:"strs="+strs,                         
          async:false,                                         
          success: function (result) {                         
        	  for (var key in result) { 
                  i++;               
                 var total = result.length;
                  var item = result[key];
                  var tr = tbody.insertRow(-1);           
                  var rowNumber = ++key;
                  var tdRowNumber = tr.insertCell(-1);      
                  var tdsongName = tr.insertCell(-1);                      
                  var tdsingerName = tr.insertCell(-1);
                  var tdsongPath = tr.insertCell(-1);
                  var tdaction = tr.insertCell(-1);
                  tdRowNumber.innerHTML = rowNumber;                        
                  tdsongName.innerHTML = "<span  onclick='listPlayMusic("+rowNumber+","+total+")'  id='tdsongName_"+rowNumber+"' >"+item.songName+"</span>";
                  tdsingerName.innerHTML = "<span   id='tdsingerName_"+rowNumber+"' >"+item.singerName+"</span>";
                  tdsongPath.innerHTML = "<span  style='display:none' id='tdsongPath_"+rowNumber+"' >"+item.songPath+"</span>";
                  tdaction.innerHTML = "<img  class='wrap'  src='"+photopath+"'   onclick='deleteMusic("+rowNumber+")'   id='deleteMusic_"+rowNumber+"'/>";
              }
              if(i==0){
            	
              }   
          },
          error: function(data) {      }
      }); 
 }
 
 function listPlayMusic(t,total) {
	 var songPath = $("#tdsongPath_"+t).text();
	 saveCurrentPlaySongList(songPath);
	 var songName = $("#tdsongName_"+t).text();
	 localStorage.setItem('songPath',songPath);//播放新·的就要更新
	 var  checkLyric = parent.document.getElementById('checkLyric');
	  checkLyric.innerHTML = songName;
	 var audioElement = parent.document.getElementById('userMain_audio_id');
	 var a="${ctx}"+songPath;
     audioElement.src = encodeURI(a);
     if(audioElement.paused) {
		  audioElement.play();
	  }	   
      parent.play();
      var prev =parent.document.getElementById('prev');//根据他是否有显示,判断是否为歌词界面,歌词界面必显示
		if( prev.style.display=="none") {	//歌词界面
			parent.document.getElementById('Mainid').src='${ctx}/Song/checkLyric.do?songPath='+ songPath;
		}	 
 }
	
 function deleteMusic(t) {
	    var strs= new Array();
		strs =parent.returnMusicArry();
		var songPath = $("#tdsongPath_"+t).text();
		var index = strs.indexOf(songPath);
		if (index > -1) {
			strs.splice(index, 1);
		}
	   localStorage.setItem('musicPathList',strs); //播放列表路径改变
	   getMusicList();
	   var currentPath ="http://localhost:8080"+"${ctx}"+songPath;
	  var audioElement = parent.document.getElementById('userMain_audio_id');
	   var audioElementSrc = audioElement.src;
	   audioElementSrc = decodeURI(audioElementSrc);
	   if(audioElementSrc == currentPath) {
		  if(!audioElement.paused) {
			  parent.next();
			  return;
		  } 
		  parent.next();
		  parent.pause();
		  
	   }
 }
	 
  
    
 </script>
   
  </body>
</html>
