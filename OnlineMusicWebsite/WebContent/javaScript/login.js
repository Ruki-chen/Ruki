//提取常量不变的，值会给改变而改变
var regName= /(^[a-zA-Z0-9]{6,10}$)/;
var regphoneNumber = /^1(3|4|5|7|8)[0-9]{9}$/; 
var regmail =  /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/; 
function verifyRegistDate() {
    $('#verify_userName_ID').hide();
	$('#verify_passWord_ID').hide();
	$('#verify_phoneNumber_ID').hide();
	$('#verify_mail_ID').hide();
    var userName = $('#input_userName_ID').val();
    var passWord = $('#input_passWord_ID').val();
    var phoneNumber = $('#input_phoneNumber_ID').val();
    var mail = $('#input_mail_ID').val();
    var pictureFile = $('#input_pictureFile_ID').val();
  //  var regName= /(^[a-zA-Z0-9]{6,10}$)/;
 //   var regphoneNumber = /^1(3|4|5|7|8)[0-9]{9}$/; 
 //   var regmail =  /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/; 

    if(!regName.test(userName)) {
	     $('#verify_userName_ID').text("用户名是6-10位英文或数字的组合");
	     $('#verify_userName_ID').show();
	     return;
    } else if(!regName.test(passWord)) {
 	    $('#verify_passWord_ID').text("密码是6-10位英文或数字的组合");
	    $('#verify_passWord_ID').show();
	    return;
    } else if(!regphoneNumber.test(phoneNumber)) {
	    $('#verify_phoneNumber_ID').text("请输入正确的手机号码");
	    $('#verify_phoneNumber_ID').show();
	    return;
    } else if(!regmail.test(mail)) {
	    $('#verify_mail_ID').text("请输入正确的电子邮箱");
	    $('#verify_mail_ID').show();
	    return;
    } else if(pictureFile =="") {
	    $('#verify_pictureFile_ID').text("请上传图片");
	    return;
    }
	   $('#form2').submit();
		
 }


function verifyEmail(t) {
	  $('#forget_verify_mial_ID').hide();
	// var regmail =  /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/; 
	 if(!regmail.test(t)) {
		    $('#forget_verify_mial_ID').text("请输入正确的电子邮箱");
		    $('#forget_verify_mial_ID').show();
		    return  false;
	    }
	 return true;

}

function disappearTips(t) {
	if(t==1) {
		 $('#forget_explain_ID').hide();  
	} else if(t==2) {
		 $('#reset_explain_ID').hide();
	}
	 
}


function  verifyResetFrom(newPassWord,confirmPassWord) {
	 $('#reset_verify_passWord_ID').hide();
	 $('#reset_verify_conPassWord_ID').hide();
	if(!regName.test(newPassWord)) {
 	    $('#reset_verify_passWord_ID').text("密码是6-10位英文或数字的组合");
	    $('#reset_verify_passWord_ID').show();
	    return false;
	} else if(newPassWord!=confirmPassWord) {
	    $('#reset_verify_conPassWord_ID').text("两次密码不能不一致");
		$('#reset_verify_conPassWord_ID').show();
		return false;
	}
		return true;
	
	
}