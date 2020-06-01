var regName= /(^[a-zA-Z0-9]{6,10}$)/;
var regphoneNumber = /^1(3|4|5|7|8)[0-9]{9}$/; 
var regmail =  /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/; 

var regInitials = /^[A-Z]/;
var regYear = /^[0-9]{4}$/;
var a="gg";

function verify(){
	var userName = $('#passenger_userName_ID').val();
    var passWord = $('#passenger_passWord_ID').val();
    var phoneNumber = $('#passenger_phoneNumber_ID').val();
    var mail = $('#passenger_mail_ID').val();
    var photoPath = $('#passenger_up1_photoPath_ID').val();
	    if(!regName.test(userName)){
	       alert("用户名是6-10位英文或数字的组合！");
	       $('#passenger_userName_ID').focus();
	       return false;
	    }else if(!regName.test(passWord)){
	       alert("密码是6-10位英文或数字的组合");
	       $('#passenger_passWord_ID').focus();
	       return false;
	    }else if(!regphoneNumber.test(phoneNumber)){
	     alert("请输入正确的手机号码");
	     $('#passenger_phoneNumber_ID').focus();
	     return false;
        }else if(!regmail.test(mail)){
	     alert("请输入正确的电子邮箱");
	     $('#passenger_mail_ID').focus();
	     return false;
        }else if(photoPath==""){
	     alert("请上传照片");
	     return false;
        }else{
	      return true;
	    }
   }

function verifySinger() {
	var singerName = $('#singer_singerName_ID').val();
    var initials = $('#singer_initials_ID').val();
    var introduce = $('#singer_introduce_ID').val();
    var pictureFile = $('#singer_picture_ID').val();
    if(singerName == ""){
	       alert("歌手名字不能为空");
	       $('#singer_singerName_ID').focus();
	       return false;
	    }else if(!regInitials.test(initials)){
	       alert("首字母是26个英文字母的大写形式");
	       $('#singer_initials_ID').focus();
	       return false;
	    }else if(introduce == ""){
	     alert("介绍不能为空");
	     $('#singer_introduce_ID').focus();
	     return false;
     }else if(pictureFile == ""){
	     alert("照片必须上传！");
	     return false;    
     }else{
	      return true;
	    }
  
}
function test(){
	
	
}
 function verifySong() {
	 var songName = $('#song_songName_ID').val();
	 var singerName = $('#song_singerName_ID').val();
	 var lyric = $('#song_lyric_ID').val();
	 var albumName = $('#song_albumName_ID').val();
	 var year = $('#song_year_ID').val();
	 var songFile = $('#song_songFile_ID').val();
	    if(songName == ""){
		       alert("歌曲名字不能为空");
		       $('#song_songName_ID').focus();
		       return false;
		    }else if(singerName == ""){
		       alert("歌手名字不能为空");
		       $('#song_singerName_ID').focus();
		       return false;
		    }else if(lyric == ""){
		     alert("歌词必须上传");
		     $('#song_lyric_ID').focus();
		     return false;
	     }else if(albumName == ""){
		     alert("专辑名字不能为空！");
		     $('#song_albumName_ID').focus();
		     return false;    
	     }else if(!regYear.test(year)){
		     alert("年份必须是四位数字");
		     $('#song_year_ID').focus();
		     return false;    
	     }else if(songFile == ""){
		     alert("歌曲必须上传！");
		     return false;    
	     }else{
		      return true;
		    }
 }
 
 function verifyAlbum() {
	 var albumName = $('#album_albumName_ID').val();
	 var singerName = $('#album_singerName_ID').val();
	 var year = $('#album_year_ID').val();
	 var albumFile = $('#album_picture_ID').val();
	 if(albumName == ""){
	       alert("专辑名字不能为空!");
	       $('#album_albumName_ID').focus();
	       return false;
	    }else if(singerName == ""){
	       alert("歌手名字不能为空");
	       $('#album_singerName_ID').focus();
	       return false;
	    }else if(!regYear.test(year)){
	     alert("年份必须是四位数字");
	     $('#album_year_ID').focus();
	     return false;
   }else if(albumFile == ""){
	     alert("图片必须上传！");
	     return false;       
   }else{
	      return true;
	    }
 }
 
 function verifyMv() {
	 var mvName = $('#mv_mvName_ID').val();
	 var singerName = $('#mv_singerName_ID').val();
	 var songName = $('#mv_songName_ID').val();
	 var year = $('#mv_year_ID').val();
	 var mvFile = $('#mv_video_ID').val();
	 var MvPhotoFile = $('#mv_MvPhoto_ID').val();
	 if(mvName == ""){
	       alert("MV名字不能为空!");
	       $('#mv_mvName_ID').focus();
	       return false;
	    }else if(singerName == ""){
	       alert("歌手名字不能为空");
	       $('#mv_singerName_ID').focus();
	       return false;
	    }else if(songName == ""){
		    alert("歌曲名字不能为空");
		     $('#mv_songName_ID').focus();
		      return false;
		 }else if(!regYear.test(year)){
	         alert("年份必须是四位数字");
	         $('#mv_year_ID').focus();
	         return false;
         }else if(mvFile == ""){
	         alert("mv必须上传！");
 	         return false;       
     }else if(MvPhotoFile == ""){
         alert("mv封面上传！");
	         return false;       
      }else{
	         return true;
	    }
	 
 }
 
 function getMusicList(){
	 var strs= new Array();
	strs =parent.returnMusicArry();
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
                  var rowNumber = key+1;
                  var tdRowNumber = tr.insertCell(-1);      // Table 有多少列就添加多少个这个
                  var tdsongName = tr.insertCell(-1);
                  var tdsingerName = tr.insertCell(-1);
                  tdRowNumber.innerHTML = ++key;
                  tdsongName.innerHTML = item.songName;
                  tdsingerName.innerHTML =item.singerName;         //中间这个是数据
              }
              if(i==0){
                alert("很抱歉！没有查找到你要找的数据");
              }   
          },
          error: function(data) {      }
      });	 
 }
 
 function verifySongList() {
	 var songListName = $('#songListName_id').val();
	 var introduce = $('#introduce_Id').val();
	 if(songListName=="") {
		 $('#Tips').val("歌单名不能为空");
		 $('#Tips').show().delay(500).fadeOut();
		 document.getElementById('textkaka1').click();
		 $('#introduce_Id').val(introduce);
		 return false;
	 }else{
         return true;
	    }
	 
 }