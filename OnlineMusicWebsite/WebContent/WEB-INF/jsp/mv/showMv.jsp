
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
    
    .home-video {
    z-index: 100;
    position: absolute;
    top: 50%;
    left: 50%;
    min-width: 100%;
    min-height: 100%;
    object-fit: fill;/*这里是关键*/
    width: auto;
    height: auto;
    -ms-transform: translateX(-50%) translateY(-50%);
    -webkit-transform: translateX(-50%) translateY(-50%);
    transform: translateX(-50%) translateY(-50%);
    background: url(../video/cover.jpg) no-repeat;
    background-size: cover;
}

#main{width:auto;height:auto;}
#left{width:750px;height:auto;}
#right1{width:700px;height:auto;margin-left:10px;}
#right2{width:700px;height:auto;margin-left:10px;}
#left,#right1{float:left;}
#left,#right2{float:left;}
 


  .yuanjiao{
        border: 2px solid blue;
        border-radius:20px;
        width: 70px;
        height: 40px;
        font-size:15px;
        padding-top:10px;
	  padding-bottom:10px;
	  padding-right:10px;
	   padding-left:10px;}
.video{
    text-align:center;
    margin-top: 15px;
} 

   .explainlog{
           width:98%;
             font-weight:bold;
             color:red;
            text-indent:700px         
   }	

</style>
 <body >
  <div class="span12" >
		      <input id="Tips" class="explainlog" type="text" style="width:100%;height:27px;" style="display:none"   value="${mvpo.mvName}" readonly="readonly"> 
	  </div>
 <a id="textkaka" href="#lvke" style="display:none" data-toggle="modal" class="btn btn-info btn-small" onclick="getMusicList()"><li class="icon-plus icon-white"></li>播放列表</a>
    
    <div style="height:20px;"></div>
   
<div class="video"  id="video_divId">
           <video controls style="width:900px;height:510px;" id="video_id">
                     <source src="<%=request.getContextPath()%>${mvpo.mvPath}"  type="video/mp4">
                     <source src="<%=request.getContextPath()%>${mvpo.mvPath}"  type="video/ogg">
                          您的浏览器不支持 HTML5 video 标签。
                 </video>
		        
</div>
 
     <div style="text-indent:550px;font-size:20px;margin-top: 20px;">  
         <img class="wrap"  src="<%=request.getContextPath()%>/img/上一个视频.jpg"   onclick="preVideo()"   id="preVideo_Id"  title="上一个视频"/>
               <img class="wrap"  style="margin-left:30px;" src="<%=request.getContextPath()%>/img/播放视频.jpg"   onclick="playVideo()"   id="playVideo_Id"   title="播放视频"/>
                <img class="wrap"  style="margin-left:30px;display:none;" src="<%=request.getContextPath()%>/img/暂停视频.jpg"   onclick="stopVideo()"   id="stopVideo_Id"  title="暂停视频"/>
                 <img class="wrap"  style="margin-left:30px;" src="<%=request.getContextPath()%>/img/下一个视频.jpg"   onclick="nextVideo()"   id="nextVideo_Id"  title="下一个视频"/>
                   <img class="wrap"  style="margin-left:30px;" src="<%=request.getContextPath()%>/img/全屏.png"   onclick="allScreen()"   id="allScreen_Id"  title="全屏"/>
                  <img class="wrap"  style="margin-left:30px;display:none;" src="<%=request.getContextPath()%>/img/全屏.png"   onclick="quitAllScreen()"   id="quitAllScreen_Id"  title="退出全屏"/>
             <img class="wrap"  style="margin-left:30px;" src="<%=request.getContextPath()%>/img/评论.jpg"   onclick="showMvComment()"   id="showComment_Id" title="评论" />
              <img class="wrap"  style="margin-left:30px;" src="<%=request.getContextPath()%>/img/详情.PNG"   onclick="information()"   id="information_Id" title="详情" />
          <img class="wrap"  style="margin-left:30px;"  src="<%=request.getContextPath()%>/img/下载.jpg"   onclick="loadMv()"   id="loadMv_id"   title="下载" />
         <form action="${ctx}/Mv/loadMv.do" method="post"  id="loadMvId_Id">
          <input id="mvPo_id_ID" name="id" type="text" style="display:none;" value="${mvpo.id}" >
       </form> 
        </div>
        
           <input id="id" type="text"  style="display:none"   value="${mvpo.id}">
             <input id="mvIdList_id" type="text"  style="display:none"   value="${mvIdList}"> 
             <input id="mail" type="text"  style="display:none"   value="${mail}"> 
          

