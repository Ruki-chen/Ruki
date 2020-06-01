package com.gx.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.gx.po.AlbumPo;
import com.gx.po.MvCommentPo;
import com.gx.po.SongListInformationPo;
import com.gx.po.SongListPo;
import com.gx.service.SongListService;


@Controller
@RequestMapping("/SongList")
public class SongListManage {
	
	@Autowired
	private SongListService songListService;
	public static String TIPS = "请填入信息";
	
	@RequestMapping("/addSongList")
	public ModelAndView addSongList(SongListPo songListPo,HttpServletRequest request)  {
		    ModelAndView mv = null;
			Boolean stuts = songListService.addSongList(songListPo,request);
			TIPS = stuts ? "歌单新增成功" : "该歌单已经存在了";
			mv=new ModelAndView("redirect:/Passenger/userSetting.do");
	     	mv.addObject("AdminTipe",TIPS);
		   return mv;
	}
	
	@ResponseBody
	@RequestMapping("/saveCurrentPlaySongList")
	public Object saveCurrentPlaySongList(HttpServletRequest request,String songPath) {
	
		songListService.saveCurrentPlaySongList(request,songPath);
		Gson gson =new Gson();
		return gson.toJson(true);
	}

	@ResponseBody
	@RequestMapping("/showSongList")
	public Object showSongList(HttpServletRequest request,String songListName) {
	
		List<SongListInformationPo>  list = songListService.showSongList(request,songListName);
		Gson gson =new Gson();
		return gson.toJson(list);
	}
	
	@ResponseBody
	@RequestMapping("/removeMusic")
	public Object removeMusic(HttpServletRequest request,int id) {
	
		songListService.removeMusic(id);
		Gson gson =new Gson();
		return gson.toJson(true);
	}
	
	@ResponseBody
	@RequestMapping("/clearSongList")
	public Object clearSongList(HttpServletRequest request,String songListName) {
	
		songListService.clearSongList(request,songListName);
		Gson gson =new Gson();
		return gson.toJson(true);
	}
	
	@ResponseBody
	@RequestMapping("/joinSaveList")
	public Object joinSaveList(HttpServletRequest request,String songPath) {
	
		songListService.joinSaveList(request,songPath);
		Gson gson =new Gson();
		return gson.toJson(true);
	}
	
	@ResponseBody
	@RequestMapping("/removeSaveList")
	public Object removeSaveList(HttpServletRequest request,String songPath) {
	
		songListService.removeSaveList(request,songPath);
		Gson gson =new Gson();
		return gson.toJson(true);
	}
	
	@ResponseBody
	@RequestMapping("/getUserSongList")
	public Object getUserSongList(HttpServletRequest request) {
		HttpSession ssHttpSession = request.getSession();
		String mail = (String) ssHttpSession.getAttribute("mail");
		List<SongListPo>  list = songListService.selectUserSongListByMail(mail);
		list = songListService.handleUserSongList(list);
		Gson gson =new Gson();
		return gson.toJson(list);
	}
	
	@ResponseBody
	@RequestMapping("/insertIntoSongList")
	public Object insertIntoSongList(HttpServletRequest request,String songListNameList,String songPath) {
		HttpSession ssHttpSession = request.getSession();
		String mail = (String) ssHttpSession.getAttribute("mail");
		if(!songListNameList.equals("")) {
			String[] FenGe = songListNameList.split(",");
			for (int i = 0; i < FenGe.length; i++) {
				songListService.addSongListInformationPo(mail, songPath, FenGe[i]);
			}
		}
		Gson gson =new Gson();
		return gson.toJson(true);
	}
	
	@ResponseBody
	@RequestMapping("/deleteSongList")
	public Object deleteSongList(HttpServletRequest request,String songListNameList) {
		if(!songListNameList.equals("")) {
			String[] FenGe = songListNameList.split(",");
			for (int i = 0; i < FenGe.length; i++) {
				songListService.deleteSongList(request, FenGe[i]);
			}
		}
		Gson gson =new Gson();
		return gson.toJson(true);
	}
	
	
}
