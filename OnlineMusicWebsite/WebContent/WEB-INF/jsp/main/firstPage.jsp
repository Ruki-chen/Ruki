
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
    .tt{
     width: 80%;    
    
  
    }
      .wrap{
 
     width: 30px; 
     height: 20px;
    
}	

   .labelroomnumber{
      position: relative;
      font-size: 17px;
      float: left;
      margin-top: 15px;
    }
 
</style>
 <body >
  <a id="textkaka" href="#lvke" style="display:none" data-toggle="modal" class="btn btn-info btn-small" onclick="getMusicList()"><li class="icon-plus icon-white"></li>播放列表</a>
     <div id="myCarousel" class="carousel slide">
	<!-- 轮播（Carousel）指标 -->
	<ol class="carousel-indicators">
		<c:forEach begin='0' end='${aListSize}' var="i" >
		<li data-target="#myCarousel" data-slide-to="${i}"></li>
		</c:forEach>
	</ol>   
	<!-- 轮播（Carousel）项目 -->
	<div class="carousel-inner">
		  <c:forEach items="${aList}" var="item" varStatus="status">
		<div class="item">
				<center><img   src="<%=request.getContextPath()%>${item.albumPhotoPath}"   class="tt"  onclick="checkAlbumInMain(${status.index+1})"></center>
			  <div class="carousel-caption"><span id="albumId_${status.index+1}">${item.id}</span></div>
		</div>
		</c:forEach>
	</div>
	<!-- 轮播（Carousel）导航 -->
	<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		<span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
	</a>
</div> 


    
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
 
 <script type="text/javascript">
   
 $(document).ready(function () {
	// parent.hidePrev2AndNext2();
	$('#myCarousel').carousel({
    interval: 2000
})
	})
	
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
	 
 function checkAlbumInMain(t) {
	 var id = $('#albumId_'+t).text();
	  parent.document.getElementById('Mainid').src = '${ctx}/Album/checkAlbum.do?id='+id;//没有返回值，用这种方法
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
