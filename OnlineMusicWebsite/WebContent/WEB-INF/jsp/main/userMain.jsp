<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
	<head>
		<title>欢迎使用303在线音乐网站</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

		<meta name="description" content="概述及统计" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!--basic styles-->

		<link href="${ctx}/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link href="${ctx}/assets/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="${ctx}/assets/css/font-awesome.min.css" />
 <link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.css" type="text/css"></link>
  <link href="${ctx}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">  <!-- start 响应式布局要添加的 -->
  <script src="${ctx}/bootstrap/js/jquery-3.1.1.min.js"></script>
  <script src="${ctx}/bootstrap/js/bootstrap.js"></script>
 <script type="text/javascript" src="${ctx}/javaScript/passenger.js"></script>
 
		<!--[if IE 7]>
		  <link rel="stylesheet" href="${ctx}/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<!--page specific plugin styles-->

		<!--fonts-->

		<!--ace styles-->

		<link rel="stylesheet" href="${ctx}/assets/css/ace.min.css" />
		<link rel="stylesheet" href="${ctx}/assets/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="${ctx}/assets/css/ace-skins.min.css" />

		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="${ctx}/assets/css/ace-ie.min.css" />
		<![endif]-->

		<!--inline styles related to this page-->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	

	</head>
	
	<style >
  .footer {

  position: absolute;

  bottom: 10px;

  width: 100%;

  height: 60px;/*脚部的高度*/

  background:url(${ctx}/img/蓝色.PNG);

  clear:both;
    

  }
  
   .btn-audio{
   width: 100%;
    height: 30px;/*脚部的高度*/
      
         text-align: center;
         bottom: 85px;
    }
 
 
 .checkLyric{width:600px;height:50px;font-family : 微软雅黑,宋体;font-size : 2em;color : block;text-indent:100px; margin-top:10px;}
.button{width:700px;height:50px;margin-left:10px; margin-top:10px;}
.checkLyric,.button{float:left;}

        a:hover {
            background-color: #424242;
            opacity: 0.3;
            color: #fff;
        }
        
          .labelroomnumber{
      position: relative;
      font-size: 17px;
      float: left;
      margin-top: 15px;
    }
    
     .theadone{
     background-color: #CCFF99;
    }
   

</style>

  <body background="<%=request.getContextPath()%>/img/桌面.PNG">
  <div   class="navbar">
			<div class="navbar-inner">
				<div class="container-fluid">
					<a href="#" class="brand" style="width:300Px">
						<small>
							<i class="icon-leaf"></i>
							欢迎使用303在线音乐网站
						</small>
					</a><!--/.brand-->
					   <a class="brand"  style="width:120Px" onclick="mainSetting()">	
					   <i class="icon-dashboard"></i>
							<span>首页</span>
							</a>
					    <a class="brand" style="width:120Px" onclick="singerSetting()">
					    	 	<i class="icon-heart"></i>
					    		<span>歌手</span></a>
					       <a class="brand" style="width:120Px"  onclick="songSetting()">
					     <i class="icon-move"></i>		
					     <span>歌曲</span></a>
					       <a class="brand"  style="width:120Px" onclick="albumSetting()">
					       	<i class="icon-heart"></i>
					       	  <span>专辑</span></a>
					          <a class="brand"  style="width:120Px" onclick="mvSetting()">
					         <i class="icon-home"></i>
					         <span>MV</span></a>
					            <a class="brand" style="width:120Px" onclick="userSetting()">
					            	 <i class="icon-user"></i>
					            	 <span>我</span></a>
					       
					    <a class="brand" style="float:right"  href="${ctx}/Login/tologin.do" >	退出</a>
				</div><!--/.container-fluid-->
			</div><!--/.navbar-inner-->
		</div>
		
  
     
		<div style="width:100%;height:100%;">
				  <iframe id="Mainid" src="${ctx}/Login/firstPage.do" style="width:100%;height:100%;"  frameBorder="0" ></iframe>
				</div>
				
	<div  class="footer" style="display:none;"  id="userMain_footer_id" >
	<div class="checkLyric"  onclick="checkLyric()">
	<span  title="点击查看"  id="checkLyric" ></span>
	</div>
	<div  class="button">
	        <button id="prev"  class="btn btn-primary" onclick="prev(this)">prev</button>
	        <button id="prev2"  class="btn btn-primary" onclick="prev(this)" style="display:none;">prev2</button>
			<button id="play"  class="btn btn-primary" onclick="play()">play</button>
			<button id="pause"  class="btn btn-primary"  onclick="pause()" style="display:none;">pause</button>
			<button id="next"  class="btn btn-primary" onclick="next()">next</button>
			<button id="next2"  class="btn btn-primary" onclick="next()" style="display:none;">next2</button>
			<button id="loop"  class="btn btn-primary" onclick="loop()">loop</button>
			<button id="unloop"  class="btn btn-primary" onclick="unloop()" style="display:none;">unloop</button>
		</div>
		<a href="#lvke" style="margin-left:20px;margin-top:10px;" data-toggle="modal" class="btn btn-info btn-small" onclick="getMusicList()"><li class="icon-plus icon-white"></li>播放列表</a>
	  <audio class="btn-audio" id="userMain_audio_id"  controls ><source src="<%=request.getContextPath()%>/music/好想爱这个世界啊.mp3" type="audio/mpeg" />
     </audio>
	
	</div>
	
	  
	
	
				
				<!--basic scripts-->

		<!--[if !IE]>-->

		<script src="assets/js/jquery-2.0.3.min.js"></script>
        
		<!--<![endif]-->

		<!--[if IE]>