<div id="mian1">
        <div>
           <a style="font-size:30px;margin-top: 20px;">MV推荐</a>
            <a style="margin-left:450px;">MV名:</a><a style="margin-left:5px;">"${mvpo.mvName}"</a><a style="margin-left:30px;">歌手：</a><a style="margin-left:5px;">${mvpo.singerName}</a>
        <a style="margin-left:30px;">发行年份:</a> <a style="margin-left:5px;">${mvpo.year}</a>
           <a class="yuanjiao" style="margin-left:30px;">${mvpo.country} </a> <a class="yuanjiao" style="margin-left:30px;">${mvpo.schools}</a>
           </div>
           
        <div style="width:700px;margin-top: 20px;"  >
          <c:forEach items="${recommendMvList}" var="item" varStatus="status">
             <img onclick="checkMv(${status.index+1})" id="MvPhotoPath_${status.index+1}" src="<%=request.getContextPath()%>${item.mvPhotoPath}"  style="height: 200px;width:200px;margin-left:20px;" title="${item.mvName}">  
                  <input id="mvName_${status.index+1}" type="text"  style="display:none"   value="${item.mvName}"> 
                   <input id="id_${status.index+1}" type="text"  style="display:none"   value="${item.id}"> 
      </c:forEach>    
        </div>
 </div>       
     
   <div id="mian" style="display:none;">
    <div id="left">         
          
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
      <th class="" style="text-align:left"><a id="commmentNumber_id"></a></th>
    </tr>
  </thead>
  <tbody id="commentTbody">
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
	  $('#Tips').show().delay(500).fadeOut();
	  parent.hidePrev2AndNext2();//前台所有页面都要这个代码
	   playVideo();
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
		var num = 0;
   function information() {
	   $('#mian1').show();
		 $('#mian').hide();
  }
	
	function playVideo() {	 
	   $('#playVideo_Id').hide();  
	   $('#stopVideo_Id').show();  
	   var video_id = document.getElementById('video_id');
	   if(video_id.paused) {
		   video_id.play();
	  }	   
 }
 
 function saveMvArry(mvPathList) {
		var strs= new Array(); 
		strs=mvPathList.split(",");
		var length = strs.length;
		 for(var i = 0; i <length; i++) {
			   if(i == (length-1)||(length==1)) {
					var last =strs[i].length;
				   strs[i] = strs[i].substring(1,last-1);
			   } else {
				   strs[i] = strs[i].substring(1);
			   }  
			};
			return strs;
	}
 
 function stopVideo() {
		  $('#playVideo_Id').show();  
		  $('#stopVideo_Id').hide();  
		   var video_id = document.getElementById('video_id');
		if(video_id.played) {
			video_id.pause();
		}
 }
 
  function preVideo() {
	  //一定要后端刷新页面
    var mvPathList = new Array();
	mvIdList = $('#mvIdList_id').val();
	var strs= new Array();
	strs = saveMvArry(mvIdList);
	var id = $('#id').val();
	var index = strs.indexOf(""+id);
	var newId;
	if(index>-1) {
		newId = (index==0) ? parseInt(strs[strs.length-1]):parseInt(strs[index-1]);	
	}
	  parent.document.getElementById('Mainid').src = '${ctx}/Mv/checkMv.do?id='+newId;//没有返回值，用这种方法
		
  }
  
  function nextVideo() {
	  var mvPathList = new Array();
		mvIdList = $('#mvIdList_id').val();
		var strs= new Array();
		strs = saveMvArry(mvIdList);
		var id = $('#id').val();
		var index = strs.indexOf(""+id);
		var newId;
		if(index>-1) {
			newId = (index==strs.length-1) ? parseInt(strs[0]):parseInt(strs[index+1]);	
		}
		  parent.document.getElementById('Mainid').src = '${ctx}/Mv/checkMv.do?id='+newId;//没有返回值，用这种方法
  }
  
  var video_id = document.getElementById('video_id');
  video_id.addEventListener('ended', function () {       
	       nextVideo();
           }, false);
  
  function allScreen() {
	  $('#quitAllScreen_Id').show();  
	  $('#allScreen_Id').hide();  
	var video_id = document.getElementById('video_id');
	video_id.style.width=window.screen.width;
	video_id.style.height=window.screen.height;	    
  }
  
  function quitAllScreen() {
	  $('#quitAllScreen_Id').hide();  
	  $('#allScreen_Id').show();  
	  var video_divId = document.getElementById('video_divId');
	  video_divId.className = 'video';
	  var video_id = document.getElementById('video_id');
	  video_id.style.width="900px";
		video_id.style.height="510px";	
  }
	
	function  checkMv(t) {
	  var id = $('#id_'+t).val();
	  parent.document.getElementById('Mainid').src = '${ctx}/Mv/checkMv.do?id='+id;//没有返回值，用这种方法
 }
	
	
	function showMvComment(flag) {
	 $('#mian1').hide();
	 $('#mian').show();
     var id = $("#id").val();
     var mail = $("#mail").val();
     var goodpath ='${ctx}/img/点赞.PNG';
	 var restoregoodpath ='${ctx}/img/取消点赞.jpg';
	 var deletemusicpath ='${ctx}/img/deletemusic.jpg';
 	 var commentTbody = document.getElementById("commentTbody");
	 $("#commentTbody").empty();
     $.ajax({                                                      
         cache:false,                                            
         type: "POST",                                          
         url: '${ctx}/MvComment/showComment.do',      
         data:"id="+id,                         
         async:false,                                         
         success: function (result) {
         var total = result.length;
         $("#commmentNumber_id").text("评论："+total);        	    
       	  for (var key in result) {             
                 var item = result[key];
                 var tr = commentTbody.insertRow(-1);           
                 var rowNumber = ++key;
                 var tdcontent = tr.insertCell(-1);      
                 var tdid = tr.insertCell(-1);                      
                 var tdmvCommentStutsId = tr.insertCell(-1);     
                 var tdmailId = tr.insertCell(-1);     
                 tdcontent.innerHTML = "<a  style='width:700px;font-size: 14px;'  id='userNameId_"+rowNumber+"'>"+item.userName+"</a>";
                 tdcontent.innerHTML = (item.mvCommentStuts == "false") ?  tdcontent.innerHTML+"<img  onclick='addGoodNumber("+rowNumber+")' class='wrap' src='"+goodpath+"' />" :  tdcontent.innerHTML+"<img  onclick='reduceGoodNumber("+rowNumber+")' class='wrap' src='"+restoregoodpath+"' />";
                 tdcontent.innerHTML = tdcontent.innerHTML +  "<span id='goodNumberId_"+rowNumber+"'  style='width:700px;font-size: 14px;'>"+item.goodNumber+"</span>";
                 if(item.mail == mail) {
               	  tdcontent.innerHTML = tdcontent.innerHTML+"<img  onclick='deleteComment("+rowNumber+")' class='wrap' src='"+deletemusicpath+"'/><br>";     	  
                 }
                 tdcontent.innerHTML = tdcontent.innerHTML+ "<br><span id='userComment_"+rowNumber+"'>"+item.userComment+"</span><br>"+
                 "<a style='text-align:left;font-size: 14px;'  id='time_"+rowNumber+"'>"+item.time+"</a> <a id='restore_"+rowNumber+"' style='font-size: 14px;' onclick='restoreComment("+rowNumber+")'>回复</a><a style='width:700px;font-size: 14px;'  id='replayNumberId_"+rowNumber+"'>"+item.replayNumber+"</a><br>";    
                 tdid.innerHTML = "<span  style='display:none' id='commentId_"+rowNumber+"' >"+item.id+"</span>";         
                 tdmvCommentStutsId.innerHTML = "<span  style='display:none' id='mvCommentStutsId_"+rowNumber+"' >"+item.mvCommentStuts+"</span>";
                 tdmailId.innerHTML = "<span  style='display:none' id='mailId_"+rowNumber+"' >"+item.mail+"</span>";
             }
         },
         error: function(data) {      }
     }); 
     if(flag==="replay") {
    	var replyRow = localStorage.getItem('replyRow');
    	 $("#restore_"+replyRow).click();
     }
  }
 

 function loadMv() {
	  $("#loadMvId_Id").submit();
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
	 var id = $("#id").val();
	 if(userComment==="") {
		 $("#Tips").val("不能发布空消息");
		 $('#Tips').show().delay(500).fadeOut();
		 return;
	 }
	 $.ajax({                                                      
        cache:false,                                            
        type: "POST",                                          
        url: '${ctx}/MvComment/publishComments.do',      
        data:"userComment="+userComment+"&id="+id+"&parentCommentId="+parentCommentId,                      
        async:false,                                         
        success: function (result) {                         
      	     if(result) {
      	    	 $("#Tips").val("发布成功");
      			 $('#Tips').show().delay(500).fadeOut();
      			$("#userCommentId").val(""); 
      			showMvComment(flag);
      			 return;
      	     }
      	     $("#Tips").val("请用户先登入");
			 $('#Tips').show().delay(500).fadeOut();
      	     
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
			  commentId = ( right2 == "" )? $("#restore_commentId_"+t).text() :$("#commentId_"+t).text();
			  flag = ( right2 == "" )?  "replay" :"publish";;
		}
		 $.ajax({                                                      
	         cache:false,                                            
	         type: "POST",                                          
	         url: '${ctx}/MvComment/addGoodNumber.do',      
	         data:"id="+commentId,                      
	         async:false,                                         
	         success: function (result) {
	        	 if(result) {
	        			showMvComment(flag);
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
			  commentId = ( right2 == "" )? $("#restore_commentId_"+t).text() :$("#commentId_"+t).text();
			  flag = ( right2 == "" )?  "replay" :"publish";
		}
		 $.ajax({                                                      
	         cache:false,                                            
	         type: "POST",                                          
	         url: '${ctx}/MvComment/reduceGoodNumber.do',      
	         data:"id="+commentId,                      
	         async:false,                                         
	         success: function (result) {
	        	 if(result) {
	        		 showMvComment(flag);
	       	     }
	        	 
	         },
	         error: function(data) {      }
	     }); 
	 }
 
 function restoreComment(t) {  
	  localStorage.setItem('replyRow',t);
	  var id = $("#commentId_"+t).text();
	  var userName = $("#userNameId_"+t).text();
	  var mvCommentStuts = $("#mvCommentStutsId_"+t).text();//修改过了
	  var mailId = $("#mailId_"+t).text();
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
	         url: '${ctx}/MvComment/restoreComment.do',      
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
	                  var tdmvCommentStutsId = tr.insertCell(-1);     
	                  tdcontent.innerHTML = "<a  style='width:700px;font-size: 14px;'  id='replay_userNameId_"+rowNumber+"'>"+item.userName+"</a>";
	                  tdcontent.innerHTML = (item.mvCommentStuts == "false") ?  tdcontent.innerHTML+"<img  onclick='addGoodNumber("+rowNumber+")' class='wrap' src='"+goodpath+"' />" :  tdcontent.innerHTML+"<img  onclick='reduceGoodNumber("+rowNumber+")' class='wrap' src='"+restoregoodpath+"' />";
	                  tdcontent.innerHTML = tdcontent.innerHTML +  "<span id='replay_goodNumberId_"+rowNumber+"'  style='width:700px;font-size: 14px;'>"+item.goodNumber+"</span>";
	                  if(item.mail == mail) {
	                	  tdcontent.innerHTML = tdcontent.innerHTML+"<img  onclick='deleteComment("+rowNumber+")' class='wrap' src='"+deletemusicpath+"'/><br>";     	  
	                  }
	                  tdcontent.innerHTML = tdcontent.innerHTML+ "<br><span id='replay_userComment_"+rowNumber+"'>"+item.userComment+"</span><br>"+
	                  "<a style='text-align:left;font-size: 14px;'  id='replay_time_"+rowNumber+"'>"+item.time+"</a> <a id='restore_"+rowNumber+"' style='font-size: 14px;display:none;' onclick='restoreComment2("+rowNumber+")'>回复</a><br>";    
	                  tdCommentId.innerHTML = "<span  style='display:none' id='restore_commentId_"+rowNumber+"' >"+item.id+"</span>";         
	                  tdmvCommentStutsId.innerHTML = "<span  style='display:none' id='restore_albumCommentStutsId_"+rowNumber+"' >"+item.albumCommentStuts+"</span>";
	              }
	       	     
	         },
	         error: function(data) {      }
	     });   
	  $("#restore_userName_id").text(userName);
	  if(mvCommentStuts=="true") {
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
				  commentId = $("#commentId_"+t).text();
				  parentCommentId = 0;
				  flag = "publish";
			  }
		}
		 $.ajax({                                                      
	         cache:false,                                            
	         type: "POST",                                          
	         url: '${ctx}/MvComment/deleteComment.do',      
	         data:"id="+commentId+"&parentCommentId="+parentCommentId,                      
	         async:false,                                         
	         success: function (result) {
	        	 if(result) {
	        		 showMvComment(flag);
	       	     }
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