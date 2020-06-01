package com.gx.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.gx.po.SingerPo;
import com.gx.po.SongPo;
import com.gx.po.UserSongCommentStutsPo;
import com.gx.po.songCommentPo;
import com.gx.service.SongCommentService;
import com.gx.service.SongService;



@Controller
@RequestMapping("/SongComment")
public class SongCommentManage {
	
	@Autowired
	private SongCommentService songCommentService;

	@Autowired
	private SongService songService;

	@RequestMapping("/showComment")
	public ModelAndView showComment(HttpServletRequest request,String songPath,String flag) {
		HttpSession ss = request.getSession();
		String mail = (String) ss.getAttribute("mail");
		ModelAndView mv = null;
		List<songCommentPo> resultList =  songCommentService.showComment(request,songPath);
		SingerPo  singerimfo =  songService.checkSingerPhotoPathbySongPath(songPath);
		SongPo songimfoPo = songService.selectSongBySongPath(songPath);
		mv = new ModelAndView("/song/showComment");
		mv.addObject("resultList",resultList);
		mv.addObject("singerimfo",singerimfo);
		mv.addObject("songimfoPo",songimfoPo);
		mv.addObject("commentSum",resultList.size());
		mv.addObject("flag",flag);
		mv.addObject("mail",mail);
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/publishComments")
	public Object publishComments(HttpServletRequest request,String userComment,String songName,int parentCommentId) {
		
		boolean flag = songCommentService.addComment(request,userComment,songName,parentCommentId);	
		Gson gson =new Gson();
		return gson.toJson(flag);
	}
	
	
	@ResponseBody
	@RequestMapping("/deleteComment")
	public Object deleteComment(HttpServletRequest request,int id,int parentCommentId) {
	
		songCommentService.deleteComment(request,id,parentCommentId);
		Gson gson =new Gson();
		return gson.toJson(true);
	}
	
	@ResponseBody
	@RequestMapping("/restoreComment")
	public Object restoreComment(HttpServletRequest request,int id) {
	
	   List<songCommentPo>	 replaylist = songCommentService.selectReplayComment(request,id);
		Gson gson =new Gson();
		return gson.toJson(replaylist);
	}
	
	@ResponseBody
	@RequestMapping("/addGoodNumber")
	public Object addGoodNumber(HttpServletRequest request,int id) {
	
		songCommentService.addGoodNumber(request,id);
		Gson gson =new Gson();
		return gson.toJson(true);
	}
	
	@ResponseBody
	@RequestMapping("/reduceGoodNumber")
	public Object reduceGoodNumber(HttpServletRequest request,int id) {
	
		songCommentService.reduceGoodNumber(request,id);
		Gson gson =new Gson();
		return gson.toJson(true);
	}
}
