
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
    
     .singer{
	border:2px solid #a1a1a1;
	padding:5px 30px;
	height: 300px;
	width:280px;
	border-radius:30px;
	text-indent:center;
}
 
#main{width:auto;height:auto;margin-top:30px;}
#left{width:400px;height:1000px;}
#right{width:1020px;height:1000px;margin-left:10px;}
#left,#right{float:left;}

</style>
 <body >
 <a id="textkaka" href="#lvke" style="display:none" data-toggle="modal" class="btn btn-info btn-small" onclick="getMusicList()"><li class="icon-plus icon-white"></li>播放列表</a>
    <div id="main">
    <div id="left"> 
      <div class="singer" >
    <a id="textkaka5" href="#lvke5"  data-toggle="modal"  onclick="checkSingerInformation()" ><img class="tt" src="<%=request.getContextPath()%>${singerPo.photoPath}" style="height: 300px;width:280px;" /></a> 
     </div>
           <input id="id" type="text"  style="display:none"   value="${singerPo.id}"> 
           <input id="musicPathList_id"  type="text" style="display:none;" value="${musicPathList}" >
            <input id="introduce_id"  type="text" style="display:none;" value="${singerPo.introduce}" >
         <input id="photoPath_id"  type="text" style="display:none;" value="${singerPo.photoPath}" >
     </div>
    <div id="right">
    
    <ul id="myTab" class="nav nav-tabs">
	<li  class="active">
		<a href="#song" data-toggle="tab" style="width:200px;text-align:center;font-size:20px"> 歌曲</a>
	</li>
	<li ><a href="#mian" data-toggle="tab" style="width:200px;text-align:center;font-size:20px">主页</a></li>
	<li ><a href="#album" data-toggle="tab" style="width:200px;text-align:center;font-size:20px" >专辑</a></li>
	<li><a href="#mv" data-toggle="tab" style="width:200px;text-align:center;font-size:20px">MV</a></li>
</ul>

<div id="myTabContent" class="tab-content">
	<div class="tab-pane fade" id="mian">
		  <div style="text-align:center;color:#87CEEB">  ${singerPo.singerName},${singerPo.country}歌手<br>
       擅长的流派是:"${singerPo.schools}"音乐<br>
       ${singerPo.introduce}<br>
        </div>
	</div>
	<div class="tab-pane fade in active" id="song">
		<table class="table table-striped">
      <thead class="theadone">
    <tr>
      <th class="wrap" style="text-align:center;vertical-align:middle;">统计 ：${songSize }首</th>
      <th class="wrap" style="text-align:center;vertical-align:middle;"></th>
      <th class="wrap" style="text-align:center;vertical-align:middle;"></th>
    </tr>
  </thead>
  <tbody>
 <c:forEach items="${songList}" var="item" varStatus="status">
    <tr>
      <td  class="wrap" style="text-align:center;vertical-align:middle;"> <a  onclick="checkLyric(${status.index+1},${songSize})" title="点击查看" id="songName_${status.index+1}">${item.songName}</a></td>
      <td  class="wrap" style="text-align:center;vertical-align:middle;">${item.singerName}</td>
      <td  class="wrap" style="text-align:center;vertical-align:middle;">
       <img class="wrap" src="<%=request.getContextPath()%>/img/播放.gif"    onclick="playMusic(${status.index+1},${songSize})"   id="playMusic_${status.index+1}"/>
       <img class="wrap"  style="display:none" src="<%=request.getContextPath()%>/img/暂停.gif"    onclick="stopMusic(${status.index+1})"   id="stopMusic_${status.index+1}"/>
       <img class="wrap" src="<%=request.getContextPath()%>/img/新建.jpg"   onclick="addMusicPlayList(${status.index+1},${songSize})"   id="addMusicPlayList_${status.index+1}"/>
       <img class="wrap" src="<%=request.getContextPath()%>/img/评论.jpg"   onclick="showComment(${status.index+1},${songSize})"   id="showComment_${status.index+1}"/>
         <img class="wrap" src="<%=request.getContextPath()%>/img/下载.jpg"   onclick="loadMusic(${status.index+1},${songSize})"   id="loadMusic_${status.index+1}"/>
          <a  href="#lvke3"  data-toggle="modal"   onclick="joinSongList(${status.index+1},${songSize})"   id="joinSongList_${status.index+1}"><img class="wrap" src="<%=request.getContextPath()%>/img/加入列表.jpg" /></a> 
         <c:if test="${item.songStuts == 'false'}"><img  onclick="joinSaveList(${status.index+1})" class="wrap" src="<%=request.getContextPath()%>/img/点赞.PNG" /></c:if>   
         <c:if test="${item.songStuts == 'true'}"><img  onclick="removeSaveList(${status.index+1})" class="wrap" src="<%=request.getContextPath()%>/img/取消点赞.jpg" /></c:if>   
        <form action="${ctx}/Song/loadMusic.do" method="post"  id="loadmusicId_${status.index+1}">
          <input id="song_songName_ID" name="songPath" type="text" style="display:none;" value="${item.songPath}" >
      </form>
      </td>
        <td  class="wrap" style="text-align:center;vertical-align:middle;display:none;"><span  id="songPath_${status.index+1}">${item.songPath}</span></td>
    </tr>
     </c:forEach>
  </tbody>
