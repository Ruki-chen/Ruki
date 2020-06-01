package com.gx.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gx.page.Page;
import com.gx.po.SongListPo;
import com.gx.po.UserPo;
import com.gx.service.SongListService;
import com.gx.service.UserService;

@Controller
@RequestMapping("/Passenger")
public class PassengerManage {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private SongListService songListService;
	
	public static String TIPS = "请填入信息";

	 
	 
	
	//	mv.addObject("list",vo);可以直接传给前端，或者作为其他方法的参数相传，很多东西，都是有共性
	@RequestMapping("/tolist")
	public ModelAndView tolist(HttpServletRequest request,Integer currentPage,String txtname,String AdminTipe){
		if(AdminTipe==null) {
			AdminTipe="请谨慎操作哦！";
		}	
		ModelAndView mv=null;
		mv=new ModelAndView("/passenger/list");
		Page<UserPo> vo=new Page<UserPo>();
		if (currentPage==null) {
			currentPage=1;
		}else if (currentPage==0) {
			currentPage=1;
		}
		if(txtname==null)
		{
			txtname="";
		}
		vo.setCurrentPage(currentPage);
		vo=userService.pageFuzzyselect(txtname, vo);
		mv.addObject("list",vo);
		mv.addObject("txtname",txtname);
		mv.addObject("AdminTipe",AdminTipe);
		return mv;
	}
	
	@RequestMapping("/toadd")
	public ModelAndView toadd(){
		ModelAndView mv=null;
		mv=new ModelAndView("/passenger/add");
		return mv;
	}

	@RequestMapping("/add")
	public ModelAndView add(HttpServletRequest request,UserPo user,MultipartFile pictureFile) throws IllegalStateException, IOException{
		ModelAndView mv=null;
		Boolean checkUserNoExistNUllDate = userService.checkUserExistNUllDate(user);
		if(checkUserNoExistNUllDate) {
			Boolean registStuts = userService.addUser(request,user,pictureFile);
			TIPS = registStuts ? "用户新增成功" : "该电子邮箱已经被其他账户注册过了";
			if(registStuts) {
				user = null;
				mv=new ModelAndView("redirect:/Passenger/tolist.do");
				mv.addObject("AdminTipe","添加成功");
			}
			else{
				mv = new ModelAndView("/passenger/add");
			}
		}
		else {
      		TIPS =  "必须输入所有数据" ;
      		mv = new ModelAndView("/passenger/add");
		}
		mv.addObject("TIPS",TIPS);
		mv.addObject("user",user);
		return mv;
	}
	
	@RequestMapping("/toupdate")
	public ModelAndView toupdate(String mail,String userType){
		ModelAndView mv=null;
		UserPo  list=userService.returnUserByMial(mail);
		mv=new ModelAndView("/passenger/update");
		mv.addObject("list",list);
		mv.addObject("user","user");
		mv.addObject("userType",userType);
		return mv;
	}
	
	@RequestMapping("/update")
	public ModelAndView update(HttpServletRequest request,UserPo user,MultipartFile pictureFile,String userType1) throws IllegalStateException, IOException{
		ModelAndView mv = null;
		userService.updateByMial(request,user,pictureFile);
		mv = userType1.equals("user") ? new ModelAndView("redirect:/Passenger/userSetting.do"):new ModelAndView("redirect:/Passenger/tolist.do");
		mv.addObject("AdminTipe","修改成功");
		return mv;
	}
	
	@RequestMapping("/delete")
	public ModelAndView delete(String mail) {
		ModelAndView mv = null;
		String[] FenGe = mail.split(",");
		for (int i = 0; i < FenGe.length; i++) {
			userService.deleteByMial(FenGe[i]);
		}
		mv = new ModelAndView("redirect:/Passenger/tolist.do");
		mv.addObject("AdminTipe","删除成功");
		return mv;
	}
	
	@RequestMapping("/userSetting")
	public ModelAndView userSetting(HttpServletRequest request,String AdminTipe) {
		HttpSession ss = request.getSession();
		String mail = (String) ss.getAttribute("mail");
		UserPo userpo = userService.returnUserByMial(mail);
		List <SongListPo> allSongList = songListService.selectUserSongListByMail(mail);
		ModelAndView mv = null;
		mv = new ModelAndView("/passenger/userSetting");
		mv.addObject("userpo",userpo);
		mv.addObject("AdminTipe",AdminTipe);
		mv.addObject("allSongList",allSongList);
		mv.addObject("allSongSize",allSongList.size());
		return mv;
	}
}
