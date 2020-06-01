
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
#right1{width:700px;height:1000px;margin-left:10px;}
#right2{width:700px;height:1000px;margin-left:10px;}
#left,#right1{float:left;}
#left,#right2{float:left;}

.comment{
   text-align:left;
   width:400px
    font-size: 14px;
}

   .explainlog{
           width:98%;
             font-weight:bold;
             color:red;
            text-indent:500px         
   }	
</style>
 <body >

 <a id="textkaka" href="#lvke" style="display:none" data-toggle="modal" class="btn btn-info btn-small" onclick="getMusicList()"><li class="icon-plus icon-white"></li>播放列表</a>
    <div id="main">
    <div id="left"> 
    <img class="tt" src="<%=request.getContextPath()%>${albumimfo.albumPhotoPath}" style="height: 500px;width:700px;" /> <br>
         <input id="photoPath_id"  type="text" style="display:none;" value="${albumimfo.albumPhotoPath}" >
       
         <input id="albumName" type="text"  style="display:none"   value="${albumimfo.albumName}"> 
         <input id="id" type="text"  style="display:none"   value="${albumimfo.id}"> 
          <input id="flag" type="text"  style="display:none"   value="${flag}"> 
          <input id="mail" type="text"  style="display:none"   value="${mail}"> 
        
        
        <div style="text-align:left;margin-top: 20px;"> 
       <a  style="width:400px;">输入评论</a><br>
        <textarea style="width:700px;height:90px;" id="userCommentId"></textarea>
       <div style="width:700px;text-align:right;"><a  onclick="publishComments()">发布</a></div> 
        </div>
     </div>
    <div id="right1">
    <table class="table table-striped">
      <thead class="theadone">
    <tr>
      <th class="" style="text-align:left">评论 ${commentSum}</th>
    </tr>
  </thead>
  <tbody>
 <c:forEach items="${resultList}" var="item" varStatus="status">
    <tr>
      <td  class=""> 
      <a  style="width:700px;font-size: 14px;" id="userNameId_${status.index+1}">${item.userName}</a>
      <c:if test="${item.albumCommentStuts == 'false'}"><img  onclick="addGoodNumber(${status.index+1})" class="wrap" src="<%=request.getContextPath()%>/img/点赞.PNG" /></c:if>   
      <c:if test="${item.albumCommentStuts == 'true'}"><img  onclick="reduceGoodNumber(${status.index+1})" class="wrap" src="<%=request.getContextPath()%>/img/取消点赞.jpg" /></c:if>   
      <span id="goodNumberId_${status.index+1}" style="width:700px;font-size: 14px;">${item.goodNumber}</span>
      <c:if test="${item.mail == mail}"><img  onclick="deleteComment(${status.index+1})" class="wrap" src="<%=request.getContextPath()%>/img/deletemusic.jpg" /></c:if>   <br>
      <span id="userComment_${status.index+1}">${item.userComment} </span><br>
       <a style="text-align:left;font-size: 14px;"  id="time_${status.index+1}">${item.time}</a> <a id="restore_${status.index+1}" style="font-size: 14px;" onclick="restoreComment(${status.index+1})">回复</a>
       <a  style="width:700px;font-size: 14px;" id="replayNumberId_${status.index+1}">${item.replayNumber}</a><br>
      </td>
     <td style="display:none"><input id="commentId_${status.index+1}" type="text"  style="display:none"   value="${item.id}"> </td>
       <td style="display:none"><input id="albumCommentStutsId_${status.index+1}" type="text"  style="display:none"   value="${item.albumCommentStuts}"> </td>
       <td style="display:none"><input id="mailId_${status.index+1}" type="text"  style="display:none"   value="${item.mail}"> </td>
    </tr>
     </c:forEach>
  </tbody>