</table> 	
	</div>
	<div class="tab-pane fade" id="album">
	<div style="font-size:20px;margin-top:15px">
		<span style="margin-left:50px">统计 ：${albumSize }张</span>
</div>

<div class="dgvone" style="margin-top:15px">
        <c:forEach items="${abumList}" var="item" varStatus="status">
     <div  style="float:left;margin-left:20px;margin-top:20px">
            <img onclick="checkAlbum(${status.index+1})" id="albumPhotoPath_${status.index+1}" src="<%=request.getContextPath()%>${item.albumPhotoPath}"  style="height: 170px;width:170px;margin-left:20px;" title="${item.albumName}"> 
            <div style="margin-left:20px;margin-top:10px">
             <span   style="font-size:15px;"   >${item.albumName} </span><br>
              <span   style="font-size:20px;color:#87CEEB;margin-top:20px"   >${item.singerName} </span>
            </div> 
                  <input id="albumName_${status.index+1}" type="text"  style="display:none"   value="${item.albumName}"> 
                   <input id="albumid_${status.index+1}" type="text"  style="display:none"   value="${item.id}"> 
    </div>
   </c:forEach>
    </div>
	</div>
	<div class="tab-pane fade" id="mv">
	<div style="font-size:20px;margin-top:15px">
		<span style="margin-left:50px">统计 ：${mvSize }张</span>
</div>
   
    <div class="dgvone">
        <c:forEach items="${mvList}" var="item" varStatus="status">
     <div  style="float:left;margin-left:20px;margin-top:20px">
         <img onclick="checkMv(${status.index+1})" id="MvPhotoPath_${status.index+1}" src="<%=request.getContextPath()%>${item.mvPhotoPath}"  style="height: 170px;width:170px;margin-left:20px;" title="${item.mvName}">  
            <div style="margin-left:20px;margin-top:10px">
             <span   style="font-size:15px;"   >${item.mvName} </span><br>
              <span   style="font-size:20px;color:#87CEEB;margin-top:20px"   >${item.singerName} </span>
            </div> 
                      <input id="mvName_${status.index+1}" type="text"  style="display:none"   value="${item.mvName}"> 
                   <input id="mvid_${status.index+1}" type="text"  style="display:none"   value="${item.id}"> 
    </div>
   </c:forEach>
    </div>
	</div>
