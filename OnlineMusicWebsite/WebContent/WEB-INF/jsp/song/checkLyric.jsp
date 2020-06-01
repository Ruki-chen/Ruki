
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
   
    .change{
  width:100%; 
  height:100%; 
 
  }
   .tt{
       width:700px;
      height:400px; 
  
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
 
#main{width:auto;height:auto;margin-top:30px;}
#left{width:750px;height:1000px;}
#right{width:700px;height:1000px;margin-left:10px;}
#left,#right{float:left;}

</style>
 <body >
 <a id="textkaka" href="#lvke" style="display:none" data-toggle="modal" class="btn btn-info btn-small" onclick="getMusicList()"><li class="icon-plus icon-white"></li>播放列表</a>
    <div id="main">
    <div id="left"> 
      <a id="textkaka5" href="#lvke5"  data-toggle="modal"  onclick="checkSingerInformation()" ><img class="tt" src="<%=request.getContextPath()%>${singerimfo.photoPath}" style="height: 500px;width:700px;" /></a>  <br>
         <input id="photoPath_id"  type="text" style="display:none;" value="${singerimfo.photoPath}" >
       
         <div style="width:700px;margin-top: 20px;text-align:center;"> 
       <img class="wrap" src="<%=request.getContextPath()%>/img/评论.jpg"   onclick="showComment()"   id="showComment_Id"/>
         <img class="wrap" src="<%=request.getContextPath()%>/img/下载.jpg"   onclick="loadMusic()"   id="loadMusic_id"/>
        <form action="${ctx}/Song/loadMusic.do" method="post"  id="loadmusicId_Id">
          <input id="song_songName_ID" name="songPath" type="text" style="display:none;" value="${songimfoPo.songPath}" >
      </form> 
        </div>
     </div>
    <div id="right">

 
    <table class="table table-striped">
      <thead class="theadone">
    <tr>
      <th class="wrap" style="text-align:center;vertical-align:middle;">${songimfoPo.songName}</th>
    </tr>
  </thead>
  <tbody>
 <c:forEach items="${resultList}" var="item" varStatus="status">
    <tr>
      <td  class="wrap" style="text-align:center;vertical-align:middle;"> <a  >${item}</a></td>
      
    </tr>
     </c:forEach>
  </tbody>
</table> 
 </div>
 </div>
 
 <div class="modal fade" id="lvke5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<img  src="<%=request.getContextPath()%>/img/播放.gif"  id="Singer_PhotoPath" style="height: 200px;width:480px;">
			</div>
			<div class="modal-body">
			 <div style="text-align:center;color:#87CEEB"> 歌名:"${songimfoPo.songName}",由${songimfoPo.singerName}演唱,所属"${songimfoPo.albumName}"专辑<br>
         是${songimfoPo.country}的"${songimfoPo.schools}"音乐<br>
       发行年份是${songimfoPo.year}<br>
        </div>
				<span id="Singer_introduce" style="color:#87CEEB"></span>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" >关闭
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
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
	  //var audio = document.getElementById('mp3Btn');
	 // audio.play();
		
	})
	
	function checkSingerInformation() {
	 var photoPath = $('#photoPath_id').val();
     document.getElementById('Singer_PhotoPath').src = "${ctx}"+photoPath;
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
	
	function showComment() {
     var songPath = $("#song_songName_ID").val();
	 parent.document.getElementById('Mainid').src='${ctx}/SongComment/showComment.do?songPath='+ songPath; 
  }
 

 function loadMusic() {
	  $("#loadmusicId_Id").submit();
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