</table> 
 </div>
 
 <div id="right2" style="display:none;">
 <div> <img  onclick="returnAllComment()" class="" src="<%=request.getContextPath()%>/img/返回.jpg" /></div>
 <div>   <a  style="width:700px;font-size: 14px;" id="restore_userName_id"></a> 
          <img id="restore_addGoodNumber_id" style="display:none;" onclick="addGoodNumber()" class="wrap" src="<%=request.getContextPath()%>/img/点赞.PNG" />
           <img id="restore_reduceGoodNumber_id"  style="display:none;" onclick="reduceGoodNumber()" class="wrap" src="<%=request.getContextPath()%>/img/取消点赞.jpg" />
           <span id="restore_goodNumber_id" style="width:700px;font-size: 14px;"></span>
           <img  onclick="deleteComment()"  style="display:none;" class="wrap" id="restore_deleteComment_id"  src="<%=request.getContextPath()%>/img/deletemusic.jpg"/><br>
           <span id="restore_comment_id" ></span><br>
       <a style="text-align:left;font-size: 14px;" id="restore_time_id" ></a>  <br>  
       <input id="restore_Id_id" type="text"  style="display:none" > 
 </div>
 
    <table class="table table-striped">
      <thead class="theadone">
    <tr>
      <th class="" style="text-align:left">热门回复.<span id="repalyNumber_id"></span> </th>
    </tr>
  </thead>
  <tbody id="replayTbody">
 
  </tbody>
