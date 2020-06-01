package com.gx.web;



import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.gx.po.AlbumPo;
import com.gx.po.UserPo;
import com.gx.service.AlbumService;
import com.gx.service.UserService;



@Controller
@RequestMapping("/Login")
public class Login {
	
	@Autowired
	private UserService userService;
	@Autowired
	private AlbumService albumService;
	
	public static String TIPS = "请填入信息";
	public static String ADMIN = "Admin";
	
	
	@RequestMapping("/tologin")
	public String tologin(){
		return "/login/login";
	}
	
	@RequestMapping("/toreset")
	public String toreset(){
		return "/login/reset";
	}
	
	@RequestMapping("/toregist")
	public String toRegist(){
		return "/login/regist";
	}
	
	@RequestMapping("/regist")
	public ModelAndView  regist(HttpServletRequest request,UserPo user,MultipartFile pictureFile) throws IllegalStateException, IOException {
		ModelAndView mv = null;
		Boolean checkUserNoExistNUllDate = userService.checkUserExistNUllDate(user);
		if(checkUserNoExistNUllDate) {
			Boolean registStuts = userService.addUser(request,user,pictureFile);
			TIPS = registStuts ? "注册成功，请登入" : "该电子邮箱已经被其他账户注册过了";
			if(registStuts) {
				user = null;
			}			
		}
		else {
      		TIPS =  "必须输入所有数据" ;
		}
		mv = new ModelAndView("/login/regist");
		mv.addObject("TIPS",TIPS);
		mv.addObject("user",user);
		return mv;
	}

	@RequestMapping("/tofoget")
	public String toForget() {
		return "/login/forget";
	}

	
	@RequestMapping("/tomain")
	public ModelAndView tomain(HttpServletRequest request,UserPo user) {
		ModelAndView mv = null;
		UserPo u = userService.selectLogin(user);
		HttpSession ss=request.getSession();
		
		if (u != null) {
			ss.setAttribute("userName", u.getUserName());
			ss.setAttribute("mail", u.getMail());
			mv = u.getUserType().equals(ADMIN) ?  new ModelAndView("/main/adminMain") : new ModelAndView("/main/userMain") ;
		}else {
			mv = new ModelAndView("/login/login");
			TIPS =  "账号或密码有误" ;
			mv.addObject("TIPS",TIPS);
			mv.addObject("user",user);
		}
		
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/sendVerifyCode")
	public Object sendVerifyCode(String mial) throws EmailException{
		boolean falg = userService.selectUserByMial(mial);
		Gson gson =new Gson();
		return gson.toJson(falg);
	}
	
	@ResponseBody
	@RequestMapping(value="/submitVerifyCode")
	public Object submitVerifyCode(String verifyCode) throws EmailException{
		boolean falg = userService.submitVerifyCode(verifyCode);
		Gson gson =new Gson();
		return gson.toJson(falg);
	}
	
	@ResponseBody
	@RequestMapping(value="/updatePassWord")
	public Object updatePassWord(String newPassWord,String forgetMial) {
		boolean falg = userService.updatePassWord(newPassWord,forgetMial);
		Gson gson =new Gson();
		return gson.toJson(falg);
	}
	
	@RequestMapping("/picture")
	public String picture() {
		return "/main/picture";
	}
	
	@RequestMapping("/firstPage")
	public ModelAndView firstPage() {
		ModelAndView mv = null;
		mv = new ModelAndView("/main/firstPage");
		List<AlbumPo> aList = albumService.notPageFuzzySelect("");//可以设置专辑推荐的条件，时间的期间或者按热度
		mv.addObject("aList",aList);
		mv.addObject("aListSize",aList.size());
		return mv;
	}

}
