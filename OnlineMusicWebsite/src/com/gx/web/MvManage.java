package com.gx.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gx.page.Page;
import com.gx.po.AlbumPo;
import com.gx.po.MvPo;
import com.gx.po.SingerPo;
import com.gx.po.SongPo;
import com.gx.po.attributePo;
import com.gx.service.MvService;
import com.gx.service.attributeService;


@Controller
@RequestMapping("/Mv")
public class MvManage {
	
	@Autowired
	private MvService mvService;
	@Autowired
	private attributeService attributeService;
	public static String TIPS = "请填入信息";
	
	@RequestMapping("/tolist")
	public ModelAndView tolist(HttpServletRequest request,Integer currentPage,String txtname,String AdminTipe){
		if(AdminTipe==null) {
			AdminTipe="请谨慎操作哦！";
		}	
		ModelAndView mv=null;
		mv=new ModelAndView("/mv/list");
		Page<MvPo> vo=new Page<MvPo>();
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
		vo=mvService.pageFuzzyselect(txtname, vo);
		mv.addObject("list",vo);
		mv.addObject("txtname",txtname);
		mv.addObject("AdminTipe",AdminTipe);
		return mv;
		
	}
	
	@RequestMapping("/toadd")
	public ModelAndView toadd(){
		ModelAndView mv=null;
		mv=new ModelAndView("/mv/add");
		return mv;
	}

	@RequestMapping("/add")
	public ModelAndView add(MvPo mvPo,MultipartFile mvFile,MultipartFile mvPhotoFile,HttpServletRequest request) throws IllegalStateException, IOException{
		ModelAndView mv = null;
			Boolean registStuts = mvService.addMv(mvPo,mvFile,mvPhotoFile,request);
			TIPS = registStuts ? "专辑新增成功" : "该专辑已经注册过了";
			if(registStuts) {
				mvPo = null;
				mv=new ModelAndView("redirect:/Mv/tolist.do");
				mv.addObject("AdminTipe","添加成功");
			}
			else{
				mv = new ModelAndView("/mv/add");
			}
		
		mv.addObject("TIPS",TIPS);
		mv.addObject("user",mvPo);
		
		return mv;
	}
	
	@RequestMapping("/toupdate")
	public ModelAndView toupdate(int id){
		ModelAndView mv=null;
		MvPo  list=mvService.returnMvById(id);
		mv=new ModelAndView("/mv/update");
		mv.addObject("list",list);
		return mv;
	}
	
	@RequestMapping("/update")
	public ModelAndView update(MvPo mvPo,MultipartFile mvFile,MultipartFile mvPhotoFile,HttpServletRequest request) throws IllegalStateException, IOException{
		ModelAndView mv=null;
		mvService.updateById(mvPo,mvFile,mvPhotoFile,request);
		mv=new ModelAndView("redirect:/Mv/tolist.do");
		mv.addObject("AdminTipe","修改成功");
		return mv;
	}

	@RequestMapping("/delete")
	public ModelAndView delete(String id,HttpServletRequest request) {
		ModelAndView mv = null;
		String[] FenGe = id.split(",");
		for (int i = 0; i < FenGe.length; i++) {
			mvService.deleteById(Integer.parseInt(FenGe[i]),request);
		}
		mv = new ModelAndView("redirect:/Mv/tolist.do");
		mv.addObject("AdminTipe","删除成功");
		return mv;
	}
	
	@RequestMapping("/userList")
	public ModelAndView userList(HttpServletRequest request,MvPo mvpo,String AdminTipe){
		if(AdminTipe==null) {
			AdminTipe="鼠标点击查询MV名！";
		}	
		ModelAndView mv=null;
		mv=new ModelAndView("/mv/userList");
		List<MvPo> aList = new ArrayList<MvPo>();
//刚开始进来		
		if(mvpo.getSchools()==null&&mvpo.getIsPopular()==null&&mvpo.getCountry()==null)
		{
			String txtname="";
			aList = mvService.notPageFuzzySelect(txtname);
		}
		else if(mvpo.getMvName()!=null&&!mvpo.getMvName().equals(""))
		{
			String txtname=mvpo.getMvName();
			aList = mvService.notPageFuzzySelect(txtname);
		}
		else{
			aList = mvService.notPageFuzzySelectUser(mvpo);
		}
		List<attributePo> countryList = attributeService.selectSpecialList("地区");
		List<attributePo> isPopularList = attributeService.selectSpecialList("是否流行");
		List<attributePo> schoolsList = attributeService.selectSpecialList("流派");
		List<attributePo> yearList = attributeService.selectSpecialList("年份");
		mv.addObject("list",aList);
		mv.addObject("AdminTipe",AdminTipe);
		mv.addObject("countryList",countryList);
		mv.addObject("countryListSize",countryList.size());
		mv.addObject("isPopularList",isPopularList);
		mv.addObject("isPopularListSize",isPopularList.size());
		mv.addObject("schoolsList",schoolsList);
		mv.addObject("schoolsListSize",schoolsList.size());
		mv.addObject("yearList",yearList);
		mv.addObject("yearListSize",yearList.size());
		return mv;
		
	}
	
	@RequestMapping("/checkMv")
	public ModelAndView checkMv(HttpServletRequest request,int id){
		HttpSession ss = request.getSession();
		String mail = (String) ss.getAttribute("mail");
		ModelAndView mv=null;
		mv=new ModelAndView("/mv/showMv");
		MvPo mvpo = mvService.returnMvById(id);
		List<MvPo> recommendMvList = mvService.selectRecommendMv(mvpo);
		List<Integer> mvIdList = mvService.getAllMvId(mvpo);
		mv.addObject("mvpo",mvpo);
		mv.addObject("recommendMvList",recommendMvList);
		mv.addObject("mvIdList",mvIdList);
		mv.addObject("mail",mail);
		
		
		return mv;
		
	}
	
	@RequestMapping("/loadMv")
	public ModelAndView loadMv(HttpServletRequest request,HttpServletResponse response,int id) throws IOException {
		ModelAndView mv = null;
		MvPo mvpo = mvService.returnMvById(id);
	    String url = request.getSession().getServletContext().getRealPath("/mv");
		 String  mvName = mvpo.getMvPath().substring(4);
		 File file = new File(url+"/"+mvName); 
		 if (!file.exists()) {
			  mv=new ModelAndView("redirect:/Mv/userList.do");
				mv.addObject("AdminTipe","您要下载的资源已被删除！！");
				return mv;
			} 
		    String fileName  = new String(mvName.getBytes(), "iso8859-1");
	        response.addHeader("Content-Disposition", "attachment;filename=" +fileName);      
	      //  response.setContentType("audio/mp3"); //下载文件的类型,不设置为默认匹配所有类型
	        FileInputStream in = new FileInputStream(url+"/"+mvName);
	        OutputStream out = response.getOutputStream();
	        byte buffer[] = new byte[1024]; 
	        int len = 0;
	        while((len = in.read(buffer)) > 0){
	        	out.write(buffer, 0, len);
	        }
	        in.close();
	        out.close();
			return mv;
	}
}
