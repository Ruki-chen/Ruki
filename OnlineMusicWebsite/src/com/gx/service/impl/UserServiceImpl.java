package com.gx.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gx.dao.UserDao;
import com.gx.page.Page;
import com.gx.po.SingerPo;
import com.gx.po.UserPo;
import com.gx.service.SongListService;
import com.gx.service.UserService;



@Transactional
@Service(value="userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private SongListService songListService;
	
	//常量可以把它封装到特意一个类;
	public static String  CURREN_TTIME = "loginsuccess";
	public static String  VERIFY_CODE = "textcode";
	public static String  HOST_NAME ="smtp.qq.com";
	public static String PASS_WORD = "hjhrlrklspntiehb";
	public static String FROM_ADDRESS ="1477695554@qq.com";
	

	@Override
	public UserPo selectLogin(UserPo user) {
		// TODO Auto-generated method stub
		return userDao.selectLogin(user);//对数据库实际的操作
	}



	@Override
	public Boolean selectRegist(UserPo user) {
		// TODO Auto-generated method stub
		UserPo userPo = userDao.selectUserByMial(user.getMail());
		 if(userPo != null)
		 {
			 return false;
		 }
		userDao.selectRegist(user);
		return true;
	}



	@Override
	public Boolean checkUserExistNUllDate(UserPo user) {
		// TODO Auto-generated method stub
		if(user.getUserName().equals("")||user.getPassWord().equals("")||user.getUserType()==null||user.getPhoneNumber().equals("")||user.getMail().equals("")) {
			return false;
		}
		return true;
	}



	@Override
	public Boolean selectUserByMial(String mial) throws EmailException {
		// TODO Auto-generated method stub
		UserPo user = userDao.selectUserByMial(mial);
		 if(user==null)
		 {
			 return false;//没有注册过
		 }
	     sendEmail(mial);
		 
		 return true;
	}



	@Override
	public void sendEmail(String mial) throws EmailException {
		// TODO Auto-generated method stub
		HtmlEmail email = new HtmlEmail();
	       email.setCharset("UTF-8");
	       email.setHostName(HOST_NAME);
	       email.setSubject("找回密码");
	       email.setAuthentication(FROM_ADDRESS, PASS_WORD);
	       email.addPart("您登入303在线音乐网站的验证码是:  "+createVerifyCode()+".", "text/html;charset=utf-8");
           email.setFrom(FROM_ADDRESS,"303在线音乐网站");// 设置发件人信息
           email.addTo(mial);
	       email.send();
	       
	}

	@Override
	public String createVerifyCode() {
		// TODO Auto-generated method stub
		VERIFY_CODE = (int)((Math.random()*9+1)*100000)+"";	
		return VERIFY_CODE;
	}

	@Override
	public Boolean submitVerifyCode(String verifyCode) {
		// TODO Auto-generated method stub
		//需考虑验证码失效时间
		return  VERIFY_CODE.equals(verifyCode) ;
	}



	@Override
	public Boolean updatePassWord(String newPassWord, String forgetMial) {
		// TODO Auto-generated method stub
		UserPo user = userDao.selectUserByMial(forgetMial);
		if(user==null)
		 {
			 return false;//没有注册过
		 }
		user.setPassWord(newPassWord);
		userDao.updatePassWordByMial(user);
		
		return true;
	}



	@Override
	public UserPo returnUserByMial(String mial) {
		// TODO Auto-generated method stub
		return userDao.selectUserByMial(mial);
	}



	@Override
	public int updateByMial(HttpServletRequest request,UserPo user, MultipartFile pictureFile) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		if(!pictureFile.isEmpty())
		{
			String photoName = deletePhoto(user, request);
			String url = request.getSession().getServletContext().getRealPath("/img");	
			 pictureFile.transferTo(new File(url+"/"+photoName));
		}
		return  userDao.updateByMial(user);
	}
	@Override
	public String deletePhoto(UserPo user, HttpServletRequest request) {
		// TODO Auto-generated method stub
		String url = request.getSession().getServletContext().getRealPath("/img");
		 String  photoPath =  user.getPhotoPath();
		 String photoName = photoPath.substring(5);
		File oldFile = new File(url+"/"+photoName); 
		oldFile.delete();	
		return  photoName;
	}



	@Override
	public int deleteByMial(String mial) {
		// TODO Auto-generated method stub
		return  userDao.deleteByMial(mial);
	}
	
	@Override
	public Page<UserPo> pageFuzzyselect(String mail, Page<UserPo> vo) {
		// TODO Auto-generated method stub
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<UserPo> list=userDao.pageFuzzyselect(mail, start, vo.getPageSize());
		vo.setResult(list);
		int count=userDao.countFuzzyselect(mail);
		vo.setTotal(count);
		return vo;
	}



	@Override
	public Boolean addUser(HttpServletRequest request, UserPo user,MultipartFile pictureFile) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		UserPo userPo = userDao.selectUserByMial(user.getMail());
		 if(userPo != null)
		 {
			 return false;
		 }
		 String path =  savePhoto(user, pictureFile,request);
		 user.setPhotoPath(path);
         userDao.selectRegist(user);
         songListService.autoCreatSongList(user.getMail());
		return true;
		
	}
	
	@Override
	public String savePhoto(UserPo user, MultipartFile pictureFile,HttpServletRequest request) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		 String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
		 String name=user.getUserName();
		 UserPo userpro = userDao.selectUserByPhotoPath("/img/"+user.getUserName()+"."+ext);
		if(userpro != null)
		{
			name = name + (int)((Math.random()*9+1)*100000)+"";	
		}
         String url = request.getSession().getServletContext().getRealPath("/img");
         System.out.println(url);
         pictureFile.transferTo(new File(url+"/"+name + "." + ext));
         String path = "/img/"+name + "." + ext;
		return path;
	}
}
