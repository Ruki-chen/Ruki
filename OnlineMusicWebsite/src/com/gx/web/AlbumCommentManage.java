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
import com.gx.po.AlbumPo;
import com.gx.po.SingerPo;
import com.gx.po.SongPo;
import com.gx.po.albumCommentPo;
import com.gx.po.songCommentPo;
import com.gx.service.AlbumCommentService;
import com.gx.service.AlbumService;
import com.gx.service.SingerService;
import com.gx.service.SongService;


@Controller
@RequestMapping("/AlbumComment")
public class AlbumCommentManage {
	
	@Autowired
	private AlbumCommentService albumCommentService;
	
	@Autowired
	private AlbumService albumService;
	
	@Autowired
	private SingerService singerService;
	
	
	@RequestMapping("/showComment")
	public ModelAndView showComment(HttpServletRequest request,int id,String flag) {
		HttpSession ss = request.getSession();
		String mail = (String) ss.getAttribute("mail");
		ModelAndView mv = null;
		List<albumCommentPo> resultList =  albumCommentService.showComment(request,id);
		AlbumPo albumimfo =albumService.returnAlbumById(id);
		List<SingerPo>  singerimfo =  singerService.selectSingerBySingerName(albumimfo.getSingerName());
		mv = new ModelAndView("/album/showComment");
		mv.addObject("resultList",resultList);
		mv.addObject("singerimfo",singerimfo.get(0));
		mv.addObject("albumimfo",albumimfo);
		mv.addObject("commentSum",resultList.size());
		mv.addObject("flag",flag);
		mv.addObject("mail",mail);
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/publishComments")
	public Object publishComments(HttpServletRequest request,String userComment,String albumName,int parentCommentId) {
		
		boolean flag = albumCommentService.addComment(request,userComment,albumName,parentCommentId);	
		Gson gson =new Gson();
		return gson.toJson(flag);
	}
	
	@ResponseBody
	@RequestMapping("/addGoodNumber")
	public Object addGoodNumber(HttpServletRequest request,int id) {
	
		albumCommentService.addGoodNumber(request,id);
		Gson gson =new Gson();
		return gson.toJson(true);
	}
	
	@ResponseBody
	@RequestMapping("/reduceGoodNumber")
	public Object reduceGoodNumber(HttpServletRequest request,int id) {
	
		albumCommentService.reduceGoodNumber(request,id);
		Gson gson =new Gson();
		return gson.toJson(true);
	}
	
	
	@ResponseBody
	@RequestMapping("/restoreComment")
	public Object restoreComment(HttpServletRequest request,int id) {
	
	   List<albumCommentPo>	 replaylist = albumCommentService.selectReplayComment(request,id);
		Gson gson =new Gson();
		return gson.toJson(replaylist);
	}
	
	@ResponseBody
	@RequestMapping("/deleteComment")
	public Object deleteComment(HttpServletRequest request,int id,int parentCommentId) {
	
		albumCommentService.deleteComment(request,id,parentCommentId);
		Gson gson =new Gson();
		return gson.toJson(true);
	}


}