</table> 
 </div>
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
//	 $('#Tips').show().delay(500).fadeOut();
	 parent.hidePrev2AndNext2();
	 checkShowDiv();
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
	
  function  checkShowDiv() {
	 var flag = $("#flag").val();
	 if(flag=="replay") {
		 var replyRow = localStorage.getItem("replyRow");	
		 $('#restore_'+replyRow).click();
	 }
	 
 }
  function returnAllComment() {	 
	  $("#right1").show();
	  $("#right2").hide();	 
 }
 
  function deleteComment(t) {
	    var commentId;
		var flag;
		var parentCommentId;
		if (t==null) {
			commentId = $("#restore_Id_id").val();
			flag = "replay";
			parentCommentId = 0;
		}
		else {
			  var right2 = document.getElementById('right2').style.display;
			  if(right2 == "") {
				  commentId = $("#restore_commentId_"+t).text();
				  parentCommentId = $("#restore_Id_id").val();
				  flag = "replay";
			  } else {
				  commentId = $("#commentId_"+t).val();
				  parentCommentId = 0;
				  flag = "publish";
			  }
		}
		 var id = $("#id").val();
		 $.ajax({                                                      
	         cache:false,                                            
	         type: "POST",                                          
	         url: '${ctx}/AlbumComment/deleteComment.do',      
	         data:"id="+commentId+"&parentCommentId="+parentCommentId,                      
	         async:false,                                         
	         success: function (result) {
	        	 if(result) {
	        		 parent.document.getElementById('Mainid').src='${ctx}/AlbumComment/showComment.do?id='+ id+'&flag='+flag;     
	       	     }
	         },
	         error: function(data) {      }
	     }); 
  }
	
  function addGoodNumber(t) {
	var commentId;
	var flag;
	if (t==null) {
		commentId = $("#restore_Id_id").val();
		flag = "replay";
	}
	else {
		  var right2 = document.getElementById('right2').style.display;
		  commentId = ( right2 == "" )? $("#restore_commentId_"+t).text() :$("#commentId_"+t).val();
		  flag = ( right2 == "" )?  "replay" :"publish";;
	}
	 var id = $("#id").val();
	 $.ajax({                                                      
         cache:false,                                            
         type: "POST",                                          
         url: '${ctx}/AlbumComment/addGoodNumber.do',      
         data:"id="+commentId,                      
         async:false,                                         
         success: function (result) {
        	 if(result) {
        		 parent.document.getElementById('Mainid').src='${ctx}/AlbumComment/showComment.do?id='+ id+'&flag='+flag;     
       	     }
         },
         error: function(data) {      }
     }); 
	 
 }
 
 function reduceGoodNumber(t) {
    var commentId;
	var flag;
	if (t==null) {
		commentId = $("#restore_Id_id").val();
		flag = "replay";
	}
	else {
		  var right2 = document.getElementById('right2').style.display;
		  commentId = ( right2 == "" )? $("#restore_commentId_"+t).text() :$("#commentId_"+t).val();
		  flag = ( right2 == "" )?  "replay" :"publish";
	}
	 var id = $("#id").val();
	 $.ajax({                                                      
         cache:false,                                            
         type: "POST",                                          
         url: '${ctx}/AlbumComment/reduceGoodNumber.do',      
         data:"id="+commentId,                      
         async:false,                                         
         success: function (result) {
        	 if(result) {
        		 parent.document.getElementById('Mainid').src='${ctx}/AlbumComment/showComment.do?id='+ id+'&flag='+flag;        	
       	     }
        	 
         },
         error: function(data) {      }
     }); 
 }
 
  function publishComments() {
	  var right2 = document.getElementById('right2').style.display;
	  var parentCommentId = 0;
	  var flag = "publish";
	  if(right2=="") {  //说明在第二个页面
		  parentCommentId = $("#restore_Id_id").val();      
		  flag = "replay";
	  }
	 var userComment = $("#userCommentId").val();
	 var albumName = $("#albumName").val(); 
	 var id = $("#id").val();
	 if(userComment==="") {
	//	 $("#Tips").val("不能发布空消息");
	//	 $('#Tips').show().delay(500).fadeOut();
		 return;
	 }
	 $.ajax({                                                      
         cache:false,                                            
         type: "POST",                                          
         url: '${ctx}/AlbumComment/publishComments.do',      
         data:"userComment="+userComment+"&albumName="+albumName+"&parentCommentId="+parentCommentId,                      
         async:false,                                         
         success: function (result) {                         
       	     if(result) {
       	 //   	 $("#Tips").val("发布成功");
       		//	 $('#Tips').show().delay(500).fadeOut();
       			parent.document.getElementById('Mainid').src='${ctx}/AlbumComment/showComment.do?id='+ id+'&flag='+flag;
       			 return;
       	     }
       //	     $("#Tips").val("请用户先登入");
		//	 $('#Tips').show().delay(500).fadeOut();
       	     
         },
         error: function(data) {      }
     }); 
	 
 }
   
  function restoreComment(t) {  
	  localStorage.setItem('replyRow',t);
	  var id = $("#commentId_"+t).val();
	  var userName = $("#userNameId_"+t).text();
	  var albumCommentStuts = $("#albumCommentStutsId_"+t).val();//修改过了
	  var mailId = $("#mailId_"+t).val();
	  var  userComment = $("#userComment_"+t).text();
	  var time = $("#time_"+t).text();
	  var  goodNumber = $("#goodNumberId_"+t).text();
	  var goodpath ='${ctx}/img/点赞.PNG';
	  var restoregoodpath ='${ctx}/img/取消点赞.jpg';
	  var deletemusicpath ='${ctx}/img/deletemusic.jpg';
	  var mail = $("#mail").val();
	  $("#replayTbody").empty();
	  $.ajax({                                                      
	         cache:false,                                            
	         type: "POST",                                          
	         url: '${ctx}/AlbumComment/restoreComment.do',      
	         data:"id="+id,                      
	         async:false,                                         
	         success: function (result) {    
	        	  var total = result.length;
	        	  $("#repalyNumber_id").text(total); 
	        	 for (var key in result) {         
	                  var item = result[key];
	                  var tr = replayTbody.insertRow(-1);           
	                  var rowNumber = ++key;
	                  var tdcontent = tr.insertCell(-1);      
	                  var tdCommentId = tr.insertCell(-1);                      
	                  var tdalbumCommentStutsId = tr.insertCell(-1);     
	                  tdcontent.innerHTML = "<a  style='width:700px;font-size: 14px;'  id='replay_userNameId_"+rowNumber+"'>"+item.userName+"</a>";
	                  tdcontent.innerHTML = (item.albumCommentStuts == "false") ?  tdcontent.innerHTML+"<img  onclick='addGoodNumber("+rowNumber+")' class='wrap' src='"+goodpath+"' />" :  tdcontent.innerHTML+"<img  onclick='reduceGoodNumber("+rowNumber+")' class='wrap' src='"+restoregoodpath+"' />";
	                  tdcontent.innerHTML = tdcontent.innerHTML +  "<span id='replay_goodNumberId_"+rowNumber+"'  style='width:700px;font-size: 14px;'>"+item.goodNumber+"</span>";
	                  if(item.mail == mail) {
	                	  tdcontent.innerHTML = tdcontent.innerHTML+"<img  onclick='deleteComment("+rowNumber+")' class='wrap' src='"+deletemusicpath+"'/><br>";     	  
	                  }
	                  tdcontent.innerHTML = tdcontent.innerHTML+ "<br><span id='replay_userComment_"+rowNumber+"'>"+item.userComment+"</span><br>"+
	                  "<a style='text-align:left;font-size: 14px;'  id='replay_time_"+rowNumber+"'>"+item.time+"</a> <a id='restore_"+rowNumber+"' style='font-size: 14px;display:none;' onclick='restoreComment2("+rowNumber+")'>回复</a><br>";    
	                  tdCommentId.innerHTML = "<span  style='display:none' id='restore_commentId_"+rowNumber+"' >"+item.id+"</span>";         
	                  tdalbumCommentStutsId.innerHTML = "<span  style='display:none' id='restore_albumCommentStutsId_"+rowNumber+"' >"+item.albumCommentStuts+"</span>";
	              }
	       	     
	         },
	         error: function(data) {      }
	     });   
	  $("#restore_userName_id").text(userName);
	  if(albumCommentStuts=="true") {
		  $("#restore_reduceGoodNumber_id").show();
		  $("#restore_addGoodNumber_id").hide();
	  } else {
		  $("#restore_addGoodNumber_id").show();
		  $("#restore_reduceGoodNumber_id").hide();
	  }
	  if(mailId == mail) {
		  $("#restore_deleteComment_id").show();
	  } else {
		  $("#restore_deleteComment_id").hide();
	  }
		  
	  $("#restore_comment_id").text(userComment);
	  $("#restore_time_id").text(time);
	  $("#restore_goodNumber_id").text(goodNumber);
	  $("#restore_Id_id").val(id);
	  $("#right1").hide();
	  $("#right2").show();
  }
  