<script src="assets/js/jquery-1.10.2.min.js"></script>

<![endif]-->

		<!--[if !IE]>-->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='${ctx}/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

		<!--<![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='${ctx}/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='${ctx}/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="${ctx}/assets/js/bootstrap.min.js"></script>

		<!--page specific plugin scripts-->

		<!--[if lte IE 8]>
		  <script src="${ctx}/assets/js/excanvas.min.js"></script>
		<![endif]-->

		<script src="${ctx}/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
		<script src="${ctx}/assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="${ctx}/assets/js/jquery.slimscroll.min.js"></script>
		<script src="${ctx}/assets/js/jquery.easy-pie-chart.min.js"></script>
		<script src="${ctx}/assets/js/jquery.sparkline.min.js"></script>
		<script src="${ctx}/assets/js/flot/jquery.flot.min.js"></script>
		<script src="${ctx}/assets/js/flot/jquery.flot.pie.min.js"></script>
		<script src="${ctx}/assets/js/flot/jquery.flot.resize.min.js"></script>
		
        <script src="/${ctx}/assets/js/ace-extra.min.js"></script>
		

		<!--ace scripts-->

		<script src="${ctx}/assets/js/ace-elements.min.js"></script>
		<script src="${ctx}/assets/js/ace.min.js"></script>
		<script type="text/javascript">
	    	var num = 0;
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
			function mainSetting() {
				document.getElementById('Mainid').src = '${ctx}/Login/firstPage.do';
			}
			
			function singerSetting() {
				document.getElementById('Mainid').src = '${ctx}/Singer/userList.do';
			}
			
			function songSetting() {
				document.getElementById('Mainid').src = '${ctx}/Song/userList.do';
			}
			
			function albumSetting() {
				document.getElementById('Mainid').src = '${ctx}/Album/userList.do';
			}
			
			function mvSetting() {
				document.getElementById('Mainid').src = '${ctx}/Mv/userList.do';
			}
			
			function userSetting() {
				document.getElementById('Mainid').src = '${ctx}/Passenger/userSetting.do';
			}
			
			function play() {
				  $('#play').hide();  
				  $('#pause').show();  
				  var audioElement =document.getElementById('userMain_audio_id');
				  if(audioElement.paused) {
					  audioElement.play();
				  }	   
			}
			
			function pause() {
				  $('#play').show();  
				  $('#pause').hide();  
				var audioElement =document.getElementById('userMain_audio_id');
				if(audioElement.played) {
					audioElement.pause();
				}
			}
			
			function loop() {
				  $('#unloop').show();
				  $('#loop').hide();  
				var audioElement =document.getElementById('userMain_audio_id');
				audioElement.loop=true; 
				
			}
			
			function unloop() {
				  $('#unloop').hide();
				  $('#loop').show();  
				var audioElement =document.getElementById('userMain_audio_id');
				audioElement.loop=false; 
				
			}
			
			
			function prev(t) {
				if(ckeckIsNullList()) {
					pause();
					return;
				}
				var strs= new Array();
				strs = returnMusicArry();
				num = (num +strs.length-1)%strs.length;
				var audioElement =document.getElementById('userMain_audio_id');
				audioElement.src = encodeURI("${ctx}"+strs[num]);
				audioElement.play();
				play();
				localStorage.setItem('songPath',strs[num]); //更新路径,列表点播/下一首/上一首都改变
		     	updateSongNameBySongPath(strs[num]);
		     	saveCurrentPlaySongList(strs[num]);
				if("prev2"==t.id) {	
			    	document.getElementById('Mainid').src='${ctx}/Song/checkLyric.do?songPath='+ strs[num];
				}
			}
			
			function next() {
			
				if(ckeckIsNullList()) {
					pause();
					return;
				}
				var strs= new Array();
				strs = returnMusicArry();//是播放连表的数据
			 	num = (num +1)%strs.length;
				var audioElement =document.getElementById('userMain_audio_id');
				audioElement.src = encodeURI("${ctx}"+strs[num]);
				audioElement.play();
			 	play();
			 	localStorage.setItem('songPath',strs[num]); //更新路径,列表点播/下一首/上一首都改变
			 	updateSongNameBySongPath(strs[num]);
			 	saveCurrentPlaySongList(strs[num]);
				var prev =document.getElementById('prev');//根据他是否有显示,判断是否为歌词界面,歌词界面必显示
				if( prev.style.display=="none") {	//歌词界面
			    	document.getElementById('Mainid').src='${ctx}/Song/checkLyric.do?songPath='+ strs[num];
				}
			}
			
			var audioElement =document.getElementById('userMain_audio_id');
			audioElement.addEventListener('ended', function () {       
				        next();
                   }, false);
			
			function returnMusicArry() {
				var musicPathList = localStorage.getItem("musicPathList");	
				var strs= new Array(); 
				strs=musicPathList.split(",");
					return strs;
			}
			
			function ckeckIsNullList() {
			    var  checkLyric = document.getElementById('checkLyric');
				var strs= new Array(); 
				strs = returnMusicArry();
				if(strs[0] == "") {
					 checkLyric.innerHTML = "303音乐 就是不用钱";//chickList 也要有对应的界面
					 return true;
				}
				return false;
			}
			
			function updateSongNameBySongPath(songPath) {
			    var  checkLyric = document.getElementById('checkLyric');
				 $.ajax({                                                      
			          cache:false,                                            
			          type: "POST",                                          
			          url: '${ctx}/Song/returnSongNameBySongPath.do',      
			          data:"songPath="+songPath,                         
			          async:false,                                         
			          success: function (result) {                         
						  checkLyric.innerHTML = result;
			          },
			          error: function(data) {      }
			      });
				 return true;
			}
			
			function checkLyric() {
				  $('#prev').hide();
				  $('#prev2').show(); 
				  $('#next').hide();
				  $('#next2').show(); 
				var songPath = localStorage.getItem("songPath");	//信息必须及时更新
				document.getElementById('Mainid').src='${ctx}/Song/checkLyric.do?songPath='+ songPath;
			}
			
			function hidePrev2AndNext2() {
				$('#prev').show();
				 $('#prev2').hide(); 
				 $('#next').show();
				 $('#next2').hide(); 
			 }
		 function getMusicList() {
			 document.getElementById('Mainid').contentWindow.document.getElementById('textkaka').click();
			 
			/*	var strs= new Array();
				strs = returnMusicArry();
				var tbody = document.getElementById("tbody");
				var i=0;
				 $("#tbody").empty();
				 $.ajax({                                                      
			          cache:false,                                            
			          type: "POST",                                          
			          url: '${ctx}/Song/getSongListBySongPathList.do',      
			          data:"strs="+strs,                         
			          async:false,                                         
			          success: function (result) {                         
			        	  for (var key in result) { 
			                  i++;               
			                  var item = result[key];
			                  var tr = tbody.insertRow(-1);            // FireFox必须使用-1这个参数
			                 
			                  var tdRowNumber = tr.insertCell(-1);      // Table 有多少列就添加多少个这个
			                  var tdsongName = tr.insertCell(-1);
			                  var tdsingerName = tr.insertCell(-1);
			                  tdRowNumber.innerHTML = key+1;
			                  tdsongName.innerHTML = item.songName;
			                  tdsingerName.innerHTML =item.singerName;         //中间这个是数据
			              }
			              if(i==0){
			                alert("很抱歉！没有查找到你要找的数据");
			              }   
			          },
			          error: function(data) {      }
			      });*/
				
		 }
</script>
  </body>
</html>