</div>
    
    
    
    
    
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
				<span id="Singer_introduce" style="color:#87CEEB"></span>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" >关闭
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
  
 
 <div class="modal fade" id="lvke3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
				加入歌单<span style="display:none;" id="songList_songPath_id"></span>
				</h4>
			</div>
			<div class="modal-body">
				<table class="table table-striped" id="tableid">
	         <thead class="theadone">
	        <tr>
	          <th style="display:none">序号</th>
	          <th style="display:none">歌单名</th>
	        </tr>
	      </thead>
	      <tbody id="Jointbody">
	      </tbody>
	    </table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" id="close">关闭
				</button>
				<button type="button" class="btn btn-primary"  onclick="insertIntoSongList()">
					提交更改
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
	//  $('#Tips').show().delay(500).fadeOut();
	  parent.hidePrev2AndNext2();//前台所有页面都要这个代码
	
	})
	
	function  checkMv(t) {
	  var id = $('#mvid_'+t).val();
	  parent.document.getElementById('Mainid').src = '${ctx}/Mv/checkMv.do?id='+id;//没有返回值，用这种方法
 }
	
	function checkSingerInformation() {
	 var introduce = $('#introduce_id').val();
	 var photoPath = $('#photoPath_id').val();
     $('#Singer_introduce').text(introduce);
     document.getElementById('Singer_PhotoPath').src = "${ctx}"+photoPath;
 }
 
	//久的
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
 
 function joinSongList(t,total) {
	 var songPath = $("#songPath_"+t).text();
	 $("#songList_songPath_id").text(songPath);
	 var Jointbody = document.getElementById("Jointbody");
		 $("#Jointbody").empty();
		 $.ajax({                                                      
	          cache:false,                                            
	          type: "POST",                                          
	          url: '${ctx}/SongList/getUserSongList.do',                              
	          async:false,                                         
	          success: function (result) {                         
	        	  for (var key in result) {          
	                 var total = result.length;
	                  var item = result[key];
	                  var tr = Jointbody.insertRow(-1);           
	                  var rowNumber = ++key;
	                  var tdid = tr.insertCell(-1);      
	                  var tdsongListName = tr.insertCell(-1);                       
	                  tdid.innerHTML = "<input type='checkbox' name='songListName' value='"+item.songListName+"'>";
	                  tdsongListName.innerHTML = "<span   id='tdsongListName_"+rowNumber+"' >"+item.songListName+"</span>";
	                
	              }

	          },
	          error: function(data) {      }
	      }); 
 }
 
 function insertIntoSongList(){
	  //var id = $("#id").val();
	   var chk_value=[];
	   var  songPath = $("#songList_songPath_id").text();
	  	$('input[name="songListName"]:checked').each(function(){
	  		chk_value.push($(this).val());
	  	});
	  	 $.ajax({                                                      
	          cache:false,                                            
	          type: "POST",                                          
	          url: '${ctx}/SongList/insertIntoSongList.do',     
	          data:"songListNameList="+chk_value+'&songPath='+songPath,      
	          async:false,                                         
	          success: function (result) {                         
	        	//  parent.document.getElementById('Mainid').src = '${ctx}/Album/checkAlbum.do?id='+id;
	        	  document.getElementById('close').click();
	          },
	          error: function(data) {      }
	      }); 
	  }
 function joinSaveList(t) {
	 var songPath = $("#songPath_"+t).text();
	 var id = $("#id").val();
	 $.ajax({                                                      
         cache:false,                                            
         type: "POST",                                          
         url: '${ctx}/SongList/joinSaveList.do',      
         data:"songPath="+songPath,                         
         async:false,                                         
         success: function (result) {                         
        	  parent.document.getElementById('Mainid').src = '${ctx}/Singer/checkSinger.do?id='+id;//没有返回值，用这种方法
         },
         error: function(data) {      }
     }); 
	 
 }
 
 function removeSaveList(t) {
	 var songPath = $("#songPath_"+t).text();
	 var id = $("#id").val();
	 $.ajax({                                                      
         cache:false,                                            
         type: "POST",                                          
         url: '${ctx}/SongList/removeSaveList.do',      
         data:"songPath="+songPath,                         
         async:false,                                         
         success: function (result) {                         
        	 parent.document.getElementById('Mainid').src = '${ctx}/Singer/checkSinger.do?id='+id;//没有返回值，用这种方法
         },
         error: function(data) {      }
     }); 
 }
	
	function checkLyric(t,total) {
	 var songPath = $("#songPath_"+t).text();
	 parent.document.getElementById('Mainid').src='${ctx}/Song/checkLyric.do?songPath='+ songPath;
	 
 }
 
 function playMusic(t,total) {
	  var musicPathList = new Array();
	  musicPathList = $('#musicPathList_id').val();
	  saveMusicArry(musicPathList);
	  for(var i = 1; i <=total; i++) {
		   if(i!=t){
			   $("#playMusic_"+i).show();
			   $("#stopMusic_"+i).hide();
		   }
		};

	 $("#playMusic_"+t).hide();
	 $("#stopMusic_"+t).show();
	 var songPath = $("#songPath_"+t).text();
	 saveCurrentPlaySongList(songPath);
	 var songName = $("#songName_"+t).text();
	 localStorage.setItem('songPath',songPath); //播放那首歌的路径重点!!!!
	 localStorage.setItem('songName',songName); 
	 var  footeeElement = parent.document.getElementById('userMain_footer_id');
	 var  checkLyric = parent.document.getElementById('checkLyric');
	  checkLyric.innerHTML = songName;
	  footeeElement.style.display="block";
    var audioElement = parent.document.getElementById('userMain_audio_id');
	 var a="${ctx}"+songPath;
    audioElement.src = encodeURI(a);
    if(audioElement.paused) {
		  audioElement.play();
	  }	   
     parent.play();
}
 
 function saveMusicArry(musicPathList) {
		var strs= new Array(); 
		strs=musicPathList.split(",");
		var length = strs.length;
		 for(var i = 0; i <length; i++) {
			   if(i == (length-1)||(length==1)) {
					var last =strs[i].length;
				   strs[i] = strs[i].substring(1,last-1);
			   } else {
				   strs[i] = strs[i].substring(1);
			   }  
			};
			 localStorage.setItem('musicPathList',strs); //播放列表路径改变
			return strs;
	}
 
 function stopMusic(t) {
	 $("#playMusic_"+t).show();
	 $("#stopMusic_"+t).hide();
     var audioElement = parent.document.getElementById('userMain_audio_id');
     if(audioElement.played) {
			audioElement.pause();
	 }	 
     parent.pause();
 }
 
 function addMusicPlayList(t,total) {
	 var songPath = $("#songPath_"+t).text();
	 var strs= new Array();
     strs =parent.returnMusicArry();
     strs.push(songPath);
     localStorage.setItem('musicPathList',strs);//实时更新
 }

 function showComment(t,total) {
     var songPath = $("#songPath_"+t).text();
	 parent.document.getElementById('Mainid').src='${ctx}/SongComment/showComment.do?songPath='+ songPath;
	 
 }
 
 function loadMusic(t,total) {
     for(var i = 1; i <=total; i++) {
		   if(i==t){
			   $("#loadmusicId_"+t).submit();
		   }
		};
	 
 }
	function showAlbumComment() {
     var id = $("#id").val();
	 parent.document.getElementById('Mainid').src='${ctx}/AlbumComment/showComment.do?id='+ id; 
  }
 

 
 function  checkAlbum(t) {
	  var id = $('#albumid_'+t).val();
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