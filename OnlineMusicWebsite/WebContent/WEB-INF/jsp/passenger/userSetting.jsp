
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
 
     width: 60px; 
     height: 50px; 
}	

 .wrap1{
 
    width: 30px; 
     height: 20px;
}	

   .labelroomnumber{
      position: relative;
      font-size: 17px;
      float: left;
      margin-top: 15px;
    }
 
#main{width:auto;height:auto;}
#left{width:750px;height:1000px;}
#right{width:700px;height:1000px;margin-left:10px;}
#left,#right{float:left;}

  .songList{
	height: 30px;
	width:100%;
	text-indent:center;
}
</style>
 <body >
  <a id="textkaka" href="#lvke" style="display:none" data-toggle="modal" class="btn btn-info btn-small" onclick="getMusicList()"><li class="icon-plus icon-white"></li>播放列表</a>
  <a id="textkaka1" href="#lvke2" style="display:none" data-toggle="modal" class="btn btn-info btn-small" ><li class="icon-plus icon-white"></li>新建列表</a>
  
   <input id="mail"  type="text"  style="display:none;" value="${userpo.mail}" > 
 <div class="container">
  
    <div style=" border: solid; border-color:  #FFF0F5;width:80%;margin-top:20px">
      <div class="">
        <h3 style="text-align: left;">
         <c:if test="${userpo.photoPath == null}">	 <i class="icon-user" onclick="updateUser()"></i>${userpo.userName}</h3></c:if>   
          <c:if test="${userpo.photoPath != null}"> <img onclick="updateUser()" class="wrap" src="<%=request.getContextPath()%>${userpo.photoPath}" />${userpo.userName}</h3></c:if>       
      </div>
     <div  >
		       <img style="margin-left:100px;" onclick="" class="wrap" src="<%=request.getContextPath()%>/img/用户下载.jpg" />
		       <img style="margin-left:100px;" onclick="showSongList(3,${allSongSize})" class="wrap" src="<%=request.getContextPath()%>/img/用户最近.jpg" />
                 <img style="margin-left:100px;" onclick="showSongList(1,${allSongSize})" class="wrap" src="<%=request.getContextPath()%>/img/用户收藏.jpg" />
		        <img style="margin-left:100px;" onclick="turnOn()" style="margin-left:140px;" class="wrap" src="<%=request.getContextPath()%>/img/新建.jpg"  title="新建歌单"/>
		         <a  href="#lvke4"  data-toggle="modal"  style="margin-left:100px;" onclick="joinSongList()"   id="deleteSongList"><img class="wrap"  src="<%=request.getContextPath()%>/img/deletemusic.jpg"/></a>
  </div> 
  <div   style="margin-top:10px;"">
		       <span style="margin-left:100px;font-size:30px">下载</span>
		       <span style="margin-left:100px;font-size:30px" >最近</span>
               <span style="margin-left:100px;font-size:30px">收藏</span>
		       <span style="margin-left:100px;font-size:30px">新建</span>
		       <span style="margin-left:100px;font-size:30px">删除</span>
    </div>
    </div>
  
    <div  style=" border: solid; border-color:  #FFF0F5;width:80%;margin-top:40px;">
   
   <div class="panel-group" id="accordion">
    <c:forEach items="${allSongList}" var="item" varStatus="status">
     <span style="display:none;" id="songListName_${status.index+1}">${item.songListName}</span>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<div data-toggle="collapse" data-parent="#accordion" 
				   href="#${status.index+1}"  onclick="showSongList(${status.index+1},${allSongSize})" class="songList">
				 <span >${item.songListName} </span>
				</div>
			</h4>
		</div>
		<div id="${status.index+1}" class="panel-collapse collapse">
			<div class="panel-body">
				 
             <table class="table table-striped">
             <thead class="theadone">
               <tr>
             <th class="" ><span id="create_songListName_id_${status.index+1}" style="display:none"></span> </th>
             <th><a style="margin-left:250px;display:none;" id="information_${status.index+1}" >该歌单暂无歌曲，快去添加吧</a></th>
               <th><a style="margin-left:350px;" onclick="clearSongList(${status.index+1})" id="clearAll_${status.index+1}"></a><span id="total_id_${status.index+1}"></span></th>
           </tr>
            </thead>
            <tbody id="createTbody_${status.index+1}">
           </tbody>
          </table>
         
			</div>
		</div>
	</div>
	</c:forEach>
	</div>
   
   
   
   
   
   
  

  
      
 </div>
    </div>
    
    <div class="modal fade" id="lvke4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
				删除歌单
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
	      <tbody id="deletetbody">
	      </tbody>
	    </table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" id="close4">关闭
				</button>
				<button type="button" class="btn btn-primary"  onclick="deleteSongList()">
					提交
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
 
     
     <div class="modal fade" id="lvke2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
				新建歌单
				</h4>
			</div>
				<form action="${ctx}/SongList/addSongList.do" method="post" onsubmit="return verifySongList()" >
			<div class="modal-body">
              <a style="height:30px;width:100px" >歌单名：</a > <input id="songListName_id" name="songListName"  type="text"  style="height:30px;width:400px" > <br>
              <a style="height:30px;width:100px" >歌单简介：</a > <textarea style="width:400px;height:80px;" id="introduce_Id" name="introduce"></textarea><br>       
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" >关闭
				</button>
				<button type="submit" class="btn btn-primary" >
					保存
				</button>
			</div>
			</form>
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
					提交
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
	
	var musicPathList;
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
	
	function deleteSongList() {
		 var chk_value=[];
		 $('input[name="songListName"]:checked').each(function(){		  
			 chk_value.push($(this).val());
		  });
		  	 $.ajax({                                                      
		          cache:false,                                            
		          type: "POST",                                          
		          url: '${ctx}/SongList/deleteSongList.do',     
		          data:"songListNameList="+chk_value,      
		          async:false,                                         
		          success: function (result) {                         
		        	  document.getElementById('close4').click();
		        	  parent.document.getElementById('Mainid').src = '${ctx}/Passenger/userSetting.do';
		          },
		          error: function(data) {      }
		      }); 
	}
 
	
	 function showSongList(t,allSongSize) { 
		 for(var i=1;i<=allSongSize;i++) {
			 if(i!=t) {
				 $('#'+i).collapse('hide');
			 }
		 }
		   $('#'+t).collapse('show');
		 $('#create_songListName_id_'+t).text("");
         $('#total_id_'+t).text("");
         $('#clearAll_'+t).text("");	
         $('#information_'+t).hide();
		 var songListName  = $("#songListName_"+t).text();
		 var  playButtonPath ='${ctx}/img/播放.gif';
		 var stopButtonPath = '${ctx}/img/暂停.gif';
		 var joinListButtinPath = '${ctx}/img/新建.jpg';
		 var sayButtonPath = '${ctx}/img/评论.jpg';
		 var loadButtonPath = '${ctx}/img/下载.jpg';
		 var deleteButtonPath =  '${ctx}/img/deletemusic.jpg';
		  var goodpath ='${ctx}/img/点赞.PNG';
		  var restoregoodpath ='${ctx}/img/取消点赞.jpg';
		   var path ='${ctx}/img/加入列表.jpg';
		 var createTbody = document.getElementById("createTbody_"+t);
			 $("#createTbody_"+t).empty();
		 $.ajax({                                                      
	         cache:false,                                            
	         type: "POST",                                          
	         url: '${ctx}/SongList/showSongList.do',      
	         data:"songListName="+songListName,                           
	         async:false,                                         
	         success: function (result) { 
	             var total = result.length;
	             if(total != 0){
	            	 musicPathList = result[0].musicPathList;
	             }else {
	            	    $('#information_'+t).show();
	             }    
	        	 for (var key in result) {            //如果没有数据，则是不进去的
	                  var item = result[key];
	                  var tr = createTbody.insertRow(-1);           
	                  var rowNumber = ++key;
	                  var tdsongName = tr.insertCell(-1);      
	                  var tdsingerName = tr.insertCell(-1);                      
	                  var tdcontent = tr.insertCell(-1);
	                  var tdsongPath = tr.insertCell(-1);
	                  var tdId = tr.insertCell(-1);             
	                  tdsongName.innerHTML = "<a  style='text-indent:50px;width:800px' onclick='checkLyric("+rowNumber+","+total+")' title='点击查看' id='songName_"+rowNumber+"'>"+item.songName+"</a>";
	                  tdsingerName.innerHTML = "<span style='margin-left:300px;'  id='singerName_"+rowNumber+"' >"+item.singerName+"</span>";
	                  tdcontent.innerHTML = " <img style='margin-left:100px' class='wrap1' src='"+playButtonPath+"'    onclick='playMusic("+rowNumber+","+total+")'   id='playMusic_"+rowNumber+"'/>"
	                  + "<img class='wrap1'  style='margin-left:100px;display:none' src='"+stopButtonPath+"'    onclick='stopMusic("+rowNumber+")'   id='stopMusic_"+rowNumber+"'/>" 
	                  +"<img class='wrap1'  style='margin-left:10px' src='"+joinListButtinPath+"'   onclick='addMusicPlayList("+rowNumber+","+total+")'   id='addMusicPlayList_"+rowNumber+"'/>"
	                  +"<img class='wrap1' style='margin-left:10px' src='"+sayButtonPath+"'   onclick='showComment("+rowNumber+","+total+")'   id='showComment_"+rowNumber+"'/>"
	                  +"<img class='wrap1'  style='margin-left:10px' src='"+loadButtonPath+"'   onclick='loadMusic("+rowNumber+","+total+")'   id='loadMusic_"+rowNumber+"'/>"
	                  + "<a style='margin-left:10px' href='#lvke3'  data-toggle='modal'   onclick='joinSongList("+rowNumber+","+total+")'   id='joinSongList_"+rowNumber+"'><img class='wrap1' src='"+path+"' /></a> ";
	                  tdcontent.innerHTML = (item.songStuts  == "false") ?  tdcontent.innerHTML+"<img  style='margin-left:10px'  onclick='joinSaveList("+rowNumber+","+t+")' class='wrap1' src='"+goodpath+"' />" :  tdcontent.innerHTML+"<img  onclick='removeSaveList("+rowNumber+","+t+")' class='wrap1' src='"+restoregoodpath+"' />";
	                  tdcontent.innerHTML =  tdcontent.innerHTML+"<img class='wrap1'  style='margin-left:10px' src='"+deleteButtonPath+"'   onclick='removeMusic("+rowNumber+","+total+","+t+")'   id='moveMusic_"+rowNumber+"'/>";
	                  tdcontent.innerHTML =  tdcontent.innerHTML+"<form action='${ctx}/Song/loadMusic.do' method='post'  id='loadmusicId_"+rowNumber+"'>"
	                  + "<input id='song_songName_ID' name='songPath' type='text' style='display:none;' value='"+item.songPath+"' >"
	                  +"</form>";
	                  tdsongPath.innerHTML = "<span style='display:none'  id='songPath_"+rowNumber+"'>"+item.songPath+"</span>";
	                  tdId.innerHTML = "<span style='display:none'  id='id_"+rowNumber+"'>"+item.id+"</span>";
	                 $('#create_songListName_id_'+t).text(item.songListName);
	                 $('#total_id_'+t).text("（"+total+"首）");
	                 $('#clearAll_'+t).text("清空");
	              
	              }
	  
	         },
	         error: function(data) {      }
	     }); 
		 
	 }
	 
	 function joinSongList(t,total) {
		 if(t !=null) { 
		     var songPath = $("#songPath_"+t).text();
		     $("#songList_songPath_id").text(songPath);
		     var Jointbody = document.getElementById("Jointbody");
			 $("#Jointbody").empty();
		 }else {
			 var deletetbody = document.getElementById("deletetbody");
			 $("#deletetbody").empty();
		 }
			 $.ajax({                                                      
		          cache:false,                                            
		          type: "POST",                                          
		          url: '${ctx}/SongList/getUserSongList.do',                              
		          async:false,                                         
		          success: function (result) {                         
		        	  for (var key in result) {          
		                 var total = result.length;
		                  var item = result[key];
		                  var tr = (t !=null) ?  Jointbody.insertRow(-1) :deletetbody.insertRow(-1);   		                        
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
		        	  document.getElementById('close').click();
		        	
		          },
		          error: function(data) {      }
		      }); 
		  }
	
	function updateUser() {
	 var mail = $('#mail').val();
	 var userType = "user";
	  parent.document.getElementById('Mainid').src='${ctx}/Passenger/toupdate.do?mail='+ mail+'&userType='+userType;
 }
 
 function turnOn() {
	document.getElementById('textkaka1').click();
 }

 function removeMusic(t,total,songListNumber) {
	 var id = $("#id_"+t).text();
	 $.ajax({                                                      
         cache:false,                                            
         type: "POST",                                          
         url: '${ctx}/SongList/removeMusic.do',      
         data:"id="+id,                         
         async:false,                                         
         success: function (result) {        
        	 showSongList(songListNumber);
         },
         error: function(data) {      }
     }); 
 }
 
 function clearSongList(t) {
	 var songListName = $('#create_songListName_id_'+t).text();//没有数据时也要变掉，否则处理错误
	 $.ajax({                                                      
         cache:false,                                            
         type: "POST",                                          
         url: '${ctx}/SongList/clearSongList.do',      
         data:"songListName="+songListName,                         
         async:false,                                         
         success: function (result) {        
        	 showSongList(t);
         },
         error: function(data) {      }
     }); 
 }
 //播放相同功能，封装
 
  function joinSaveList(t,songListNumber) {
	 var songPath = $("#songPath_"+t).text();
	 var id = $("#id").val();
	 $.ajax({                                                      
         cache:false,                                            
         type: "POST",                                          
         url: '${ctx}/SongList/joinSaveList.do',      
         data:"songPath="+songPath,                         
         async:false,                                         
         success: function (result) {                         
        	 showSongList(songListNumber);
         },
         error: function(data) {      }
     }); 
	 
 }
 
 function removeSaveList(t,songListNumber) {
	 var songPath = $("#songPath_"+t).text();
	 var id = $("#id").val();
	 $.ajax({                                                      
         cache:false,                                            
         type: "POST",                                          
         url: '${ctx}/SongList/removeSaveList.do',      
         data:"songPath="+songPath,                         
         async:false,                                         
         success: function (result) {                         
        	 showSongList(songListNumber);
         },
         error: function(data) {      }
     }); 
 }
	
 function checkLyric(t,total) {
	 var songPath = $("#songPath_"+t).text();
	 parent.document.getElementById('Mainid').src='${ctx}/Song/checkLyric.do?songPath='+ songPath;
	 
 }
 
 function playMusic(t,total) {
	 localStorage.setItem('musicPathList',musicPathList);
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
                  tdaction.innerHTML = "<img  class='wrap1'  src='"+photopath+"'   onclick='deleteMusic("+rowNumber+")'   id='deleteMusic_"+rowNumber+"'/>";
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