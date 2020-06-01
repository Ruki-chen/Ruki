package com.gx.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.gx.page.Page;
import com.gx.po.SingerPo;
import com.gx.po.SongPo;
import com.gx.po.attributePo;
import com.gx.service.SongListService;
import com.gx.service.SongService;
import com.gx.service.attributeService;




@Controller
@RequestMapping("/Song")
public class SongManage {
	
	@Autowired
	private SongService songService;

	@Autowired
	private attributeService attributeService;


	public static String TIPS = "请填入信息";
	
	@RequestMapping("/tolist")
	public ModelAndView tolist(HttpServletRequest request,Integer currentPage,String txtname,String AdminTipe){
		if(AdminTipe==null) {
			AdminTipe="请谨慎操作哦！";
		}	
		ModelAndView mv=null;
		mv=new ModelAndView("/song/list");
		Page<SongPo> vo=new Page<SongPo>();
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
		vo=songService.pageFuzzyselect(request,txtname, vo);
		mv.addObject("list",vo);
		mv.addObject("txtname",txtname);
		mv.addObject("AdminTipe",AdminTipe);
		return mv;
		
	}
	
	@RequestMapping("/toadd")
	public ModelAndView toadd(){
		ModelAndView mv=null;
		mv=new ModelAndView("/song/add");
		return mv;
	}

	@RequestMapping("/add")
	public ModelAndView add(SongPo song,MultipartFile songFile,MultipartFile lyricFile,HttpServletRequest request) throws IllegalStateException, IOException{
		    ModelAndView mv = null;
			Boolean registStuts = songService.addSong(song,songFile,lyricFile,request);
			TIPS = registStuts ? "歌曲新增成功" : "该歌曲已经注册过了";
			if(registStuts) {
				song = null;
				mv=new ModelAndView("redirect:/Song/tolist.do");
				mv.addObject("AdminTipe","添加成功");
			}
			else{
				mv = new ModelAndView("/song/add");
			}
		
		mv.addObject("TIPS",TIPS);
		mv.addObject("user",song);
		
		return mv;
	}
	
	@RequestMapping("/toupdate")
	public ModelAndView toupdate(int id){
		ModelAndView mv=null;
		SongPo  list=songService.returnSongById(id);
		mv=new ModelAndView("/song/update");
		mv.addObject("list",list);
		return mv;
	}
	
	@RequestMapping("/update")
	public ModelAndView update(SongPo songPo,MultipartFile songFile,MultipartFile lyricFile,HttpServletRequest request) throws IllegalStateException, IOException{
		ModelAndView mv=null;
		songService.updateById(songPo,songFile,lyricFile,request);
		mv=new ModelAndView("redirect:/Song/tolist.do");
		mv.addObject("AdminTipe","修改成功");
		return mv;
	}
	
	@RequestMapping("/delete")
	public ModelAndView delete(String id,HttpServletRequest request) {
		ModelAndView mv = null;
		String[] FenGe = id.split(",");
		for (int i = 0; i < FenGe.length; i++) {
			songService.deleteById(Integer.parseInt(FenGe[i]),request);
		}
		mv = new ModelAndView("redirect:/Song/tolist.do");
		mv.addObject("AdminTipe","删除成功");
		return mv;
	}
	
	@RequestMapping("/userList")
	public ModelAndView userList(HttpServletRequest request,Integer currentPage,SongPo songPo,String AdminTipe){
		if(AdminTipe==null) {
			AdminTipe="请谨慎操作哦！";
		}	
		ModelAndView mv=null;
		mv=new ModelAndView("/song/userList");
		Page<SongPo> vo=new Page<SongPo>();
		if (currentPage==null) {
			currentPage=1;
		}else if (currentPage==0) {
			currentPage=1;
		}
//刚开始进来		
		if(songPo.getSchools()==null&&songPo.getIsPopular()==null&&songPo.getCountry()==null)
		{
			String txtname="";
			vo=songService.pageFuzzyselect(request,txtname, vo);
		}
		else if(songPo.getSongName()!=null&&!songPo.getSongName().equals(""))
		{
			String txtname=songPo.getSongName();
			vo=songService.pageFuzzyselect(request,txtname, vo);
		}
		else{
			vo=songService.pageFuzzyselectUser(request,songPo, vo);
		}
		List<String> musicPathList = songService.getAllMusicPath(vo.getResult());
		List<attributePo> countryList = attributeService.selectSpecialList("地区");
		List<attributePo> isPopularList = attributeService.selectSpecialList("是否流行");
		List<attributePo> schoolsList = attributeService.selectSpecialList("流派");
		List<attributePo> yearList = attributeService.selectSpecialList("年份");
		vo.setCurrentPage(currentPage);
		mv.addObject("list",vo);
		mv.addObject("AdminTipe",AdminTipe);
		mv.addObject("musicPathList",musicPathList);
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
		

	@RequestMapping("/loadMusic")
	public ModelAndView loadMusic(HttpServletRequest request,HttpServletResponse response,String songPath) throws IOException {
		ModelAndView mv = null;
	    String url = request.getSession().getServletContext().getRealPath("/music");
		 String  songName = songPath.substring(7);
		 File file = new File(url+"/"+songName); 
		 if (!file.exists()) {
			  mv=new ModelAndView("redirect:/Song/userList.do");
				mv.addObject("AdminTipe","您要下载的资源已被删除！！");
				return mv;
			} 
		    String fileName  = new String(songName.getBytes(), "iso8859-1");
	        response.addHeader("Content-Disposition", "attachment;filename=" +fileName);      
	        response.setContentType("audio/mp3"); //下载文件的类型,不设置为默认匹配所有类型
	        FileInputStream in = new FileInputStream(url+"/"+songName);
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
	
	@RequestMapping("/checkLyric")
	public ModelAndView checkLyric(HttpServletRequest request,String songPath) {
		ModelAndView mv = null;
		List<String> resultList =  songService.checkLyric(request,songPath);
		SingerPo  singerimfo =  songService.checkSingerPhotoPathbySongPath(songPath);
		SongPo songimfoPo = songService.selectSongBySongPath(songPath);
		mv = new ModelAndView("/song/checkLyric");
		mv.addObject("resultList",resultList);
		mv.addObject("singerimfo",singerimfo);
		mv.addObject("songimfoPo",songimfoPo);
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/returnSongNameBySongPath")
	public Object returnSongNameBySongPath(String songPath) {
		SongPo songPo = songService.selectSongBySongPath(songPath);
		Gson gson =new Gson();
		return gson.toJson(songPo.getSongName());
	}
	
	@ResponseBody
	@RequestMapping(value="/getSongListBySongPathList")
	public Object getSongListBySongPathList(String[] strs) {
		List<SongPo> list = songService.getSongListBySongPathList(strs);
		Gson gson =new Gson();
		return gson.toJson(list);
	}
	
}
