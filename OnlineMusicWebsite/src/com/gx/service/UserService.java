package com.gx.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.mail.EmailException;
import org.springframework.web.multipart.MultipartFile;

import com.gx.page.Page;
import com.gx.po.SingerPo;
import com.gx.po.UserPo;

public interface UserService {

	public UserPo selectLogin(UserPo user);
	
	public Boolean selectUserByMial(String mial) throws EmailException;
	
	public UserPo returnUserByMial(String mial);
	
	public int updateByMial(HttpServletRequest request, UserPo user, MultipartFile pictureFile) throws IllegalStateException, IOException;
	
	public int deleteByMial(String mial);
	
	public String createVerifyCode();
	
	public Boolean submitVerifyCode(String verifyCode);
	
	public Boolean updatePassWord(String newPassWord,String forgetMial);
	
	public void sendEmail(String mial) throws EmailException;
	
	public Boolean selectRegist(UserPo user);
	
	public Boolean checkUserExistNUllDate(UserPo user);
	
	public Page<UserPo> pageFuzzyselect(String mail,Page<UserPo> vo);

	public String deletePhoto(UserPo user, HttpServletRequest request);

	public Boolean addUser(HttpServletRequest request, UserPo user,MultipartFile pictureFile) throws IllegalStateException, IOException;

	public String savePhoto(UserPo user, MultipartFile pictureFile,HttpServletRequest request) throws IllegalStateException,IOException;
	
}
