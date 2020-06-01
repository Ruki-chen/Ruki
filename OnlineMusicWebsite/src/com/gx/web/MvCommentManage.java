package com.gx.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.gx.po.MvCommentPo;
import com.gx.po.albumCommentPo;
import com.gx.service.MvCommentService;


@Controller
@RequestMapping("/MvComment")
public class MvCommentManage {
	
	@Autowired
	private MvCommentService mvCommentService;
	
	@ResponseBody
	@RequestMapping(value="/showComment")
	public Object showComment(HttpServletRequest request,int id) {
		
		List<MvCommentPo> resultList =  mvCommentService.showComment(request,id);		
		Gson gson =new Gson();
		return gson.toJson(resultList);
		
	}
	
	@ResponseBody
	@RequestMapping(value="/publishComments")
	public Object publishComments(HttpServletRequest request,String userComment,int id,int parentCommentId) {
		
		boolean flag = mvCommentService.addComment(request,userComment,id,parentCommentId);	
		Gson gson =new Gson();
		return gson.toJson(flag);
	}
	
	@ResponseBody
	@RequestMapping("/addGoodNumber")
	public Object addGoodNumber(HttpServletRequest request,int id) {
	
		mvCommentService.addGoodNumber(request,id);
		Gson gson =new Gson();
		return gson.toJson(true);
	}
	
	@ResponseBody
	@RequestMapping("/reduceGoodNumber")
	public Object reduceGoodNumber(HttpServletRequest request,int id) {
	
		mvCommentService.reduceGoodNumber(request,id);
		Gson gson =new Gson();
		return gson.toJson(true);
	}
	
	@ResponseBody
	@RequestMapping("/restoreComment")
	public Object restoreComment(HttpServletRequest request,int id) {
	
	   List<MvCommentPo>	 replaylist = mvCommentService.selectReplayComment(request,id);
		Gson gson =new Gson();
		return gson.toJson(replaylist);
	}
	
	@ResponseBody
	@RequestMapping("/deleteComment")
	public Object deleteComment(HttpServletRequest request,int id,int parentCommentId) {
	
		mvCommentService.deleteComment(request,id,parentCommentId);
		Gson gson =new Gson();
		return gson.toJson(true);
	}

}
