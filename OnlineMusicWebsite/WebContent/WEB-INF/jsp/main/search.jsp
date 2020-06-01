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
  </style>
  
  </head>
  
 
  <body background="<%=request.getContextPath()%>/img/xuhua.jpg"> 
  <div class="container">
  
   <div class="span12">
		      <input id="Tips" class="explainlog" type="text" style="width:100%;height:27px;" style="display:none" value="${AdminTipe}"  readonly="readonly"> 
	  </div>
	  <br>
    <div class="span11" style=" border: solid; border-color:  #FFF0F5;">
   <div class="span9 margin-top-one">
      <div class="row-fluid">
        <h3 style="text-align: center;">歌曲筛选</h3>
        
      </div>
    </div>
    <form action="" method="post" onsubmit="" >
    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	   
	    <div class="span12">
	      <div class="row-fluid">
		      <div class="span3">
		          <a style="width:100%;height:27px;">歌曲</a>
		      </div>
		      <div class="span3">
		        <a style="width:100%;height:27px;">专辑</a>
		     </div>
		   <div class="span3">
		         <a style="width:100%;height:27px;">Mv</a>
		     </div>
		     
		      <div class="span3">
		         <a style="width:100%;height:27px;">歌手</a>
		     </div>
		    
		  </div>
	    </div>
	    
      </form>
    </div>
      <br>
      
      <div class="center">
    <span style="width: 100px; "> 筛选结果</span>
    </div>
       <br>
    <div style="width:100%;height:100%;">
				  <iframe id="Mainid" src="${ctx}/Song/userList.do" style="width:100%;height:100%;"  frameBorder="0" ></iframe>
		</div>
    
      
      <div class="modal hide fade" id="lvke" style="text-align:right;width:500px;height:480px; " >
      <div class="span5" style="width:400px;height:480px; overflow-x:auto;">
         <div class="row-fluid">
		   <div class="span8">
		      <label class="labelroomnumber">播放列表</label>
	       </div>  
	    </div>
	     <div class="dgvone" style="width:100%;text-align:center;">
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
    </div>
    </div>
    
    
 
 
 
 
 <script type="text/javascript">
 $(document).ready(function () {
	  $('#Tips').show().delay(500).fadeOut();
	  parent.hidePrev2AndNext2();//前台所有页面都要这个代码
	})
	
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

 function loadMusic(t,total) {
     for(var i = 1; i <=total; i++) {
		   if(i==t){
			   $("#loadmusicId_"+t).submit();
		   }
		};
	 
 }
 function checkLyric(t,total) {
	 var songPath = $("#songPath_"+t).text();
	 parent.document.getElementById('Mainid').src='${ctx}/Song/checkLyric.do?songPath='+ songPath;
	 
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
