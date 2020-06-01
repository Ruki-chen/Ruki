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
  
 
  <body background=""> 
  <div class="container">
  
  <div class="span11" style=" border: solid; border-color:  #FFF0F5;width:100%;margin-top:20px">
  
    <form action="${ctx}/Song/userList.do" method="post" onsubmit="" id="form1">
    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
		      <div class="span3">
		         <input id="txtnameid" name="songName"  style="width:150px;height:27px;" type="text" placeholder="请输入歌曲名字" value="${songName}">
		         <input id="userList_country_id" name="country"  style="display:none" type="text" placeholder="请输入歌手名字" >
		         <input id="userList_schools_id" name="schools"  style="display:none" type="text" placeholder="请输入歌手名字" >
		         <input id="userList_isPopular_id" name="isPopular"  style="display:none" type="text" placeholder="请输入歌手名字" >
		          <input id="userList_year_id" name="year"  style="display:none" type="text" placeholder="请输入歌手名字" >
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
         <span style="margin-left:30px;">年份：</span>  
         <c:forEach items="${yearList}" var="item" varStatus="status">
         <span id="year_${status.index+1}" onclick="selectYear(${status.index+1},${yearListSize})" style="margin-left:100px;">${item.attributeName}</span>
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
    
    <div class="center">
    <span style="width: 100px; "> 筛选结果</span>
    </div>
       <br>
    <div class="dgvone">
       <input id="musicPathList_id"  type="text" style="display:none;" value="${musicPathList}" >
    <table class="table table-striped">
      <thead class="theadone">
    <tr>
      <th class="" style="">歌曲推荐</th>
      <th class="wrap" style="text-align:center;vertical-align:middle;"></th>
      <th class="wrap" style="text-align:center;vertical-align:middle;"></th>
      <th class="wrap" style="text-align:center;vertical-align:middle;display:none;"></th>
    </tr>
  </thead>
  <tbody>
 <c:forEach items="${list.result}" var="item" varStatus="status">
    <tr>
      <td  class="wrap" style="text-align:center;vertical-align:middle;"> <a  onclick="checkLyric(${status.index+1},${list.total})" title="点击查看" id="songName_${status.index+1}">${item.songName}</a></td>
      <td  class="wrap" style="text-align:center;vertical-align:middle;">${item.singerName}</td>
      <td  class="wrap" style="text-align:center;vertical-align:middle;">
       <img class="wrap" src="<%=request.getContextPath()%>/img/播放.gif"    onclick="playMusic(${status.index+1},${list.total})"   id="playMusic_${status.index+1}"/>
       <img class="wrap"  style="display:none" src="<%=request.getContextPath()%>/img/暂停.gif"    onclick="stopMusic(${status.index+1})"   id="stopMusic_${status.index+1}"/>
       <img class="wrap" src="<%=request.getContextPath()%>/img/新建.jpg"   onclick="addMusicPlayList(${status.index+1},${list.total})"   id="addMusicPlayList_${status.index+1}"/>
       <img class="wrap" src="<%=request.getContextPath()%>/img/评论.jpg"   onclick="showComment(${status.index+1},${list.total})"   id="showComment_${status.index+1}"/>
         <img class="wrap" src="<%=request.getContextPath()%>/img/下载.jpg"   onclick="loadMusic(${status.index+1},${list.total})"   id="loadMusic_${status.index+1}"/>
         <a  href="#lvke3"  data-toggle="modal"   onclick="joinSongList(${status.index+1},${list.total})"   id="joinSongList_${status.index+1}"><img class="wrap" src="<%=request.getContextPath()%>/img/加入列表.jpg" /></a> 
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
    
    <div class="span11">
      <div class="row-fluid">
        <div class="tcdPageCode" style="text-align:center;"></div>
      </div>
    </div>
  </div>
 
 
 
 
 <script type="text/javascript">
 $(document).ready(function () {
	//  $('#Tips').show().delay(500).fadeOut();
	  parent.hidePrev2AndNext2();//前台所有页面都要这个代码
	  var countryNumber1 =  localStorage.getItem('countryNumber1');
	  var countryListSize1 =  localStorage.getItem('countryListSize1');
	  changeColor(countryNumber1,countryListSize1,"country_");
	  var schoolsNumber1 =  localStorage.getItem('schoolsNumber1');
	  var schoolsListSize1 =  localStorage.getItem('schoolsListSize1');
	  changeColor(schoolsNumber1,schoolsListSize1,"schools_");
	  var isPopularNumber1 =  localStorage.getItem('isPopularNumber1');
	  var isPopularListSize1 =  localStorage.getItem('isPopularListSize1');
	  changeColor(isPopularNumber1,isPopularListSize1,"isPopular_");
	  var yearNumber1 =  localStorage.getItem('yearNumber1');
	  var yearListSize1 =  localStorage.getItem('yearListSize1');
	  changeColor(yearNumber1,yearListSize1,"year_");
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
 function selectCountry(t,countryListSize1) {
	 var flag = "country_";
	 changeColor(t,countryListSize1,flag);
	 localStorage.setItem('countryNumber1',t);
	 localStorage.setItem('countryListSize1',countryListSize1);
     var country = $('#country_'+t).text() === "全部" ? "" : $('#country_'+t).text();
     var yearNumber1 =  localStorage.getItem('yearNumber1');
     var schoolsNumber1 =  localStorage.getItem('schoolsNumber1');
     var isPopularNumber1 =  localStorage.getItem('isPopularNumber1');
     var year = yearNumber1 ==null ? "" :$('#year_'+yearNumber1).text() === "全部" ? "" : $('#year_'+yearNumber1).text() ;
     var schools = schoolsNumber1==null ? "" :$('#schools_'+schoolsNumber1).text() === "全部" ? "" : $('#schools_'+schoolsNumber1).text();
     var isPopular = isPopularNumber1 ==null ? "" :$('#isPopular_'+isPopularNumber1).text() === "全部" ? "" : $('#isPopular_'+isPopularNumber1).text();
     $('#userList_year_id').val(year);
     $('#userList_country_id').val(country);
     $('#userList_schools_id').val(schools);
     $('#userList_isPopular_id').val(isPopular);
     $('#form1').submit();
}	
 
 function selectSchools(t,schoolsListSize1) {
	 var flag = "schools_";
	 changeColor(t,schoolsListSize1,flag);
	 localStorage.setItem('schoolsNumber1',t);
	 localStorage.setItem('schoolsListSize1',schoolsListSize1);
     var schools = $('#schools_'+t).text() === "全部" ? "" : $('#schools_'+t).text();
     var yearNumber1 =  localStorage.getItem('yearNumber1');
     var countryNumber1 =  localStorage.getItem('countryNumber1');
     var isPopularNumber1 =  localStorage.getItem('isPopularNumber1');
     var year = yearNumber1 ==null ? "" :$('#year_'+yearNumber1).text() === "全部" ? "" : $('#year_'+yearNumber1).text() ;
     var country = countryNumber1==null ? "" :$('#country_'+countryNumber1).text() === "全部" ? "" : $('#country_'+countryNumber1).text();
     var isPopular = isPopularNumber1 ==null ? "" :$('#isPopular_'+isPopularNumber1).text() === "全部" ? "" : $('#isPopular_'+isPopularNumber1).text();
     $('#userList_year_id').val(year);
     $('#userList_country_id').val(country);
     $('#userList_schools_id').val(schools);
     $('#userList_isPopular_id').val(isPopular);
     $('#form1').submit();
 }
 
 function selectIsPopular(t,isPopularListSize1) {
	 var flag = "isPopular_";
	 changeColor(t,isPopularListSize1,flag);
	 localStorage.setItem('isPopularNumber1',t);
	 localStorage.setItem('isPopularListSize1',isPopularListSize1);
     var isPopular = $('#isPopular_'+t).text()  === "全部" ? "" : $('#isPopular_'+t).text();
     var yearNumber1 =  localStorage.getItem('yearNumber1');
     var countryNumber1 =  localStorage.getItem('countryNumber1');
     var schoolsNumber1 =  localStorage.getItem('schoolsNumber1');
     var year = yearNumber1 ==null ? "" :$('#year_'+yearNumber1).text() === "全部" ? "" : $('#year_'+yearNumber1).text() ;
     var country = countryNumber1==null ? "" :$('#country_'+countryNumber1).text() === "全部" ? "" : $('#country_'+countryNumber1).text();
     var schools = schoolsNumber1 ==null ? "" :$('#schools_'+schoolsNumber1).text() === "全部" ? "" : $('#schools_'+schoolsNumber1).text();
     $('#userList_year_id').val(year);
     $('#userList_country_id').val(country);
     $('#userList_schools_id').val(schools);
     $('#userList_isPopular_id').val(isPopular);
     $('#form1').submit();
 }
 
 function selectYear(t, yearListSize1) {
	 var flag = "year_";
	 changeColor(t,yearListSize1,flag);
	 localStorage.setItem('yearNumber1',t);
	 localStorage.setItem('yearListSize1',yearListSize1);
     var year = $('#year_'+t).text()  === "全部" ? "" : $('#year_'+t).text();
     var isPopularNumber1 =  localStorage.getItem('isPopularNumber1');
     var countryNumber1 =  localStorage.getItem('countryNumber1');
     var schoolsNumber1 =  localStorage.getItem('schoolsNumber1');
     var isPopular = isPopularNumber1 ==null ? "" :$('#isPopular_'+isPopularNumber1).text() === "全部" ? "" : $('#isPopular_'+isPopularNumber1).text();
     var country = countryNumber1==null ? "" :$('#country_'+countryNumber1).text() === "全部" ? "" : $('#country_'+countryNumber1).text();
     var schools = schoolsNumber1 ==null ? "" :$('#schools_'+schoolsNumber1).text() === "全部" ? "" : $('#schools_'+schoolsNumber1).text();
     $('#userList_year_id').val(year);
     $('#userList_country_id').val(country);
     $('#userList_schools_id').val(schools);
     $('#userList_isPopular_id').val(isPopular);
     $('#form1').submit();
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
 
 function joinSaveList(t) {
	 var songPath = $("#songPath_"+t).text();
	 $.ajax({                                                      
         cache:false,                                            
         type: "POST",                                          
         url: '${ctx}/SongList/joinSaveList.do',      
         data:"songPath="+songPath,                         
         async:false,                                         
         success: function (result) {                         
        	 parent.document.getElementById('Mainid').src = '${ctx}/Song/userList.do';
         },
         error: function(data) {      }
     }); 
	 
 }
 
 function removeSaveList(t) {
	 var songPath = $("#songPath_"+t).text();
	 $.ajax({                                                      
         cache:false,                                            
         type: "POST",                                          
         url: '${ctx}/SongList/removeSaveList.do',      
         data:"songPath="+songPath,                         
         async:false,                                         
         success: function (result) {                         
        	 parent.document.getElementById('Mainid').src = '${ctx}/Song/userList.do';
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
	        	//  parent.document.getElementById('Mainid').src = '${ctx}/Song/userList.do';
	        	  document.getElementById('close').click();
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
	 /* 分页要用的 */
  $(".tcdPageCode").createPage({
     pageCount:${list.totalPage},
     current:${list.currentPage},
     backFn:function(p){
    	 var countryOptions = $("#userList_country_id option:selected");　　　　//获取选中项
    	 var schoolsOptions = $("#userList_schools_id option:selected");　
    	 var isPopularOptions = $("#userList_isPopular_id option:selected");　
    	 
    	 var country = countryOptions.val();　
    	 var  schools = schoolsOptions.val();　
    	 var  isPopular = isPopularOptions.val();　
    	 
    	 var songPo = {
    			 country:country,
    			 schools:schools,
    			 isPopular:isPopular
    	 };	     
     location.href="${ctx}/Song/tolist.do?currentPage="+p+"&songPo="+songPo;
     }
   });
  
    
 </script>
   
  </body>
</html>
