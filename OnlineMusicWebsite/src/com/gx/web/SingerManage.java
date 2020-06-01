package com.gx.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.gx.service.AlbumService;
import com.gx.service.MvService;
import com.gx.service.SingerService;
import com.gx.service.SongService;
import com.gx.service.attributeService;




@Controller
@RequestMapping("/Singer")
public class SingerManage {
	
	@Autowired
	private attributeService attributeService;
	
	@Autowired
	private SingerService singerService;
	@Autowired
	private AlbumService albumService;
	
	@Autowired
	private MvService mvService;
	@Autowired
	private SongService songService;
	
	public static String TIPS = "请填入信息";
	
	@RequestMapping("/tolist")
	public ModelAndView tolist(HttpServletRequest request,Integer currentPage,String txtname,String AdminTipe){
		if(AdminTipe==null) {
			AdminTipe="请谨慎操作哦！";
		}	
		ModelAndView mv=null;
		mv=new ModelAndView("/singer/list");
		Page<SingerPo> vo=new Page<SingerPo>();
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
		vo=singerService.pageFuzzyselect(txtname, vo);
		mv.addObject("list",vo);
		mv.addObject("txtname",txtname);
		mv.addObject("AdminTipe",AdminTipe);
		return mv;
		
	}
	
	@RequestMapping("/toadd")
	public ModelAndView toadd(){
		ModelAndView mv=null;
		mv=new ModelAndView("/singer/add");
		return mv;
	}

	@RequestMapping("/add")
	public ModelAndView add(SingerPo singer,MultipartFile pictureFile,HttpServletRequest request) throws IllegalStateException, IOException{
		ModelAndView mv = null;
			Boolean registStuts = singerService.addSinger(singer,pictureFile,request);
			TIPS = registStuts ? "歌手新增成功" : "该歌手已经注册过了";
			if(registStuts) {
				singer = null;
				mv=new ModelAndView("redirect:/Singer/tolist.do");
				mv.addObject("AdminTipe","添加成功");
			}
			else{
				mv = new ModelAndView("/singer/add");
			}
		
		mv.addObject("TIPS",TIPS);
		mv.addObject("user",singer);
		
		return mv;
	}
	
	@RequestMapping("/toupdate")
	public ModelAndView toupdate(int id){
		ModelAndView mv=null;
		SingerPo  list=singerService.returnSingerById(id);
		mv=new ModelAndView("/singer/update");
		mv.addObject("list",list);
		return mv;
	}
	
	@RequestMapping("/update")
	public ModelAndView update(SingerPo singer,MultipartFile pictureFile,HttpServletRequest request) throws IllegalStateException, IOException{
		ModelAndView mv=null;
		singerService.updateById(singer,pictureFile,request);
		mv=new ModelAndView("redirect:/Singer/tolist.do");
		mv.addObject("AdminTipe","修改成功");
		return mv;
	}
	
	@RequestMapping("/delete")
	public ModelAndView delete(String id,HttpServletRequest request) {
		ModelAndView mv = null;
		String[] FenGe = id.split(",");
		for (int i = 0; i < FenGe.length; i++) {
			singerService.deleteById(Integer.parseInt(FenGe[i]),request);
		}
		mv = new ModelAndView("redirect:/Singer/tolist.do");
		mv.addObject("AdminTipe","删除成功");
		return mv;
	}


@RequestMapping("/userList")
public ModelAndView userList(HttpServletRequest request,SingerPo singerPo,String AdminTipe){
	if(AdminTipe==null) {
		AdminTipe="鼠标点击查询歌手！";
	}	
	ModelAndView mv=null;
	mv=new ModelAndView("/singer/userList");
	List<SingerPo> aList = new ArrayList<SingerPo>();
//刚开始进来		
	if(singerPo.getSchools()==null&&singerPo.getIsPopular()==null&&singerPo.getCountry()==null)
	{
		String txtname="";
		aList = singerService.selectSingerBySingerName(txtname);
	}
	else if(singerPo.getSingerName()!=null&&!singerPo.getSingerName().equals(""))
	{
		String txtname=singerPo.getSingerName();
		aList = singerService.selectSingerBySingerName(txtname);
	}
	else{
		aList = singerService.notPageFuzzySelectUser(singerPo);
	}
	List<attributePo> countryList = attributeService.selectSpecialList("地区");
	List<attributePo> isPopularList = attributeService.selectSpecialList("是否流行");
	List<attributePo> schoolsList = attributeService.selectSpecialList("流派");
	List<attributePo> sexList = attributeService.selectSpecialList("性别");
	mv.addObject("list",aList);
	mv.addObject("AdminTipe",AdminTipe);
	mv.addObject("countryList",countryList);
	mv.addObject("countryListSize",countryList.size());
	mv.addObject("isPopularList",isPopularList);
	mv.addObject("isPopularListSize",isPopularList.size());
	mv.addObject("schoolsList",schoolsList);
	mv.addObject("schoolsListSize",schoolsList.size());
	mv.addObject("sexList",sexList);
	mv.addObject("sexListSize",sexList.size());
	return mv;
  }

@RequestMapping("/checkSinger")
public ModelAndView checkSinger(HttpServletRequest request,int id){
	ModelAndView mv=null;
	mv=new ModelAndView("/singer/checkSinger");
	SingerPo singerPo = singerService.returnSingerById(id);
	List<SongPo> songList = songService.selectSongBySingerName(request, singerPo.getSingerName());
	List<String> musicPathList = songService.getAllMusicPath(songList);
	List<AlbumPo> abumList = albumService.selectAlbumBySingerName(singerPo.getSingerName());
	List<MvPo> mvList = mvService.selectMvBySingerName(singerPo.getSingerName());
	mv.addObject("singerPo",singerPo);
	mv.addObject("songList",songList);
	mv.addObject("musicPathList",musicPathList);
	mv.addObject("abumList",abumList);
	mv.addObject("mvList",mvList);	
	mv.addObject("songSize",songList.size());	
	mv.addObject("albumSize",abumList.size());	
	mv.addObject("mvSize",mvList.size());	
	return mv;
	
}

}