/* function restoreComment2(t) {  
	  localStorage.setItem('replyRow',t);
	  var id = $("#restore_commentId_"+t).text();
	  var userName = $("#replay_userNameId_"+t).text();
	  var songCommentStuts = $("#restore_songCommentStutsId_"+t).text();
	  var  userComment = $("#replay_userComment_"+t).text();
	  var time = $("#replay_time_"+t).text();
	  var  goodNumber = $("#replay_goodNumberId_"+t).text();
	  var goodpath ='${ctx}/img/点赞.PNG';
	  var restoregoodpath ='${ctx}/img/取消点赞.jpg';
	  $("#replayTbody").empty();
	  $.ajax({                                                      
	         cache:false,                                            
	         type: "POST",                                          
	         url: '${ctx}/SongComment/restoreComment.do',      
	         data:"id="+id,                      
	         async:false,                                         
	         success: function (result) {                         
	        	 for (var key in result) {         
	                 var total = result.length;
	                  var item = result[key];
	                  var tr = replayTbody.insertRow(-1);           
	                  var rowNumber = ++key;
	                  var tdcontent = tr.insertCell(-1);      
	                  var tdCommentId = tr.insertCell(-1);                      
	                  var tdsongCommentStutsId = tr.insertCell(-1);     
	                  tdcontent.innerHTML = "<a  style='width:700px;font-size: 14px;'  id='replay_userNameId_"+rowNumber+"'>"+item.userName+"</a>";
	                  tdcontent.innerHTML = (item.songCommentStuts == "false") ?  tdcontent.innerHTML+"<img  onclick='addGoodNumber("+rowNumber+")' class='wrap' src='"+goodpath+"' />" :  tdcontent.innerHTML+"<img  onclick='reduceGoodNumber("+rowNumber+")' class='wrap' src='"+restoregoodpath+"' />";
	                
	                  tdcontent.innerHTML = tdcontent.innerHTML +  "<span id='replay_goodNumberId_"+rowNumber+"'  style='width:700px;font-size: 14px;'>"+item.goodNumber+"</span><br>"+
	                  "<span id='replay_userComment_"+rowNumber+"'>"+item.userComment+"</span><br>"+
	                  "<a style='text-align:left;font-size: 14px;'  id='replay_time_"+rowNumber+"'>"+item.time+"</a> <a id='restore_"+rowNumber+"' style='font-size: 14px;' onclick='restoreComment2("+rowNumber+")'>回复</a><br>";    
	                  tdCommentId.innerHTML = "<span  style='display:none' id='restore_commentId_"+rowNumber+"' >"+item.id+"</span>";         
	                  tdsongCommentStutsId.innerHTML = "<span  style='display:none' id='restore_songCommentStutsId_"+rowNumber+"' >"+item.songCommentStuts+"</span>";
	              }
	       	     
	         },
	         error: function(data) {      }
	     });   
	  
	  
	  $("#restore_userName_id").text(userName);
	  if(songCommentStuts=="true") {
		  $("#restore_reduceGoodNumber_id").show();
	  } else {
		  $("#restore_addGoodNumber_id").show();
	  }
	  $("#restore_comment_id").text(userComment);
	  $("#restore_time_id").text(time);
	  $("#restore_goodNumber_id").text(goodNumber);
	  $("#restore_Id_id").val(id);
	  $("#right1").hide();
	  $("#right2").show();
  }*/
	 
	 
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
